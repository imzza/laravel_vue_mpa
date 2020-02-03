const User = {
  allStudent(cb, errorCB) {
    axios
      .get(API_URL + 'me')
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
  getToken (data, cb, errorCB) {
    axios
      .post(API_URL + 'getToken', data)
      .then(resp => {
        if (resp.status == 200) {
          cb(resp.data)
        }
      })
      .catch(err => {
        errorCB(err.response.data)
      })
  },
  saveStudent (data, cb, errorCB) {
    axios
      .post(API_URL + 'students', data)
      .then(resp => {
        console.log("saveUser:",resp);
        if (resp.status == 201) {
          cb(resp.data)
        }
      })
      .catch(err => {
        errorCB(err.response.data)
      })
  },
  getSingleStudent (id, cb, errorCB) {
    axios
      .get(API_URL + 'students/' + id)
      .then(resp => {
        console.log("getSingleUser:",resp)
        if (resp.status == 200) {
          cb(resp.data)
        }
      })
      .catch(err => {
        errorCB(err.response.data)
      })
  },
  updateStudent (id, data, cb, errorCB) {
    axios
      .put(API_URL + 'students/' + id, data)
      .then(resp => {
        console.log("updateUser:",resp)
        if (resp.status == 200) {
          cb(resp.data)
        }
      })
      .catch(err => {
        errorCB(err.response.data)
      })
  },

  deleteStudent (id, cb, errorCB) {
    axios
      .delete(API_URL + 'students/' + id)
      .then(resp => {
        console.log("deleteUser:",resp)
        if (resp.status == 204) {
          cb(resp.data)
        }
      })
      .catch(err => {
        errorCB(err.response.data)
      })
  }
}

export default User
