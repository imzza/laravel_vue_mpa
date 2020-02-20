import _ from 'lodash'
import Vue from 'vue'
import notify from '~/helpers/notifications.js'
import './axios'
import '@fortawesome/fontawesome-free/js/all.js'
import Permissions from '~/mixins/cmmon.js'
window._ = _
const getUrl = window.location
// remove last section for running project as virtual host
const baseUrl =
    getUrl.protocol + '//' + getUrl.host + '/' + getUrl.pathname.split('/')[1]
function ProjectUrl(path = null) {
    const url = window.location.origin
    const pth = window.location.pathname
    let orig = ''
    if (url.indexOf('localhost') != -1 || url.indexOf('127.0.0.1') != -1) {
        orig = url + '/' + pth.split('/')[1]
    } else {
        orig = url
    }
    if (path != null) {
        orig = orig + path
    }
    return orig
}
window.ProjectUrl = ProjectUrl
const AB_URL = ProjectUrl()
window.PREFIX = 'laravel_vue_mpa'
window.SUB_URL = baseUrl
window.BASE_URL = baseUrl
window.Full_url = window.BASE_URL
window.API_URL = baseUrl + '/api/'
window.Vue = Vue
window.Notify = notify
window.EventBus = new Vue()
Vue.mixin(Permissions);


Vue.component(
    'mian-component',
    () => import('./components/MainComponent.vue')
)
Vue.component(
    'roles-and-permissions-component',
    () => import('./components/RolesAndPermissions/Index.vue')
)
Vue.component('v-button', () => import('./components/Button.vue'));

Vue.component('test-component', () => import('./components/Test/Index.vue'));


// Vue.component('v-button', require('./components/Button.vue'))

Vue.prototype.$setErrorsFromResponse = function(errorResponse) {
    if (!this.hasOwnProperty('$validator')) {
        return
    }
    this.$validator.errors.clear()
    if (!errorResponse.hasOwnProperty('errors')) {
        return
    }
    const errorFields = Object.keys(errorResponse.errors)
    errorFields.map(field => {
        const errorString = errorResponse.errors[field].join(', ')
        this.$validator.errors.add({ field: field, msg: errorString })
    })
}
const app = new Vue({
    el: '#app',
})
