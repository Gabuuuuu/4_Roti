<template>
    <div>
        <header id="header" class="d-flex align-items-center">
            <div
                class="container d-flex align-items-center justify-content-between"
            >
                <h1 class="logo">
                    <router-link to="/home">
                        4-<span>Roti !</span>
                    </router-link>
                </h1>
                <nav id="navbar" class="navbar">
                    <ul>
                        <li>
                            <router-link class="nav-link" to="/home"
                                >Acasa
                            </router-link>
                        </li>
                        <li>
                            <router-link class="nav-link" to="/prices"
                                >Preturi Frigidere
                            </router-link>
                        </li>
                        <li>
                            <router-link class="nav-link" to="/cars"
                                >Masini
                            </router-link>
                        </li>
                        <li>
                            <router-link class="nav-link" to="/team"
                                >Echipa
                            </router-link>
                        </li>
                        <li v-if="!isAuthenticated">
                            <router-link class="nav-link" to="/login"
                                >Login
                            </router-link>
                        </li>
                        <li v-if="!isAuthenticated">
                            <router-link class="nav-link" to="/register"
                                >Register
                            </router-link>
                        </li>
                        <li
                            v-if="
                                isAuthenticated &&
                                returnDepRoleProperty('role') >= 2
                            "
                        >
                            <router-link to="/adminp" class="nav-link">
                                Panou Administrativ
                            </router-link>
                        </li>
                        <li v-if="isAuthenticated">
                            <router-link
                                to="/"
                                @click="logout"
                                class="nav-link"
                            >
                                Logout
                            </router-link>
                        </li>
                    </ul>
                </nav>
            </div>
        </header>
    </div>
</template>

<script>
import { mapMutations, mapGetters } from "vuex";

export default {
    data() {
        return {
            departmentIDs: [1, 3],
        };
    },
    methods: {
        logout() {
            Swal.fire({
                title: "Are you sure you want to log out?",
                icon: "question",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Log me out",
            }).then((result) => {
                if (result.isConfirmed) {
                    this.$store.dispatch("logout");
                    this.$router.replace("/login");
                }
            });
        },
        returnDepRoleProperty(property) {
            if (this.retrieveRoleData?.length) {
                const roleProperties = JSON.parse(this.retrieveRoleData);

                switch (property) {
                    case "dep":
                        return roleProperties.department_id;
                    case "role":
                        return roleProperties.role_id;
                }
            }
        },
        ...mapMutations(["loginVerify"]),
    },
    mounted() {
        this.loginVerify();
    },
    computed: {
        ...mapGetters(["isAuthenticated", "retrieveRoleData"]),
    },
};
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Alfa+Slab+One&family=Lobster&display=swap");
body {
    font-family: "Open Sans", sans-serif;
    color: #444444;
}

a {
    color: #ffffff;
    text-decoration: none;
}

a:hover {
    color: #ffffff;
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
#header.fixed-top {
    height: 80px;
}
#header .logo {
    font-size: 50px;
    margin: 0;
    padding: 0;
    line-height: 1;
    font-weight: 600;
    letter-spacing: 3px;
    font-family: "Lobster", cursive;
    margin-left: 50px;
}
#header .logo a {
    color: #ffffff;
}
#header .logo a span {
    color: #ff2525;
}
.scrolled-offset {
    margin-top: 70px;
}
.navbar {
    padding: 0;
}
.navbar ul {
    margin: 0;
    padding: 0;
    display: flex;
    list-style: none;
    align-items: center;
}
.navbar li {
    position: relative;
}
.navbar > ul > li {
    white-space: nowrap;
    padding: 10px 0 10px 28px;
    font-family: "Lobster", cursive;
}
.navbar a,
.navbar a:focus {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 3px;
    font-size: 26px;
    font-weight: 600;
    color: #ffffff;
    white-space: nowrap;
    transition: 0.3s;
    position: relative;
}
.navbar a i,
.navbar a:focus i {
    font-size: 12px;
    line-height: 0;
    margin-left: 5px;
}
.navbar > ul > li > a:before {
    content: "";
    position: absolute;
    width: 100%;
    height: 2px;
    bottom: -6px;
    left: 0;
    background-color: #ff2525;
    visibility: hidden;
    width: 0px;
    transition: all 0.5s ease-in-out 0s;
}
.navbar a:hover:before,
.navbar li:hover > a:before,
.navbar .active:before {
    visibility: visible;
    width: 100%;
}
.navbar a:hover,
.navbar .active,
.navbar .active:focus,
.navbar li:hover > a {
    color: #ff2525;
}
</style>
