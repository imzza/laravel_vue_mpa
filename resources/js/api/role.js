const Role = {
  viewRoles (cb, errorCB) {
    axios
      .get(API_URL + 'viewRoles')
      .then(resp => {
        console.log("viewRoles:",resp)
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
  saveRole (data, cb, errorCB) {
    axios
      .post(API_URL + 'roles', data)
      .then(resp => {
        console.log("saveRole:",resp);
        if (resp.status == 201) {
          cb(resp.data)
        }
      })
      .catch(err => {
        errorCB(err.response.data)
      })
  },
  getSingleRole (id, cb, errorCB) {
    axios
      .get(API_URL + 'roles/' + id)
      .then(resp => {
        console.log("getSingleRole:",resp);
        if (resp.status == 200) {
          cb(resp.data)
        }
      })
      .catch(err => {
        errorCB(err.response.data)
      })
  },
  updateRole (id, data, cb, errorCB) {
    axios
      .put(API_URL + 'roles/' + id, data)
      .then(resp => {
        console.log("updateRole:",resp);
        if (resp.status == 201) {
          cb(resp.data)
        }
      })
      .catch(err => {
        errorCB(err.response.data)
      })
  },

  deleteRole (id, cb, errorCB) {
    axios
      .delete(API_URL + 'roles/' + id)
      .then(resp => {
        console.log("deleteRole:",resp)
        if (resp.status == 204) {
          cb(resp.data)
        }
      })
      .catch(err => {
        errorCB(err.response.data)
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
                cb(resp.data);
            } else {
                errorCb(resp.data);
            }
        })
        .catch(error => {
            errorCb(error);
        });
},
}

export default Role
