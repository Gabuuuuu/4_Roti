require("./bootstrap");

import axios from "axios";
import VueAxios from "vue-axios";

//IMPORTING VUE
import { createApp } from "vue";

//Importing App.vue from comps
import App from "./App.vue";

//Importing the router from res/js
import router from "./router.js";
import store from './store';

// Sweet Alert is a popular public package used for alerts inside the application:
// Sweet Alert setup start
import Swal from 'sweetalert2';
window.Swal = Swal;

const Toast = Swal.mixin({
    toast: true,
    position: 'top-end',
    showConfirmButton: false,
    timer: 3000,
    timerProgressBar: true,
    didOpen: (toast) => {
        toast.addEventListener('mouseenter', Swal.stopTimer)
        toast.addEventListener('mouseleave', Swal.resumeTimer)
    }
})

window.Toast = Toast;
// Sweet alert setup end

//Definind the App
const app = createApp(App);
app.use(router);
app.use(store);
app.use(VueAxios, axios);
app.mount("#app");
