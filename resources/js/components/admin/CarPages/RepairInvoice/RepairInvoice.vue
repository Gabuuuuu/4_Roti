<template>
  <div class="card">
    <div class="card-body mx-4">
      <div class="container">
        <div class="row">
          <h1 class="logo">
            <router-link to="/home"> 4<span>Roti</span> </router-link>
          </h1>
          <p class="my-5 mx-5 text-center" style="font-size: 30px">
            Factura Nr. {{ repairinvoice.Id_repair_notice }} pentru masina
            {{ carDetails.marca }} {{ carDetails.model }}
          </p>
        </div>

        <div class="row">
          <ul class="list-unstyled">
            <li class="text-black">
              Angajatul implicat in accident:
              {{ employeeDetails.prenume_angajat }} {{ employeeDetails.nume_angajat }}
            </li>
            <br />
            <li class="text-muted mt-1">
              <span class="text-black">Data Emiterii</span>:
            </li>
            <li class="text-black mt-1">
              {{ formatDate(repairinvoice.data_emiterii) }}
            </li>
            <br />
          </ul>
          <hr />
          <div class="col-xl-10">
            <p>Detaliile complete ale daunelor:</p>
            <h5>{{ repairinvoice.damage_info }}</h5>
          </div>
        </div>
        <br />
        <div class="row text-black">
          <hr style="border: 2px solid black" />

          <div class="row">
            <div class="col-xl-10">
              <p>Costul total de reparatie:</p>
            </div>
            <div class="col-xl-2">
              <p class="float-end">{{ repairinvoice.damage_cost }}.00€</p>
            </div>
          </div>
          <hr style="border: 2px solid black" />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import TheFooter from "../../../layout/TheFooter";
import TheHeader from "../../../layout/TheHeader";

export default {
  components: { TheHeader, TheFooter },
  data() {
    return {
      repairinvoice: [],
      carDetails: [],
      employeeDetails: [],
    };
  },
  created() {
    this.loadData();
  },
  methods: {
    async loadData() {
      const requestOne = axios.get(
        "/api/loadRepairNotice/" + this.$route.params.id
      );

      const requestTwo = axios.get("/api/LoadRepairNoticeData/");

      await axios
        .all([requestOne, requestTwo])
        .then(
            axios.spread((...responses) => {
                this.repairinvoice = responses[0].data;
                this.carDetails = responses[1].data[3].filter((item) => item.car_id === this.repairinvoice.car_id)[0];
                this.employeeDetails = responses[1].data[2].filter((item) => item.employee_id === this.repairinvoice.employee_id)[0];
            })
        )
        .catch((errors) => {
          console.log(errors);
        });
    },
    formatDate(dateToday) {
      return new Date(dateToday).toLocaleDateString();
    },
  },
};
</script>

<style scoped>
a {
  text-decoration: none;
}

a:hover {
  text-decoration: none;
}

h1 {
  font-family: "Roboto", sans-serif;
}

.logo {
  font-size: 50px;
  margin: 0;
  padding: 0;
  line-height: 1;
  font-weight: 600;
  letter-spacing: 1px;
  font-family: "Lobster", cursive;
}
.logo a {
  color: #000000;
}
.logo a span {
  color: #ff2525;
}
</style>
