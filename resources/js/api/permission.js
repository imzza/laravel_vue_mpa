const Permission = {
    all(cb, errorCB) {
        axios
            .get(API_URL + 'permissions')
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
            .post(API_URL + 'permissions', data)
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
            .get(API_URL + 'permissions' + id)
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
            .put(API_URL + 'permissions/' + id, data)
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
            .delete(API_URL + 'permissions/' + id)
            .then(resp => {
                if (resp.status == 204) {
                    cb(resp.data)
                }
            })
            .catch(err => {
                errorCB(err.response.data)
            })
    },
    permission_by_group(cb, errorCb) {
        axios
            .get(API_URL + 'permission_by_group')
            .then(resp => {
                if (resp.status == 200) {
                    cb(resp.data)
                } else {
                    errorCb(resp.data)
                }
            })
            .catch(error => {
                errorCb(error) // .resp.data
            })
    },
    permission_by_role(id, cb, errorCb) {
        axios
            .get(API_URL + 'permission_by_role/' + id)
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

export default Permission
