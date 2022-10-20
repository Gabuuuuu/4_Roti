import Login from "../pages/auth/Login.vue";
import Register from "../pages/auth/Register";
import Forgot from "../pages/auth/Forgot";

export default [
    {
        path: "/login",
        component: Login,
        meta:{ guest: true }
    },
    {
        path: "/register",
        component: Register,
         meta: { guest: true }
    },
    {
        path: "/forgot",
        component: Forgot,
        meta: { guest: true }
    },
];
