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
                <p class="text-center">Cantitate</p>
              </th>
              <th scope="col">
                <p class="text-center">Pret</p>
              </th>
              <th scope="col">
                <p class="text-center">Data emiterii</p>
              </th>
              <th scope="col">
                <p class="text-center">Factura completa</p>
              </th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="fridge in fridges" :key="fridge.frigde_model_id">
              <td scope="row">
                <p class="text-center">
                  {{ fridge.fridge_invoice_id }}
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
                  {{ fridge.pret }}
                </p>
              </td>
              <td scope="row">
                <p class="text-center">
                  {{ fridge.cantitate }}
                </p>
              </td>
              <td scope="row">
                <p class="text-center">
                  {{ formatDate(fridge.data_emiterii) }}
                </p>
              </td>
              <td scrope="row" class="text-center">
                <button class="btn btn-light btn-outline-info btn-s">
                  <router-link
                    class="text-muted text-decoration-none fs-5"
                    :to="{
                      name: 'fridgeInvoicesDetails',
                      params: { id: fridge.fridge_invoice_id },
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
      fridges: [],
      suppliers: [],
    };
  },
  beforeMount() {
    this.loadData();
  },
  methods: {
    async loadData() {
      const response = await axios.get(`/api/fridgeInvoices`);
      const responseData = response.data;

      this.fridges = responseData[0];
      this.suppliers = responseData[1];
    },
    idToSuppplierName(id) {
      const supplier = this.suppliers.filter(
        (item) => item.supplier_id === id
      )[0];
      return supplier.denumire_furnizor;
    },
    formatDate(dateToday) {
      return new Date(dateToday).toLocaleDateString();
    },
  },
};
</script>W
