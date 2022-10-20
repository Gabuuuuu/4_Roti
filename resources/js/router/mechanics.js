// Mechanics
import Revisions from "../components/admin/Revisions";
import FullRevision from "../components/admin/FullRevision";
import AddRevision from "../components/admin/AddRevision";
import RepairNotices from "../components/admin/RepairNotices";
import FullRepairNotice from "../components/admin/FullRepairNotice";
import AddRepairNotice from "../components/admin/AddRepairNotice";

export default [
    {
        path: "/revisions",
        component: Revisions,
        name: "revisions",
        meta: { requiresAuth: true, requiresAdmin: true },
    },
    {
        path: "/fullrevision/:id",
        component: FullRevision,
        name: "fullrevision",
        meta: { requiresAuth: true, requiresAdmin: true },
    },
    {
        path: "/addrevision",
        component: AddRevision,
        meta: { requiresAuth: true, requiresAdmin: true },
    },
    {
        path: "/fullrepairnotice/:id",
        component: FullRepairNotice,
        name: "fullrepairnotice",
        meta: { requiresAuth: true, requiresAdmin: true },
    },
    {
        path: "/repairnotices",
        component: RepairNotices,
        name: "repairnotices",
        meta: { requiresAuth: true, requiresAdmin: true },
    },
    {
        path: "/addrepairnotice",
        component: AddRepairNotice,
        meta: { requiresAuth: true, requiresAdmin: true },
    },
]