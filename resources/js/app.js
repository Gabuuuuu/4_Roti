require("./bootstrap");

import axios from "axios";
import VueAxios from "vue-axios";

//IMPORTING VUE
import { createApp } from "vue";

//Importing App.vue from comps
import App from "./App.vue";

//Importing the router from res/js
import router from "./router.js";

//Definind the App
const app = createApp(App);
app.use(router);
app.use(VueAxios, axios);
app.mount("#app");
