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
              <div class="card bg-dark text-white" style="border-radius: 1rem">
                <div class="card-body p-5 text-center">
                  <router-link to="/home">
                    <button class="btn btn-outline-light btn-lg px-6">
                      Inapoi la pagina principala
                    </button>
                  </router-link>
                  <div class="mb-md-6 mt-md-4 pb-5">
                    <h2 class="fw-bold mb-4">
                      Panou Administrativ -
                      {{ getUsersRole() }}
                    </h2>

                    <p class="text-white-50 mb-4">
                      Alege optiunea preferata de mai jos !
                    </p>

                    <div v-for="link in matchingDynamicLinks" :key="link.id">
                      <router-link :to="link.linkURL">
                        <button class="btn btn-outline-light btn-lg px-6">
                          {{ link.linkText }}
                        </button>
                      </router-link>
                    </div>

                    <!-- <div>
                      <router-link to="/users">
                        <button class="btn btn-outline-light btn-lg px-5 mb-1">
                          Utilizatori
                        </button>
                      </router-link>
                    </div>
                    <br />
                    <div>
                      <router-link to="/employees">
                        <button class="btn btn-outline-light btn-lg px-5 mb-1">
                          Angajati
                        </button>
                      </router-link>
                    </div>
                    <br />
                    <div>
                      <router-link to="/addCar">
                        <button class="btn btn-outline-light btn-lg px-5 mb-1">
                          Achizitioneaza o masina
                        </button>
                      </router-link>
                    </div>
                    <br />
                    <div>
                      <router-link to="/carinvoices">
                        <button class="btn btn-outline-light btn-lg px-5 mb-1">
                          Facturi masini
                        </button>
                      </router-link>
                    </div>
                    <br />
                    <div>
                      <router-link to="/addRevision">
                        <button class="btn btn-outline-light btn-lg px-5 mb-1">
                          Inregistreaza o revizie
                        </button>
                      </router-link>
                    </div>
                    <br />
                    <div>
                      <router-link to="/revisions">
                        <button class="btn btn-outline-light btn-lg px-5 mb-1">
                          Reviziile masinilor
                        </button>
                      </router-link>
                    </div>
                    <br />
                    <div>
                      <router-link to="/addrepairnotice">
                        <button class="btn btn-outline-light btn-lg px-5 mb-1">
                          Trimite o constatare de daune
                        </button>
                      </router-link>
                    </div>
                    <br />
                    <div>
                      <router-link to="/repairnotices">
                        <button class="btn btn-outline-light btn-lg px-5 mb-1">
                          Lista constatari daune
                        </button>
                      </router-link>
                    </div>
                    <br />
                    <div>
                      <router-link to="/repairinvoices">
                        <button class="btn btn-outline-light btn-lg px-5 mb-1">
                          Facturi reparatii
                        </button>
                      </router-link>
                    </div>
                    <br />
                    <div>
                      <router-link to="/removecar">
                        <button class="btn btn-outline-light btn-lg px-5 mb-1">
                          Remove a Car
                        </button>
                      </router-link>
                    </div>
                    <br /> -->
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
        1: [],
        2: [
          {
            linkText: "Facturi masini",
            linkURL: "/carinvoices",
          },
          {
            linkText: "Facturi reparatii masini",
            linkURL: "/repairinvoices",
          },
          {
            linkText: "Lista constatari daune",
            linkURL: "/repairNotices",
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
            linkText: "Adauga o masina",
            linkURL: "/addCar",
          },
          {
            linkText: "Angajati",
            linkURL: "/employees",
          },
        ],
      },
      matchingDynamicLinks: "",
    };
  },
  methods: {
    getUsersRole() {
      return this.rolProperties.denumire_rol;
    },
    getUsersDepartment() {
      return this.rolProperties.department_id.toString();
    },
  },
  created() {
    const matchingDepID = Object.keys(this.routesByRole).filter(
      (key) => key === this.getUsersDepartment()
    )[0];
    this.matchingDynamicLinks = this.routesByRole[matchingDepID];
  },
};
</script>

<style scoped>
.bg-image {
  background-image: url("../../../../public/photos/BgAuth.jpg");
  height: 100vh;
  background-size: cover;
  background-position: center;
}

button {
    width: 300px;
    margin-bottom: 20px;
}
</style>
