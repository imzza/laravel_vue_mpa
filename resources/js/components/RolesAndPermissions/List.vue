<template>
    <div>
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
        <vuetable ref="vuetable" :api-url="`${ApiUrl}students`" :fields="flds" pagination-path="" :css="css.table" :sort-order="sortOrder" :multi-sort="true" :http-fetch="myFetch" detail-row-component="my-detail-row" :append-params="moreParams" @vuetable:cell-clicked="onCellClicked" @vuetable:pagination-data="onPaginationData"></vuetable>
        <div class="vuetable-pagination">
            <vuetable-pagination-info ref="paginationInfo" info-class="pagination-info"></vuetable-pagination-info>
            <vuetable-pagination ref="pagination" :css="css.pagination" @vuetable-pagination:change-page="onChangePage"></vuetable-pagination>
        </div>
    </div>
</template>
<!--/api/v1/employees_all vuetable.ratiw.net/api/users -->
<script>
import moment from 'moment';
import Vuetable from 'vuetable-2/src/components/Vuetable';
import VuetablePagination from 'vuetable-2/src/components/VuetablePagination';
import VuetablePaginationInfo from 'vuetable-2/src/components/VuetablePaginationInfo';
import Vue from 'vue';

import VueEvents from 'vue-events';

import CustomActions from './CustomActions';
// import DetailRow from './DetailRow';
import FilterBar from './FilterBar';

Vue.use(VueEvents);

// Vue.component('custom-actions', CustomActions);
// Vue.component('filter-bar', FilterBar);

import User from '~/api/user.js';
export default {
    name: 'SampleComponent',
    components: {
        Vuetable,
        VuetablePagination,
        VuetablePaginationInfo,
        'custom-actions': CustomActions
    },
    data() {
        return {
            filterText: '',
            flds: [
                {
                    name: '__sequence',
                    title: '#',
                    titleClass: 'text-right',
                    dataClass: 'text-right',
                },
                // {
                //   name: '__checkbox',
                //   titleClass: 'text-center',
                //   dataClass: 'text-center',
                // },
                {
                    name: 'name',
                    title: 'Role Name',
                    sortField: 'name',
                },
                {
                    name: 'rolename',
                    title: 'Role Display Name',
                    sortField: 'rolename',
                },
                {
                    name: 'role_descrip',
                    title: 'Description',
                    sortField: 'role_descrip',
                },
                // {
                //     name: 'city',
                //     title: 'City',
                //     sortField: 'city',
                // },
                // {
                //     name: 'state',
                //     title: 'State',
                //     sortField: 'state',
                // },
                // {
                //     name: 'zip',
                //     title: 'zip',
                //     sortField: 'zip',
                // },
                // {
                //     name: 'created_at',
                //     title: 'Created',
                //     sortField: 'created_at',
                //     titleClass: 'text-center',
                //     dataClass: 'text-center',
                //     callback: 'formatDate|DD-MM-YYYY',
                // },
                // {
                //     name: 'gender',
                //     sortField: 'gender',
                //     titleClass: 'text-center',
                //     dataClass: 'text-center',
                //     callback: 'genderLabel',
                // },
                {
                    name: '__component:custom-actions',
                    title: 'Actions',
                    titleClass: 'text-center',
                    dataClass: 'text-center',
                },
            ],
            css: {
                table: {
                    tableClass: 'table table-bordered table-striped table-hover',
                    ascendingIcon: 'fa fa-chevron-up',
                    descendingIcon: 'fa fa-chevron-down',
                },
                pagination: {
                    wrapperClass: 'pagination',
                    activeClass: 'active',
                    disabledClass: 'disabled',
                    pageClass: 'page',
                    linkClass: 'link',
                    icons: {
                        first: '',
                        prev: '',
                        next: '',
                        last: '',
                    },
                },
                icons: {
                    first: 'fa fa-step-backward',
                    prev: 'fa fa-chevron-left',
                    next: 'fa fa-chevron-right',
                    last: 'fa fa-step-forward',
                },
            },
            sortOrder: [{ field: 'email', sortField: 'email', direction: 'asc' }],
            moreParams: {},
        };
    },
    methods: {
        doFilter(){
            this.moreParams = {
                filter: this.filterText,
            };
            Vue.nextTick(() => this.$refs.vuetable.refresh());
        },
        resetFilter(){
            this.filterText = '';
            this.moreParams = {};
            Vue.nextTick(() => this.$refs.vuetable.refresh());
        },

        myFetch(apiUrl, httpOptions) {
            return axios.get(apiUrl, httpOptions);
        },
        allcap(value) {
            return value.toUpperCase();
        },
        genderLabel(value) {
            return value === 'male' ? '<span class="label label-success"><i class="fa fa-star"></i> Male</span>' : '<span class="label label-danger"><i class="fa fa-heart"></i> Female</span>';
        },
        formatNumber(value) {
            return value, 2;
        },
        formatDate(value, fmt = 'D MMM YYYY') {
            return value == null ? '' : moment(value, 'YYYY-MM-DD').format(fmt);
        },
        onPaginationData(paginationData) {
            this.$refs.pagination.setPaginationData(paginationData);
            this.$refs.paginationInfo.setPaginationData(paginationData);
        },
        onChangePage(page) {
            this.$refs.vuetable.changePage(page);
        },
        onCellClicked(data, field, event) {
            // console.log('cellClicked: ', field.name)
            // this.$refs.vuetable.toggleDetailRow(data.id)
        },
        check_c() {
            axios
                .get(API_URL + 'students')
                .then(resp => {
                    if (resp.status == 200) {
                        console.log(resp);
                    } else {
                        console.log('error');
                    }
                })
                .catch(err => {
                    console.log('error');
                });
        },
    },
    // events: {
    //     'filter-set'(filterText) {
    //         this.moreParams = {
    //             filter: filterText,
    //         };
    //         Vue.nextTick(() => this.$refs.vuetable.refresh());
    //     },
    //     'filter-reset'() {
    //         this.moreParams = {};
    //         Vue.nextTick(() => this.$refs.vuetable.refresh());
    //     },
    // },
    computed: {
        ApiUrl() {
            return API_URL;
        },
    },
    created() {
        EventBus.$on('DELETE_CONTACT', data => {
            console.log(data);
            User.delete(
                data.id,
                resp => {
                    Notify.success('Deleted successfully');
                    this.$refs.vuetable.refresh();
                },
                err => {
                    Notify.error('Something went wrong');
                }
            );
        });
    },
    destroyed() {
        EventBus.$on('DELETE_CONTACT');
    },
};
</script>
<style>
.vuetable-empty-result {
    font-weight: bold;
}
.vuetable-pagination {
    display: flex;
    flex-direction: row;
    font-weight: bold;
    justify-content: space-between;
}
.pagination-info {
    font-weight: bold;
}
.pagination .btn-nav {
    width: 30px;
    height: 35px;
}
.pagination .page {
    cursor: pointer;
}

.pagination a.btn-nav.disabled {
    color: lightgray;
    border: 1px solid lightgray;
    border-radius: 3px;
    padding: 5px 10px;
    cursor: not-allowed;
    font-weight: bold;
    color: #000;
}
</style>
