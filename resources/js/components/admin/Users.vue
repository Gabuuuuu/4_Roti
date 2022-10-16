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
                            <th scope="col"><center>ID Utilizator</center></th>
                            <th scope="col">
                                <center>Nume Utilizator</center>
                            </th>
                            <th scope="col"><center>Email</center></th>
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
                                <center>{{ this.roles[user.employee_id].denumire_rol }}</center>
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
                                        @click="changeRole(user.user_id)"
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
        };
    },
    created() {
        this.loadData();
    },
    methods: {
        async loadData() {
            const requestOne = axios.get("api/guestUsers");
            const requestTwo = axios.get("api/roles");

            await axios.all([requestOne, requestTwo]).then(axios.spread((...responses) => {
                this.users = responses[0].data;
                this.roles = responses[1].data;
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
