import CarInvoices from "../components/pricesec/CarInvoices";
import CarInvoiceDetails from "../components/pricesec/CarInvoiceDetails";
import RepairInvoices from "../components/admin/RepairInvoices";
import RepairInvoice from "../components/admin/RepairInvoice";

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
]