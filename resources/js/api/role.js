const Role = {
    view(cb, errorCB) {
        axios
            .get(API_URL + 'roles')
            .then(resp => {
                if (resp.status == 200) {
                    cb(resp.data)
                } else {
                    errorCB(resp.data)
                }
            })
            .catch(err => {
                errorCB(err.response)
            })
    },
    save(data, cb, errorCB) {
        axios
            .post(API_URL + 'roles', data)
            .then(resp => {
                if (resp.status == 201) {
                    cb(resp.data)
                }
            })
            .catch(err => {
                errorCB(err.response.data)
            })
    },
    getSingle(id, cb, errorCB) {
        axios
            .get(API_URL + 'roles/' + id)
            .then(resp => {
                if (resp.status == 200) {
                    cb(resp.data)
                }
            })
            .catch(err => {
                errorCB(err.response.data)
            })
    },
    update(id, data, cb, errorCB) {
        axios
            .put(API_URL + 'roles/' + id, data)
            .then(resp => {
                if (resp.status == 201) {
                    cb(resp.data)
                }
            })
            .catch(err => {
                errorCB(err.response.data)
            })
    },

    delete(id, cb, errorCB) {
        axios
            .delete(API_URL + 'roles/' + id)
            .then(resp => {
                if (resp.status == 204) {
                    cb(resp.data)
                }
            })
            .catch(err => {
                errorCB(err.response.data)
            })
    },

    roles_with_permissions(cb, errorCB) {
        axios
            .get(API_URL + 'roles_with_permissions')
            .then(resp => {
                if (resp.status == 200) {
                    cb(resp.data)
                } else {
                    errorCB(resp.data)
                }
            })
            .catch(err => {
                errorCB(err.response)
            })
    },

    assign_permissions(id, data, cb, errorCb) {
        axios
            .post(API_URL + 'roles_assign_permissions', {
                id: id,
                permissions: data,
            })
            .then(resp => {
                if (resp.status == 200) {
                    cb(resp.data)
                } else {
                    errorCb(resp.data)
                }
            })
            .catch(error => {
                errorCb(error)
            })
    },
}

export default Role
