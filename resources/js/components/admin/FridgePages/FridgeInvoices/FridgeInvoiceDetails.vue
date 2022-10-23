<template>
  <div>
    <section>
      <div class="container">
        <div class="row">
          <!-- BEGIN INVOICE -->
          <div class="col-xs-12">
            <div class="grid invoice">
              <div class="grid-body">
                <div class="invoice -title">
                  <div class="row">
                    <h1 class="logo">
                      <router-link to="/home">4<span>Roti</span> </router-link>
                    </h1>
                  </div>
                  <br />
                  <div class="row">
                    <div class="col-xs-12">
                      <h2>
                        Factura<br />
                        <span class="small"
                          >Comanda {{ fridge.fridge_invoice_id }}</span
                        >
                      </h2>
                    </div>
                  </div>
                </div>
                <hr />
                <div class="row m-b-4">
                  <div class="col-xs-6">
                    <address>
                      <strong>Livrat catre:</strong><br />
                      Romania, Bucuresti<br />
                      Sector 5, Str. Ileana Cosanzeana 10<br />
                      305142<br />
                      <abbr title="Phone">P:</abbr> (+40) 0723-077-177
                    </address>
                  </div>
                  <div class="col-xs-6 text-end position-absolute end-0">
                    <address>
                      <strong>Livrat de catre:</strong><br />
                      {{ idToSuppplierName(fridge.supplier_id) }}<br />
                    </address>
                  </div>
                </div>

                <div class="row">
                  <div class="col-xs-6">
                    <address>
                      <strong>Metoda de plata:</strong><br />
                      Visa ending **** 1234<br />
                    </address>
                  </div>
                  <div class="col-xs-6 text-end position-absolute end-0">
                    <address>
                      <strong>Order Date:</strong><br />
                      {{ fridge.data_emiterii }}
                    </address>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-12">
                    <h3>REZUMATUL COMENZII</h3>
                    <table class="table table-striped">
                      <thead>
                        <tr class="line">
                          <td class="text-center">
                            <strong>Denumire model</strong>
                          </td>
                          <td class="text-center">
                            <strong>Pret</strong>
                          </td>
                          <td class="text-center">
                            <strong>Cantitate</strong>
                          </td>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td class="text-center">
                            {{ fridge.denumire_model }}
                          </td>
                          <td class="text-center">
                            {{ fridge.pret }}
                          </td>
                          <td class="text-center">
                            {{ fridge.cantitate }}
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-12 text-right identity">
                    <p>Factura generata de<br /><strong>4 Roti SRL.</strong></p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- END INVOICE -->
        </div>
      </div>
    </section>
  </div>
</template>

<script>
export default {
  data() {
    return {
      fridge: [],
      suppliers: [],
    };
  },
  beforeMount() {
    this.loadData();
  },
  methods: {
    async loadData() {
      const response = await axios.get(
        `/api/loadFridgeInvoice/` + this.$route.params.id
      );
      const responseData = response.data;
      const responseTwo = await axios.get("/api/fridgeSuppliers");

      this.fridge = responseData;
      this.suppliers = responseTwo.data;
    },
    idToSuppplierName(id) {
      if (!_.isEmpty(this.fridge)) {
        const supplier = this.suppliers.filter(
          (item) => item.supplier_id === id
        )[0];
        return supplier.denumire_furnizor;
      }
    },
    formatDate(dateToday) {
      return new Date(dateToday).toLocaleDateString();
    },
  },
};
</script>

<style scoped>
body {
  margin-top: 20px;
  background: #eee;
}
a {
  text-decoration: none;
}

a:hover {
  text-decoration: none;
}

h1,
h2,
h3,
h4,
h5,
h6 {
  font-family: "Roboto", sans-serif;
}
#header {
  background: rgba(1, 0, 56, 0.255);
  transition: all 0.5s;
  z-index: 997;
  height: 86px;
  box-shadow: 0px 30px 30px rgba(1, 0, 56, 0.255);
  opacity: 0.8;
}
.logo {
  font-size: 50px;
  margin: 0;
  padding: 0;
  line-height: 1;
  font-weight: 600;
  letter-spacing: 1px;
  font-family: "Lobster", cursive;
}
.logo a {
  color: #000000;
}
.logo a span {
  color: #ff2525;
}

.invoice {
  padding: 30px;
}

.invoice h2 {
  margin-top: 0px;
  line-height: 0.8em;
}

.invoice .small {
  font-weight: 300;
}

.invoice hr {
  margin-top: 10px;
  border-color: #ddd;
}

.invoice .table tr.line {
  border-bottom: 1px solid #ccc;
}

.invoice .table td {
  border: none;
}

.invoice .identity {
  margin-top: 10px;
  font-size: 1.1em;
  font-weight: 300;
}

.invoice .identity strong {
  font-weight: 600;
}

.grid {
  position: relative;
  width: 100%;
  background: #fff;
  color: #666666;
  border-radius: 2px;
  margin-bottom: 25px;
  box-shadow: 0px 1px 4px rgba(0, 0, 0, 0.1);
}
</style>
