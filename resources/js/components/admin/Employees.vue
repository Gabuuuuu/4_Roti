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
                            <th scope="col"><p class="text-center">ID Angajat</p></th>

                            <th scope="col"><p class="text-center">Nume</p></th>
                            <th scope="col"><p class="text-center">Prenume</p></th>
                            <th scope="col">
                                <p class="text-center">Rol Angajat</p>
                            </th>
                            <th scope="col">
                                <p class="text-center">Schimba Rolul</p>
                            </th>
                            <th scope="col">
                                <p class="text-center">Confirma</p>
                            </th>
                            <th scope="col">
                                <p class="text-center">Detalii Complete</p>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="employee in employees" :key="employee.index">
                            <td scope="row">
                                <p class="text-center">{{ employee.employee_id }}</p>
                            </td>

                            <td scope="row">
                                <p class="text-center">{{ employee.nume_angajat }}</p>
                            </td>
                            <td scope="row">
                                <p class="text-center">{{ employee.prenume_angajat }}</p>
                            </td>
                            <td scope="row">
                                <p class="text-center">{{ roles[employee.role_id].denumire_rol }}</p>
                            </td>
                            <td scope="row">
                                <p class="text-center">
                                    <select
                                        v-model="form.role"
                                        class="selectpicker btn btn-outline-dark btn-s dropdown-toggle form-control form-control-lg"
                                        data-style="btn-success"
                                    >
                                        <option
                                            v-for="role in roles"
                                            :key="role.index"
                                        >
                                            {{ role.denumire_rol }}
                                        </option>
                                    </select>
                                </p>
                            </td>
                            <td scope="row">
                                <p class="text-center">
                                    <button
                                        class="btn btn-success btn-s"
                                        @click="changeRole()"
                                    >
                                        Schimba Rolul
                                    </button>
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
            role: [],
            form: {
                role: "",
            },
        };
    },
    beforeMount() {
        this.loadData();
    },
    methods: {
        async loadData() {
            const requestOne = axios.get("api/employees");
            const requestTwo = axios.get("api/roles");

            await axios.all([requestOne, requestTwo]).then(axios.spread((...responses) => {
                this.employees = responses[0].data;
                this.roles = responses[1].data;
                console.log()
                this.form.role = this.roles[0].denumire_rol;
            })).catch(errors => {
                console.log(errors)
            })

        },
        changeRole(id) {
            let res;
            axios.put(`api/users/${id}`, this.form.role).then((data) => {
                res = data;
                console.log(res.data)
            });
            this.loadData();
        },
    },
};
</script>
<style scoped></style>
