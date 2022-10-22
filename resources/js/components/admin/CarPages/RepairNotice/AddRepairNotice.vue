<template>
  <div>
    <section>
      <div class="bg-image">
        <TheHeader class="fixed-top"></TheHeader>
        <div class="container py-5 h-100">
          <div
            class="row d-flex justify-content-center align-items-center h-100"
          >
            <div class="col-12 col-md-8 col-lg-6 col-xl-5">
              <div class="card bg-dark text-white" style="border-radius: 1rem">
                <div class="card-body p-5 text-center">
                  <router-link to="/adminp">
                    <button
                      class="btn btn-outline-light btn-lg px-6 mb-2"
                      type="submit"
                    >
                      Inapoi
                    </button>
                  </router-link>
                  <div class="mb-md-6 mt-md-4 pb-5">
                    <h2 class="fw-bold mb-4">
                      Inregistreaza o constatare de daune
                    </h2>

                    <p class="text-white-50 mb-4">
                      Completeaza datele constatarii
                    </p>
                    <form
                      @submit.prevent="addnotice"
                      method="POST"
                      enctype="multipart/form-data"
                    >
                      <div class="form-outline form-white mb-4">
                        <p>
                          Alege masina afectata

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
                          Alege angajatul implicat in accident
                          <select
                            class="
                              selectpicker
                              btn btn-secondary btn-lg
                              dropdown-toggle
                              form-control form-control-lg
                            "
                            data-style="btn-success"
                            v-model="form.employee"
                            @change="changeDepartmentText($event)"
                          >
                            <option
                              v-for="employee in employees"
                              :key="employee.employee_id"
                            >
                              {{ employee.employee_id }} -
                              {{ employee.nume_angajat }}
                              {{ employee.prenume_angajat }}
                            </option>
                          </select>
                        </p>
                      </div>

                      <h4>{{ activeEmployeeDepartment }}</h4>

                      <div class="form-outline form-white mb-4">
                        <p>
                          Te rog sa introduci avariile pe care masina le-a
                          prezentat
                          <textarea
                            class="form-control form-control-lg"
                            data-style="btn-success"
                            v-model="form.damage_info"
                          >
                          </textarea>
                        </p>
                      </div>
                      <div class="form-outline form-white mb-4">
                        <p>
                          Suma contra costa reparatiilor (RON):
                          <input
                            class="form-control form-control-lg"
                            v-model="form.damage_cost"
                          />
                        </p>
                      </div>

                      <button
                        class="btn btn-outline-light btn-lg px-5 mb-1"
                        type="submit"
                      >
                        Trimite instiintarea
                      </button>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <TheFooter class="fixed-bottom"></TheFooter>
      </div>
    </section>
  </div>
</template>

<script>
import TheFooter from "../../../layout/TheFooter";
import TheHeader from "../../../layout/TheHeader";

export default {
  components: { TheHeader, TheFooter },
  data() {
    return {
      cars: [],
      employees: [],
      roles: [],
      departments: [],
      form: {
        car: "",
        employee: "",
        damage_info: "",
        damage_cost: "",
      },
      activeEmployeeDepartment: "",
    };
  },
  created() {
    this.loadData();
  },
  methods: {
    addnotice() {
      const car_id = this.form.car.split(" ")[0];
      const employee_id = this.form.employee.split(" ")[0];

      const data = new FormData();
      data.append("car_id", car_id);
      data.append("employee_id", employee_id);
      data.append("damage_info", this.form.damage_info);
      data.append("damage_cost", this.form.damage_cost);

      axios.post("/api/repairnotices", data).then(() => {
        this.$router.push({ path: "/repairNotices" });
        this.loadData();
      });
    },
    async loadData() {
      const response = await axios.get("/api/LoadRepairNoticeData");
      this.roles = response.data[0];
      this.departments = response.data[1];
      this.employees = response.data[2];
      this.cars = response.data[3];

      this.form.car = `${this.cars[0].car_id} - ${this.cars[0].marca} ${this.cars[0].model}`;
      this.form.employee = `${this.employees[0].employee_id} - ${this.employees[0].nume_angajat} ${this.employees[0].prenume_angajat}`;
      this.loadDepartament(this.employees[0].role_id);
    },
    loadDepartament(id) {
      const employeeDepID = this.roles.filter((item) => item.role_id === id)[0]
        ?.department_id;
      this.activeEmployeeDepartment = this.departments.filter(
        (item) => item.department_id === employeeDepID
      )[0]?.denumire_departament;
    },
    changeDepartmentText(event) {
      const employeeID = event.target.value.split(" ")[0];
      this.activeEmployeeDepartment = this.employees.filter(
        (item) => item.employee_id == +employeeID
      )[0].role_id;
      this.loadDepartament(this.activeEmployeeDepartment);
    },
  },
};
</script>

<style scoped>
.bg-image {
  background-image: url("../../../../../../public/photos/BgAuth.jpg");
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
