<template>
  <div>
    <section>
      <TheHeader></TheHeader>
      <div class="p-4">
        <router-link to="/adminp">
          <button class="btn btn-dark btn-outline-light btn-lg px-6 mb-4">
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
              <td>{{ idToCar(insurance) }}</td>
              <td>{{ idToCompany(insurance) }}</td>
              <td>{{ idToInsuranceType(insurance) }}</td>
              <td>{{ formatDate(insurance.Data_emiterii) }}</td>
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
      cars: [],
      companies: [],
      insuranceTypes: [],
      filterCar: "",
      filterCompanyName: "",
      filterInsuranceType: "",
      filterByValue: "",
    };
  },
  created() {
    this.loadData();
  },
  methods: {
    async loadData() {
      const requestOne = axios.get("/api/insurances");
      const requestTwo = axios.get("/api/cars");
      const requestThree = axios.get("/api/company");
      const requestFour = axios.get("/api/insurance");

      await axios
        .all([requestOne, requestTwo, requestThree, requestFour])
        .then(
          axios.spread((...responses) => {
            this.insurances = responses[0].data;
            this.cars = responses[1].data;
            this.companies = responses[2].data;
            this.insuranceTypes = responses[3].data;
          })
        )
        .catch((errors) => {
          console.log(errors);
        });
    },
    formatDate(dateToday) {
      return new Date(dateToday).toLocaleDateString();
    },
    idToInsuranceType(insurance) {
      const insuranceData = this.insuranceTypes.filter(
        (item) => item.insurance_type_id === insurance.insurance_type_id
      )[0];
      return insuranceData ? insuranceData.tip_asigurare : "No insurance found";
    },
    idToCompany(insurance) {
      const company = this.companies.filter(
        (item) => item.insurance_company_id === insurance.insurance_company_id
      )[0];
      return company ? company.denumire_companie_asigurari : "No company found";
    },
    idToCar(insurance) {
      const car = this.cars.filter(
        (item) => item.car_id === insurance.car_id
      )[0];
      return car ? `${car.marca} ${car.model}` : "Car could not be found";
    },
  },
};
</script>

<style scoped></style>
