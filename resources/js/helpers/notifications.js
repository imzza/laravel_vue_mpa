// Sweet Alert Configurations
import Swal from 'sweetalert2'
const Toast = Swal.mixin({
    toast: true,
    position: 'top-right',
    showConfirmButton: false,
    timer: 4000,
})

const notify = {
    success(msg) {
        if (msg == '') {
            return true
        }
        Toast.fire({
            type: 'success',
            title: msg,
        })
    },
    error(msg) {
        Toast.fire({
            type: 'error',
            title: msg,
        })
    },
    warning(msg) {
        Toast.fire({
            type: 'warning',
            title: msg,
        })
    },
    confirm(message, small = true) {
        if (message === undefined) {
            message = 'Are you sure?'
        }

        return new Promise((resolve, reject) => {
            // text:  for small text
            Swal.fire({
                title: message,
                position: 'top-right',
                type: 'warning',
                showCancelButton: true,
                toast: small,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Delete',
            }).then(result => {
                if (result.value) {
                    resolve('success')
                }
            })
        })
    },
}

export default notify
