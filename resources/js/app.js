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


// const files = require.context('./', true, /\.vue$/i);
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default));

//DynamiC Import Section
// Vue.component('mian-component', () => import('./components/MainComponent.vue'));

Vue.component('mian-component', require('./components/MainComponent.vue').default);

//Dynamic Imports
// Vue.component('v-button', () => import('./components/Button.vue'));
Vue.component('v-button', require('./components/Button.vue').default);

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
