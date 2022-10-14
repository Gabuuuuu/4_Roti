<template>
    <div>
        <section id="hero" class="d-flex align-items-center">
            <div class="container">
                <h1>Catch-A-<span>Ride!</span></h1>
                <h2>The world's largest car renting marketplace</h2>
            </div>
        </section>
    </div>
</template>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Alfa+Slab+One&display=swap");
#hero {
    width: 100%;
    height: 100vh;
    background-image: url("../../../../public/photos/HomePic.jpg");
    background-size: cover;
    position: relative;
}
#hero .container {
    position: relative;
}
#hero h1 {
    margin-bottom: 30px;
    font-size: 110px;
    line-height: 56px;
    color: #ffffff;
    font-family: "Alfa Slab One", cursive;
    text-align: center;
    opacity: 0.85;
}
#hero h1 span {
    color: #ff0000;
}
#hero h2 {
    color: #ffffff;
    margin: 5px 0 30px 0;
    font-size: 44px;
    text-align: center;
    margin-bottom: 15vh;
    font-family: "Alfa Slab One", cursive;
    opacity: 0.85;
}
</style>
