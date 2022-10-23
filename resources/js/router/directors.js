import Users from "../components/admin/Users";
import AddCar from "../components/admin/CarPages/AddCar.vue";
import Employees from "../components/admin/EmployeePages/Employees";
import EmployeeDetails from "../components/admin/EmployeePages/EmployeeDetails";

// Director aprovizionare
import addFridge from "../components/admin/FridgePages/addFridge.vue";

export default [
    {
        path: "/users",
        component: Users,
        name: "users",
        meta: { requiresAuth: true, requiresAdmin: true },
    },
    {
        path: "/addCar",
        component: AddCar,
        name: "Addcar",
        meta: { requiresAuth: true, requiresAdmin: true },
    },
    {
        path: "/employees",
        component: Employees,
        name: "employees",
        meta: { requiresAuth: true, requiresAdmin: true },
    },
    {
        path: "/employeedetails/:id",
        component: EmployeeDetails,
        name: "employeedetails",
        meta: { requiresAuth: true, requiresAdmin: true },
    },
    {
        path: "/addFridge",
        component: addFridge,
        name: "addFridge",
        meta: { requiresAuth: true, requiresAdmin: true },
    },
]