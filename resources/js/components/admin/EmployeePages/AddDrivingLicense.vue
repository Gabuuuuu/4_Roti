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
                                            Introdu datele permisului de
                                            conducere al angajatului
                                        </h2>

                                        <p class="text-white-50 mb-4">
                                            Completeaza toate campurile
                                            existente
                                        </p>
                                        <form
                                            @submit.prevent="addlicense"
                                            method="POST"
                                            enctype="multipart/form-data"
                                        >
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Alege un angajat

                                                    <select
                                                        class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                        data-style="btn-success"
                                                        v-model="form.employee"
                                                    >
                                                        <option
                                                            v-for="employee in employees"
                                                            :key="
                                                                employee.employee_id
                                                            "
                                                        >
                                                            {{
                                                                employee.employee_id
                                                            }}
                                                        </option>
                                                    </select>
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Alege un tip de permis
                                                    <select
                                                        class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                        data-style="btn-success"
                                                        placeholder="Tip permis"
                                                        v-model="
                                                            form.license_type
                                                        "
                                                    >
                                                        <option>B</option>
                                                        <option>C</option>
                                                        <option>C+E</option>
                                                    </select>
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <h3>Nume:{{ nume }}</h3>
                                                <h3>Prenume:{{ prenume }}</h3>
                                                <h3>CNP:{{ cnp }}</h3>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Introduceti locul nasterii
                                                    angajatului
                                                    <input
                                                        placeholder="Locul nasterii"
                                                        type="text"
                                                        class="form-control form-control-lg"
                                                        v-model="form.birth"
                                                    />
                                                </p>
                                            </div>

                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Data Nasterii
                                                    <input
                                                        placeholder="Model"
                                                        type="date"
                                                        class="form-control form-control-lg"
                                                        v-model="form.birthdate"
                                                    />
                                                </p>
                                            </div>

                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Data emiterii permisului
                                                    <input
                                                        placeholder="Model"
                                                        type="date"
                                                        class="form-control form-control-lg"
                                                        v-model="form.issuedate"
                                                    />
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Data expirarii permisului
                                                    <input
                                                        placeholder="Model"
                                                        type="date"
                                                        class="form-control form-control-lg"
                                                        v-model="
                                                            form.expiredate
                                                        "
                                                    />
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Introduceti sediul care a
                                                    emis permisul
                                                    <input
                                                        placeholder="Departamentul emitent"
                                                        type="text"
                                                        class="form-control form-control-lg"
                                                        v-model="
                                                            form.department
                                                        "
                                                    />
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Introduceti numarul
                                                    permisului
                                                    <input
                                                        placeholder="Numarul permisului"
                                                        type="text"
                                                        class="form-control form-control-lg"
                                                        v-model="form.nr"
                                                    />
                                                </p>
                                            </div>
                                            <br />
                                            <button
                                                class="btn btn-outline-light btn-lg px-5 mb-1"
                                                type="submit"
                                            >
                                                Inregistrare permis
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
            employees: [],

            form: {
                employee: "",
                nume_angajat: "",
                prenume_angajat: "",
                CNP: "",
                license_type: "",
                birth: "",
                birthdate: "",
                issuedate: "",
                expiredate: "",
                department: "",
                nr: "",
                suspended: "0",
            },
            success: "",
        };
    },
    created() {
        this.loadData();
    },
    methods: {
        addlicense() {
            const data = new FormData();
            data.append("employee_id", this.form.employee);
            data.append("license_type_id", this.form.license_type);
            data.append("nume_angajat", this.form.nume_angajat);
            data.append("prenume_angajat", this.form.prenume_angajat);
            data.append("CNP", this.form.CNP);
            data.append("license_type_id", this.form.license_type);
            data.append("locul_nasterii", this.form.birth);
            data.append("data_nasterii", this.form.birthdate);
            data.append("data_emiterii", this.form.issuedate);
            data.append("data_expirarii", this.form.expiredate);
            data.append("autoritatea_emiterii", this.form.department);
            data.append("Nr_permis", this.form.nr);
            data.append("permis_suspendat	", this.form.suspended);

            axios.post("/api/drivinglicenses", data).then(() => {
                this.$router.push({ path: "/drivinglicenses" });
                this.loadData();
            });
        },
        async loadData() {
            const requestOne = axios.get("/api/employees");

            await axios
                .all([requestOne])
                .then(
                    axios.spread((...responses) => {
                        this.employees = responses[0].data;
                    })
                )
                .catch((errors) => {
                    console.log(errors);
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
