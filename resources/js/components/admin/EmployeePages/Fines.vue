<template>
    <div>
        <section>
            <TheHeader></TheHeader>
            <div class="container">
                <div class="row align-items-center">
                    <div class="col">
                        <input
                            class="form-control input-lg"
                            type="text"
                            v-model="filterName"
                            placeholder="Filter By Name"
                        />
                    </div>
                    <div class="col">
                        <input
                            class="form-control input-lg"
                            type="text"
                            v-model="filterSurname"
                            placeholder="Filter By Surname"
                        />
                    </div>
                    <div class="col">
                        <input
                            class="form-control input-lg"
                            type="text"
                            v-model="filterRole"
                            placeholder="Filter By Role"
                        />
                    </div>
                </div>
            </div>
            <br />
            <div class="p-4">
                <router-link to="/adminp">
                    <button
                        class="btn btn-dark btn-outline-light btn-lg px-6 mb-4"
                    >
                        Inapoi
                    </button>
                </router-link>
                <table class="table table-striped">
                    <thead class="thead-dark table-dark">
                        <tr>
                            <th scope="col">
                                <p class="text-center">ID Amenda</p>
                            </th>

                            <th scope="col">
                                <p class="text-center">Angajat</p>
                            </th>
                            <th scope="col">
                                <p class="text-center">Data emiterii</p>
                            </th>
                            <th scope="col">
                                <p class="text-center">Valoarea amenzii</p>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="fine in fines" :key="fine.index">
                            <td scope="row">
                                <p class="text-center">
                                    {{ fine.fine_id }}
                                </p>
                            </td>

                            <td scope="row">
                                <p class="text-center">
                                    {{ fine.employee_id }}
                                </p>
                            </td>
                            <td scope="row">
                                <p class="text-center">
                                    {{ fine.data_emiterii }}
                                </p>
                            </td>
                            <td scope="row">
                                <p class="text-center">
                                    {{ fine.pret_daune }} lei
                                </p>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <TheFooter class="fixed-bottom"></TheFooter>
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
            fines: [],
        };
    },
    beforeMount() {
        this.loadData();
    },
    methods: {
        async loadData() {
            const requestOne = axios.get(`/api/fines/`);
            await axios
                .all([requestOne])
                .then(
                    axios.spread((...responses) => {
                        this.fines = responses[0].data;
                    })
                )
                .catch((errors) => {
                    console.log(errors);
                });
        },
    },
    computed: {
        filterEmployees() {
            return this.employees
                .filter(
                    (employee) =>
                        employee.nume_angajat
                            .toLowerCase()
                            .indexOf(this.filterName.toLowerCase()) > -1
                )
                .filter(
                    (employee) =>
                        employee.prenume_angajat
                            .toLowerCase()
                            .indexOf(this.filterSurname.toLowerCase()) > -1
                )
                .filter(
                    (employee) =>
                        employee.role_id
                            .toString()
                            .indexOf(this.filterRole.toLowerCase()) > -1
                );
        },
    },
};
</script>
<style scoped></style>
