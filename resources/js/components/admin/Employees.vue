<template>
    <div>
        <section>
            <TheHeader></TheHeader>

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
                                <p class="text-center">ID Angajat</p>
                            </th>

                            <th scope="col"><p class="text-center">Nume</p></th>
                            <th scope="col">
                                <p class="text-center">Prenume</p>
                            </th>
                            <th scope="col">
                                <p class="text-center">Rol Angajat</p>
                            </th>
                            <th scope="col">
                                <p class="text-center">Detalii Complete</p>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="employee in employees" :key="employee.index">
                            <td scope="row">
                                <p class="text-center">
                                    {{ employee.employee_id }}
                                </p>
                            </td>

                            <td scope="row">
                                <p class="text-center">
                                    {{ employee.nume_angajat }}
                                </p>
                            </td>
                            <td scope="row">
                                <p class="text-center">
                                    {{ employee.prenume_angajat }}
                                </p>
                            </td>
                            <td scope="row">
                                <p class="text-center">
                                    {{ getUsersRole(employee) }}
                                </p>
                            </td>

                            <td scope="row">
                                <p class="text-center">
                                    <router-link
                                        :to="{
                                            name: 'employeedetails',
                                            params: {
                                                id: employee.employee_id,
                                            },
                                        }"
                                        class="btn btn-info btn-outline-dark btn-s"
                                    >
                                        Detalii
                                    </router-link>
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
import TheFooter from "../../components/layout/TheFooter.vue";
import TheHeader from "../../components/layout/TheHeader";
export default {
    components: { TheHeader, TheFooter },
    data() {
        return {
            employees: [],
        };
    },
    beforeMount() {
        this.loadData();
    },
    methods: {
        async loadData() {
            const requestOne = axios.get("api/employees");
            const requestTwo = axios.get("api/roles");

            await axios
                .all([requestOne, requestTwo])
                .then(
                    axios.spread((...responses) => {
                        this.employees = responses[0].data;
                        this.roles = responses[1].data;
                    })
                )
                .catch((errors) => {
                    console.log(errors);
                });
        },
        getUsersRole(employee) {
            const filteredRole = this.roles.filter((item) => item.role_id === employee.role_id)[0];
            return filteredRole.denumire_rol;
        }
    },
};
</script>
<style scoped></style>
