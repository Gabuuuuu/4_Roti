<template>
    <div>
        <TheHeader class="fixed-top"></TheHeader>
        <Cars></Cars>
        <TheFooter></TheFooter>
    </div>
</template>

<script>
import TheFooter from "../../components/layout/TheFooter.vue";
import TheHeader from "../../components/layout/TheHeader";
import Cars from "../../components/pricesec/Cars.vue";
export default {
    components: {
        TheFooter,
        TheHeader,
        Cars,
    },
};
</script>

<style scoped></style>
