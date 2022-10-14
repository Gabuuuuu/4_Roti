<template>
    <div class="form-outline form-white mb-4">
        <select
            v-model="form.brand"
            class="selectpicker btn btn-secondary btn-lg dropdown-toggle form-control form-control-lg"
            data-style="btn-success"
        >
            <option hidden disabled selected>Brand</option>
            <option>Brand 1</option>
            <option>Brand 2</option>
        </select>
    </div>
</template>

<script>
export default {
    data() {
        return {
            form: {
                brand: "",
            },
        };
    },
};
</script>
