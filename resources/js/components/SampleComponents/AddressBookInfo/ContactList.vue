<template>
    <div>
    <div class="title-row d-flex align-items-center my-3">
						<h2>Contact List <span>( check a location to associate )</span></h2>
					</div>
					<div class="cusTable table-responsive tabl-sm">
							<table class="table table-striped table-hover">
								<thead>
									<tr>
										<th>Sample</th>
										<th>Ship1</th>
										<th>Ship2</th>
										<th>Bill</th>
										<th>FirstName</th>
										<th>LastName</th>
										<th>Office</th>
										<th>Mobile</th>
										<th>Fax</th>
										<th>Email</th>
										<th>Display</th>
										<th>Modified</th>
										<th>Created</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
								<tr v-for="(contact, ind) in ContactData" :class="`contact_${ind}`">
										<td>
											<div class="checkbox">
												<label>
												  <input type="checkbox" :name="`contactSample${ind}`" :id="`contactSample${ind}`" :class="`contactCheckboxStatus${ind}`" v-model="contact.LocationSample" :true-value="1"/>
												  <span class="cr"><i class="cr-icon fa fa-check"></i></span>
												</label>
											</div>
										</td>
										<td>
											<div class="checkbox">
												<label>
												  <input type="checkbox" :name="`contactShip1${ind}`" :id="`contactShip1${ind}`"  :class="`contactCheckboxStatus${ind}`" v-model="contact.LocationShip1" :true-value="1">
												  <span class="cr"><i class="cr-icon fa fa-check"></i></span>
												</label>
											</div>
										</td>
										<td>
											<div class="checkbox" >
												<label>
												  <input type="checkbox" :name="`contactShip2${ind}`" :id="`contactShip2${ind}`" :class="`contactCheckboxStatus${ind}`"  v-model="contact.LocationShip2" :true-value="1">
												  <span class="cr"><i class="cr-icon fa fa-check"></i></span>
												</label>
											</div>
										</td>
										<td>
											<div class="checkbox">
												<label>
												  <input type="checkbox" :name="`contactBill${ind}`" v-on:blur="saveContact($event)" :id="`contactBill_${ind}_${contact.ContactID}_${contact.ABID}`" :class="`contactCheckboxStatus${ind}`"  v-model="contact.LocationBill" :true-value="1">
												  <span class="cr"><i class="cr-icon fa fa-check"></i></span>
												</label>
											</div>
										</td>

										<td class="w-65">
											<input class="form-control input-small bg-yellow" type="text" :name="`Firstname${ind}`" v-on:change="saveContact($event)" :id="`Firstname_${ind}_${contact.ContactID}_${contact.ABID}`" v-model="contact.FirstName"  />
										</td>
										<td class="w-65">
											<input class="form-control input-small bg-yellow" type="text" :name="`Lastname${ind}`" v-on:change="saveContact($event)" :id="`Lastname_${ind}_${contact.ContactID}_${contact.ABID}`" v-model="contact.Lastname" />
										</td>
										<td >
											<input class="form-control input-small bg-yellow" type="text"    placeholder="XXX-XXX-XXXX" :name="`Phone${ind}`" v-on:change="saveContact($event)" :id="`Phone_${ind}_${contact.ContactID}_${contact.ABID}`" v-model="contact.Phone"   />
										</td>
										<td >
											<input class="form-control input-small" type="text" v-model="contact.Cellular"   :name="`Cellular${ind}`" placeholder="XXX-XXX-XXXX"   v-on:change="saveContact($event)" :id="`Cellular_${ind}_${contact.ContactID}_${contact.ABID}`"  />
										</td>
										<td >
											<input class="form-control input-small" :name="`Fax${ind}`" v-on:change="saveContact($event)" :id="`Fax_${ind}_${contact.ContactID}_${contact.ABID}`" v-model="contact.Fax"  type="text"  />
										</td>
										<td >
											<input class="form-control input-small bg-yellow" :name="`Email${ind}`" v-on:change="saveContact($event)" :id="`Email_${ind}_${contact.ContactID}_${contact.ABID}`"  v-model="contact.Email" type="text" />
										</td>
										<td>
											<div class="checkbox">
												<label>
												  <input type="checkbox" :name="`display${ind}`" v-on:change="saveContact($event)" :id="`display_${ind}_${contact.ContactID}_${contact.ABID}`"  v-model="contact.display"/>
												  <span class="cr"><i class="cr-icon fa fa-check"></i></span>
												</label>
											</div>
										</td>
										<td class="w-65">
											{{contact.modified}}
										</td>
										<td class="w-65">
										{{contact.Created}}
										</td>
										<td class="btn-td">
											<!-- <a class="btn btn-primary btn-sm" href="#"><i class="fas fa-share"></i></a> -->
											<a class="btn btn-danger btn-sm" href="#" @click.prevent="deleteContact(contact.ContactID,ind)"><i class="far fa-trash-alt"></i></a>
										</td>
								</tr>

								</tbody>
							</table>
					</div>
    </div>
</template>

<script>
import { saveContact, deleteContact } from '~/api/addressbook';

export default {

  name: 'ContactList',
  props: ['AbContactData'],
  data () {
    return {
		ContactData: _.cloneDeep(this.AbContactData),
    }
  },
  mounted(){
     this.$nextTick(() => {
        this.addRecord();
    });
  },
  methods: {
    addRecord(){
        let addMdl = {
            ABID: 0,
            Cellular: '',
            ContactID: 0,
            Created: '',
            Email: '',
            EmailAllReports: '',
            EmailCOfA: '',
            EmailEU: '',
            EmailIFRA: '',
            EmailInvoice: '',
            EmailOrderConfirmation: '',
            EmailRMCReport: '',
            EmailSDS: '',
            Fax: '',
            FirstName: '',
            LastName: '',
            LocationBill: '',
            LocationID: '',
            LocationSample: '',
            LocationShip1: '',
            LocationShip2: '',
            Phone: '',
            Title: '',
            display: '',
            modified: '',
            pwd: ''
        }

        this.ContactData.push(addMdl);
    },
    saveContact(e){
        let parts  = e.target.id.split('_');
        let name = parts[0];
        let id = parts[1];
        let ContactID = parts[2];
        // let ABID = parts[3];
        let value = e.target.value;

        // console.log(e.target);
        // console.log(parts);
        // return false;
        let ABID = this.$parent.getAbNameData.ABID;
        let data = { ABID: ABID, name: name, id:id, ContactID: ContactID, value: value };

        console.log('data', data);

        saveContact(data, sdata => {
            if (sdata.isNew) {
                alert('New Record is Added');
            }

            Notify.success(sdata.message);
            console.log(sdata);
        }, err => {
            Notify.error(err.message);
            console.log(err);
        });

        // if (this.ContactData.length > parseInt(id)) {
        //     alert(this.ContactData.length);
        // }

        // console.log('ContactData', this.ContactData);



        // console.log('Parts', parts);
        // console.log('Name: ',parts[0]);
        // console.log('Id', parts[1]);
    },
    deleteContact(id,ind){
        let self = this;
        Notify.confirm().then(() => {
            deleteContact(id, sdata => {
                self.ContactData.splice(self.ContactData.indexOf(ind), 1);
                Notify.success('Deleted successfully.');
            },err =>{
                Notify.error(err.message);
            });
        });
    }
  }
}
</script>

<style lang="css" scoped>
</style>
