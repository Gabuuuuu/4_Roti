import Users from "../components/admin/Users";
import AddCar from "../components/admin/CarPages/AddCar.vue";
import Employees from "../components/admin/EmployeePages/Employees";
import EmployeeDetails from "../components/admin/EmployeePages/EmployeeDetails";
import DrivingLicenses from "../components/admin/EmployeePages/DrivingLicenses";
import AddDrivingLicense from "../components/admin/EmployeePages/AddDrivingLicense";

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
        path: "/AddDrivingLicense",
        component: AddDrivingLicense,
        name: "AddDrivingLicense",
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
        path: "/drivinglicenses",
        component: DrivingLicenses,
        name: "drivinglicenses",
        meta: { requiresAuth: true, requiresAdmin: true },
    },
];
