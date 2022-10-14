<template>
    <div>
        <TheHeader class="fixed-top"></TheHeader>
        <HeroSec></HeroSec>
        <CardsSec></CardsSec>
        <AboutSec></AboutSec>
        <TheFooter></TheFooter>
    </div>
</template>

<script>
import TheFooter from "../../components/layout/TheFooter.vue";
import AboutSec from "../../components/homesec/AboutSec.vue";
import CardsSec from "../../components/homesec/CardsSec.vue";
import TheHeader from "../../components/layout/TheHeader";
import HeroSec from "../../components/homesec/HeroSec";

export default {
    components: { TheHeader, HeroSec, CardsSec, AboutSec, TheFooter },
};
</script>

<style scoped>
section {
    padding: 60px 0;
    overflow: hidden;
}

.section-bg {
    background-color: #f6f9fe;
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
    font-size: 32px;
    font-weight: 700;
}
.section-title h3 span {
    color: #ff0000;
}
.section-title p {
    margin: 15px auto 0 auto;
    font-weight: 600;
}
</style>
