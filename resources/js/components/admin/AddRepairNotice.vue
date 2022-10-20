<template>
    <div>
        <section>
            <div class="bg-image">
                <TheHeader class="fixed-top"></TheHeader>
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
                                    <router-link to="/adminp">
                                        <button
                                            class="btn btn-outline-light btn-lg px-6 mb-2"
                                            type="submit"
                                        >
                                            Inapoi
                                        </button>
                                    </router-link>
                                    <div class="mb-md-6 mt-md-4 pb-5">
                                        <h2 class="fw-bold mb-4">
                                            Inregistreaza o constatare de daune
                                        </h2>

                                        <p class="text-white-50 mb-4">
                                            Completeaza datele constatarii
                                        </p>
                                        <form
                                            @submit.prevent="addnotice"
                                            method="POST"
                                            enctype="multipart/form-data"
                                        >
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Alege masina afectata

                                                    <select
                                                        class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                        data-style="btn-success"
                                                        v-model="form.car"
                                                    >
                                                        <option
                                                            v-for="car in cars"
                                                            :key="car.car_id"
                                                        >
                                                            {{ car.car_id }}
                                                        </option>
                                                    </select>
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Alege angajatul implicat in
                                                    accident
                                                    <select
                                                        class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
                                                        data-style="btn-success"
                                                        v-model="form.employee"
                                                    >
                                                        <option
                                                            v-for="employee in employees"
                                                            :key="
                                                                employee.employee_id
                                                            "
                                                        >
                                                            {{
                                                                employee.employee_id
                                                            }}
                                                        </option>
                                                    </select>
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Te rog sa introduci avariile
                                                    pe care masina le-a
                                                    prezentat
                                                    <textarea
                                                        class="form-control form-control-lg"
                                                        data-style="btn-success"
                                                        v-model="
                                                            form.damage_info
                                                        "
                                                    >
                                                    </textarea>
                                                </p>
                                            </div>
                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <p>
                                                    Introduceti suma totala care
                                                    a fost necesara repararii
                                                    masinii prezentat
                                                    <input
                                                        class="form-control form-control-lg"
                                                        v-model="
                                                            form.damage_cost
                                                        "
                                                    />
                                                </p>
                                            </div>

                                            <button
                                                class="btn btn-outline-light btn-lg px-5 mb-1"
                                                type="submit"
                                            >
                                                Trimite instiintarea
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <TheFooter class="fixed-bottom"></TheFooter>
            </div>
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
            cars: [],
            employees: [],
            form: {
                car: "",
                employee: "",
                damage_info: "",
                damage_cost: "",
            },
            success: "",
        };
    },
    created() {
        this.loadData();
    },
    methods: {
        addnotice() {
            const data = new FormData();
            data.append("car_id", this.form.car);
            data.append("employee_id", this.form.employee);
            data.append("damage_info", this.form.damage_info);
            data.append("damage_cost", this.form.damage_cost);

            axios.post("/api/repairnotices", data).then(() => {
                this.$router.push({ path: "/adminp" });
                this.loadData();
            });
        },
        async loadData() {
            const response = await axios.get("api/cars");
            const response1 = await axios.get("api/employees");
            this.cars = response.data;
            this.employees = response1.data;
        },
    },
};
</script>

<style scoped>
.bg-image {
    background-image: url("../../../../public/photos/BgAuth.jpg");
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
