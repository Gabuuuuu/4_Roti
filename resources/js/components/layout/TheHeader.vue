<template>
    <div>
        <header id="header" class="d-flex align-items-center">
            <div
                class="container d-flex align-items-center justify-content-between"
            >
                <h1 class="logo">
                    <router-link to="/home">
                        CatchA<span>Ride</span>
                    </router-link>
                </h1>
                <nav id="navbar" class="navbar">
                    <ul>
                        <li>
                            <router-link class="nav-link" to="/home"
                                >Home
                            </router-link>
                        </li>
                        <li>
                            <router-link class="nav-link" to="/prices"
                                >Prices
                            </router-link>
                        </li>
                        <li>
                            <router-link class="nav-link" to="/team"
                                >Team
                            </router-link>
                        </li>
                        <li v-if="!loggedIn">
                            <router-link class="nav-link" to="/login"
                                >Login
                            </router-link>
                        </li>
                        <li v-if="!loggedIn">
                            <router-link class="nav-link" to="/register"
                                >Register
                            </router-link>
                        </li>
                        <li v-if="loggedIn && !!verifyRole">
                            <router-link to="/adminp" class="nav-link">
                                Admin Panel
                            </router-link>
                        </li>
                        <li v-if="loggedIn">
                            <router-link
                                to="/"
                                @click="logOut"
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
export default {
    data() {
        return {
            loggedIn: !!localStorage.getItem("token"),
            role: undefined,
        };
    },
    methods: {
        logOut() {
            localStorage.removeItem("token");
            localStorage.removeItem("user");
            localStorage.removeItem("id");
            localStorage.removeItem("role");
            this.loggedIn = false;
            then(this.loadData());
        },
    },
    computed: {
        verifyRole() {
            if (this.loggedIn) {
                const id = localStorage.getItem("id");
                axios.get("api/users/getRole/" + id).then(({ data }) => {
                    this.role = data;
                });
                if (this.role == "1") {
                    return true;
                }
                return false;
            }
        },
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
    letter-spacing: 1px;
    font-family: "Lobster", cursive;
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
