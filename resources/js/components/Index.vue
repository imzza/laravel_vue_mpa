<template>
    <section>
        <div class="card mt-4 border-0">
            <div class="card-body">
                <template>
                    <div class="filter-bar">
                        <form class="form-inline">
                            <div
                                class="form-group d-flex justify-content-end w-100"
                            >
                                <label class="cust-label">Search for:</label>
                                <input
                                    v-model="filterText"
                                    type="text"
                                    class="form-control cust-form-control"
                                    placeholder="Search .."
                                    @keyup.enter="doFilter"
                                />
                                <button
                                    class="btn btn-primary w10"
                                    @click.prevent="doFilter"
                                >
                                    Go
                                </button>
                                <button
                                    class="btn btn-danger w10 f-right"
                                    @click.prevent="resetFilter"
                                >
                                    Reset
                                </button>
                            </div>
                        </form>
                    </div>
                </template>
                <vuetable
                    ref="vuetable"
                    :api-url="`${ApiUrl}students`"
                    :fields="flds"
                    pagination-path=""
                    :css="css.table"
                    :sort-order="sortOrder"
                    :multi-sort="true"
                    :http-fetch="myFetch"
                    detail-row-component="my-detail-row"
                    :append-params="moreParams"
                    @vuetable:cell-clicked="onCellClicked"
                    @vuetable:pagination-data="onPaginationData"
                >
                    <div slot="actions-slot" slot-scope="props">
                        <div class="custom-actions">
                            <button
                                v-if="$can('departments_delet')"
                                class="btn btn-primary btn-sm"
                                @click="itemAction('view', props.rowData.id)"
                            >
                                <i class="fa fa-eye" />
                            </button>
                            <button
                                class="btn btn-primary btn-sm"
                                @click="itemAction('edit', props.rowData.id)"
                            >
                                <i class="fa fa-edit" />
                            </button>
                            <button
                                class="btn btn-danger btn-sm"
                                @click="deleteItem(props.rowData.id)"
                            >
                                <i class="fa fa-trash" />
                            </button>
                        </div>
                    </div>
                </vuetable>
                <div class="vuetable-pagination">
                    <vuetable-pagination-info
                        ref="paginationInfo"
                        info-class="pagination-info"
                    />
                    <vuetable-pagination
                        ref="pagination"
                        :css="css.pagination"
                        @vuetable-pagination:change-page="onChangePage"
                    />
                </div>
            </div>
        </div>
    </section>
</template>
<script>
    import moment from 'moment'
    import Vuetable from 'vuetable-2/src/components/Vuetable'
    import VuetablePagination from 'vuetable-2/src/components/VuetablePagination'
    import VuetablePaginationInfo from 'vuetable-2/src/components/VuetablePaginationInfo'
    import Vue from 'vue'

    import Student from '~/api/student'

    export default {
        name: 'SampleComponent',
        components: {
            Vuetable,
            VuetablePagination,
            VuetablePaginationInfo,
            // CustomActions,
            // 'filter-bar': FilterBar
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
                    {
                        name: 'first_name',
                        title: 'First Name',
                        sortField: 'first_name',
                    },
                    {
                        name: 'last_name',
                        title: 'Last Name',
                        sortField: 'last_name',
                    },
                    {
                        name: 'email',
                        title: 'Email Address',
                        sortField: 'email',
                    },
                    {
                        name: 'city',
                        title: 'City',
                        sortField: 'city',
                    },
                    {
                        name: 'state',
                        title: 'State',
                        sortField: 'state',
                    },
                    {
                        name: 'zip',
                        title: 'zip',
                        sortField: 'zip',
                    },
                    {
                        name: 'created_at',
                        title: 'Created',
                        sortField: 'created_at',
                        titleClass: 'text-center',
                        dataClass: 'text-center',
                        callback: 'formatDate|DD-MM-YYYY',
                    },
                    {
                        name: 'gender',
                        sortField: 'gender',
                        titleClass: 'text-center',
                        dataClass: 'text-center',
                        callback: 'genderLabel',
                    },
                    {
                        name: '__slot:actions-slot',
                        title: 'Actions',
                        titleClass: 'text-center',
                        dataClass: 'text-center',
                    },
                ],
                css: {
                    table: {
                        tableClass: 'table table-bordered',
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
                sortOrder: [
                    { field: 'email', sortField: 'email', direction: 'asc' },
                ],
                moreParams: {},
            }
        },
        computed: {
            ApiUrl() {
                return API_URL
            },
        },
        created() {},
        destroyed() {},
        methods: {
            itemAction(action, data) {
                if (action == 'edit') {
                    this.$router.push({ path: '/edit/' + data })
                } else if (action == 'view') {
                    alert('View')
                }
            },
            doFilter() {
                this.moreParams = {
                    filter: this.filterText,
                }
                Vue.nextTick(() => this.$refs.vuetable.refresh())
            },
            resetFilter() {
                this.filterText = ''
                this.moreParams = {}
                Vue.nextTick(() => this.$refs.vuetable.refresh())
            },

            deleteItem(id) {
                Notify.confirm().then(resp => {
                    Student.delete(
                        id,
                        resp => {
                            Notify.success('Deleted successfully')
                            this.$refs.vuetable.refresh()
                        },
                        err => {
                            Notify.error('Something went wrong')
                        }
                    )
                })
            },
            myFetch(apiUrl, httpOptions) {
                return axios.get(apiUrl, httpOptions)
            },
            allcap(value) {
                return value.toUpperCase()
            },
            genderLabel(value) {
                return value === 'male'
                    ? '<span class="label label-success"><i class="fa fa-star"></i> Male</span>'
                    : '<span class="label label-danger"><i class="fa fa-heart"></i> Female</span>'
            },
            formatNumber(value) {
                return value, 2
            },
            formatDate(value, fmt = 'D MMM YYYY') {
                return value == null
                    ? ''
                    : moment(value, 'YYYY-MM-DD').format(fmt)
            },
            onPaginationData(paginationData) {
                this.$refs.pagination.setPaginationData(paginationData)
                this.$refs.paginationInfo.setPaginationData(paginationData)
            },
            onChangePage(page) {
                this.$refs.vuetable.changePage(page)
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
                        } else {
                        }
                    })
                    .catch(err => {
                        console.log('error')
                    })
            },
        },
    }
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
