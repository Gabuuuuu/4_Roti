import { createRouter, createWebHistory } from "vue-router";
import store from "../store/index";

// Universal
import NotFound from "../pages/notFound.vue";
import Home from "../pages/landing/Home";
import Team from "../pages/landing/Team";
import Cars from "../components/admin/CarPages/Cars";

// Employees only
import AdminPanel from "../components/admin/AdminPanel";

// External modules
import externalAuth from "./auth";
import externalMechanics from "./mechanics";
import externalAccountants from "./accountants";
import externalDirectors from "./directors";

// Templates:
// import RentNow from "../components/pricesec/RentNow";
// import Details from "../components/pricesec/Details";

const router = createRouter({
    history: createWebHistory(),
    routes: [
        ...externalAuth,
        ...externalMechanics,
        ...externalAccountants,
        ...externalDirectors,
        // {
        //     path: "/details/:id",
        //     component: Details,
        //     name: "details"
        // },
        // {
        // path: "/rentnow/:id",
        // component: RentNow,
        // name: "rentnow"
        // },
        {
            path: "/",
            redirect: "/home",
        },
        {
            path: "/home",
            component: Home,
        },
        {
            path: "/team",
            component: Team,
        },
        {
            path: "/cars",
            component: Cars,
        },
        {
            path: "/adminp",
            component: AdminPanel,
            meta: { requiresAuth: true, requiresAdmin: true },
        },
        {
            path: "/:notFound(.*)",
            component: NotFound,
        },
    ],
});

router.beforeEach((to, _, next) => {
    const userRole = store.getters.retrieveRoleData?.length
        ? JSON.parse(store.getters.retrieveRoleData).role_id
        : 0;

    if (
        to.meta.requiresAuth &&
        to.meta.requiresAdmin &&
        store.getters.isAuthenticated &&
        userRole < 2
    ) {
        next("/");
    } else if (to.meta.requiresAuth && !store.getters.isAuthenticated) {
        next("/login");
    } else if (to.meta.guest && store.getters.isAuthenticated) {
        next("/cars");
    } else {
        next();
    }
});

export default router;
