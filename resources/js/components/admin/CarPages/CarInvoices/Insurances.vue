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
                    <div class="col">
                        <input
                            class="form-control input-lg"
                            type="text"
                            v-model="filterType"
                            placeholder="Filter By Car Type"
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
                            <th scope="col">ID Asigurare</th>
                            <th scope="col">Masina</th>
                            <th scope="col">Compania de asigurari</th>
                            <th scope="col">Tipul de asigurare</th>
                            <th scope="col">Data emiterii</th>
                            <th scope="col">Pretul asigurarii</th>
                        </tr>
                    </thead>

                    <tbody class="text-center fs-5">
                        <tr
                            v-for="insurance in insurances"
                            :key="insurance.index"
                        >
                            <th scope="row">{{ insurance.insurance_id }}</th>
                            <td>{{ insurance.car_id }}</td>
                            <td>{{ insurance.insurance_company_id }}</td>
                            <td>{{ insurance.insurance_type_id }}</td>
                            <td>{{ insurance.Data_emiterii }}</td>
                            <td>{{ insurance.Pret_asigurare }} lei</td>
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
            insurances: [],
        };
    },
    created() {
        this.loadData();
    },
    methods: {
        async loadData() {
            const requestOne = axios.get("/api/insurances");

            await axios
                .all([requestOne])
                .then(
                    axios.spread((...responses) => {
                        this.insurances = responses[0].data;
                    })
                )
                .catch((errors) => {
                    console.log(errors);
                });
        },
    },
};
</script>

<style scoped></style>
