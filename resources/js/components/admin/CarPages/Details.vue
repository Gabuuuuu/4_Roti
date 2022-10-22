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
                                    <router-link to="/prices">
                                        <button
                                            class="btn btn-outline-light btn-lg px-6 mb-4"
                                            type="submit"
                                        >
                                            Back to the cars
                                        </button>
                                    </router-link>

                                    <div class="mb-md-6 mt-md-4 pb-5">
                                        <h2 class="fw-bold mb-4">
                                            {{ car.brand }} {{ car.model }}
                                        </h2>

                                        <p class="text-white-50 mb-4">
                                            Here are all the details for our
                                            model
                                        </p>

                                        <div
                                            class="form-outline form-white mb-4"
                                        >
                                            <img
                                                :src="
                                                    '/images/cars/' + car.image
                                                "
                                                alt="Error"
                                                class="border rounded border-4 rounded-3"
                                            />
                                        </div>

                                        <div
                                            class="form-outline form-white mb-4"
                                        >
                                            <h4>{{ car.description }}</h4>
                                        </div>
                                        <div
                                            class="form-outline form-white mb-4"
                                        >
                                            <h4>Made in: {{ car.year }}</h4>
                                        </div>
                                        <div
                                            class="form-outline form-white mb-4"
                                        >
                                            <h4>Fuel Type: {{ car.fuel }}</h4>
                                        </div>
                                        <div
                                            class="form-outline form-white mb-4"
                                        >
                                            <h4>
                                                Consumption:
                                                {{ car.consumption }}
                                            </h4>
                                        </div>
                                        <div
                                            class="form-outline form-white mb-4"
                                        >
                                            <h4>
                                                Number of Seats: {{ car.seats }}
                                            </h4>
                                        </div>
                                        <div
                                            class="form-outline form-white mb-4"
                                        >
                                            <h4>Car Type: {{ car.body }}</h4>
                                        </div>
                                        <div
                                            class="form-outline form-white mb-4"
                                        >
                                            <h4>
                                                Transmission type:
                                                {{ car.transmission }}
                                            </h4>
                                        </div>
                                        <div
                                            class="form-outline form-white mb-4"
                                        >
                                            <h4>Price/Day: {{ car.price }}</h4>
                                        </div>
                                        <br />
                                        <router-link
                                            :to="{
                                                name: 'rentnow',
                                                params: { id: car.id },
                                            }"
                                        >
                                            <button
                                                class="btn btn-outline-light btn-lg px-5 mb-1"
                                                type="submit"
                                            >
                                                Rent now
                                            </button>
                                        </router-link>
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
            car: [],
        };
    },
    created() {
        this.loadData();
    },
    methods: {
        async loadData() {
            const response = await axios.get(
                "/api/loadCar/" + this.$route.params.id
            );
            this.car = response.data;
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
    width: 425px;
    height: 425px;
    object-fit: fill;
}
</style>
