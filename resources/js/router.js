import { createRouter, createWebHistory } from "vue-router";
import store from "../js/store/index";

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
import AddRevision from "./components/admin/AddRevision";
import RepairNotices from "./components/admin/RepairNotices";
import FullRepairNotice from "./components/admin/FullRepairNotice";
import AddRepairNotice from "./components/admin/AddRepairNotice";
import RepairInvoice from "./components/admin/RepairInvoice";
import RepairInvoices from "./components/admin/RepairInvoices";

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
        { path: "/addrevision", component: AddRevision, name: "addrevision" },
        {
            path: "/repairnotices",
            component: RepairNotices,
            name: "repairnotices",
        },
        {
            path: "/repairinvoices",
            component: RepairInvoices,
            name: "repairinvoices",
        },

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
            path: "/addrepairnotice",
            component: AddRepairNotice,
            meta: { admin: true },
        },
        {
            path: "/repairinvoice/:id",
            component: RepairInvoice,
            name: "loadRepairNotice",
            meta: { admin: true },
        },

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
            path: "/fullrepairnotice/:id",
            component: FullRepairNotice,
            name: "fullrepairnotice",
            meta: { admin: true },
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
    // if(to.meta.guest && !loggedIn) {
    //     return {
    //         path: '/home'
    //     }
    // } else if (to.meta.guest && loggedIn) {
    //     return {
    //         path: "/cars",
    //     };
    // } else if (role >= 2 && loggedIn && to.meta.admin) {
    //     return {
    //         path: "/adminp",
    //     };
    // }

    if (
        to.meta.requiresAuth &&
        store.getters.isAuthenticated &&
        userRole < 2 &&
        to.meta.requiresAdmin
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
