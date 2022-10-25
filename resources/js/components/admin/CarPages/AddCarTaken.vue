<template>
  <div>
    <section>
      <TheHeader class="fixed-top"></TheHeader>
      <div class="bg-image">
        <div class="container py-5 h-100">
          <div
            class="row d-flex justify-content-center align-items-center h-100"
          >
            <div class="col-12 col-md-8 col-lg-6 col-xl-5">
              <div class="card bg-dark text-white" style="border-radius: 1rem">
                <div class="card-body p-5 text-center">
                  <div class="mb-md-6 mt-md-4 pb-5">
                    <h2 class="fw-bold mb-4">Atribuie o masina unui angajat</h2>

                    <p class="text-white-50 mb-4">
                      Completeaza datele de atribuire
                    </p>
                    <form
                      @submit.prevent="addRide"
                      method="POST"
                      enctype="multipart/form-data"
                    >
                      <div class="form-outline form-white mb-4">
                        <p>
                          Alege o masina
                          <select
                            class="
                              selectpicker
                              btn btn-secondary btn-lg
                              dropdown-toggle
                              form-control form-control-lg
                            "
                            data-style="btn-success"
                            v-model="form.car"
                          >
                            <option v-for="car in cars" :key="car.car_id">
                              {{ car.car_id }} - {{ car.marca }} {{ car.model }}
                            </option>
                          </select>
                        </p>
                      </div>
                      <div class="form-outline form-white mb-4">
                        <p>
                          Alege un angajat
                          <select
                            class="
                              selectpicker
                              btn btn-secondary btn-lg
                              dropdown-toggle
                              form-control form-control-lg
                            "
                            data-style="btn-success"
                            v-model="form.employee"
                            v-if="drivingLicenses.length"
                          >
                            <option
                              v-for="employee in drivingLicenses"
                              :key="employee.employee_id"
                            >
                              {{ employee.employee_id ?? "" }} -
                              {{ employee.nume_angajat }}
                              {{ employee.prenume_angajat }}
                            </option>
                          </select>
                        </p>
                        <p v-if="!drivingLicenses.length">
                          Nu sunt angajati disponibili
                        </p>
                      </div>
                      <br />
                      <button
                        class="btn btn-outline-light btn-lg px-5 mb-1"
                        type="submit"
                      >
                        Efectueaza cursa
                      </button>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <TheFooter></TheFooter>
    </section>
  </div>
</template>

<script>
import TheFooter from "../../../components/layout/TheFooter";
import TheHeader from "../../../components/layout/TheHeader";
export default {
  components: { TheHeader, TheFooter },
  data() {
    return {
      cars: [],
      employees: [],
      drivingLicenses: [],
      drivingLicenseTypes: [],
      form: {
        car: "",
        employee: "",
      },
    };
  },
  created() {
    this.loadData();
  },
  methods: {
    addRide() {
      const car_id = this.form.car.split(" ")[0];
      const employee_id = this.form.employee.split(" ")[0];

      const hasDrivingLicenseType = this.drivingLicenses.filter(
        (value) => value.employee_id === +employee_id
      )[0].license_type_id;

      const carType = this.cars.filter(
        (value) => value.car_id === +car_id
      )[0].car_type_id;

      const carTypes = {
        1: 'B',
        2: 'B',
        3: 'C',
        4: 'C+E',
        5: 'C+E',
      }

      if (hasDrivingLicenseType !== carTypes[carType]) {
        Toast.fire({
          icon: "error",
          title: "Angajatul nu poate conduce acest tip de vehicul",
        });
        return;
      }

      const data = new FormData();
      data.append("car_id", car_id);
      data.append("employee_id", employee_id);

      axios.post("/api/addRide", data).then(() => {
        Toast.fire({
          icon: "success",
          title: "Ride added successfully",
        });

        this.$router.push({ path: "/adminp" });
        this.loadData();
      });
    },
    async loadData() {
      const res1 = await axios.get("/api/employees");
      const res2 = await axios.get("/api/cars");
      const res3 = await axios.get("/api/drivinglicenses");
      const res4 = await axios.get("/api/getLicenseTypes");

      this.cars = res2.data;
      this.employees = res1.data;
      this.drivingLicenses = res3.data;
      this.drivingLicenseTypes = res4.data;
      this.employeeHasDrivingLicense();
      this.form.car = `${res2.data[0].car_id} - ${res2.data[0].marca} ${res2.data[0].model}`;
      this.form.employee = this.drivingLicenses.length
        ? `${this.employees[0].employee_id} - ${this.employees[0].nume_angajat} ${this.employees[0].prenume_angajat}`
        : "";
    },
    employeeHasDrivingLicense() {
      let newEmployeesArray = [];
      this.employees.forEach((item) => {
        const hasDrivingLicense = this.drivingLicenses.filter(
          (value) => value.employee_id === item.employee_id
        )[0];

        if (hasDrivingLicense && hasDrivingLicense.permis_suspendat !== 1) {
          newEmployeesArray.push(hasDrivingLicense);
        }
      });
      this.drivingLicenses = newEmployeesArray;
    },
  },
};
</script>

<style scoped>
.bg-image {
  background-image: url("../../../../../public/images/BgAuth.jpg");
  background-size: cover;
  background-position: center;
}
a {
  text-decoration: none;
  color: white;
  opacity: 0.8;
}
.card {
  opacity: 0.8;
}
</style>
