// Mechanics
import Revisions from "../components/admin/CarPages/Revision/Revisions";
import FullRevision from "../components/admin/CarPages/Revision/FullRevision";
import AddRevision from "../components/admin/CarPages/Revision/AddRevision";

import RepairNotices from "../components/admin/CarPages/RepairNotice/RepairNotices";
import FullRepairNotice from "../components/admin/CarPages/RepairNotice/FullRepairNotice";
import AddRepairNotice from "../components/admin/CarPages/RepairNotice/AddRepairNotice";

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