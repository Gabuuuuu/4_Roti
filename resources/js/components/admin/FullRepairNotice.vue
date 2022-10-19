<template>
    <div>
        <section>
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
                                    <router-link to="/repairnotices">
                                        <button
                                            class="btn btn-outline-light btn-lg px-6 mb-2"
                                            type="submit"
                                        >
                                            Inapoi
                                        </button>
                                    </router-link>

                                    <div class="mb-md-6 mt-md-4 pb-5">
                                        <h2 class="fw-bold mb-4">
                                            ID Instiintare:
                                            {{ repairnotice.Id_repair_notice }}
                                        </h2>
                                        <h2 class="fw-bold mb-4">
                                            {{ repairnotice.car_id }} -
                                            {{ repairnotice.employee_id }}
                                        </h2>

                                        <p class="text-white-50 mb-4">
                                            Conditia Masinii
                                        </p>
                                        <div
                                            class="form-outline form-white mb-4"
                                        >
                                            <h4>Detaliile daunelor cauzate:</h4>
                                            <h4>
                                                {{ repairnotice.damage_info }}
                                            </h4>
                                        </div>
                                        <div
                                            class="form-outline form-white mb-4"
                                        >
                                            <h4>Costul de reparatie:</h4>
                                            <h4>
                                                {{ repairnotice.damage_cost }}€
                                            </h4>
                                        </div>
                                        <div
                                            class="form-outline form-white mb-4"
                                        >
                                            <h4>Data emitere instiintare:</h4>
                                            <h4>
                                                {{ repairnotice.data_emiterii }}
                                            </h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</template>

<script>
export default {
    data() {
        return {
            repairnotice: [],
        };
    },
    created() {
        this.loadData();
    },
    methods: {
        async loadData() {
            const requestOne = axios.get(
                "/api/loadRepairNotice/" + this.$route.params.id
            );
            await axios
                .all([requestOne])
                .then(
                    axios.spread((...responses) => {
                        this.repairnotice = responses[0].data;
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
    background-image: url("../../../../public/photos/BgAuth.jpg");
    background-size: cover;
    background-position: center;
}
img {
    width: 525px;
    height: 525px;
    object-fit: fill;
}
</style>
