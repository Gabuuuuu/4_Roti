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
                                            Introdu amenda in baza de date
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
                                                        @change="
                                                            changeEmployeeText(
                                                                $event
                                                            )
                                                        "
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
                                                            -
                                                            {{
                                                                employee.nume_angajat
                                                            }}
                                                            {{
                                                                employee.prenume_angajat
                                                            }}
                                                        </option>
                                                    </select>
                                                </p>
                                            </div>

                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Data emiterii amenzii
                                                    <input
                                                        placeholder="Data emitere"
                                                        type="date"
                                                        class="form-control form-control-lg"
                                                        v-model="form.finedate"
                                                    />
                                                </p>
                                            </div>

                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Introduceti suma amenzii
                                                    <input
                                                        placeholder="Suma amenzii"
                                                        type="text"
                                                        class="form-control form-control-lg"
                                                        v-model="form.finesum"
                                                    />
                                                </p>
                                            </div>

                                            <br />
                                            <button
                                                class="btn btn-outline-light btn-lg px-5 mb-1"
                                                type="submit"
                                            >
                                                Inregistrare amenda
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
                finedate: "",
                finesum: "",
            },
            success: "",
        };
    },
    created() {
        this.loadData();
    },
    methods: {
        addlicense() {
            const employeeID = this.form.employee.split(" ")[0];

            const data = new FormData();
            data.append("employee_id", employeeID);
            data.append("data_emiterii", this.form.finedate);
            data.append("pret_daune", this.form.finesum);

            axios.post("/api/fines", data).then(() => {
                this.$router.push({ path: "/adminp" });
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
                        this.form.employee = this.getUsersName(
                            this.employees[0].employee_id
                        );
                    })
                )
                .catch((errors) => {
                    console.log(errors);
                });
        },
        getUsersName(id) {
            const employeeDetails = this.employees.filter(
                (item) => item.employee_id === id
            )[0];
            return `${employeeDetails.employee_id} - ${employeeDetails.nume_angajat} ${employeeDetails.prenume_angajat}`;
        },
        changeEmployeeText(event) {
            const employeeID = event.target.value.split(" ")[0];
            this.activeEmploye = this.employees.filter(
                (item) => item.employee_id == +employeeID
            )[0];
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
