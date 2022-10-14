<template>
    <div>
        <section>
            <TheHeader></TheHeader>

            <form
                @submit.prevent="
                    rentnow(
                        car.brand,
                        car.model,
                        car.price,
                        form.total,
                        form.days
                    )
                "
            >
                <div class="container d-lg-flex">
                    <div class="box-1 bg-light user">
                        <div class="box-inner-1 pb-3 mb-3">
                            <div
                                class="d-flex justify-content-between mb-3 userdetails"
                            >
                                <p class="fw-bold">
                                    {{ car.brand }} {{ car.model }}
                                </p>
                            </div>
                            <div>
                                <div>
                                    <img
                                        :src="'/images/cars/' + car.image"
                                        alt="Error"
                                        class="border rounded border-4 rounded-3"
                                    />
                                </div>
                            </div>
                            <p
                                class="dis info my-5 fw-bold mb-4"
                                style="font-size: 20px"
                            >
                                {{ car.description }}
                            </p>
                            <br />
                            <div>
                                <h5 class="fw-bold mb-4">
                                    Built in: {{ car.year }}
                                </h5>
                                <br />
                                <h5 class="fw-bold mb-4">
                                    Fuel Type: {{ car.fuel }}
                                </h5>
                                <br />
                                <h5 class="fw-bold mb-4">
                                    Consumption: {{ car.consumption }}
                                </h5>
                                <br />
                                <h5 class="fw-bold mb-4">
                                    Number of Seats: {{ car.seats }}
                                </h5>
                                <br />
                                <h5 class="fw-bold mb-4">
                                    Car Type: {{ car.body }}
                                </h5>
                                <br />
                                <h5 class="fw-bold mb-4">
                                    Transmission type: {{ car.transmission }}
                                </h5>
                                <br />
                                <h5 class="fw-bold mb-4">
                                    Price/Day: {{ car.price }}
                                </h5>
                                <br />
                            </div>
                        </div>
                    </div>
                    <div class="box-2">
                        <div class="box-inner-2">
                            <div>
                                <p class="fw-bold">Payment Details</p>
                                <p class="dis mb-3">
                                    Complete your purchase by providing your
                                    payment details
                                </p>
                            </div>

                            <div class="mb-3">
                                <p class="dis fw-bold mb-2">Email address</p>
                                <input
                                    v-model="form.email"
                                    class="form-control"
                                    type="email"
                                    placeholder="Email"
                                />
                            </div>
                            <div>
                                <p class="dis fw-bold mb-2">Card details</p>
                                <div
                                    class="d-flex align-items-center justify-content-between card-atm border rounded"
                                >
                                    <div class="fab fa-cc-visa ps-3"></div>
                                    <input
                                        maxlength="16"
                                        v-model="form.carddetails"
                                        type="text"
                                        class="form-control"
                                        placeholder="Card Details"
                                    />
                                    <div class="d-flex w-50">
                                        <input
                                            maxlength="5"
                                            v-model="form.carddate"
                                            type="text"
                                            class="form-control px-0"
                                            placeholder="MM/YY"
                                        />
                                        <input
                                            v-model="form.cardccv"
                                            type="text"
                                            maxlength="3"
                                            class="form-control px-0"
                                            placeholder="CVV"
                                        />
                                    </div>
                                </div>
                                <div class="my-3 cardname">
                                    <p class="dis fw-bold mb-2">
                                        Cardholder name
                                    </p>
                                    <input
                                        maxlength="50"
                                        v-model="form.cardname"
                                        class="form-control"
                                        type="text"
                                        placeholder="Your Full Name"
                                    />
                                </div>
                                <div class="address">
                                    <p class="dis fw-bold mb-3">
                                        Billing address
                                    </p>
                                    <select
                                        class="form-select"
                                        aria-label="Default select example"
                                    >
                                        <option selected hidden>Country</option>
                                        <option>Romania</option>
                                        <option>USA</option>
                                        <option>Sweeden</option>
                                        <option>Finland</option>
                                        <option>Germany</option>
                                        <option>Australia</option>
                                        <option>Bulgaria</option>
                                        <option disabled>Russia</option>
                                    </select>
                                    <br />
                                    <div class="d-flex">
                                        <input
                                            maxlength="6"
                                            v-model="form.zip"
                                            class="form-control zip"
                                            type="text"
                                            placeholder="ZIP"
                                        />
                                    </div>
                                    <br />
                                    <p class="dis fw-bold mb-2">
                                        How many days do you want to rent the
                                        car ?
                                    </p>
                                    <select
                                        v-model="form.days"
                                        class="form-select"
                                        aria-label="Default select example"
                                        @change="total(car.price, form.days)"
                                    >
                                        <option selected hidden>Days</option>
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>7</option>
                                        <option>30</option>
                                    </select>
                                    <br />

                                    <div class="d-flex flex-column dis">
                                        <div
                                            class="d-flex align-items-center justify-content-between mb-2"
                                        >
                                            <p class="fw-bold">Total</p>
                                            <input
                                                v-model="form.total"
                                                readonly
                                                disabled
                                                class="fw-bold"
                                            />
                                        </div>
                                        <br />
                                        <button
                                            class="btn btn-primary mt-2"
                                            type="submit"
                                        >
                                            Rent
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <TheFooter></TheFooter>
        </section>
    </div>
