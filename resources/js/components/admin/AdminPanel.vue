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
                                    <div class="mb-md-6 mt-md-4 pb-5">
                                        <h2 class="fw-bold mb-4">
                                            Welcome to the Admin Panel!
                                        </h2>

                                        <p class="text-white-50 mb-4">
                                            Please select the desired option
                                        </p>
                                        <div>
                                            <router-link to="/addcar">
                                                <button
                                                    class="btn btn-outline-light btn-lg px-5 mb-1"
                                                >
                                                    Add a Car
                                                </button>
                                            </router-link>
                                        </div>
                                        <br />
                                        <div>
                                            <router-link to="/invoices">
                                                <button
                                                    class="btn btn-outline-light btn-lg px-5 mb-1"
                                                >
                                                    Invoices
                                                </button>
                                            </router-link>
                                        </div>
                                        <br />
                                        <div>
                                            <router-link to="/removecar">
                                                <button
                                                    class="btn btn-outline-light btn-lg px-5 mb-1"
                                                >
                                                    Remove a Car
                                                </button>
                                            </router-link>
                                        </div>
                                        <br />
                                        <div>
                                            <router-link to="/addadmins">
                                                <button
                                                    class="btn btn-outline-light btn-lg px-5 mb-1"
                                                >
                                                    Give admin privilieges
                                                </button>
                                            </router-link>
                                        </div>
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
};
</script>

<style scoped>
.bg-image {
    background-image: url("../../../../public/photos/BgAuth.jpg");
    height: 100vh;
    background-size: cover;
    background-position: center;
}
</style>
