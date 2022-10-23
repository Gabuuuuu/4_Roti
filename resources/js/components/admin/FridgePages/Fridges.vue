<template>
  <div>
    <section>
      <TheHeader></TheHeader>

      <br />
      <div class="p-4">
        <router-link to="/adminp">
          <button class="btn btn-dark btn-outline-light btn-lg px-6 mb-4">
            Inapoi
          </button>
        </router-link>
        <table class="table table-striped">
          <thead class="thead-dark table-dark">
            <tr>
              <th scope="col">
                <p class="text-center">ID Model Frigider</p>
              </th>

              <th scope="col"><p class="text-center">Distribuitori</p></th>
              <th scope="col">
                <p class="text-center">Denumire model</p>
              </th>
              <th scope="col">
                <p class="text-center">An fabricatie</p>
              </th>
              <th scope="col">
                <p class="text-center">Greutate</p>
              </th>
              <th scope="col">
                <p class="text-center">Marime</p>
              </th>
              <th scope="col">
                <p class="text-center">Consum energetic</p>
              </th>
              <th scope="col">
                <p class="text-center">Calitate</p>
              </th>
              <th scope="col">
                <p class="text-center">Volum</p>
              </th>
              <th scope="col">
                <p class="text-center">Pret</p>
              </th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="fridge in fridges" :key="fridge.frigde_model_id">
              <td scope="row">
                <p class="text-center">
                  {{ fridge.fridge_model_id }}
                </p>
              </td>
              <td scope="row">
                <p class="text-center">
                  {{ idToSuppplierName(fridge.supplier_id) }}
                </p>
              </td>
              <td scope="row">
                <p class="text-center">
                  {{ fridge.denumire_model }}
                </p>
              </td>
              <td scope="row">
                <p class="text-center">
                  {{ formatDate(fridge.an_fabricatie) }}
                </p>
              </td>
              <td scope="row">
                <p class="text-center">
                  {{ fridge.greutate }}
                </p>
              </td>
              <td scope="row">
                <p class="text-center">
                  {{ fridge.marime }}
                </p>
              </td>
              <td scope="row">
                <p class="text-center">
                  {{ fridge.consum_energetic }}
                </p>
              </td>
              <td scope="row">
                <p class="text-center">
                  {{ fridge.calitate }}
                </p>
              </td>
              <td scope="row">
                <p class="text-center">
                  {{ fridge.volum }}
                </p>
              </td>
              <td scope="row">
                <p class="text-center">
                  {{ fridge.pret }}
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
        fridges: [],
        suppliers: [],
    };
  },
  beforeMount() {
    this.loadData();
  },
  methods: {
    async loadData() {
        const response = await axios.get(`/api/loadFridges/`);
        const responseData = response.data;

        this.suppliers = responseData[0];
        this.fridges = responseData[1];
    },
    idToSuppplierName(id) {
      const supplier = this.suppliers.filter(
        (item) => item.supplier_id === id
      )[0];
      return supplier.denumire_furnizor;
    },
    formatDate(dateToday) {
        return new Date(dateToday).toLocaleDateString();
    }
  },
};
</script>W