</template>

<script>
import TheFooter from "../../components/layout/TheFooter.vue";
import TheHeader from "../../components/layout/TheHeader";
export default {
    components: { TheHeader, TheFooter },

    data() {
        return {
            car: [],
            form: {
                cardccv: "",
                carddate: "",
                carddetails: "",
                email: "",
                cardname: "",
                days: "",
                total: "",
                zip: "",
            },
        };
    },
    created() {
        this.loadData();
    },

    methods: {
        async loadData() {
            const response = await axios.get(
                "/api/loadCar/" + this.$route.params.id
            );
            this.car = response.data;
        },
        rentnow(brand, model, price) {
            const payload = {
                brand,
                model,
                price,
                zip: this.form.zip,
                cardnumbers: this.form.carddetails,
                month: this.form.carddate,
                ccv: this.form.cardccv,
                email: this.form.email,
                cardname: this.form.cardname,
                days: this.form.days,
                total: this.form.total,
            };

            axios
                .post("/api/invoices", payload)
                .then((res) => {
                    this.responseAfterLogin(res);
                    this.loadData();
                })
                .catch((error) => console.log(error.response.data));
        },
        responseAfterLogin(res) {
            this.$router.push({ path: "/home" });
        },
        total(price, days) {
            this.form.total = price * days;
        },
    },
};
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap");

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    list-style: none;
    font-family: "Montserrat", sans-serif;
}
img {
    width: 425px;
    height: 425px;
    object-fit: fill;
}

body {
    padding: 5px;
    background-color: #7a34ca;
}

p {
    margin: 0%;
}

.container {
    max-width: 900px;
    margin: 20px auto;
    overflow: hidden;
    background-color: #f8f9fa;
}

.box-1 {
    max-width: 450px;
    padding: 10px 40px;
    user-select: none;
}

.box-1 div .fs-12 {
    font-size: 8px;
    color: white;
}

.box-1 div .fs-14 {
    font-size: 15px;
    color: white;
}

.box-1 img.pic {
    width: 20px;
    height: 20px;
    object-fit: cover;
}

.box-1 img.mobile-pic {
    width: 100%;
    height: 200px;
    object-fit: cover;
}

.box-1 .name {
    font-size: 11px;
    font-weight: 600;
}

.dis {
    font-size: 12px;
    font-weight: 500;
}

label.box {
    width: 100%;
    font-size: 12px;
    background: #ddd;
    margin-top: 12px;
    padding: 10px 12px;
    border-radius: 5px;
    cursor: pointer;
    border: 1px solid transparent;
}

#one:checked ~ label.first,
#two:checked ~ label.second,
#three:checked ~ label.third {
    border-color: #7700ff;
}

#one:checked ~ label.first .circle,
#two:checked ~ label.second .circle,
#three:checked ~ label.third .circle {
    border-color: #7a34ca;
    background-color: #fff;
}

