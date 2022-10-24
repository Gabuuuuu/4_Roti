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
                    <h2 class="fw-bold mb-4">
                      Inregistreaza revizia pentru o masina
                    </h2>

                    <p class="text-white-50 mb-4">
                      Completeaza datele reviziei
                    </p>
                    <form
                      @submit.prevent="addrevision"
                      method="POST"
                      enctype="multipart/form-data"
                    >
                      <div class="form-outline form-white mb-4">
                        <p>
                          Alege o masina pentru revizie

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
                          Starea motorului
                          <select
                            class="
                              selectpicker
                              btn btn-secondary btn-lg
                              dropdown-toggle
                              form-control form-control-lg
                            "
                            data-style="btn-success"
                            v-model="form.motor"
                          >
                            <option>Buna</option>
                            <option>Avariat</option>
                          </select>
                        </p>
                      </div>
                      <div class="form-outline form-white mb-4">
                        <p>
                          Starea luminilor

                          <select
                            class="
                              selectpicker
                              btn btn-secondary btn-lg
                              dropdown-toggle
                              form-control form-control-lg
                            "
                            data-style="btn-success"
                            v-model="form.lumini"
                          >
                            <option>Buna</option>
                            <option>Avariat</option>
                          </select>
                        </p>
                      </div>
                      <div class="form-outline form-white mb-4">
                        <p>
                          Starea suspensiilor

                          <select
                            class="
                              selectpicker
                              btn btn-secondary btn-lg
                              dropdown-toggle
                              form-control form-control-lg
                            "
                            data-style="btn-success"
                            v-model="form.suspensii"
                          >
                            <option>Buna</option>
                            <option>Avariat</option>
                          </select>
                        </p>
                      </div>
                      <div class="form-outline form-white mb-4">
                        <p>
                          Starea amortizorului

                          <select
                            class="
                              selectpicker
                              btn btn-secondary btn-lg
                              dropdown-toggle
                              form-control form-control-lg
                            "
                            data-style="btn-success"
                            v-model="form.amortizor"
                          >
                            <option>Buna</option>
                            <option>Avariat</option>
                          </select>
                        </p>
                      </div>
                      <div class="form-outline form-white mb-4">
                        <p>
                          Starea franelor

                          <select
                            class="
                              selectpicker
                              btn btn-secondary btn-lg
                              dropdown-toggle
                              form-control form-control-lg
                            "
                            data-style="btn-success"
                            v-model="form.frane"
                          >
                            <option>Buna</option>
                            <option>Avariat</option>
                          </select>
                        </p>
                      </div>
                      <div class="form-outline form-white mb-4">
                        <p>
                          Starea sistemului electric

                          <select
                            class="
                              selectpicker
                              btn btn-secondary btn-lg
                              dropdown-toggle
                              form-control form-control-lg
                            "
                            data-style="btn-success"
                            v-model="form.sistem"
                          >
                            <option>Buna</option>
                            <option>Avariat</option>
                          </select>
                        </p>
                      </div>
                      <div class="form-outline form-white mb-4">
                        <p>
                          Starea dotarilor

                          <select
                            class="
                              selectpicker
                              btn btn-secondary btn-lg
                              dropdown-toggle
                              form-control form-control-lg
                            "
                            data-style="btn-success"
                            v-model="form.dotari"
                          >
                            <option>Buna</option>
                            <option>Avariat</option>
                          </select>
                        </p>
                      </div>
                      <div class="form-outline form-white mb-4">
                        <p>
                          Starea cauciucurilor

                          <select
                            class="
                              selectpicker
                              btn btn-secondary btn-lg
                              dropdown-toggle
                              form-control form-control-lg
                            "
                            data-style="btn-success"
                            v-model="form.cauciucuri"
                          >
                            <option>Buna</option>
                            <option>Avariat</option>
                          </select>
                        </p>
                      </div>
                      <div class="form-outline form-white mb-4">
                        <p>
                          Introduceti nr. de KM noi:

                          <input
                            placeholder="KM"
                            type="text"
                            class="form-control form-control-lg"
                            v-model="form.km"
                          />
                        </p>
                      </div>
                      <div class="form-outline form-white mb-4">
                        <p>
                          Introduceti pretul curent:

                          <input
                            placeholder="Pret curent"
                            type="text"
                            class="form-control form-control-lg"
                            v-model="form.pret_curent"
                          />
                        </p>
                      </div>
                      <button
                        class="btn btn-outline-light btn-lg px-5 mb-1"
                        type="submit"
                      >
                        Adauga revizia
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
import TheFooter from "../../../layout/TheFooter.vue";
import TheHeader from "../../../layout/TheHeader";
export default {
  components: { TheHeader, TheFooter },
  data() {
    return {
      cars: [],
      form: {
        car: "",
        motor: "",
        lumini: "",
        suspensii: "",
        amortizor: "",
        frane: "",
        sistem: "",
        dotari: "",
        cauciucuri: "",
        km: "",
        pret_curent: "",
      },
      success: "",
    };
  },
  created() {
    this.loadData();
  },
  methods: {
    addrevision() {
      const data = new FormData();

      const km = this.form.km;
      const pret_curent = this.form.pret_curent;

      for (const item in this.form) {
        if (item === "car") {
          this.form[item] = this.cars[0].car_id;
        } else {
          if (this.form[item] === "Buna") {
            this.form[item] = 0;
          } else {
            this.form[item] = 1;
          }
        }
      }

      data.append("car_id", this.form.car);
      data.append("StareMotor", this.form.motor);
      data.append("StareLumini", this.form.lumini);
      data.append("StareSuspensii", this.form.suspensii);
      data.append("StareAmortizor", this.form.amortizor);
      data.append("StareFrana", this.form.frane);
      data.append("StareSistemElectric", this.form.sistem);
      data.append("StareDotari", this.form.dotari);
      data.append("StareCauciucuri", this.form.cauciucuri);
      data.append("km", km.toString());
      data.append("pret_curent", pret_curent.toString());

      axios.post("/api/revisions", data).then(() => {
        this.$router.push({ path: "/revisions" });
        this.loadData();
      });
    },
    async loadData() {
      const response = await axios.get("/api/cars");
      this.cars = response.data;
      for (const item in this.form) {
        if (item === "car") {
          this.form[item] =
            this.form.car = `${this.cars[0].car_id} - ${this.cars[0].marca} ${this.cars[0].model}`;
        } else if(item === 'km' || item === 'pret_curent') {
          this.form[item] = '';
        } else {
          this.form[item] = "Buna";
        }
      }
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
