<template>
    <div>
        <section>
            <TheHeader></TheHeader>
            <div class="">
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
                                v-model="filterPrice"
                                placeholder="Filter By Price/Day"
                            />
                        </div>
                        <div class="col">
                            <input
                                class="form-control input-lg"
                                type="text"
                                v-model="filterEmail"
                                placeholder="Filter By Email"
                            />
                        </div>

                        <div class="col">
                            <input
                                class="form-control input-lg"
                                type="text"
                                v-model="filterName"
                                placeholder="Filter By Name"
                            />
                        </div>

                        <div class="col">
                            <input
                                class="form-control input-lg"
                                type="text"
                                v-model="filterTotal"
                                placeholder="Filter By Total Paid"
                            />
                        </div>
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
                        <tr v-for="car in cars" :key="car.index">
                            <th scope="row">{{ car.car_id }}</th>
                            <td>{{ car.marca }}</td>
                            <td>{{ car.model }}</td>
                            <td>{{ car.an }}</td>
                            <td>{{ car.car_type_id }}</td>
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
import TheFooter from "../../components/layout/TheFooter.vue";
import TheHeader from "../../components/layout/TheHeader";
export default {
    components: { TheHeader, TheFooter },
    data() {
        return {
            cars: [],
            filterBrand: "",
            filterModel: "",
            filterPrice: "",
            filterEmail: "",
            filterName: "",
            filterDays: "",
            filterTotal: "",
        };
    },
    created() {
        this.loadData();
    },
    methods: {
        async loadData() {
            const response = await axios.get("api/cars");
            this.cars = response.data;
        },
    },
    computed: {
        filterInvoices() {
            return this.invoices
                .filter(
                    (invoice) =>
                        invoice.brand
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
                        invoice.priceday
                            .toLowerCase()
                            .indexOf(this.filterPrice.toLowerCase()) > -1
                )
                .filter(
                    (invoice) =>
                        invoice.email
                            .toLowerCase()
                            .indexOf(this.filterEmail.toLowerCase()) > -1
                )
                .filter(
                    (invoice) =>
                        invoice.cardname
                            .toLowerCase()
                            .indexOf(this.filterName.toLowerCase()) > -1
                )
                .filter(
                    (invoice) =>
                        invoice.days
                            .toLowerCase()
                            .indexOf(this.filterDays.toLowerCase()) > -1
                )
                .filter(
                    (invoice) =>
                        invoice.total
                            .toLowerCase()
                            .indexOf(this.filterTotal.toLowerCase()) > -1
                );
        },
    },
};
</script>

<style scoped></style>
