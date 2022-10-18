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
                                            Completeaza toate datele pentru
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
                                                    v-model="form.department"
                                                >
                                                    <option v-for="department in departments" :key="department.department_id">
                                                        {{ department.denumire_departament }}
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
                                                    v-model="form.type"
                                                >
                                                    <option v-for="body_type in body_types" :key="body_type.car_type_id">
                                                        {{ body_type.denumire_tip_masina }}
                                                    </option>
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
                                                    <option v-for="brand in brands" :key="brand.id">
                                                        {{ brand.brand }}
                                                    </option>
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
                                                    v-model="form.model"
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
                                                    v-model="form.year"
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
                                                    v-model="form.km"
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
                                                    v-model="form.fuel"
                                                >
                                                    <option v-for="fuel_type in fuel_types" :key="fuel_type.id">
                                                        {{ fuel_type.fuel }}
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
                                                    v-model="form.transmission"
                                                >
                                                    <option v-for="transmission in transmissions" :key="transmission.id">
                                                        {{ transmission.transmission }}
                                                    </option>
                                                </select>
                                            </div>
                                            <div
                                                class="form-outline form-white"
                                            >
                                                <p>Alege numarul de locuri</p>
                                                <select
                                                    class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                    data-style="btn-success"
                                                    v-model="form.seats"
                                                >
                                                    <option v-for="seat in seats" :key="seat.id">
                                                        {{ seat.seats }}
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
                                                    v-model="form.putere"
                                                />
                                            </div>
                                            <div
                                                class="form-outline form-white"
                                            >
                                                <p>Alege culoarea masinii</p>
                                                <select
                                                    class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                    data-style="btn-success"
                                                    v-model="form.color"
                                                >
                                                    <option v-for="color in colors" :key="color.Culoare_id">
                                                        {{ color.Culoare_denumire }}
                                                    </option>
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
                                                    v-model="form.vin"
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
                                                    v-model="form.price"
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
                                                    v-model="form.seller"
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
            fuel_types: [],
            body_types: [],
            brands: [],
            seats: [],
            transmissions: [],
            colors: [],
            dataBunch: [],
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
            const dep = this.departments.filter((item) => item.denumire_departament === this.form.department);
            const tip = this.body_types.filter((item) => item.denumire_tip_masina === this.form.type);

            const data = new FormData();
            data.append("department_id", dep[0].department_id);
            data.append("car_type_id", tip[0].car_type_id);
            data.append("marca", this.form.brand);
            data.append("model", this.form.model);
            data.append("an", this.form.year);
            data.append("km", this.form.km);
            data.append("combustibil", this.form.fuel);
            data.append("putere", this.form.putere);
            data.append("transmisie", this.form.transmission);
            data.append("nr_portiere", this.form.seats);
            data.append("culoare", this.form.color);
            data.append("vin", this.form.vin);
            data.append("oferit_de", this.form.seller);
            data.append("pret_curent", this.form.price);
            data.append("daune", 0);

            axios.post("/api/cars", data).then(() => {
                this.$router.push({ path: "/home" });
                this.loadData();
            });
        },
        loadData() {
            axios.get('/api/loadCarParts').then((res) => {
                const responseData = res.data;

                this.transmissions = responseData[0];
                this.form.transmission = responseData[0][0].transmission;
                this.seats = responseData[1];
                this.form.seats =responseData[1][0].seats;
                this.colors = responseData[2];
                this.form.color = responseData[2][0].Culoare_denumire;
                this.fuel_types = responseData[3];
                this.form.fuel = responseData[3][0].fuel;
                this.brands = responseData[4];
                this.form.brand = responseData[4][0].brand;
                this.body_types = responseData[5];
                this.form.type = responseData[5][0].denumire_tip_masina;
                this.departments = responseData[6];
                this.form.department = responseData[6][0].denumire_departament;
            });
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
