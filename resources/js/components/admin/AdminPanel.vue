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
                                    <router-link to="/home">
                                        <button
                                            class="btn btn-outline-light btn-lg px-6"
                                        >
                                            Inapoi la pagina principala
                                        </button>
                                    </router-link>
                                    <div class="mb-md-6 mt-md-4 pb-5">
                                        <h2 class="fw-bold mb-4">
                                            Panou Administrativ -
                                            {{ getUsersRoleName() }}
                                        </h2>

                                        <p
                                            v-if="matchingDynamicLinks.length"
                                            class="text-white-50 mb-4"
                                        >
                                            Alege optiunea preferata de mai jos
                                            !
                                        </p>

                                        <p v-else class="text-white-50 mb-4">
                                            Nu s-au putut gasi optiuni. Reveniti
                                            mai tarziu.
                                        </p>

                                        <div v-if="this.isDirector">
                                            <div
                                                v-for="link in routesByRole[4]"
                                                :key="link.id"
                                            >
                                                <router-link :to="link.linkURL">
                                                    <button
                                                        class="btn btn-outline-light btn-lg px-6"
                                                    >
                                                        {{ link.linkText }}
                                                    </button>
                                                </router-link>
                                            </div>
                                        </div>

                                        <div
                                            v-for="link in matchingDynamicLinks"
                                            :key="link.id"
                                        >
                                            <router-link :to="link.linkURL">
                                                <button
                                                    class="btn btn-outline-light btn-lg px-6"
                                                >
                                                    {{ link.linkText }}
                                                </button>
                                            </router-link>
                                        </div>

                                        <router-link
                                            v-if="
                                                this.isDirector &&
                                                this.getUsersDepartment() ===
                                                    '1'
                                            "
                                            to="/addFridge"
                                        >
                                            <button
                                                class="btn btn-outline-light btn-lg px-6"
                                            >
                                                Adauga frigider
                                            </button>
                                        </router-link>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
            rolProperties: JSON.parse(localStorage.getItem("roleData")),
            routesByRole: {
                1: [
                    {
                        linkText:
                            "Adauga informatii referitoare la permisul de conducere",
                        linkURL: "/AddDrivingLicense",
                    },
                    {
                        linkText: "Permise de conducere ale angajatilor",
                        linkURL: "/drivinglicenses",
                    },
                    {
                        linkText: "Frigidere",
                        linkURL: "/fridges",
                    },
                ],
                2: [
                    {
                        linkText: "Inregistreaza o amenda",
                        linkURL: "/registerfine",
                    },
                    {
                        linkText: "Amenzi angajati",
                        linkURL: "/fines",
                    },
                    {
                        linkText: "Inregistreaza o asigurare",
                        linkURL: "/addinsurance",
                    },
                    {
                        linkText: "Asigurarile masinilor actuale",
                        linkURL: "/insurances",
                    },
                    {
                        linkText: "Facturi masini",
                        linkURL: "/carinvoices",
                    },
                    {
                        linkText: "Cheltuieli totale",
                        linkURL: "/totalexpenses",
                    },
                    {
                        linkText: "Facturi reparatii masini",
                        linkURL: "/repairinvoices",
                    },
                    {
                        linkText: "Lista constatari daune",
                        linkURL: "/repairNotices",
                    },
                    {
                        linkText: "Facturi achizitii frigidere",
                        linkURL: "/fridgeInvoices",
                    },
                ],
                3: [
                    {
                        linkText: "Reviziile masinilor",
                        linkURL: "/revisions",
                    },
                    {
                        linkText: "Inregistreaza o revizie",
                        linkURL: "/addRevision",
                    },
                    {
                        linkText: "Lista constatari daune",
                        linkURL: "/repairNotices",
                    },
                    {
                        linkText: "Trimite o constatare de daune",
                        linkURL: "/addRepairNotice",
                    },
                ],
                4: [
                    {
                        linkText: "Utilizatori",
                        linkURL: "/users",
                    },
                    {
                        linkText: "Angajati",
                        linkURL: "/employees",
                    },
                    {
                        linkText: "Adauga o masina",
                        linkURL: "/addCar",
                    },
                    {
                        linkText: "Adauga o noua cursa",
                        linkURL: "/addCarTaken",
                    },
                ],
            },
            matchingDynamicLinks: "",
            isDirector: false,
        };
    },
    created() {
        this.generateDynamicLinks();
    },
    methods: {
        getUsersRoleName() {
            return this.rolProperties.denumire_rol;
        },
        getUsersDepartment() {
            return this.rolProperties.department_id.toString();
        },
        getUsersRoleID() {
            return this.rolProperties.role_id;
        },
        generateDynamicLinks() {
            const matchingDepID = Object.keys(this.routesByRole).filter(
                (key) => key === this.getUsersDepartment()
            )[0];

            const directorRoles = [2, 3, 4];
            this.isDirector = directorRoles.includes(this.getUsersRoleID());
            this.matchingDynamicLinks = this.routesByRole[matchingDepID];
        },
    },
};
</script>

<style scoped>
.bg-image {
    background-image: url("../../../../public/photos/BgAuth.jpg");
    background-attachment: fixed;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    min-height: 100vh;
}

button {
    width: 300px;
    margin-bottom: 20px;
}

.card {
    margin-top: 3rem;
}
</style>
