<template>
    <div>
        <section>
            <TheHeader></TheHeader>

            <br />
            <div class="p-5">
                <table class="table table-striped">
                    <thead class="thead-dark table-dark">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Name</th>
                            <th scope="col">Email</th>
                            <th scope="col">Role</th>
                            <th scope="col">Change Role</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="user in users" :key="user.index">
                            <th scope="row">{{ user.id }}</th>
                            <td>{{ user.name }}</td>
                            <td>{{ user.email }}</td>
                            <td>{{ user.role }}</td>
                            <td>
                                <button
                                    class="btn btn-outline-dark btn-s"
                                    @click="changeRole(user.id)"
                                >
                                    Change Role
                                </button>
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
        changeRole(id) {
            axios.get("/api/users/changeRole/" + id).then(this.loadData());
        },
    },
};
</script>
<style scoped></style>
