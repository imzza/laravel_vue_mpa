<template>
    <div class="filter-bar">
        <form class="form-inline">
            <div class="form-group d-flex justify-content-end w-100">
                <label class="cust-label">Search for:</label>
                <input type="text" v-model="filterText" class="form-control cust-form-control" @keyup.enter="doFilter" placeholder="Search ..">
                <button class="btn btn-primary w10" @click.prevent="doFilter">Go</button>
                <button class="btn btn-danger w10 f-right" @click.prevent="resetFilter">Reset</button>
            </div>
        </form>
    </div>
</template>
<script>
export default {
    data() {
        return {
            filterText: ''
        }
    },
    methods: {
        doFilter() {
            this.$events.fire('filter-set', this.filterText)
        },
        resetFilter() {
            this.filterText = ''
            this.$events.fire('filter-reset')
        }
    }
}

</script>
<style>
.cust-label {
    font-weight: bold;
    margin-right: 20px;
}
.w10 {
    width: 7% !important;
    margin: 0px 10px 0px 10px;
}
.f-right {
    margin-right: -10px !important;
}
.cust-form-control {
    width: 20%;
    max-width: 200px !important;
    min-width: 200px !important;
    border-radius: 0px;
    background-color: inherit;
}
</style>
