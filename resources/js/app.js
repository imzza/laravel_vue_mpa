import _ from 'lodash';
window._ = _;

let getUrl = window.location;
//remove last section for running project as virtual host
let baseUrl = getUrl.protocol + '//' + getUrl.host + '/' + getUrl.pathname.split('/')[1];



function ProjectUrl(path= null){
    let url = window.location.origin;
    let pth = window.location.pathname;
    let orig = '';
    if (url.indexOf('localhost') != -1 || url.indexOf('127.0.0.1') != -1) {
        orig = url+'/'+pth.split('/')[1];
    }else{
        orig = url;
    }

    if (path != null) {
        orig = orig+path;
    }
    return orig;
}

window.ProjectUrl = ProjectUrl;

let AB_URL = ProjectUrl();
console.log('AB_URL:', AB_URL);

window.PREFIX = 'laravel_vue_mpa';

window.SUB_URL = baseUrl;
window.BASE_URL = baseUrl;
window.Full_url = window.BASE_URL;

window.API_URL = baseUrl + '/api/';

import Vue from 'vue';
window.Vue = Vue;

import notify from '~/helpers/notifications.js';
window.Notify = notify;

window.EventBus = new Vue();

import './axios';

import '@fortawesome/fontawesome-free/js/all.js';

import Permissions from '~/mixins/cmmon.js';
Vue.mixin(Permissions);


Vue.component('mian-component', require('./components/MainComponent.vue').default);
Vue.component('roles-and-permissions-component', require('./components/RolesAndPermissions/Index.vue').default);

//Dynamic Imports
// Vue.component('v-button', () => import('./components/Button.vue'));
Vue.component('v-button', require('./components/Button.vue').default);

Vue.prototype.$setErrorsFromResponse = function(errorResponse) {
    if (!this.hasOwnProperty('$validator')) {
        return;
    }

    this.$validator.errors.clear();
    if (!errorResponse.hasOwnProperty('errors')) {
        return;
    }
    let errorFields = Object.keys(errorResponse.errors);

    errorFields.map(field => {
        let errorString = errorResponse.errors[field].join(', ');
        this.$validator.errors.add({ field: field, msg: errorString });
    });
};

const app = new Vue({
    el: '#app',
});
