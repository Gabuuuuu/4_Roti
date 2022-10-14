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
                                    <div class="mb-md-6 mt-md-4 pb-5">
                                        <h2 class="fw-bold mb-5">
                                            Forgot Password
                                        </h2>

                                        <p class="text-white-50 mb-4">
                                            Enter the email of the lost account
                                        </p>

                                        <div
                                            class="form-outline form-white mb-5"
                                        >
                                            <input
                                                placeholder="Email"
                                                type="email"
                                                id="typeEmailX"
                                                class="form-control form-control-lg"
                                            />
                                        </div>

                                        <button
                                            class="btn btn-outline-light btn-lg px-5 mb-1"
                                            type="submit"
                                        >
                                            Submit
                                        </button>
                                    </div>

                                    <div class="deco">
                                        <p class="mb-1">
                                            <router-link
                                                to="/login"
                                                class="text-primary fw-bold"
                                                >Back to Login</router-link
                                            >
                                        </p>
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
export default {};
</script>

<style scoped>
.bg-image {
    background-image: url("../../../../public/photos/BgAuth.jpg");
    height: 100vh;
    background-size: cover;
    background-position: center;
}
a {
    text-decoration: none;
}
.card {
    opacity: 0.8;
}
</style>
