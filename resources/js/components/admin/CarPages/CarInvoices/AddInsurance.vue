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
                                            Inregistreaza o asigurare pentru o
                                            masina
                                        </h2>

                                        <p class="text-white-50 mb-4">
                                            Completeaza datele achizitiei
                                        </p>
                                        <form
                                            @submit.prevent="addinsurance"
                                            method="POST"
                                            enctype="multipart/form-data"
                                        >
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Alege masina pentru care a
                                                    fost achizitionata
                                                    asigurarea

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
                                                    Alege firma de asigurari
                                                    alaturi de care a fost
                                                    facuta asigurarea

                                                    <select
                                                        class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                        data-style="btn-success"
                                                        v-model="
                                                            form.insurance_company
                                                        "
                                                    >
                                                        <option
                                                            v-for="insurance_company in insurance_companies"
                                                            :key="
                                                                insurance_company.insurance_company_id
                                                            "
                                                        >
                                                            {{
                                                                insurance_company.insurance_company_id
                                                            }}
                                                        </option>
                                                    </select>
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Alege tipul de asigurare

                                                    <select
                                                        class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                        data-style="btn-success"
                                                        v-model="
                                                            form.insurance_type
                                                        "
                                                    >
                                                        <option
                                                            v-for="insurance_type in insurance_types"
                                                            :key="
                                                                insurance_type.insurance_type_id
                                                            "
                                                        >
                                                            {{
                                                                insurance_type.insurance_type_id
                                                            }}
                                                        </option>
                                                    </select>
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Data emiterii asigurarii
                                                    <input
                                                        placeholder="Data emitere"
                                                        type="date"
                                                        class="form-control form-control-lg"
                                                        v-model="form.date"
                                                    />
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Introduceti pretul
                                                    asigurarii
                                                    <input
                                                        placeholder="Pret asigurare"
                                                        type="text"
                                                        class="form-control form-control-lg"
                                                        v-model="form.price"
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
            insurance_companies: [],
            insurance_types: [],

            form: {
                car: "",
                insurance_company: "",
                insurance_type: "",
                date: "",
                price: "",
            },
            success: "",
        };
    },
    created() {
        this.loadData();
    },
    methods: {
        addinsurance() {
            const data = new FormData();

            data.append("car_id", this.form.car);
            data.append("insurance_company_id", this.form.insurance_company);
            data.append("insurance_type_id", this.form.insurance_type);
            data.append("Data_emiterii", this.form.date);
            data.append("Pret_asigurare", this.form.price);

            axios.post("/api/insurances", data).then((res) => {
                console.log(res);
                this.$router.push({ path: "/adminp" });
                this.loadData();
            });
        },
        async loadData() {
            const response = await axios.get("/api/cars");
            this.cars = response.data;

            const loadCompany = axios.get("/api/company");
            const loadType = axios.get("/api/insurance");
            axios.all([loadCompany, loadType]).then(
                axios.spread((...responses) => {
                    this.insurance_companies = responses[0].data;
                    this.insurance_types = responses[1].data;
                })
            );
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
