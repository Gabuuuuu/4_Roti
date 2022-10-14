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
                                        <h2 class="fw-bold mb-4">Add a car</h2>

                                        <p class="text-white-50 mb-4">
                                            Fill all the available spaces
                                        </p>
                                        <form
                                            @submit.prevent="addcar"
                                            method="POST"
                                            enctype="multipart/form-data"
                                        >
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <select
                                                    v-model="form.brand"
                                                    class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                    data-style="btn-success"
                                                >
                                                    <option disabled hidden>
                                                        Brand
                                                    </option>
                                                    <option
                                                        v-for="brand in brands"
                                                        :key="brand.id"
                                                    >
                                                        {{ brand.brand }}
                                                    </option>
                                                </select>
                                            </div>

                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <select
                                                    v-model="form.fuel"
                                                    class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                    data-style="btn-success"
                                                >
                                                    <option
                                                        hidden
                                                        disabled
                                                        selected
                                                    >
                                                        Fuel Type
                                                    </option>
                                                    <option
                                                        v-for="fuel in fuels"
                                                        :key="fuel.id"
                                                    >
                                                        {{ fuel.fuel }}
                                                    </option>
                                                </select>
                                            </div>

                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <select
                                                    v-model="form.body"
                                                    class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                    data-style="btn-success"
                                                >
                                                    <option
                                                        hidden
                                                        disabled
                                                        selected
                                                    >
                                                        Body Type
                                                    </option>
                                                    <option
                                                        v-for="body in bodies"
                                                        :key="body.id"
                                                    >
                                                        {{ body.body }}
                                                    </option>
                                                </select>
                                            </div>

                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <select
                                                    v-model="form.seats"
                                                    class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                    data-style="btn-success"
                                                >
                                                    <option
                                                        hidden
                                                        disabled
                                                        selected
                                                    >
                                                        Seats
                                                    </option>
                                                    <option
                                                        v-for="seat in seats"
                                                        :key="seat.id"
                                                    >
                                                        {{ seat.seats }}
                                                    </option>
                                                </select>
                                            </div>

                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <select
                                                    v-model="form.transmission"
                                                    class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                    data-style="btn-success"
                                                >
                                                    <option
                                                        hidden
                                                        disabled
                                                        selected
                                                    >
                                                        Transmission
                                                    </option>
                                                    <option
                                                        v-for="transmission in transmissions"
                                                        :key="transmission.id"
                                                    >
                                                        {{
                                                            transmission.transmission
                                                        }}
                                                    </option>
                                                </select>
                                            </div>

                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <input
                                                    type="file"
                                                    class="form-control form-control-lg"
                                                    @change="changeImage"
                                                />
                                            </div>

                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <input
                                                    v-model="form.model"
                                                    placeholder="Model Masina"
                                                    type="text"
                                                    class="form-control form-control-lg"
                                                />
                                            </div>

                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <input
                                                    v-model="form.consumption"
                                                    placeholder="Consumption"
                                                    type="text"
                                                    class="form-control form-control-lg"
                                                />
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <input
                                                    v-model="form.year"
                                                    placeholder="Year"
                                                    type="text"
                                                    class="form-control form-control-lg"
                                                />
                                            </div>

                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <input
                                                    v-model="form.price"
                                                    placeholder="Price/Day"
                                                    type="text"
                                                    class="form-control form-control-lg"
                                                />
                                            </div>

                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <textarea
                                                    v-model="form.description"
                                                    placeholder="Description"
                                                    type="text"
                                                    class="form-control form-control-lg"
                                                    rows="5"
                                                />
                                            </div>

                                            <button
                                                class="btn btn-outline-light btn-lg px-5 mb-1"
                                                type="submit"
                                            >
                                                Add the car
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
            brands: [],
            fuels: [],
            bodies: [],
            seats: [],
            transmissions: [],
            form: {
                brand: "",
                fuel: "",
                body: "",
                seats: "",
                transmission: "",
                model: "",
                consumption: "",
                year: "",
                price: "",
                file: "",
                description: "",
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
            const loadBrands = axios.get("/api/brands");
            const loadFuels = axios.get("/api/fuel_type");
            const loadBodies = axios.get("/api/body_type");
            const loadSeats = axios.get("/api/seats");
            const loadTransmission = axios.get("/api/transmission");

            axios
                .all([
                    loadBrands,
                    loadFuels,
                    loadBodies,
                    loadSeats,
                    loadTransmission,
                ])
                .then(
                    axios.spread((...responses) => {
                        this.brands = responses[0].data;
                        this.fuels = responses[1].data;
                        this.bodies = responses[2].data;
                        this.seats = responses[3].data;
                        this.transmissions = responses[4].data;
                    })
                );
        },
        responseAfterLogin(res) {
            this.$router.push({ path: "/home" });
        },

        changeImage(e) {
            this.form.file = e.target.files[0];
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
