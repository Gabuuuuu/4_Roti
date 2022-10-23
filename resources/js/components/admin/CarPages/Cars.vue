<template>
    <div>
        <TheHeader class="fixed-top"></TheHeader>

        <section class="wrapper">
            <div class="container-fostrap">
                <div class="content">
                    <div class="container">
                        <div class="row">
                            <div
                                class="col-xs-12 col-sm-4"
                                v-for="car in cars"
                                :key="car.index"
                            >
                                <div class="card">
                                    <div class="card-content">
                                        <h4 class="card-title text-center">
                                            {{ idToCarName(car.car_id) }}
                                        </h4>
                                        <h3 class="text-center card-title">
                                            Tip vehicul: {{ carTypeName(car.car_type_id) }}
                                        </h3>
                                    </div>
                                    <div class="card-content">
                                        <h3 class="text-center">
                                            Folosit de:
                                            {{ carDepartment(car.department_id) }}
                                        </h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <TheFooter></TheFooter>
    </div>
</template>

<!-- Detalii complete redirectioneaza catre details -->

<script>
import TheFooter from "../../../components/layout/TheFooter";
import TheHeader from "../../../components/layout/TheHeader";
export default {
    components: {
        TheFooter,
        TheHeader,
    },
    data() {
        return {
            cars: [],
            deparments: [],
            carTypes: [],
        };
    },
    created() {
        this.loadData();
    },
    methods: {
        async loadData() {
            const response = await axios.get("/api/carsDetails");
            this.cars = response.data[0];
            this.deparments = response.data[1];
            this.carTypes = response.data[2];
        },
        idToCarName(id) {
            const carDetails = this.cars.filter((item) => item.car_id === id)[0];
            return `${carDetails.car_id}. ${carDetails.marca} ${carDetails.model}`;
        },
        carDepartment (id) {
            return this.deparments.filter((item) => item.department_id === id)[0].denumire_departament;
        },
        carTypeName (id) {
            return this.carTypes.filter((item) => item.car_type_id === id)[0].denumire_tip_masina;
        }
    },
};
</script>

<style scoped>
@import url(https://fonts.googleapis.com/css?family=Roboto:400,100,900);

html,
body {
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    height: 100%;
    width: 100%;
    background: #fff;
    font-family: "Roboto", sans-serif;
    font-weight: 400;
}

.wrapper {
    margin-top: 15vh;
    display: table;
    height: 100%;
    width: 100%;
}

.container-fostrap {
    display: table-cell;
    padding: 1em;
    text-align: center;
    vertical-align: middle;
}
.fostrap-logo {
    width: 100px;
    margin-bottom: 15px;
}
h1.heading {
    color: #fff;
    font-size: 1.15em;
    font-weight: 900;
    margin: 0 0 0.5em;
    color: #505050;
}
@media (min-width: 450px) {
    h1.heading {
        font-size: 3.55em;
    }
}
@media (min-width: 760px) {
    h1.heading {
        font-size: 3.05em;
    }
}
@media (min-width: 900px) {
    h1.heading {
        font-size: 3.25em;
        margin: 0 0 0.3em;
    }
}
.card {
    display: block;
    margin-bottom: 20px;
    line-height: 1.42857143;
    background-color: #fff;
    border-radius: 2px;
    box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16),
        0 2px 10px 0 rgba(0, 0, 0, 0.12);
    transition: box-shadow 0.25s;
}
.card:hover {
    box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2),
        0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
.img-card {
    width: 100%;
    height: 200px;
    border-top-left-radius: 2px;
    border-top-right-radius: 2px;
    display: block;
    overflow: hidden;
}
.img-card img {
    width: 100%;
    height: 200px;
    object-fit: cover;
    transition: all 0.25s ease;
}
.card-content {
    padding: 15px;
    text-align: left;
}
.card-title {
    margin-top: 0px;
    font-weight: 700;
    font-size: 1.65em;
}
.card-title a {
    color: #000;
    text-decoration: none !important;
}
</style>
