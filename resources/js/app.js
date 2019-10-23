import _ from 'lodash';
window._ = _;

let getUrl = window.location;
//remove last section for running project as virtual host
let baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[1];

window.PREFIX = 'laravel_vue_mpa';

window.SUB_URL=baseUrl;
window.BASE_URL = baseUrl;
window.Full_url=window.BASE_URL;

window.API_URL = baseUrl+'/api/';



import Vue from 'vue';
window.Vue = Vue;


import notify from '~/helpers/notifications.js';
window.Notify = notify;

window.EventBus = new Vue();

import './axios'

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i);
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default));

// Vue.component('mian-component', require('./components/MainComponent.vue').default);

// Vue.component('addressbook-info', require('./components/AddressBook/AddressBookInfo.vue').default);


Vue.component('mian-component', () => import('./components/MainComponent.vue'));
Vue.component('v-button', () => import('./components/Button.vue'));

// Vue.component('addressbook-info', () => import('./components/AddressBook/AddressBookInfo.vue'));
// Vue.component('addressbook-main', () => import('./components/AddressBook/AddressBook.vue'));



/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */


Vue.prototype.$setErrorsFromResponse  = function(errorResponse) {
    if(!this.hasOwnProperty('$validator')) {
        return;
    }

    this.$validator.errors.clear();
    if(!errorResponse.hasOwnProperty('errors')) {
        return;
    }
    let errorFields = Object.keys(errorResponse.errors);

    errorFields.map(field => {
        let errorString = errorResponse.errors[field].join(', ');
        this.$validator.errors.add({field: field, msg: errorString });
    });
};


const app = new Vue({
    el: '#app',
});
