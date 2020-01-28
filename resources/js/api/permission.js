const Permission = {
    all (cb, errorCB) {
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
    save (data, cb, errorCB) {
      axios
        .post(API_URL + 'permissions', data)
        .then(resp => {
          console.log(resp)
          if (resp.status == 201) {
            cb(resp.data)
          }
        })
        .catch(err => {
          errorCB(err.response.data)
        })
    },
    getSingle (id, cb, errorCB) {
      axios
        .get(API_URL + 'permissions' + id)
        .then(resp => {
          console.log(resp)
          if (resp.status == 200) {
            cb(resp.data)
          }
        })
        .catch(err => {
          errorCB(err.response.data)
        })
    },
    update (id, data, cb, errorCB) {
      axios
        .put(API_URL + 'permissions/' + id, data)
        .then(resp => {
          console.log(resp)
          if (resp.status == 201) {
            cb(resp.data)
          }
        })
        .catch(err => {
          errorCB(err.response.data)
        })
    },
  
    delete (id, cb, errorCB) {
      axios
        .delete(API_URL + 'permissions/' + id)
        .then(resp => {
          console.log(resp)
          if (resp.status == 204) {
            cb(resp.data)
          }
        })
        .catch(err => {
          errorCB(err.response.data)
        })
    }
  }
  
  export default Permission
  