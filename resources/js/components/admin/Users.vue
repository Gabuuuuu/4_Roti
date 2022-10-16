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
            const response = await axios.get("api/users");
            this.users = response.data;
        },
    },
};
</script>
<style scoped></style>
