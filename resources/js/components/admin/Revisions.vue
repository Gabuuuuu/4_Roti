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
                                <p class="text-center">ID Revizie</p>
                            </th>

                            <th scope="col">
                                <p class="text-center">ID Masina</p>
                            </th>
                            <th scope="col">
                                <p class="text-center">Data Emiterii</p>
                            </th>

                            <th scope="col">
                                <p class="text-center">Detalii Complete</p>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="revision in revisions" :key="revision.index">
                            <td scope="row">
                                <p class="text-center">
                                    {{ revision.Id_revizie }}
                                </p>
                            </td>

                            <td scope="row">
                                <p class="text-center">
                                    {{ revision.car_id }}
                                </p>
                            </td>
                            <td scope="row">
                                <p class="text-center">
                                    {{ revision.data_emiterii }}
                                </p>
                            </td>

                            <td scope="row">
                                <p class="text-center">
                                    <router-link
                                        :to="{
                                            name: 'fullrevision',
                                            params: {
                                                id: revision.Id_revizie,
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
            revisions: [],
        };
    },
    beforeMount() {
        this.loadData();
    },
    methods: {
        async loadData() {
            const res = await axios.get("api/revisions");
            this.revisions = res.data;
        },
    },
};
</script>
<style scoped></style>
