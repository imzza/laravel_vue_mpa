let MODULE = 'AddressBook/';
const addressbook = {
    addLocation(data, cb,errorCB){
        axios.post(API_URL+'AddressBook/addLocation', data)
        .then(resp => {
            if (resp.status == 200) {
                cb(resp.data);
            }else{
                errorCB(resp.data);
            }
        }).catch(err =>{
            errorCB(err.response.data);
        });
    },


    saveLocation(data, cb, errorCB) {
        axios.post(API_URL+'AddressBook/saveLocation', data)
        .then(resp => {
            console.log(resp);
            if (resp.status == 200) {
                cb(resp.data);
            }else{
                errorCB(resp.data);
            }
        })
        .catch(err => {
            errorCB(err.response.data);
        });
    }
};

export default addressbook;


export function saveContact(data, cb,errorCB){
    axios.post(API_URL+'AddressBook/Contact', data)
    .then(resp => {
        if (resp.status == 200) {
            cb(resp.data);
        }else{
            errorCB(resp.data);
        }
    }, err =>{
        errorCB(err.response.data);
    })
}

export function deleteContact(ContactID, cb,errorCB) {
    axios.delete(API_URL+'AddressBook/Contact/'+ContactID)
    .then(resp => {
        if (resp.status == 204) {
            cb(resp.data);
        }else{
            errorCB(resp.data);
        }
    }, err =>{
        errorCB(err.response.data);
    })
}
