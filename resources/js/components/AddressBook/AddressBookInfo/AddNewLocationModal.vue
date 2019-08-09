<template>
    <modal name="hello-world" draggable=".window-header" resizable :clickToClose="false" :height="500" :width="900">
        <div class="window-header">DRAG ME HERE</div>
            <div class="main_wrapper_popup">
               <!--  <div class="popup_heading_area">
                    <div class="clear"></div>
                </div>
                <div class="closeIcon">
                    <button><i class="fa fa-times-circle"></i></button>
                </div>
 -->
                <form method="post" @submit.prevent="addLocation">
                    <div class="row justify-content-end">
                        <div class="col-3">
                            <button type="reset" class="btn btn-warning">Cancel</button>
                            <button type="submit" class="btn btn-primary">Save</button>
                        </div>
                    </div>
                    <div class="card bg-promary">
                        <div class="page_id">
                            <div class="page_id_text">Location ID: <span style="font-weight: bold;">{{ modal.LocationID }}</span></div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="ShipToCompanyName">Ship To Company Name:</label>
                                <input type="text" class="form-control" name="ShipToCompanyName" v-validate="'required'" v-model="modal.ShipToCompanyName" id="ShipToCompanyName">
                                <span class="help is-danger" v-if="errors.has('ShipToCompanyName')">{{ errors.first('ShipToCompanyName') }}</span>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="LocationName">Location ID</label>
                                <input type="text" name="LocationName" v-validate="'required'" v-model="modal.LocationName" id="LocationName" class="form-control">
                                <span class="help is-danger" v-if="errors.has('LocationName')">{{ errors.first('LocationName') }}</span>
                            </div>
                        </div>

                        <div class="col-6">
                            <div class="form-group">
                                <label for="Address">Address</label>
                                <input type="text" name="Address" v-validate="'required'" v-model="modal.Address" id="Address" class="form-control">
                                <span class="help is-danger" v-if="errors.has('Address')">{{ errors.first('Address') }}</span>
                            </div>
                        </div>

                        <div class="col-6">
                            <div class="form-group">
                                <label for="City">City</label>
                                <input type="text" name="City" v-validate="'required'" v-model="modal.City" id="City" class="form-control">
                                <span class="help is-danger" v-if="errors.has('City')">{{ errors.first('City') }}</span>
                            </div>
                        </div>

                        <div class="col-6">
                            <div class="form-group">
                                <label for="State">State</label>
                                <input type="text" name="State" v-validate="'required'" v-model="modal.State" id="State" class="form-control">
                                <span class="help is-danger" v-if="errors.has('State')">{{ errors.first('State') }}</span>
                            </div>
                        </div>

                        <div class="col-6">
                            <div class="form-group">
                                <label for="Zip">Zip</label>
                                <input type="text" name="Zip" v-validate="'required'" v-model="modal.Zip" id="Zip" class="form-control">
                                <span class="help is-danger" v-if="errors.has('Zip')">{{ errors.first('Zip') }}</span>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="Country">Country</label>
                                <input type="text" name="Country" v-model="modal.Country" id="Country" class="form-control">
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="Phone">Phone</label>
                                <input type="text" name="Phone" v-validate="'required'" v-model="modal.Phone" id="Phone" class="form-control" placeholder="XXX-XXX-XXXX" maxlength="12">
                                <span class="help is-danger" v-if="errors.has('Phone')">{{ errors.first('Phone') }}</span>
                            </div>
                        </div>

                        <div class="col-6">
                            <div class="form-group">
                                <label for="LocationSample">Sampel: </label>
                                <input type="checkbox" name="LocationSample" v-model="modal.LocationSample" id="LocationSample" class="form-check" :true-value="1">
                            </div>
                        </div>

                         <div class="col-6">
                            <div class="form-group">
                                <label for="LocationShip1">Ship 1: </label>
                                <input type="checkbox" name="LocationShip1" v-model="modal.LocationShip1" id="LocationShip1" class="form-check" :true-value="1">
                            </div>
                        </div>
                         <div class="col-6">
                            <div class="form-group">
                                <label for="LocationShip2">Ship 2: </label>
                                <input type="checkbox" name="LocationShip2" v-model="modal.LocationShip2" id="LocationShip2" class="form-check" :true-value="1">
                            </div>
                        </div>
                         <div class="col-6">
                            <div class="form-group">
                                <label for="LocationBill">Bill: </label>
                                <input type="checkbox" name="LocationBill" v-model="modal.LocationBill" id="LocationBill" class="form-check" :true-value="1">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
    </modal>
</template>



<script>

import VModal from 'vue-js-modal'
Vue.use(VModal)
import addressbook from '~/api/addressbook.js';

import VeeValidate from 'vee-validate';
Vue.use(VeeValidate);
export default {
  name: 'AddNewLocationModal',
  data () {
    return {
        AData: {
            ABID: '',
            Name: ''
        },
        modal:{

        }
    }
  },
  methods: {
    closeModal(){
        this.$modal.hide('hello-world');
    },
    addLocation(){
        let self = this;
            self.$validator.validateAll().then(result => {
            if (result) {
                addressbook.saveLocation(self.modal, sdata => {
                    Notify.success('Location Added Successfully');
                    self.$modal.hide('hello-world');
                    self.$nextTick(() =>{
                        EventBus.$emit('ADD_LOCATION', sdata);
                    });
                }, err => {
                    Notify.error(err.message);
                    this.$setErrorsFromResponse(err);
                });
            }
        });
    },
  },
  created(){
    // console.log('component created');
    EventBus.$on('SHOW_CONTACT_MODAL', data => {
        this.AData = data;
        addressbook.addLocation(data, sdata => {
            this.modal = sdata;
            this.modal.ShipToCompanyName = sdata.LocationName;
            this.modal.LocationName = '';

            this.$modal.show('hello-world');

            console.log(sdata);
            console.log('Sample Announcment');
        }, error =>{
            console.log(error);
        });

    });
    EventBus.$on('HIDE_CONTACT_MODAL', () => {
        alert('Modal is Displayed');
    });

  },
  mounted(){
    // console.log('component Mounted');
  },
  destroyed(){
    EventBus.$off('SHOW_CONTACT_MODAL');
    EventBus.$off('HIDE_CONTACT_MODAL');
  }
}
</script>

<style lang="css" scoped>
</style>
