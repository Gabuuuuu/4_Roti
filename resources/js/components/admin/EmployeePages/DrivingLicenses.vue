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
                                <p class="text-center">ID Angajat</p>
                            </th>

                            <th scope="col"><p class="text-center">Nume</p></th>
                            <th scope="col">
                                <p class="text-center">Prenume</p>
                            </th>
                            <th scope="col">
                                <p class="text-center">Data nasterii</p>
                            </th>
                            <th scope="col">
                                <p class="text-center">Locul nasterii</p>
                            </th>
                            <th scope="col">
                                <p class="text-center">CNP</p>
                            </th>
                            <th scope="col">
                                <p class="text-center">Tip Permis</p>
                            </th>

                            <th scope="col">
                                <p class="text-center">
                                    Data Emiterii Permisului
                                </p>
                            </th>
                            <th scope="col">
                                <p class="text-center">Data expirarii</p>
                            </th>
                            <th scope="col">
                                <p class="text-center">Autoritatea emiterii</p>
                            </th>
                            <th scope="col">
                                <p class="text-center">Numarul permisului</p>
                            </th>
                            <th scope="col">
                                <p class="text-center">Permis suspendat</p>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="license in licenses" :key="license.index">
                            <td scope="row">
                                <p class="text-center">
                                    {{ license.employee_id }}
                                </p>
                            </td>
                            <td scope="row">
                                <p class="text-center">
                                    {{ license.nume_angajat }}
                                </p>
                            </td>
                            <td scope="row">
                                <p class="text-center">
                                    {{ license.prenume_angajat }}
                                </p>
                            </td>
                            <td scope="row">
                                <p class="text-center">
                                    {{ license.data_nasterii }}
                                </p>
                            </td>
                            <td scope="row">
                                <p class="text-center">
                                    {{ license.locul_nasterii }}
                                </p>
                            </td>
                            <td scope="row">
                                <p class="text-center">
                                    {{ license.CNP }}
                                </p>
                            </td>
                            <td scope="row">
                                <p class="text-center">
                                    {{ license.license_type_id }}
                                </p>
                            </td>
                            <td scope="row">
                                <p class="text-center">
                                    {{ license.data_emiterii }}
                                </p>
                            </td>
                            <td scope="row">
                                <p class="text-center">
                                    {{ license.data_expirarii }}
                                </p>
                            </td>
                            <td scope="row">
                                <p class="text-center">
                                    {{ license.autoritatea_emiterii }}
                                </p>
                            </td>
                            <td scope="row">
                                <p class="text-center">
                                    {{ license.Nr_permis }}
                                </p>
                            </td>
                            <td scope="row">
                                <p class="text-center">
                                    {{ license.permis_suspendat }}
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
import TheFooter from "../../../components/layout/TheFooter";
import TheHeader from "../../../components/layout/TheHeader";

export default {
    components: { TheHeader, TheFooter },
    data() {
        return {
            licenses: [],
        };
    },
    beforeMount() {
        this.loadData();
    },
    methods: {
        async loadData() {
            const requestOne = axios.get(`/api/drivinglicenses`);

            await axios
                .all([requestOne])
                .then(
                    axios.spread((...responses) => {
                        this.licenses = responses[0].data;
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
