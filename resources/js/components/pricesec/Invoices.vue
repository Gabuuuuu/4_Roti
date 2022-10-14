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
                <table class="table table-striped">
                    <thead class="thead-dark table-dark">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Brand</th>
                            <th scope="col">Model</th>
                            <th scope="col">Price/Day</th>
                            <th scope="col">Email</th>
                            <th scope="col">Card Name</th>
                            <th scope="col">Days</th>
                            <th scope="col">Total Paid</th>
                            <th scope="col">Created at</th>
                            <th scope="col">Full invoice</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr
                            v-for="invoice in filterInvoices"
                            :key="invoice.index"
                        >
                            <th scope="row">{{ invoice.id }}</th>
                            <td>{{ invoice.brand }}</td>
                            <td>{{ invoice.model }}</td>
                            <td>${{ invoice.priceday }}</td>
                            <td>{{ invoice.email }}</td>
                            <td>{{ invoice.cardname }}</td>
                            <td>{{ invoice.days }}</td>
                            <td>${{ invoice.total }}</td>
                            <td>{{ invoice.created_at }}</td>
                            <td>
                                <button class="btn btn-outline-dark btn-s">
                                    <router-link
                                        class="text-muted"
                                        :to="{
                                            name: 'invoicedetails',
                                            params: { id: invoice.id },
                                        }"
                                    >
                                        Full Invoice
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
            invoices: [],
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
            const response = await axios.get("api/invoices");
            this.invoices = response.data;
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

<style scoped>
.button {
    text-decoration: none;
}
</style>
