<template>
  <div>
    <section>
      <div class="bg-image">
        <div class="container py-5 h-100">
          <div
            class="row d-flex justify-content-center align-items-center h-100"
          >
            <div class="col-12 col-md-8 col-lg-6 col-xl-5">
              <div class="card bg-dark text-white" style="border-radius: 1rem">
                <div class="card-body p-5 text-center">
                  <router-link to="/repairnotices">
                    <button
                      class="btn btn-outline-light btn-lg px-6 mb-2"
                      type="submit"
                    >
                      Inapoi
                    </button>
                  </router-link>

                  <div class="mb-md-6 mt-md-4 pb-5">
                    <h2 class="fw-bold mb-4">
                      ID Instiintare:
                      {{ repairnotice.Id_repair_notice }}
                    </h2>
                    <h2 class="fw-bold mb-4">
                      {{ carDetails.marca }} {{ carDetails.model }} -
                      No.{{ employeeDetails.employee_id }} {{ employeeDetails.prenume_angajat }} {{ employeeDetails.nume_angajat }}
                    </h2>

                    <p class="text-white-50 mb-4">Conditia Masinii</p>
                    <div class="form-outline form-white mb-4">
                      <h4>Detaliile daunelor cauzate:</h4>
                      <h4>
                        {{ repairnotice.damage_info }}
                      </h4>
                    </div>
                    <div class="form-outline form-white mb-4">
                      <h4>Costul de reparatie:</h4>
                      <h4>{{ repairnotice.damage_cost }}€</h4>
                    </div>
                    <div class="form-outline form-white mb-4">
                      <h4>Data emitere instiintare:</h4>
                      <h4>
                        {{ formatDate(repairnotice.data_emiterii) }}
                      </h4>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
export default {
  data() {
    return {
      repairnotice: [],
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
            this.repairnotice = responses[0].data;
            this.carDetails = responses[1].data[3].filter((item) => item.car_id === this.repairnotice.car_id)[0];
            this.employeeDetails = responses[1].data[2].filter((item) => item.employee_id === this.repairnotice.employee_id)[0];
          })
        )
        .catch((errors) => {
          console.log(errors);
        });
    },
    formatDate(dateToday) {
        return new Date(dateToday).toLocaleDateString();
    }
  },
};
</script>

<style scoped>
.bg-image {
  background-image: url("../../../../../../public/photos/BgAuth.jpg");
  background-size: cover;
  background-position: center;
}
img {
  width: 525px;
  height: 525px;
  object-fit: fill;
}
</style>
