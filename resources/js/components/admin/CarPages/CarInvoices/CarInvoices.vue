<template>
    <div>
        <section>
            <TheHeader></TheHeader>
            <div class="container">
                <div class="row align-items-center">
                    <div class="col">
                        <input
                            class="form-control input-lg"
                            type="text"
                            v-model="filterBrand"
                            placeholder="Filter By Brand"
                        />
                    </div>
                    <div class="col">
                        <input
                            class="form-control input-lg"
                            type="text"
                            v-model="filterModel"
                            placeholder="Filter By Model"
                        />
                    </div>
                    <div class="col">
                        <input
                            class="form-control input-lg"
                            type="text"
                            v-model="filterYear"
                            placeholder="Filter By Year"
                        />
                    </div>
                </div>
            </div>
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
                        <tr class="text-center">
                            <th scope="col">Nr. masinii</th>
                            <th scope="col">Marca</th>
                            <th scope="col">Model</th>
                            <th scope="col">Anul</th>
                            <th scope="col">Tipul masinii</th>
                            <th scope="col">Factura completa</th>
                        </tr>
                    </thead>

                    <tbody class="text-center fs-5">
                        <tr v-for="car in filterInvoices" :key="car.index">
                            <th scope="row">{{ car.car_id }}</th>
                            <td>{{ car.marca }}</td>
                            <td>{{ car.model }}</td>
                            <td>{{ car.an }}</td>
                            <td>{{ findCarType(car.car_type_id) }}</td>
                            <td>
                                <button
                                    class="btn btn-light btn-outline-info btn-s"
                                >
                                    <router-link
                                        class="text-muted text-decoration-none fs-5"
                                        :to="{
                                            name: 'carinvoicedetails',
                                            params: { id: car.car_id },
                                        }"
                                    >
                                        Factura Completa
                                    </router-link>
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
import TheFooter from "../../../layout/TheFooter";
import TheHeader from "../../../layout/TheHeader";
export default {
    components: { TheHeader, TheFooter },
    data() {
        return {
            carInvoices: [],
            carTypes: [],
            filterBrand: "",
            filterModel: "",
            filterYear: "",
            filterType: "",
        };
    },
    created() {
        this.loadData();
    },
    methods: {
        async loadData() {
            const requestOne = axios.get("/api/cars");
            const requestTwo = axios.get("/api/loadCarTypes");

            await axios
                .all([requestOne, requestTwo])
                .then(
                    axios.spread((...responses) => {
                        this.carInvoices = responses[0].data;
                        this.carTypes = responses[1].data;
                    })
                )
                .catch((errors) => {
                    console.log(errors);
                });
        },
        findCarType(id) {
            return this.carTypes.filter((item) => item.car_type_id === id)[0]
                .denumire_tip_masina;
        },
    },
    computed: {
        filterInvoices() {
            return this.carInvoices
                .filter(
                    (invoice) =>
                        invoice.marca
                            .toLowerCase()
                            .indexOf(this.filterBrand.toLowerCase()) > -1
                )
                .filter(
                    (invoice) =>
                        invoice.model
                            .toLowerCase()
                            .indexOf(this.filterModel.toLowerCase()) > -1
                )
                .filter(
                    (invoice) =>
                        invoice.an
                            .toString()
                            .indexOf(this.filterYear.toLowerCase()) > -1
                );
        },
    },
};
</script>

<style scoped></style>
