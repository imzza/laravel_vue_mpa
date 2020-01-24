<template>
    <div class="filter-bar">
        <form class="form-inline">
            <div class="form-group d-flex justify-content-end w-100">
                <label class="cust-label">Search for:</label>
                <input type="text" v-model="filterText" class="form-control cust-form-control" @keyup.enter="doFilter" placeholder="Search .." />
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
            filterText: '',
        };
    },
    methods: {
        doFilter() {
            this.$events.fire('filter-set', this.filterText);
        },
        resetFilter() {
            this.filterText = '';
            this.$events.fire('filter-reset');
        },
    },
};
</script>
<style>

</style>
