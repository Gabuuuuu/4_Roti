import Fridges from "../components/admin/FridgePages/Fridges.vue";

export default [
    {
        path: "/fridges",
        component: Fridges,
        name: "Fridges",
        meta: { requiresAuth: true, requiresAdmin: true },
    },
];