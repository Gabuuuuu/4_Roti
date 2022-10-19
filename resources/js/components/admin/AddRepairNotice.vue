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
                            <div
                                class="card bg-dark text-white"
                                style="border-radius: 1rem"
                            >
                                <div class="card-body p-5 text-center">
                                    <div class="mb-md-6 mt-md-4 pb-5">
                                        <h2 class="fw-bold mb-4">
                                            Inregistreaza o constatare de daune
                                        </h2>

                                        <p class="text-white-50 mb-4">
                                            Completeaza datele constatarii
                                        </p>
                                        <form
                                            @submit.prevent="addrevision"
                                            method="POST"
                                            enctype="multipart/form-data"
                                        >
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Alege masina afectata

                                                    <select
                                                        class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                        data-style="btn-success"
                                                        v-model="form.car"
                                                    >
                                                        <option
                                                            v-for="car in cars"
                                                            :key="car.car_id"
                                                        >
                                                            {{ car.car_id }}
                                                        </option>
                                                    </select>
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Starea motorului
                                                    <select
                                                        class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                        data-style="btn-success"
                                                        v-model="form.motor"
                                                    >
                                                        <option>0</option>
                                                        <option>1</option>
                                                    </select>
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Starea luminilor

                                                    <select
                                                        class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                        data-style="btn-success"
                                                        v-model="form.lumini"
                                                    >
                                                        <option>0</option>
                                                        <option>1</option>
                                                    </select>
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Starea suspensiilor

                                                    <select
                                                        class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                        data-style="btn-success"
                                                        v-model="form.suspensii"
                                                    >
                                                        <option>0</option>
                                                        <option>1</option>
                                                    </select>
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Starea amortizorului

                                                    <select
                                                        class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                        data-style="btn-success"
                                                        v-model="form.amortizor"
                                                    >
                                                        <option>0</option>
                                                        <option>1</option>
                                                    </select>
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Starea franelor

                                                    <select
                                                        class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                        data-style="btn-success"
                                                        v-model="form.frane"
                                                    >
                                                        <option>0</option>
                                                        <option>1</option>
                                                    </select>
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Starea sistemului electric

                                                    <select
                                                        class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                        data-style="btn-success"
                                                        v-model="form.sistem"
                                                    >
                                                        <option>0</option>
                                                        <option>1</option>
                                                    </select>
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Starea dotarilor

                                                    <select
                                                        class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                        data-style="btn-success"
                                                        v-model="form.dotari"
                                                    >
                                                        <option>0</option>
                                                        <option>1</option>
                                                    </select>
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Starea cauciucurilor

                                                    <select
                                                        class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                        data-style="btn-success"
                                                        v-model="
                                                            form.cauciucuri
                                                        "
                                                    >
                                                        <option>0</option>
                                                        <option>1</option>
                                                    </select>
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
import TheFooter from "../../components/layout/TheFooter.vue";
import TheHeader from "../../components/layout/TheHeader";
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
            data.append("car_id", this.form.car);
            data.append("StareMotor", this.form.motor);
            data.append("StareLumini", this.form.lumini);
            data.append("StareSuspensii", this.form.suspensii);
            data.append("StareAmortizor", this.form.amortizor);
            data.append("StareFrana", this.form.frane);
            data.append("StareSistemElectric", this.form.sistem);
            data.append("StareDotari", this.form.dotari);
            data.append("StareCauciucuri", this.form.cauciucuri);

            axios.post("/api/revisions", data).then(() => {
                this.$router.push({ path: "/adminp" });
                this.loadData();
            });
        },
        async loadData() {
            const response = await axios.get("api/cars");
            this.cars = response.data;
        },
    },
};
</script>

<style scoped>
.bg-image {
    background-image: url("../../../../public/photos/BgAuth.jpg");
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
