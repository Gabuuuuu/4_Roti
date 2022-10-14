<template>
    <div>
        <section id="team" class="team section-bg">
            <div class="container">
                <div class="section-title">
                    <h3>Our Hardworking <span>Team</span></h3>
                    <p>
                        Here you can find our talented staff members that made
                        all of this possible
                    </p>
                </div>

                <div class="row">
                    <div
                        class="col-lg-3 col-md-6 d-flex align-items-stretch"
                    >
                        <div class="member">
                            <div class="member-img">
                                <img
                                    src="../../../../public/images/MoraruG.jpg"
                                    class="img-fluid"
                                />
                                <div class="social">
                                    <a href=""><i class="bi bi-twitter"></i></a>
                                    <a href=""
                                        ><i class="bi bi-facebook"></i
                                    ></a>
                                    <a href=""
                                        ><i class="bi bi-instagram"></i
                                    ></a>
                                    <a href=""
                                        ><i class="bi bi-linkedin"></i
                                    ></a>
                                </div>
                            </div>
                            <div class="member-info">
                                <h4>Moraru Gabriel Danut</h4>
                                <span>General Manager</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</template>

<script>
export default {};
</script>

<style scoped>
section {
    padding: 60px 0;
    overflow: hidden;
    background-color: rgba(1, 0, 56, 0.255);
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

.team {
    padding: 158px 0;
    margin-top: 8vh;
}
.team .member {
    text-align: center;
    margin-bottom: 20px;
    overflow: hidden;
    border-radius: 4px;
    background: #fff;
    box-shadow: 0px 2px 15px rgba(0, 0, 0, 0.15);
}
.team .member .member-img {
    position: relative;
    overflow: hidden;
}
.team .member .social {
    position: absolute;
    left: 0;
    bottom: 30px;
    right: 0;
    opacity: 0;
    transition: ease-in-out 0.3s;
    text-align: center;
}
.team .member .social a {
    transition: color 0.3s;
    color: #222222;
    margin: 0 3px;
    padding-top: 7px;
    border-radius: 4px;
    width: 36px;
    height: 36px;
    background: rgba(16, 110, 234, 0.8);
    display: inline-block;
    transition: ease-in-out 0.3s;
    color: #fff;
}
.team .member .social a:hover {
    background: #3b8af2;
}
.team .member .social i {
    font-size: 18px;
}
.team .member .member-info {
    padding: 25px 15px;
}
.team .member .member-info h4 {
    font-weight: 700;
    margin-bottom: 5px;
    font-size: 18px;
    color: #222222;
}
.team .member .member-info span {
    display: block;
    font-size: 13px;
    font-weight: 400;
    color: #aaaaaa;
}
.team .member .member-info p {
    font-style: italic;
    font-size: 14px;
    line-height: 26px;
    color: #777777;
}
.team .member:hover .social {
    opacity: 1;
    bottom: 15px;
}
@import url("https://fonts.googleapis.com/css2?family=Roboto&display=swap");
</style>
