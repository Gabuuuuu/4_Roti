<template>
    <div>
        <section>
            <TheHeader></TheHeader>

            <br />
            <div class="p-4">
                <table class="table table-striped">
                    <thead class="thead-dark table-dark">
                        <tr>
                            <th scope="col"><center>ID Angajat</center></th>
                            <th scope="col">
                                <center>Rol Angajat</center>
                            </th>
                            <th scope="col"><center>Nume</center></th>
                            <th scope="col"><center>Prenume</center></th>
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
                                <center>{{ employee.role_id }}</center>
                            </td>
                            <td scope="row">
                                <center>{{ employee.nume_angajat }}</center>
                            </td>
                            <td scope="row">
                                <center>{{ employee.prenume_angajat }}</center>
                            </td>

                            <td scope="row">
                                <center>
                                    <button
                                        class="btn btn-outline-dark btn-s"
                                        type="submit"
                                    >
                                        Detalii
                                    </button>
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
        };
    },
    beforeMount() {
        this.loadData();
    },
    methods: {
        async loadData() {
            const response = await axios.get("api/employees");
            this.employees = response.data;
        },
    },
};
</script>
<style scoped></style>
