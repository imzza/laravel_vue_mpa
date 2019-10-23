<template>
        <div>
            <section class="pagination-row py-3">
                <div class="container">
                    <div class="borderdBox">
                        <div class="d-flex">
                            <div class="sales-taps dashboard-nav mr-auto">
                                <ul class='tabs-model d-flex list-unstyled flex-wrap'>
                                    <!-- <router-link :to="{name: 'index'}">Sample</router-link>
                                    <router-link :to="{name: 'test'}">Test</router-link> -->
                                    <li><a data-toggle="modal" data-target="#addNewAddress" class="btn btn-primary btn-sm">Contact Manamagement</a></li>
                                    <li><a href="" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#exampleModalCenter">Create Sample request</a></li>
                                    <!-- <li><a href="{{url('contactHistory')}}"  class="btn btn-primary btn-sm">Create New Order</a></li> -->
                                    <li><a href="" class="btn btn-primary btn-sm">SR History</a></li>
                                    <li><a href="" class="btn btn-primary btn-sm">Order History</a></li>
                                    <li><a href="" class="btn btn-primary btn-sm">Full History</a></li>
                                    <li><a href="" class="btn btn-primary btn-sm">Delete Contact</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="tableContent">
                <router-view></router-view>
            </section>
        </div>
</template>

<script>
      // props: ['data'],

import VueRouter from 'vue-router';
import store from '~/store';


let U = window.location.href.split('/');
let base = '/'+U[3]+'/'+U[4]+'/'+U[5]+'/'+U[6]+'/'+U[7];

export default {
  store,
  name: 'AddressBookInfo',
  props: [
        'getabnamedata',
        'getalldbuser',
        'getallshippinginfo',
        'getallshippingterm',
        'getallabnamecategory',
        'getcontactdata',
        'getablocationdata',
        'getcontacthistory'
        ],
  data () {
    return {
        getAbNameData: _.cloneDeep(this.getabnamedata),
        getContactData: _.cloneDeep(this.getcontactdata),
        getAbLocationData: _.cloneDeep(this.getablocationdata),
        getContactHistory: _.cloneDeep(this.getcontacthistory)
    }
  },
    router: new VueRouter({
        mode: 'history',
        base: base,
        routes: [
            {
                path: '/index',
                name: 'index',
                component: () => import('~/components/AddressBook/AddressBookInfo/Details.vue'),
            },
            {
                path: '/',
                redirect: {name: 'index'}
            },
            {
                path: '/test',
                name: 'test',
                component: () => import('~/components/Test.vue'),
            },
            // {
            //     path: '/add-item',
            //     name: 'add-item',
            //     component: MenuItem
            // },
            // {
            //     path: '/edit-item/:id',
            //     name: 'edit-item',
            //     component: MenuItem,
            //     props: true
            // },
            {
                path: '*',
                redirect: '/'
            }
        ]
    }),
  created(){
    this.$store.commit('addressbook/SET_ALL_DB_USER', _.cloneDeep(this.getalldbuser));
    this.$store.commit('addressbook/SET_ALL_SHIPPING_INFO', _.cloneDeep(this.getallshippinginfo));
    this.$store.commit('addressbook/SET_ALL_SHIPPING_TERM', _.cloneDeep(this.getallshippingterm));
    this.$store.commit('addressbook/SET_ALL_ABNAME_CATEGORY', _.cloneDeep(this.getallabnamecategory));
  },
  mounted(){
    // console.log('Hello Web');
    // axios.get(API_URL+'user').then(resp => {
    //     console.log(resp);
    // }).catch(err =>{
    //     console.log(err.response);
    // });
  },
  methods:{
     hello(){
        console.log('Hello Web');
     }
  }
}
</script>

<style lang="css" scoped>
</style>
