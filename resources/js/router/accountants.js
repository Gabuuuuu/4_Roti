import CarInvoices from "../components/admin/CarPages/CarInvoices/CarInvoices";
import CarInvoiceDetails from "../components/admin/CarPages/CarInvoices/CarInvoiceDetails";

import RepairInvoices from "../components/admin/CarPages/RepairInvoice/RepairInvoices";
import RepairInvoice from "../components/admin/CarPages/RepairInvoice/RepairInvoice";

import FridgeInvoices from "../components/admin/FridgePages/FridgeInvoices/FridgeInvoices";
import FridgeInvoicesDetails from "../components/admin/FridgePages/FridgeInvoices/FridgeInvoiceDetails";

export default [
    {
        path: "/carinvoices",
        component: CarInvoices,
        name: "carinvoices",
        meta: { requiresAuth: true, requiresAdmin: true },
    },
    {
        path: "/carinvoicedetails/:id",
        component: CarInvoiceDetails,
        name: "carinvoicedetails",
        meta: { requiresAuth: true, requiresAdmin: true },
    },
    {
        path: "/repairinvoices",
        component: RepairInvoices,
        name: "repairinvoices",
        meta: { requiresAuth: true, requiresAdmin: true },
    },
    {
        path: "/repairinvoice/:id",
        component: RepairInvoice,
        name: "loadRepairNotice",
        meta: { requiresAuth: true, requiresAdmin: true },
    },
    {
        path: "/repairinvoice/:id",
        component: RepairInvoice,
        name: "loadRepairNotice",
        meta: { requiresAuth: true, requiresAdmin: true },
    },
    {
        path: "/fridgeInvoices",
        component: FridgeInvoices,
        name: "fridgeInvoices",
        meta: { requiresAuth: true, requiresAdmin: true },
    },
    {
        path: "/fridgeInvoices/:id",
        component: FridgeInvoicesDetails,
        name: "fridgeInvoicesDetails",
        meta: { requiresAuth: true, requiresAdmin: true },
    },
]