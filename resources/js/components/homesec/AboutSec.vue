<template>
    <div>
        <section id="about" class="about section-bg">
            <div class="container">
                <div class="section-title">
                    <h3>De ce 4-<span>Roti?</span></h3>
                    <p>
                        Noi va oferim cele mai bune oferte pentru toate
                        brandurile, de la minifrigidere la cele mai performante
                        frigidere de pe piata!
                    </p>
                </div>

                <div class="row">
                    <div class="col-lg-6">
                        <img
                            src="../../../../public/photos/FridgeAbout.jpg"
                            class="img-fluid"
                        />
                    </div>
                    <div
                        class="col-lg-6 pt-4 pt-lg-0 content d-flex flex-column justify-content-center"
                    >
                        <h3>Gaseste frigiderul perfect pentru tine !</h3>
                        <p class="fst-italic">
                            Intra in stilul tau si cauta prin mii de frigidere
                            pe care le avem la dispozitie.
                        </p>
                        <ul>
                            <li v-for="line in lines" :key="line.id">
                                <i :class="line.icon"></i>
                                <div>
                                    <h5>
                                        {{ line.title }}
                                    </h5>
                                    <p>
                                        {{ line.desc }}
                                    </p>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
    </div>
</template>

<script>
import { ref } from "vue";
export default {
    setup() {
        const lines = ref([
            {
                icon: "bx bxs-hand",
                title: "Anulare Gratuita",
                desc: "Anuleaza pana in 24 de ore pentru a obtine un retur complet la orice produs achizitionat, pentru ca viata se poate intampla si va intelegem.",
            },
            {
                icon: "bx bx-map",
                title: "Livrare Convenabila",
                desc: "Primeste frigiderul tau de vis in orice zi a saptamanii, cu ajutorul curierilor nostrii care lucreaza 24/7 pentru a va aduce cea mai buna experienta!",
            },
        ]);
        return {
            lines,
        };
    },
};
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Roboto&display=swap");
section {
    padding: 60px 0;
    overflow: hidden;
    font-family: "Roboto", sans-serif;
    letter-spacing: 1px;
}

.section-title {
    text-align: center;
    padding-bottom: 30px;
}
.section-title h2 {
    font-size: 13px;
    letter-spacing: 1px;
    font-weight: 700;
    padding: 8px 20px;
    margin: 0;
    background: #e7f1fd;
    color: #106eea;
    display: inline-block;
    text-transform: uppercase;
    border-radius: 50px;
}
.section-title h3 {
    margin: 15px 0 0 0;
    font-size: 40px;
    font-weight: 700;
}
.section-title h3 span {
    color: #ff0000;
}
.section-title p {
    margin: 15px auto 0 auto;
    font-weight: 600;
}
.about .content h3 {
    font-weight: 600;
    font-size: 26px;
}
.about .content ul {
    list-style: none;
    padding: 0;
}
.about .content ul li {
    display: flex;
    align-items: flex-start;
    margin-bottom: 35px;
}
.about .content ul li:first-child {
    margin-top: 35px;
}
.about .content ul i {
    background: #fff;
    box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.12);
    font-size: 24px;
    padding: 20px;
    margin-right: 15px;
    color: #106eea;
    border-radius: 50px;
}
.about .content ul h5 {
    font-size: 23px;
    color: #000000;
}
.about .content ul p {
    font-size: 20px;
    color: #000000;
}
.about .content p:last-child {
    margin-bottom: 0;
}
</style>
