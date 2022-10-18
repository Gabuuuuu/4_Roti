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
                                            Achizitioneaza o masina
                                        </h2>

                                        <p class="text-white-50 mb-4">
                                            Complteaza toate datele pentru
                                            achizitionarea masini
                                        </p>
                                        <form
                                            @submit.prevent="addcar"
                                            method="POST"
                                            enctype="multipart/form-data"
                                        >
                                            <div
                                                class="form-outline form-white"
                                            >
                                                <p>
                                                    Asociaza un departament
                                                    masinii
                                                </p>
                                                <select
                                                    class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                    data-style="btn-success"
                                                >
                                                    <option>
                                                        Departament 1 2
                                                    </option>
                                                </select>
                                            </div>
                                            <div
                                                class="form-outline form-white"
                                            >
                                                <p>Alege un tip de masina</p>
                                                <select
                                                    class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                    data-style="btn-success"
                                                >
                                                    <option>Tip 1 2</option>
                                                </select>
                                            </div>
                                            <div
                                                class="form-outline form-white"
                                            >
                                                <p>
                                                    Alege o marca pentru masina
                                                </p>
                                                <select
                                                    class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                    data-style="btn-success"
                                                >
                                                    <option>Marca 1 2</option>
                                                </select>
                                            </div>

                                            <div
                                                class="form-outline form-white"
                                            >
                                                <p>Introduceti modelul</p>
                                                <input
                                                    placeholder="Model"
                                                    type="text"
                                                    class="form-control form-control-lg"
                                                />
                                            </div>
                                            <div
                                                class="form-outline form-white"
                                            >
                                                <p>Introduceti anul</p>
                                                <input
                                                    placeholder="An"
                                                    type="text"
                                                    class="form-control form-control-lg"
                                                />
                                            </div>
                                            <div
                                                class="form-outline form-white"
                                            >
                                                <p>
                                                    Introduceti Km masinii la
                                                    achizitionare
                                                </p>
                                                <input
                                                    placeholder="Km"
                                                    type="text"
                                                    class="form-control form-control-lg"
                                                />
                                            </div>
                                            <div
                                                class="form-outline form-white"
                                            >
                                                <p>
                                                    Alege tipul de combustibil
                                                </p>
                                                <select
                                                    class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                    data-style="btn-success"
                                                >
                                                    <option>
                                                        Combustibil 1 2
                                                    </option>
                                                </select>
                                            </div>
                                            <div
                                                class="form-outline form-white"
                                            >
                                                <p>Alege tipul de transmisie</p>
                                                <select
                                                    class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                    data-style="btn-success"
                                                >
                                                    <option>
                                                        Transmisie 1 2
                                                    </option>
                                                </select>
                                            </div>
                                            <div
                                                class="form-outline form-white"
                                            >
                                                <p>Alege numarul de portiere</p>
                                                <select
                                                    class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                    data-style="btn-success"
                                                >
                                                    <option>
                                                        portiere 1 2
                                                    </option>
                                                </select>
                                            </div>

                                            <div
                                                class="form-outline form-white"
                                            >
                                                <p>Introduceti caii putere</p>
                                                <input
                                                    placeholder="Cai putere"
                                                    type="text"
                                                    class="form-control form-control-lg"
                                                />
                                            </div>
                                            <div
                                                class="form-outline form-white"
                                            >
                                                <p>Alege culoarea masinii</p>
                                                <select
                                                    class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                    data-style="btn-success"
                                                >
                                                    <option>Culoare 1 2</option>
                                                </select>
                                            </div>
                                            <div
                                                class="form-outline form-white"
                                            >
                                                <p>
                                                    Introduceti VIN-ul masinii
                                                </p>
                                                <input
                                                    placeholder="VIN"
                                                    type="text"
                                                    class="form-control form-control-lg"
                                                />
                                            </div>
                                            <div
                                                class="form-outline form-white"
                                            >
                                                <p>
                                                    Introduceti pretul curent al
                                                    masinii
                                                </p>
                                                <input
                                                    placeholder="Pret curent"
                                                    type="text"
                                                    class="form-control form-control-lg"
                                                />
                                            </div>
                                            <div
                                                class="form-outline form-white"
                                            >
                                                <p>
                                                    Introduceti numele
                                                    firmei/persoanei fizica
                                                    alaturi de care s-a realizat
                                                    contractul
                                                </p>
                                                <input
                                                    placeholder="Firma/Persoana fizica"
                                                    type="text"
                                                    class="form-control form-control-lg"
                                                />
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Introduceti daunele pe care
                                                    le prezinta masina la
                                                    cumparare
                                                </p>
                                                <textarea
                                                    placeholder="Daune"
                                                    type="text"
                                                    class="form-control form-control-lg"
                                                    rows="5"
                                                />
                                            </div>

                                            <button
                                                class="btn btn-outline-light btn-lg px-5 mb-1"
                                                type="submit"
                                            >
                                                Achizitionare
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
            departments: [],
            types: [],
            brands: [],
            fuel_type: [],
            transmissions: [],
            seats: [],
            colors: [],
            form: {
                department: "",
                type: "",
                brand: "",
                model: "",
                year: "",
                km: "",
                fuel: "",
                transmission: "",
                seats: "",
                putere: "",
                color: "",
                vin: "",
                price: "",
                seller: "",
                daune: "",
            },
            success: "",
        };
    },
    created() {
        this.loadData();
    },
    methods: {
        addcar() {
            const data = new FormData();
            data.append("brand", this.form.brand);
            data.append("fuel", this.form.fuel);
            data.append("body", this.form.body);
            data.append("seats", this.form.seats);
            data.append("transmission", this.form.transmission);
            data.append("model", this.form.model);
            data.append("consumption", this.form.consumption);
            data.append("year", this.form.year);
            data.append("price", this.form.price);
            data.append("file", this.form.file);
            data.append("description", this.form.description);

            axios.post("/api/cars", data).then((res) => {
                this.responseAfterLogin(res);
                this.loadData();
            });
        },

        loadData() {
            // const loadBrands = axios.get("/api/brands");
            // const loadFuels = axios.get("/api/fuel_type");
            // const loadBodies = axios.get("/api/body_type");
            // const loadSeats = axios.get("/api/seats");
            // const loadTransmission = axios.get("/api/transmission");
            // axios
            //     .all([
            //         loadBrands,
            //         loadFuels,
            //         loadBodies,
            //         loadSeats,
            //         loadTransmission,
            //     ])
            //     .then(
            //         axios.spread((...responses) => {
            //             this.brands = responses[0].data;
            //             this.fuels = responses[1].data;
            //             this.bodies = responses[2].data;
            //             this.seats = responses[3].data;
            //             this.transmissions = responses[4].data;
            //         })
            //     );
        },
        responseAfterLogin(res) {
            this.$router.push({ path: "/home" });
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
