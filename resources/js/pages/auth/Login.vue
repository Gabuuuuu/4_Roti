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
                                    <router-link to="/home">
                                        <button
                                            class="btn btn-outline-light btn-lg px-6 mb-4"
                                        >
                                            Back to the main page
                                        </button>
                                    </router-link>
                                    <form @submit.prevent="login">
                                        <div class="mb-md-6 mt-md-4 pb-5">
                                            <h2 class="fw-bold mb-4">
                                                Welcome !
                                            </h2>

                                            <p class="text-white-50 mb-4">
                                                Please enter your email and
                                                password!
                                            </p>

                                            <div
                                                class="form-outline form-white mb-4"
                                            >
                                                <input
                                                    @keyup.enter="login()"
                                                    v-model="form.email"
                                                    placeholder="Email"
                                                    type="email"
                                                    class="form-control form-control-lg"
                                                />
                                            </div>

                                            <div
                                                class="form-outline form-white mb-5"
                                            >
                                                <input
                                                    @keyup.enter="login()"
                                                    v-model="form.password"
                                                    placeholder="Password"
                                                    type="password"
                                                    class="form-control form-control-lg"
                                                />
                                            </div>
                                            <button
                                                class="btn btn-outline-light btn-lg px-5 mb-1"
                                                type="submit"
                                            >
                                                Login
                                            </button>
                                        </div>

                                        <p class="mb-1">
                                            <router-link
                                                to="/forgot"
                                                class="text-primary fw-bold"
                                            >
                                                Forgot my password.
                                            </router-link>
                                        </p>
                                        <p class="mb-2">
                                            Don't have an account?
                                            <router-link
                                                to="/register"
                                                class="text-primary fw-bold"
                                            >
                                                Signup</router-link
                                            >
                                        </p>
                                    </form>
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
            form: {
                email: "",
                password: "",
            },
        };
    },
    methods: {
        login() {
            axios
                .post("/api/login", this.form)
                .then((res) => {
                    this.responseAfterLogin(res);
                    this.loadData();
                })
                .catch((error) => console.log(error.response.data));
        },
        responseAfterLogin(res) {
            const access_token = res.data.access_token;
            const username = res.data.name;
            const id = res.data.id;
            const role = res.data.role;

            localStorage.setItem("token", access_token);
            localStorage.setItem("user", username);
            localStorage.setItem("id", id);
            localStorage.setItem("role", role);

            this.$router.push({ path: "/home" });
        },
    },
};
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
    color: white;
    opacity: 0.8;
}
.card {
    opacity: 0.8;
}
.mainp {
    font-size: 20px;
}
</style>