label.box .course {
    width: 100%;
}

label.box .circle {
    height: 12px;
    width: 12px;
    background: #ccc;
    border-radius: 50%;
    margin-right: 15px;
    border: 4px solid transparent;
    display: inline-block;
}

input[type="radio"] {
    display: none;
}

.box-2 {
    max-width: 450px;
    padding: 10px 40px;
}

.box-2 .box-inner-2 input.form-control {
    font-size: 12px;
    font-weight: 600;
}

.box-2 .box-inner-2 .inputWithIcon {
    position: relative;
}

.box-2 .box-inner-2 .inputWithIcon span {
    position: absolute;
    left: 15px;
    top: 8px;
}

.box-2 .box-inner-2 .inputWithcheck {
    position: relative;
}

.box-2 .box-inner-2 .inputWithcheck span {
    position: absolute;
    width: 20px;
    height: 20px;
    border-radius: 50%;
    background-color: green;
    font-size: 12px;
    color: white;
    display: flex;
    justify-content: center;
    align-items: center;
    right: 15px;
    top: 6px;
}

.form-control:focus,
.form-select:focus {
    box-shadow: none;
    outline: none;
    border: 1px solid #7700ff;
}

.border:focus-within {
    border: 1px solid #7700ff !important;
}

.box-2 .card-atm .form-control {
    border: none;
    box-shadow: none;
}

.form-select {
    border-radius: 0;
    border-top-left-radius: 10px;
    border-top-right-radius: 10px;
}

.address .form-control.zip {
    border-radius: 0;
    border-bottom-left-radius: 10px;
}

.address .form-control.state {
    border-radius: 0;
    border-bottom-right-radius: 10px;
}

.box-2 .box-inner-2 .btn.btn-outline-primary {
    width: 120px;
    padding: 10px;
    font-size: 11px;
    padding: 0% !important;
    display: flex;
    align-items: center;
    border: none;
    border-radius: 0;
    background-color: whitesmoke;
    color: black;
    font-weight: 600;
}

.box-2 .box-inner-2 .btn.btn-primary {
    background-color: #7700ff;
    color: whitesmoke;
    font-size: 14px;
    display: flex;
    align-items: center;
    font-weight: 600;
    justify-content: center;
    border: none;
    padding: 10px;
}

.box-2 .box-inner-2 .btn.btn-primary:hover {
    background-color: #7a34ca;
}

.box-2 .box-inner-2 .btn.btn-primary .fas {
    font-size: 13px !important;
    color: whitesmoke;
}

.carousel-indicators [data-bs-target] {
    width: 10px;
    height: 10px;
    border-radius: 50%;
}

.carousel-inner {
    width: 100%;
    height: 250px;
}

.carousel-item img {
    object-fit: cover;
    height: 100%;
}

.carousel-control-prev {
    transform: translateX(-50%);
    opacity: 1;
}

.carousel-control-prev:hover .fas.fa-arrow-left {
    transform: translateX(-5px);
}

.carousel-control-next {
    transform: translateX(50%);
    opacity: 1;
}

.carousel-control-next:hover .fas.fa-arrow-right {
    transform: translateX(5px);
}

.fas.fa-arrow-left,
.fas.fa-arrow-right {
    font-size: 0.8rem;
    transition: all 0.2s ease;
}

.icon {
    width: 30px;
    height: 30px;
    background-color: #f8f9fa;
    color: black;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 50%;
    transform-origin: center;
    opacity: 1;
}

.fas,
.fab {
    color: #6d6c6d;
}

::placeholder {
    font-size: 12px;
}

@media (max-width: 768px) {
    .container {
        max-width: 700px;
        margin: 10px auto;
    }

    .box-1,
    .box-2 {
        max-width: 600px;
        padding: 20px 90px;
        margin: 20px auto;
    }
}

@media (max-width: 426px) {
    .box-1,
    .box-2 {
        max-width: 400px;
        padding: 20px 10px;
    }

    ::placeholder {
        font-size: 9px;
    }
}
</style>
