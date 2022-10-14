<template>
    <div>
        <section>
            <div class="container">
                <div class="row">
                    <!-- BEGIN INVOICE -->
                    <div class="col-xs-12">
                        <div class="grid invoice">
                            <div class="grid-body">
                                <div class="invoice -title">
                                    <div class="row">
                                        <h1 class="logo">
                                            <router-link to="/home">
                                                CatchA<span>Ride</span>
                                            </router-link>
                                        </h1>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <h2>
                                                INVOICE<br />
                                                <span class="small"
                                                    >Order
                                                    {{ invoice.id }}</span
                                                >
                                            </h2>
                                        </div>
                                    </div>
                                </div>
                                <hr />
                                <div class="row m-b-4">
                                    <div class="col-xs-6">
                                        <address>
                                            <strong>Billed From:</strong><br />
                                            Romania, Bucharest<br />
                                            Sector 5, Str. Ileana Cosanzeana
                                            10<br />
                                            305142<br />
                                            <abbr title="Phone">P:</abbr> (+40)
                                            0723-077-177
                                        </address>
                                    </div>
                                    <div
                                        class="col-xs-6 text-end position-absolute end-0"
                                    >
                                        <address>
                                            <strong>Shipped To:</strong><br />
                                            {{ invoice.cardname }}<br />
                                            {{ invoice.email }}<br />
                                            {{ invoice.zip }} <br />
                                        </address>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-xs-6">
                                        <address>
                                            <strong>Payment Method:</strong
                                            ><br />
                                            Visa ending **** 1234<br />
                                        </address>
                                    </div>
                                    <div
                                        class="col-xs-6 text-end position-absolute end-0"
                                    >
                                        <address>
                                            <strong>Order Date:</strong><br />
                                            {{ invoice.created_at }}
                                        </address>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <h3>ORDER SUMMARY</h3>
                                        <table class="table table-striped">
                                            <thead>
                                                <tr class="line">
                                                    <td class="text-center">
                                                        <strong>BRAND</strong>
                                                    </td>
                                                    <td class="text-center">
                                                        <strong>MODEL</strong>
                                                    </td>
                                                    <td class="text-center">
                                                        <strong>DAYS</strong>
                                                    </td>
                                                    <td class="text-center">
                                                        <strong>RATE</strong>
                                                    </td>
                                                    <td class="text-center">
                                                        <strong>TOTAL</strong>
                                                    </td>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="text-center">
                                                        {{ invoice.brand }}
                                                    </td>
                                                    <td class="text-center">
                                                        {{ invoice.model }}
                                                    </td>
                                                    <td class="text-center">
                                                        {{ invoice.days }}
                                                    </td>
                                                    <td class="text-center">
                                                        ${{
                                                            invoice.priceday
                                                        }}/day
                                                    </td>
                                                    <td
                                                        class="text-center"
                                                        format="yyyy-MM-dd HH:mm:ss"
                                                    >
                                                        ${{ invoice.total }}
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 text-right identity">
                                        <p>
                                            Invoice Offered By<br /><strong
                                                >CatchARide SRL.</strong
                                            >
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- END INVOICE -->
                </div>
            </div>
        </section>
    </div>
</template>

<script>
export default {
    data() {
        return {
            invoice: [],
        };
    },
    created() {
        this.loadData();
    },
    methods: {
        async loadData() {
            const response = await axios.get(
                "/api/loadInvoice/" + this.$route.params.id
            );
            this.invoice = response.data;
        },
    },
};
</script>

<style scoped>
body {
    margin-top: 20px;
    background: #eee;
}
a {
    text-decoration: none;
}

a:hover {
    text-decoration: none;
}

h1,
h2,
h3,
h4,
h5,
h6 {
    font-family: "Roboto", sans-serif;
}
#header {
    background: rgba(1, 0, 56, 0.255);
    transition: all 0.5s;
    z-index: 997;
    height: 86px;
    box-shadow: 0px 30px 30px rgba(1, 0, 56, 0.255);
    opacity: 0.8;
}
.logo {
    font-size: 50px;
    margin: 0;
    padding: 0;
    line-height: 1;
    font-weight: 600;
    letter-spacing: 1px;
    font-family: "Lobster", cursive;
}
.logo a {
    color: #000000;
}
.logo a span {
    color: #ff2525;
}

.invoice {
    padding: 30px;
}

.invoice h2 {
    margin-top: 0px;
    line-height: 0.8em;
}

.invoice .small {
    font-weight: 300;
}

.invoice hr {
    margin-top: 10px;
    border-color: #ddd;
}

.invoice .table tr.line {
    border-bottom: 1px solid #ccc;
}

.invoice .table td {
    border: none;
}

.invoice .identity {
    margin-top: 10px;
    font-size: 1.1em;
    font-weight: 300;
}

.invoice .identity strong {
    font-weight: 600;
}

.grid {
    position: relative;
    width: 100%;
    background: #fff;
    color: #666666;
    border-radius: 2px;
    margin-bottom: 25px;
    box-shadow: 0px 1px 4px rgba(0, 0, 0, 0.1);
}
</style>
