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
                                        <router-link to="/adminp">
                                            <button
                                                class="btn btn-outline-light btn-lg px-6"
                                                style="margin-bottom: 50px"
                                            >
                                                Inapoi la pagina principala
                                            </button>
                                        </router-link>

                                        <h2 class="fw-bold mb-4">
                                            Adauga un frigider
                                        </h2>

                                        <p class="text-white-50 mb-4">
                                            Completeaza toate datele pentru
                                            achizitionarea masini
                                        </p>
                                        <form
                                            @submit.prevent="addFridge"
                                            method="POST"
                                            enctype="multipart/form-data"
                                        >
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Alege o marca
                                                    <select
                                                        class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                        data-style="btn-success"
                                                        v-model="
                                                            form.supplier_id
                                                        "
                                                    >
                                                        <option
                                                            v-for="supplier in suppliers"
                                                            :key="
                                                                supplier.supplier_id
                                                            "
                                                        >
                                                            {{
                                                                supplier.denumire_furnizor
                                                            }}
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
                                                        v-model="
                                                            form.denumire_model
                                                        "
                                                    />
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Introduceti anul de
                                                    fabricatie
                                                    <input
                                                        placeholder="An fabricatie"
                                                        type="date"
                                                        class="form-control form-control-lg"
                                                        v-model="
                                                            form.an_fabricatie
                                                        "
                                                    />
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Introduceti greutatea
                                                    frigiderului
                                                    <input
                                                        placeholder="Greutate"
                                                        type="text"
                                                        class="form-control form-control-lg"
                                                        v-model="form.greutate"
                                                    />
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Introduceti marimea
                                                    frigiderului (KG)
                                                    <input
                                                        placeholder="Marime"
                                                        type="text"
                                                        class="form-control form-control-lg"
                                                        v-model="form.marime"
                                                    />
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Introduceti consumul
                                                    energetic al frigiderului
                                                    <input
                                                        placeholder="Consum energetic"
                                                        type="text"
                                                        class="form-control form-control-lg"
                                                        v-model="
                                                            form.consum_energetic
                                                        "
                                                    />
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Introduceti calitatea
                                                    frigiderelor
                                                    <select
                                                        class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                        data-style="btn-success"
                                                        v-model="form.calitate"
                                                    >
                                                        <option>A</option>
                                                        <option>B</option>
                                                        <option>C</option>
                                                        <option>D</option>
                                                        <option>E</option>
                                                    </select>
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Introduceti volumul
                                                    achizitionat de frigidere
                                                    <input
                                                        placeholder="Volum"
                                                        type="text"
                                                        class="form-control form-control-lg"
                                                        v-model="form.volum"
                                                    />
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Introduceti pretul
                                                    frigiderului
                                                    <input
                                                        placeholder="Pret"
                                                        type="text"
                                                        class="form-control form-control-lg"
                                                        v-model="form.pret"
                                                    />
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Adaugati o poza frigiderului
                                                    <input
                                                        type="file"
                                                        class="form-control form-control-lg"
                                                        @change="changeImage"
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
            suppliers: [],
            form: {
                supplier_id: "",
                denumire_model: "",
                an_fabricatie: "",
                greutate: "",
                marime: "",
                consum_energetic: "",
                calitate: "",
                volum: "",
                pret: "",
                file: "",
            },
            success: "",
        };
    },
    created() {
        this.loadData();
    },
    methods: {
        addFridge() {
            const idFurnizor = this.suppliers.filter(
                (item) => item.denumire_furnizor === this.form.supplier_id
            )[0].supplier_id;

            const data = new FormData();
            data.append("supplier_id", idFurnizor);
            data.append("denumire_model", this.form.denumire_model);
            data.append("an_fabricatie", this.form.an_fabricatie);
            data.append("greutate", this.form.greutate);
            data.append("marime", this.form.marime);
            data.append("consum_energetic", this.form.consum_energetic);
            data.append("calitate", this.form.calitate);
            data.append("volum", this.form.volum);
            data.append("pret", this.form.pret);
            data.append("file", this.form.file);

            axios.post("/api/addNewFridgeModel", data).then((res) => {
                Toast.fire({
                    icon: "success",
                    title: "Fridge added successfully",
                });

                console.log(res.data);

                this.$router.push({ path: "/fridges" });
                this.loadData();
            });
        },
        loadData() {
            axios.get("/api/fridgeSuppliers").then((res) => {
                this.suppliers = res.data;
                this.form.supplier_id = this.idToSuppplierName(1);
                this.form.calitate = "A";
            });
        },
        idToSuppplierName(id) {
            const supplier = this.suppliers.filter(
                (item) => item.supplier_id === id
            )[0];
            return supplier.denumire_furnizor;
        },
        changeImage(e) {
            this.form.file = e.target.files[0];
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
