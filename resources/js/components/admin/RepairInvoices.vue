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
                                <p class="text-center">ID Instiintare</p>
                            </th>

                            <th scope="col">
                                <p class="text-center"> Masina</p>
                            </th>

                            <th scope="col">
                                <p class="text-center">Detalii Factura</p>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr
                            v-for="repairnotice in repairnotices"
                            :key="repairnotice.index"
                        >
                            <td scope="row">
                                <p class="text-center">
                                    {{ repairnotice.Id_repair_notice }}
                                </p>
                            </td>

                            <td scope="row">
                                <p class="text-center">
                                    {{ idToCarName(repairnotice.car_id) }}
                                </p>
                            </td>

                            <td scope="row">
                                <p class="text-center">
                                    <router-link
                                        :to="{
                                            name: 'loadRepairNotice',
                                            params: {
                                                id: repairnotice.Id_repair_notice,
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
            repairnotices: [],
            cars: [],
        };
    },
    beforeMount() {
        this.loadData();
    },
    methods: {
        async loadData() {
            const requestOne = axios.get("/api/repairnotices");
            const requestTwo = axios.get("/api/cars");

            await axios
                .all([requestOne, requestTwo])
                .then(
                    axios.spread((...responses) => {
                        this.repairnotices = responses[0].data;
                        this.cars = responses[1].data;
                    })
                )
                .catch((errors) => {
                    console.log(errors);
                });
        },
        idToCarName(id) {
            const carDetails = this.cars.filter((item) => item.car_id === id)[0];
            return `${carDetails.car_id} - ${carDetails.marca} ${carDetails.model}`;
        }
    },
};
</script>
<style scoped></style>
