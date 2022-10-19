import { createRouter, createWebHistory } from "vue-router";

import Login from "./pages/auth/Login";
import Register from "./pages/auth/Register";
import Forgot from "./pages/auth/Forgot";
import Home from "./pages/landing/Home";
import Team from "./pages/landing/Team";
import Cars from "./components/pricesec/Cars";
import AddCar from "./components/admin/AddCar";
import NotFound from "./pages/notFound.vue";
import Details from "./components/pricesec/Details";
import RentNow from "./components/pricesec/RentNow";
import CarInvoices from "./components/pricesec/CarInvoices";
import AdminPanel from "./components/admin/AdminPanel";
import RemoveCar from "./components/admin/RemoveCar";
import Users from "./components/admin/Users";
import CarInvoiceDetails from "./components/pricesec/CarInvoiceDetails";
import Employees from "./components/admin/Employees";
import EmployeeDetails from "./components/admin/EmployeeDetails";
import Revisions from "./components/admin/Revisions";
import FullRevision from "./components/admin/FullRevision";

const router = createRouter({
    history: createWebHistory(),
    routes: [
        { path: "/", redirect: "/home" },
        { path: "/login", component: Login, meta: { guest: true } },
        { path: "/register", component: Register, meta: { guest: true } },
        { path: "/forgot", component: Forgot, meta: { guest: true } },
        { path: "/home", component: Home },
        { path: "/team", component: Team },
        { path: "/cars", component: Cars },
        {
            path: "/revisions",
            component: Revisions,
            name: "revisions",
            meta: { admin: true },
        },
        { path: "/addcar", component: AddCar, name: "Addcar" },
        { path: "/details/:id", component: Details, name: "details" },
        { path: "/rentnow/:id", component: RentNow, name: "rentnow" },

        {
            path: "/carinvoices",
            component: CarInvoices,
            name: "carinvoices",
            meta: { admin: true },
        },
        { path: "/adminp", component: AdminPanel, meta: { admin: true } },
        { path: "/removecar", component: RemoveCar, meta: { admin: true } },
        {
            path: "/users",
            component: Users,
            name: "users",
            meta: { admin: true },
        },
        {
            path: "/employees",
            component: Employees,
            name: "employees",
            meta: { admin: true },
        },

        {
            path: "/carinvoicedetails/:id",
            component: CarInvoiceDetails,
            name: "carinvoicedetails",
            meta: { admin: true },
        },
        {
            path: "/employeedetails/:id",
            component: EmployeeDetails,
            name: "employeedetails",
            meta: { admin: true },
        },
        {
            path: "/fullrevision/:id",
            component: FullRevision,
            name: "fullrevision",
            meta: { admin: true },
        },

        {
            path: "/:notFound(.*)",
            component: NotFound,
        },
    ],
});

router.beforeEach((to, _) => {
    const loggedIn = !!localStorage.getItem("token");
    const Role = localStorage.getItem("role");

    if (to.meta.guest && loggedIn) {
        return {
            path: "/home",
        };
    } else if (Role === "0" && loggedIn && to.meta.admin) {
        return {
            path: "/home",
        };
    }
});

export default router;
