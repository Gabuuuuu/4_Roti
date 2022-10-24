<template>
    <div>
        <section>
            <TheHeader class="fixed-top"></TheHeader>
            <div class="bg-image">
                <div class="container py-5 h-100">
                    <div
                        class="row d-flex justify-content-center align-items-center h-100"
                    >
                        <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                            <div
                                class="card bg-dark text-white"
                                style="border-radius: 1rem"
                            >
                                <div class="card-body p-5 text-center">
                                    <div class="mb-md-6 mt-md-4 pb-5">
                                        <h2 class="fw-bold mb-4">
                                            Introdu date de angajare
                                        </h2>

                                        <p class="text-white-50 mb-4">
                                            Completeaza toate campurile
                                            existente
                                        </p>
                                        <form
                                            @submit.prevent="addemployee"
                                            method="POST"
                                            enctype="multipart/form-data"
                                        >
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Alege un rol pentru
                                                    utilizator

                                                    <select
                                                        class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                        data-style="btn-success"
                                                        v-model="form.roleid"
                                                    >
                                                        <option
                                                            v-for="role in roles"
                                                            :key="role.role_id"
                                                        >
                                                            {{ role.role_id }}
                                                        </option>
                                                    </select>
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Introduceti numele
                                                    utilizatorului
                                                    <input
                                                        placeholder="Nume"
                                                        type="text"
                                                        class="form-control form-control-lg"
                                                        v-model="form.name"
                                                    />
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Introduceti prenumele
                                                    utilizatorului
                                                    <input
                                                        placeholder="Prenume"
                                                        type="text"
                                                        class="form-control form-control-lg"
                                                        v-model="form.surname"
                                                    />
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Introduceti CNP-ul
                                                    <input
                                                        placeholder="CNP"
                                                        type="text"
                                                        class="form-control form-control-lg"
                                                        v-model="form.CNP"
                                                    />
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Alege un act de identitate

                                                    <select
                                                        class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                        data-style="btn-success"
                                                        v-model="
                                                            form.LicenseType
                                                        "
                                                    >
                                                        <option>Buletin</option>
                                                        <option>
                                                            Pasaport
                                                        </option>
                                                    </select>
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Introduceti nr
                                                    <input
                                                        placeholder="Nr"
                                                        type="text"
                                                        class="form-control form-control-lg"
                                                        v-model="form.nr"
                                                    />
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Data eliberarii actului
                                                    <input
                                                        placeholder="Data eliberare"
                                                        type="date"
                                                        class="form-control form-control-lg"
                                                        v-model="
                                                            form.LicenseDate
                                                        "
                                                    />
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Introduceti domiciliul
                                                    angajatului
                                                    <input
                                                        placeholder="Domiciliu"
                                                        type="text"
                                                        class="form-control form-control-lg"
                                                        v-model="form.Home"
                                                    />
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Introduceti strada
                                                    <input
                                                        placeholder="Strada"
                                                        type="text"
                                                        class="form-control form-control-lg"
                                                        v-model="form.Street"
                                                    />
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Introduceti nr strazii
                                                    <input
                                                        placeholder="Nr Strada"
                                                        type="text"
                                                        class="form-control form-control-lg"
                                                        v-model="form.StreetNr"
                                                    />
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Introduceti apartamentul
                                                    <input
                                                        placeholder="Apartament"
                                                        type="text"
                                                        class="form-control form-control-lg"
                                                        v-model="form.Apartment"
                                                    />
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Introduceti sectorul
                                                    <input
                                                        placeholder="Sector"
                                                        type="text"
                                                        class="form-control form-control-lg"
                                                        v-model="form.Sector"
                                                    />
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Data inceputului angajarii
                                                    <input
                                                        placeholder="Data inceput"
                                                        type="date"
                                                        class="form-control form-control-lg"
                                                        v-model="form.StartDate"
                                                    />
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Data semnarii contractului
                                                    <input
                                                        placeholder="Data semnare"
                                                        type="date"
                                                        class="form-control form-control-lg"
                                                        v-model="
                                                            form.SigningDate
                                                        "
                                                    />
                                                </p>
                                            </div>
                                            <br />
                                            <button
                                                class="btn btn-outline-light btn-lg px-5 mb-1"
                                                type="submit"
                                            >
                                                Inregistrare Angajat
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <TheFooter></TheFooter>
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
            roles: [],

            form: {
                roleid: "",
                name: "",
                surname: "",
                CNP: "",
                LicenseType: "",
                nr: "",
                LicenseDate: "",
                Home: "",
                Street: "",
                StreetNr: "",
                Apartment: "",
                Sector: "",
                StartDate: "",
                SigningDate: "",
            },
            success: "",
        };
    },
    created() {
        this.loadData();
    },
    methods: {
        addemployee() {
            const data = new FormData();
            data.append("role_id", this.form.roleid);
            data.append("nume_angajat", this.form.name);
            data.append("prenume_angajat", this.form.surname);
            data.append("CNP", this.form.CNP);
            data.append("actDeIdentitate", this.form.LicenseType);
            data.append("nr", this.form.nr);
            data.append("dataEliberarii", this.form.LicenseDate);
            data.append("domiciliul", this.form.Home);
            data.append("strada", this.form.Street);
            data.append("nrStrada", this.form.StreetNr);
            data.append("apartament", this.form.Apartment);
            data.append("sector", this.form.Sector);
            data.append("data_inceput_ang", this.form.StartDate);
            data.append("data_semnare_contract", this.form.SigningDate);

            axios.post("/api/employees", data).then(() => {
                this.$router.push({ path: "/employees" });
                this.loadData();
            });
        },
        async loadData() {
            const requestTwo = axios.get("/api/roles");

            await axios
                .all([requestTwo])
                .then(
                    axios.spread((...responses) => {
                        this.roles = responses[0].data;
                    })
                )
                .catch((errors) => {
                    console.log(errors);
                });
        },
    },
};
</script>

<style scoped>
.bg-image {
    background-image: url("../../../../../public/images/BgAuth.jpg");
    background-size: cover;
    background-position: center;
}
a {
    text-decoration: none;
    color: white;
    opacity: 0.8;
}
.card {
    opacity: 0.8;
}
</style>
