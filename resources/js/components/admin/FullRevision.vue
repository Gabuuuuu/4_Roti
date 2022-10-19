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
                                    <router-link to="/revisions">
                                        <button
                                            class="btn btn-outline-light btn-lg px-6 mb-2"
                                            type="submit"
                                        >
                                            Inapoi
                                        </button>
                                    </router-link>

                                    <div class="mb-md-6 mt-md-4 pb-5">
                                        <h2 class="fw-bold mb-4">
                                            Revizia nr:
                                            {{ revision.Id_revizie }}
                                        </h2>
                                        <h2 class="fw-bold mb-4">
                                            Data reviziei:
                                            {{ formatDate(revision.data_emiterii) }}
                                        </h2>
                                        <h2 class="fw-bold mb-4">
                                            Masina: {{ car.car_id }} - {{ car.marca }} {{ car.model }}
                                        </h2>

                                        <p class="text-white-50 mb-4">
                                            Conditia Masinii
                                        </p>
                                        <div
                                            class="form-outline form-white mb-4"
                                        >
                                            <h4>
                                                Starea motorului:
                                                {{ revision.StareMotor }}
                                            </h4>
                                        </div>
                                        <div
                                            class="form-outline form-white mb-4"
                                        >
                                            <h4>
                                                Starea luminilor:
                                                {{ revision.StareLumini }}
                                            </h4>
                                        </div>
                                        <div
                                            class="form-outline form-white mb-4"
                                        >
                                            <h4>
                                                Starea suspensiilor:
                                                {{ revision.StareAmortizor }}
                                            </h4>
                                        </div>

                                        <div
                                            class="form-outline form-white mb-4"
                                        >
                                            <h4>
                                                Starea franei:
                                                {{ revision.StareFrana }}
                                            </h4>
                                        </div>

                                        <div
                                            class="form-outline form-white mb-4"
                                        >
                                            <h4>
                                                Starea sistemului electric:
                                                {{
                                                    revision.StareSistemElectric
                                                }}
                                            </h4>
                                        </div>
                                        <div
                                            class="form-outline form-white mb-4"
                                        >
                                            <h4>
                                                Starea dotarilor:
                                                {{ revision.StareDotari }}
                                            </h4>
                                        </div>
                                        <div
                                            class="form-outline form-white mb-4"
                                        >
                                            <h4>
                                                Starea caucicurilor:
                                                {{ revision.StareCauciucuri }}
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
            revision: [],
            car: [],
        };
    },
    created() {
        this.loadData();
    },
    methods: {
        async loadData() {
            const response = await axios.get("/api/loadRevision/" + this.$route.params.id);
            this.revision = response.data[0];
            this.car = response.data[1];

            for (const item in this.revision) {
                if(item.includes('Stare')) {
                    if(this.revision[item] === 0) {
                        this.revision[item] = 'Buna';
                    } else {
                        this.revision[item] = 'Defect';
                    }
                }
            }
        },
        formatDate(dateToday) {
            return new Date(dateToday).toLocaleDateString();
        }
    }
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
