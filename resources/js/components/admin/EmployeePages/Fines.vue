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
              v-model="filterID"
              placeholder="Filter By ID"
            />
          </div>
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
              v-model="filterFineValue"
              placeholder="Filter By Fine Value"
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
                <p class="text-center">ID Amenda</p>
              </th>

              <th scope="col">
                <p class="text-center">Angajat</p>
              </th>
              <th scope="col">
                <p class="text-center">Data emiterii</p>
              </th>
              <th scope="col">
                <p class="text-center">Valoarea amenzii</p>
              </th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="fine in filterEmployees" :key="fine.index">
              <td scope="row">
                <p class="text-center">
                  {{ fine.fine_id }}
                </p>
              </td>

              <td scope="row">
                <p class="text-center">
                  {{ getUsersName(fine) }}
                </p>
              </td>
              <td scope="row">
                <p class="text-center">
                  {{ formatDate(fine.data_emiterii) }}
                </p>
              </td>
              <td scope="row">
                <p class="text-center">{{ fine.pret_daune }} lei</p>
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
      fines: [],
      employees: [],
      filterID: "",
      filterName: "",
      filterFineValue: "",
    };
  },
  beforeMount() {
    this.loadData();
  },
  methods: {
    async loadData() {
      const requestOne = axios.get(`/api/fines/`);
      const requestTwo = axios.get(`/api/employees/`);
      await axios
        .all([requestOne, requestTwo])
        .then(
          axios.spread((...responses) => {
            this.fines = responses[0].data;
            this.employees = responses[1].data;
          })
        )
        .catch((errors) => {
          console.log(errors);
        });
    },
    formatDate(dateToday) {
      return new Date(dateToday).toLocaleDateString();
    },
    getUsersName(id) {
      const employeeDetails = this.employees.filter(
        (item) => item.employee_id === id.employee_id
      )[0];

      return `${employeeDetails.nume_angajat} ${employeeDetails.prenume_angajat}`;
    },
  },
  computed: {
    filterEmployees() {
      return this.fines
        .filter(
          (fine) =>
            fine.fine_id.toString().indexOf(this.filterID.toLowerCase()) > -1
        )
        .filter(
          (fine) =>
            fine.employee_id.toString().indexOf(this.filterName.toLowerCase()) >
            -1
        )
        .filter(
          (fine) =>
            fine.pret_daune
              .toString()
              .indexOf(this.filterFineValue.toLowerCase()) > -1
        );
    },
  },
};
</script>
<style scoped></style>
