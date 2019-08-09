<template>
        <div>
        <section class="pagination-row ">
				<div class="container">
						<div class="d-flex">
							<div class="sales-taps dashboard-nav mr-auto">
								<ul class='tabs-model d-flex list-unstyled flex-wrap'>
									<li ><a href="" class="btn btn-primary btn-sm" >New</a></li>
									<li><a href="" class="btn btn-primary btn-sm" >Admin - Merge</a></li>
									
									<li><a :href="Full_url +'/contactHistory'"  class="btn btn-primary btn-sm">Contact Report</a></li>
									<li><a href="" class="btn btn-primary btn-sm">Address Book</a></li>
								</ul>
							</div>
						
					</div>
					</div>
			</section>

            <section class="tableContent">
				<div class="container">
					<div class="cusTable table-responsive">
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th scope="col">Company Name</th>
									<th scope="col"></th>
									<th scope="col"></th>
									<th scope="col"></th>
									<th scope="col">Address</th>
									<th scope="col">City</th>
									<th scope="col"></th>
									<th scope="col"></th>
									<th scope="col"></th>
									<th scope="col"></th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
                                <tr v-for="user in records.data">
                                    <td scope="row">{{ user.NAME }}</td>
									<td scope="row">{{ user.LocationName }}</td>
									<td scope="row">{{ user.FirstName }}</td>
									<td scope="row">{{ user.LastName }}</td>
									<td scope="row">{{ user.Address }}</td>
									<td scope="row">{{ user.City }}</td>
									<td scope="row">{{ user.State }}</td>
									<td scope="row">{{ user.Zip }}</td>
									<td scope="row">
                                        <select id="customerRating" name="customerRating" v-model="user.CustomerRating" @change="updateAddress($event,user.ABID)">
                                        <option id="a_customer"    value="A Customer">A Customer</option>
                                        <option id="b_customer"   value="B Customer">B Customer</option>
                                        <option id="c_customer"    value="C Customer">C Customer</option>
                                        <option id="d_customer"   value="D Customer">D Customer</option>
                                        </select>
                                    </td>
            
                                <td scope="row">
                                <!-- {{user.CustomerIndustry}} -->
                                    <select id="customerIndustry" name="customerIndustry" v-model="user.CustomerIndustry" @change="updateAddress($event,user.ABID)">
                                        <option  value="Candle">Candle</option>
                                        <option  value="Other">Other</option>
                                        <option  value="Filler">Filler</option>
                                        <option  value="I&I">I&I</option>
                                        <option  value="Vendor">Vendor</option>
                                        <option  value="Soap">Soap</option>
                                        <option  value="Personal Care">Personal Care</option>
                                        <option  value="Body Oils">Body Oils</option>
                                        <option  value="Body Oil">Body Oil</option>
                                        <option  value="INI">INI</option>
                                        <option  value="Misc">Misc</option>
                                    </select>
                                </td>
                                <td scope="row"><a class="btn btn-small" :href="Full_url +'/AddressBook/addressBookInfo/addressBook/'+user.ABID" >+</a></td>
                                </tr>
                            </tbody>
						</table>
					</div>
				</div>
			</section>

        </div>
</template>

<script>
  
import VueRouter from 'vue-router';

let U = window.location.href.split('/');
let base = '/'+U[3]+'/'+U[4]+'/'+U[5]+'/'+U[6];

export default {
  name: 'AddressBook',
  props: ['records'],
  data () {
    return {
       
    }
  },

  computed: {
    Full_url: function () {
      return Full_url;

    }
  },

    router: new VueRouter({
        mode: 'history',
        base: base,
        routes: [
            // {
            //     path: '/index',
            //     name: 'index',
            //     component:Details
            // },
            // {
            //     path: '/',
            //     redirect: {name: 'index'}
            // },
            // {
            //     path: '/test',
            //     name: 'test',
            //     component: TestComponent
            // },
            // {
            //     path: '/add-item',
            //     name: 'add-item',
            //     component: MenuItem
            // },
            // {
            //     path: '/edit-item/:id',
            //     name: 'edit-item',
            //     component: MenuItem,
            //     props: true
            // },
            // {
            //     path: '*',
            //     redirect: '/'
            // }
        ]
    }),
  created(){

  },
  mounted(){
    // console.log('Hello Web');
    // axios.get(API_URL+'user').then(resp => {
    //     console.log(resp);
    // }).catch(err =>{
    //     console.log(err.response);
    // });
  },
  methods:{


    // updateAddress: function(e) {
    //     console.log(e.target.value);
    //     console.log(e.target.name);

    // },

    updateAddress(e,ABID)
    {
        var updateData={value:e.target.value,fieldName:e.target.name,id:ABID};
        console.log(updateData);

    }
   
  }
}
</script>

<style lang="css" scoped>
</style>
