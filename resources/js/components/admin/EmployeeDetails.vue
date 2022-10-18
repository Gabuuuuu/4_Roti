<template>
    <div>
        <section>
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
                                    <router-link to="/employees">
                                        <button
                                            class="btn btn-outline-light btn-lg px-6 mb-2"
                                            type="submit"
                                        >
                                            Inapoi
                                        </button>
                                    </router-link>

                                    <div class="mb-md-6 mt-md-4 pb-5">
                                        <h2 class="fw-bold mb-4">
                                            {{ employee.nume_angajat }}
                                            {{ employee.prenume_angajat }}
                                        </h2>

                                        <p class="text-white-50 mb-4">
                                            Detaliile Angajatului
                                        </p>
                                        <div
                                            class="form-outline form-white mb-4"
                                        >
                                            <h4>
                                                ID Angajat:
                                                {{ employee.employee_id }}
                                            </h4>
                                        </div>
                                        <div
                                            class="form-outline form-white mb-4"
                                        >
                                            <h4>
                                                Act Identitate:
                                                {{ employee.actDeIdentitate }}
                                            </h4>
                                        </div>
                                        <div
                                            class="form-outline form-white mb-4"
                                        >
                                            <h4>
                                                Data Eliberarii:
                                                {{ employee.dataEliberarii }}
                                            </h4>
                                        </div>

                                        <div
                                            class="form-outline form-white mb-4"
                                        >
                                            <h4>
                                                CNP: {{ employee.CNP }} Nr:
                                                {{ employee.nr }}
                                            </h4>
                                        </div>

                                        <div
                                            class="form-outline form-white mb-4"
                                        >
                                            <h4>
                                                Domiciliul:
                                                {{ employee.domiciliul }}
                                            </h4>
                                        </div>
                                        <div
                                            class="form-outline form-white mb-4"
                                        >
                                            <h4>
                                                Strada {{ employee.strada }} nr
                                                {{ employee.nrStrada }}
                                            </h4>
                                        </div>
                                        <div
                                            class="form-outline form-white mb-4"
                                        >
                                            <h4>
                                                Apartamentul
                                                {{ employee.apartament }},
                                                sector {{ employee.sector }}
                                            </h4>
                                        </div>
                                        <div
                                            class="form-outline form-white mb-4"
                                        >
                                            <h4>
                                                Data Semnarii Contractului:
                                                {{
                                                    employee.data_semnare_contract
                                                }}
                                            </h4>
                                        </div>
                                        <div
                                            class="form-outline form-white mb-4"
                                        >
                                            <h4>
                                                Data Inceperii Programului:
                                                {{ employee.data_inceput_ang }}
                                            </h4>
                                        </div>
                                        <div
                                            class="form-outline form-white mb-4"
                                        >
                                            <h4>
                                                Pozitie:
                                                {{
                                                    getUsersRole(employee)?.denumire_rol
                                                }}
                                            </h4>
                                        </div>
                                        <div
                                            class="form-outline form-white mb-4"
                                        >
                                            <h4>Alege pozitia dorita:</h4>
                                            <h4>
                                                <select
                                                    v-model="form.role"
                                                    class="selectpicker btn btn-outline-light btn-s dropdown-toggle form-control form-control-lg"
                                                    data-style="btn-success"
                                                >
                                                    <option
                                                        v-for="role in roles"
                                                        :key="role.index"
                                                    >
                                                        {{ role.denumire_rol }}
                                                    </option>
                                                </select>
                                            </h4>
                                        </div>
                                        <div
                                            class="form-outline form-white mb-4"
                                        >
                                            <h4>
                                                <button
                                                    class="btn btn-success form-control form-control-lg btn-lg"
                                                    @click="changeRole(form.role)"
                                                >
                                                    Schimba Rolul
                                                </button>
                                            </h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</template>

<script>
export default {
    data() {
        return {
            employee: [],
            roles: [],
            form: {
                role: "",
            },
        };
    },
    created() {
        this.loadData();
    },
    methods: {
        async loadData() {
            const requestOne = axios.get("/api/loadEmployee/" + this.$route.params.id);
            const requestTwo = axios.get("/api/roles");

            await axios
                .all([requestOne, requestTwo])
                .then(
                    axios.spread((...responses) => {
                        this.employee = responses[0].data;
                        this.roles = responses[1].data;
                        this.form.role = this.getUsersRole(this.employee)?.denumire_rol;
                    })
                )
                .catch((errors) => {
                    console.log(errors);
                });
        },
        changeRole() {

            const payload = {
                role: this.roles.filter((item) => item.denumire_rol === this.form.role)[0].role_id,
            }

            axios.put(`/api/employees/${this.$route.params.id}`, payload).then(() => {
                this.loadData;
                this.$router.replace('/employees');
            });
        },
        getUsersRole(employee) {
            const filteredRole = this.roles.filter((item) => item.role_id === employee.role_id)[0];
            return filteredRole;
        }
    },
};
</script>

<style scoped>
.bg-image {
    background-image: url("../../../../public/photos/BgAuth.jpg");
    background-size: cover;
    background-position: center;
}
img {
    width: 525px;
    height: 525px;
    object-fit: fill;
}
</style>
