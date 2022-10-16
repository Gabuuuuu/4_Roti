<template>
    <div>
        <section>
            <TheHeader></TheHeader>

            <br />
            <div class="p-4">
                <table class="table table-striped">
                    <thead class="thead-dark table-dark">
                        <tr>
                            <th scope="col"><center>ID Utilizator</center></th>
                            <th scope="col">
                                <center>Nume Utilizator</center>
                            </th>
                            <th scope="col"><center>Email</center></th>
                            <th scope="col"><center>Rol Utilizator</center></th>
                            <th scope="col"><center>Alege un rol</center></th>
                            <th scope="col"><center>Schimba Rolul</center></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="user in users" :key="user.index">
                            <td scope="row">
                                <center>{{ user.user_id }}</center>
                            </td>
                            <td scope="row">
                                <center>{{ user.name }}</center>
                            </td>
                            <td scope="row">
                                <center>{{ user.email }}</center>
                            </td>
                            <td scope="row">
                                <center>{{ user.employee_id }}</center>
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
                                        class="btn btn-outline-dark btn-s"
                                        @click="changeRole()"
                                    >
                                        Schimba Rolul
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
            users: [],
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
            const response = await axios.get("api/users");
            const loadRole = await axios.get("api/roles");
            this.users = response.data;
            this.roles = loadRole.data;
        },
        changeRole() {
            //  Don't forget to reload the data (this.loadData()) ;
        },
    },
};
</script>
<style scoped></style>
