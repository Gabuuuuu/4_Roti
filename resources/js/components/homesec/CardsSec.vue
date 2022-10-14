<template>
    <div>
        <section id="featured-services" class="featured-services">
            <div class="container">
                <div class="row">
                    <div
                        class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0"
                        v-for="card in cards"
                        :key="card.id"
                    >
                        <div class="icon-box">
                            <div class="icon"><i :class="card.icon"></i></div>
                            <h4 class="title">{{ card.title }}</h4>
                            <p class="description">
                                {{ card.desc }}
                            </p>
                        </div>
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
        // make cards variable reactive with the ref() function
        const cards = ref([
            {
                icon: "bx bx-world",
                title: "Gloabal Reach",
                desc: "We are proudly anouncing that our company has branched all over the world, providing our clients with cars and drop-out points throughout the whole globe",
            },
            {
                icon: "bx bx-wallet",
                title: "Competitive Prices",
                desc: "We are always trying to keep in touch with our clients, getting constant feedback from them, which helped us find way of getting the most affordable prices for our customers. ",
            },
            {
                icon: "bx bx-car",
                title: "Wide Variety",
                desc: "Because we care for our customers satisfaction, we provide a massive amount of cars, covering almost every single brand and prices can do to as low as $10 per day!",
            },
            {
                icon: "bx bx-shield-alt-2",
                title: "Top Protection",
                desc: "Our Policy offers you three protection plans - Premium, Standard or Minimum - based on your needs and budget. For long trips, you might have to consider getting the premium plan, that way you don't have to worry for anything that could disturb your vacation. For work or a rather short trip, then the standard or minimum plan should do the trick for you. Either way, we got you covered !",
            },
        ]);

        return {
            cards,
        };
    },
};
</script>

<style scoped>
section {
    padding: 60px 0;
    overflow: hidden;
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
.featured-services .icon-box {
    padding: 30px;
    position: relative;
    overflow: hidden;
    background: rgba(199, 203, 255, 0.461);
    box-shadow: 0 0 29px 0 rgba(68, 88, 144, 0.12);
    transition: all 0.3s ease-in-out;
    border-radius: 8px;
    z-index: 1;
    text-align: center;
}
.featured-services .icon-box::before {
    content: "";
    position: absolute;
    background: #cbe0fb;
    right: 0;
    left: 0;
    bottom: 0;
    top: 100%;
    transition: all 0.3s;
    z-index: -1;
}
.featured-services .icon-box:hover::before {
    background: #106eea;
    top: 0;
    border-radius: 0px;
}
.featured-services .icon {
    margin-bottom: 15px;
}
.featured-services .icon i {
    font-size: 48px;
    line-height: 1;
    color: #106eea;
    transition: all 0.3s ease-in-out;
}
.featured-services .title {
    font-weight: 700;
    margin-bottom: 15px;
    font-size: 18px;
}
.featured-services .title a {
    color: rgb(0, 0, 0);
}
.featured-services .description {
    font-size: 15px;
    line-height: 28px;
    margin-bottom: 0;
}
.featured-services .icon-box:hover .title a,
.featured-services .icon-box:hover .description {
    color: #fff;
}
.featured-services .icon-box:hover .icon i {
    color: #fff;
}
</style>
