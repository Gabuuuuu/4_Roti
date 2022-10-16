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
                            <th scope="col"><center>ID Angajat</center></th>

                            <th scope="col"><center>Nume</center></th>
                            <th scope="col"><center>Prenume</center></th>
                            <th scope="col">
                                <center>Rol Angajat</center>
                            </th>
                            <th scope="col">
                                <center>Schimba Rolul</center>
                            </th>
                            <th scope="col">
                                <center>Confirma</center>
                            </th>
                            <th scope="col">
                                <center>Detalii Complete</center>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="employee in employees" :key="employee.index">
                            <td scope="row">
                                <center>{{ employee.employee_id }}</center>
                            </td>

                            <td scope="row">
                                <center>{{ employee.nume_angajat }}</center>
                            </td>
                            <td scope="row">
                                <center>{{ employee.prenume_angajat }}</center>
                            </td>
                            <td scope="row">
                                <center>{{ employee.role_id }}</center>
                            </td>
                            <td scope="row">
                                <center>
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
                                </center>
                            </td>
                            <td scope="row">
                                <center>
                                    <button
                                        class="btn btn-success btn-s"
                                        @click="changeRole()"
                                    >
                                        Schimba Rolul
                                    </button>
                                </center>
                            </td>

                            <td scope="row">
                                <center>
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
                                </center>
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
            const response = await axios.get("api/employees");
            const loadRole = await axios.get("api/roles");
            this.roles = loadRole.data;
            this.employees = response.data;
        },
    },
};
</script>
<style scoped></style>
