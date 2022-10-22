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
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Asociaza un departament
                                                    masinii

                                                    <select
                                                        class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                        data-style="btn-success"
                                                        v-model="
                                                            form.department
                                                        "
                                                    >
                                                        <option
                                                            v-for="department in departments"
                                                            :key="
                                                                department.department_id
                                                            "
                                                        >
                                                            {{
                                                                department.denumire_departament
                                                            }}
                                                        </option>
                                                    </select>
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Alege un tip de masina
                                                    <select
                                                        class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                        data-style="btn-success"
                                                        v-model="form.type"
                                                    >
                                                        <option
                                                            v-for="body_type in body_types"
                                                            :key="
                                                                body_type.car_type_id
                                                            "
                                                        >
                                                            {{
                                                                body_type.denumire_tip_masina
                                                            }}
                                                        </option>
                                                    </select>
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Alege o marca pentru masina

                                                    <select
                                                        class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                        data-style="btn-success"
                                                    >
                                                        <option
                                                            v-for="brand in brands"
                                                            :key="brand.id"
                                                        >
                                                            {{ brand.brand }}
                                                        </option>
                                                    </select>
                                                </p>
                                            </div>

                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Introduceti modelul
                                                    <input
                                                        placeholder="Model"
                                                        type="text"
                                                        class="form-control form-control-lg"
                                                        v-model="form.model"
                                                    />
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Introduceti anul
                                                    <input
                                                        placeholder="An"
                                                        type="text"
                                                        class="form-control form-control-lg"
                                                        v-model="form.year"
                                                    />
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Introduceti Km masinii la
                                                    achizitionare
                                                    <input
                                                        placeholder="Km"
                                                        type="text"
                                                        class="form-control form-control-lg"
                                                        v-model="form.km"
                                                    />
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Alege tipul de combustibil
                                                    <select
                                                        class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                        data-style="btn-success"
                                                        v-model="form.fuel"
                                                    >
                                                        <option
                                                            v-for="fuel_type in fuel_types"
                                                            :key="fuel_type.id"
                                                        >
                                                            {{ fuel_type.fuel }}
                                                        </option>
                                                    </select>
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Alege tipul de transmisie
                                                    <select
                                                        class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                        data-style="btn-success"
                                                        v-model="
                                                            form.transmission
                                                        "
                                                    >
                                                        <option
                                                            v-for="transmission in transmissions"
                                                            :key="
                                                                transmission.id
                                                            "
                                                        >
                                                            {{
                                                                transmission.transmission
                                                            }}
                                                        </option>
                                                    </select>
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Alege numarul de locuri
                                                    <select
                                                        class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                        data-style="btn-success"
                                                        v-model="form.seats"
                                                    >
                                                        <option
                                                            v-for="seat in seats"
                                                            :key="seat.id"
                                                        >
                                                            {{ seat.seats }}
                                                        </option>
                                                    </select>
                                                </p>
                                            </div>

                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Introduceti caii putere
                                                    <input
                                                        placeholder="Cai putere"
                                                        type="text"
                                                        class="form-control form-control-lg"
                                                        v-model="form.putere"
                                                    />
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Alege culoarea masinii
                                                    <select
                                                        class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                        data-style="btn-success"
                                                        v-model="form.color"
                                                    >
                                                        <option
                                                            v-for="color in colors"
                                                            :key="
                                                                color.Culoare_id
                                                            "
                                                        >
                                                            {{
                                                                color.Culoare_denumire
                                                            }}
                                                        </option>
                                                    </select>
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Introduceti VIN-ul masinii

                                                    <input
                                                        placeholder="VIN"
                                                        type="text"
                                                        class="form-control form-control-lg"
                                                        v-model="form.vin"
                                                    />
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Introduceti pretul curent al
                                                    masinii

                                                    <input
                                                        placeholder="Pret curent"
                                                        type="text"
                                                        class="form-control form-control-lg"
                                                        v-model="form.price"
                                                    />
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4s"
                                            >
                                                <p>
                                                    Introduceti numele
                                                    firmei/persoanei fizica
                                                    alaturi de care s-a realizat
                                                    contractul

                                                    <input
                                                        placeholder="Firma/Persoana fizica"
                                                        type="text"
                                                        class="form-control form-control-lg"
                                                        v-model="form.seller"
                                                    />
                                                </p>
                                            </div>
                                            <br />
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
import TheFooter from "../../../components/layout/TheFooter";
import TheHeader from "../../../components/layout/TheHeader";
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
            const dep = this.departments.filter(
                (item) => item.denumire_departament === this.form.department
            );
            const tip = this.body_types.filter(
                (item) => item.denumire_tip_masina === this.form.type
            );

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
            axios.get("/api/loadCarParts").then((res) => {
                const responseData = res.data;

                this.transmissions = responseData[0];
                this.form.transmission = responseData[0][0].transmission;
                this.seats = responseData[1];
                this.form.seats = responseData[1][0].seats;
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
    background-image: url("../../../../../public/images/BgAuth.jpg");
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
