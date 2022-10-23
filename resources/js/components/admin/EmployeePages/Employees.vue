<template>
  <div>
    <section>
      <TheHeader></TheHeader>
      <div class="container">
        <div class="row align-items-center">
          <div class="col">
            <input
              class="form-control input-lg"
              type="text"
              v-model="filterName"
              placeholder="Filter By Name"
            />
          </div>
          <div class="col">
            <input
              class="form-control input-lg"
              type="text"
              v-model="filterSurname"
              placeholder="Filter By Surname"
            />
          </div>
          <div class="col">
            <input
              class="form-control input-lg"
              type="text"
              v-model="filterRole"
              placeholder="Filter By Role"
            />
          </div>
        </div>
      </div>
      <br />
      <div class="p-4">
        <router-link to="/adminp">
          <button class="btn btn-dark btn-outline-light btn-lg px-6 mb-4">
            Inapoi
          </button>
        </router-link>
        <table class="table table-striped">
          <thead class="thead-dark table-dark">
            <tr>
              <th scope="col">
                <p class="text-center">ID Angajat</p>
              </th>

              <th scope="col"><p class="text-center">Nume</p></th>
              <th scope="col">
                <p class="text-center">Prenume</p>
              </th>
              <th scope="col">
                <p class="text-center">Rol Angajat</p>
              </th>
              <th scope="col">
                <p class="text-center">Detalii Complete</p>
              </th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="employee in filterEmployees" :key="employee.index">
              <td scope="row">
                <p class="text-center">
                  {{ employee.employee_id }}
                </p>
              </td>

              <td scope="row">
                <p class="text-center">
                  {{ employee.nume_angajat }}
                </p>
              </td>
              <td scope="row">
                <p class="text-center">
                  {{ employee.prenume_angajat }}
                </p>
              </td>
              <td scope="row">
                <p class="text-center">
                  {{ getUsersRole(employee) }}
                </p>
              </td>

              <td scope="row">
                <p class="text-center">
                  <router-link
                    :to="{
                      name: 'employeedetails',
                      params: {
                        id: employee.employee_id,
                      },
                    }"
                    class="btn btn-info btn-outline-dark btn-s"
                  >
                    Detalii
                  </router-link>
                </p>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <TheFooter class="fixed-bottom"></TheFooter>
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
      rolProperties: JSON.parse(localStorage.getItem("roleData")),
      employees: [],
      filterName: "",
      filterSurname: "",
      filterRole: "",
    };
  },
  beforeMount() {
    this.loadData();
  },
  methods: {
    async loadData() {
      const roleID = this.getUsersRoleID();
      const requestOne = axios.get(`/api/employeesByDepartment/` + roleID);
      const requestTwo = axios.get("/api/roles");

      await axios
        .all([requestOne, requestTwo])
        .then(
          axios.spread((...responses) => {
            this.employees = responses[0].data;
            this.roles = responses[1].data;
          })
        )
        .catch((errors) => {
          console.log(errors);
        });
    },
    getUsersRoleID() {
      return this.rolProperties.role_id;
    },
    getUsersRole(employee) {
      const filteredRole = this.roles.filter(
        (item) => item.role_id === employee.role_id
      )[0];
      return filteredRole.denumire_rol;
    },
  },
  computed: {
    filterEmployees() {
      return this.employees
        .filter(
          (employee) =>
            employee.nume_angajat
              .toLowerCase()
              .indexOf(this.filterName.toLowerCase()) > -1
        )
        .filter(
          (employee) =>
            employee.prenume_angajat
              .toLowerCase()
              .indexOf(this.filterSurname.toLowerCase()) > -1
        )
        .filter(
          (employee) =>
            employee.role_id.toString().indexOf(this.filterRole.toLowerCase()) >
            -1
        );
    },
  },
};
</script>
<style scoped></style>
