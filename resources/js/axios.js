import axios from 'axios'
window.axios = axios

window.axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest'
window.axios.defaults.headers.common.Accept = 'application/json'
window.axios.defaults.headers.common['Content-Type'] = 'application/json'

const token = document.head.querySelector('meta[name="csrf-token"]')

if (token) {
    window.axios.defaults.headers.common['X-CSRF-TOKEN'] = token.content
} else {
    console.error(
        'CSRF token not found: https://laravel.com/docs/csrf#csrf-x-csrf-token'
    )
}

window.axios.interceptors.request.use(request => {
    // const token = store.getters['auth/token']
    // if (token) {
    //   request.headers.common['Authorization'] = `Bearer ${token}`
    // }

    // const locale = store.getters['lang/locale']
    // if (locale) {
    //   request.headers.common['Accept-Language'] = locale
    // }

    // request.headers['X-Socket-Id'] = Echo.socketId()

    return request
})


window.axios.interceptors.response.use(
    response => response,
    error => {
        // const { status } = error.response

        // if (status >= 500) {
        //   Swal.fire({
        //     type: 'error',
        //     title: i18n.t('error_alert_title'),
        //     text: i18n.t('error_alert_text'),
        //     reverseButtons: true,
        //     confirmButtonText: i18n.t('ok'),
        //     cancelButtonText: i18n.t('cancel')
        //   })
        // }

        // if (status === 401 && store.getters['auth/check']) {
        //   Swal.fire({
        //     type: 'warning',
        //     title: i18n.t('token_expired_alert_title'),
        //     text: i18n.t('token_expired_alert_text'),
        //     reverseButtons: true,
        //     confirmButtonText: i18n.t('ok'),
        //     cancelButtonText: i18n.t('cancel')
        //   }).then(() => {
        //     store.commit('auth/LOGOUT')

        //     router.push({ name: 'login' })
        //   })
        // }
        return Promise.reject(error)
    }
)
