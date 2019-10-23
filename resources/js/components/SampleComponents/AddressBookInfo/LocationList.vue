<template>
    <div>
        <div class="title-row d-flex align-items-center my-3">
        <h2>Location List:</h2>
        <button type="button" class="btn btn-primary btn_small ml-auto" @click="AddLocation">Add New Location</button>
    </div>
    <div class="cusTable table-responsive tabl-sm">
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>Sample</th>
                    <th>Ship1</th>
                    <th>Ship2</th>
                    <th>Bill</th>
                    <th>Ship To Company</th>
                    <th>Location id</th>
                    <th>Address</th>
                    <th>City</th>
                    <th>State</th>
                    <th>Zip</th>
                    <th>Country</th>
                    <th>Phone</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                    <tr v-for="(loc, ind) in AbLocationData" :class="`loc_${ind}`">
                        <td>
                            <div class="checkbox">
                                <label>
                                  <input type="checkbox" :name="`sample${ind}}`" id="`sample${ind}}`" class="`sample${ind}}`" v-model="loc.LocationSample" :true-value="1">
                                  <span class="cr"><i class="cr-icon fa fa-check"></i></span>
                                </label>
                            </div>
                        </td>
                        <td>
                            <div class="checkbox">
                                <label>
                                  <input type="checkbox" :name="`LocationShip1${ind}}`" id="`LocationShip1${ind}}`" class="`LocationShip1${ind}}`" v-model="loc.LocationShip1" :true-value="1">
                                  <span class="cr"><i class="cr-icon fa fa-check"></i></span>
                                </label>
                            </div>
                        </td>
                        <td>
                            <div class="checkbox">
                                <label>
                                  <input type="checkbox" :name="`LocationShip2${ind}}`" id="`LocationShip2${ind}}`" class="`LocationShip2${ind}}`" v-model="loc.LocationShip2" :true-value="1">

                                  <span class="cr"><i class="cr-icon fa fa-check"></i></span>
                                </label>
                            </div>
                        </td>
                        <td>
                            <div class="checkbox">
                                <label>
                                 <input type="checkbox" :name="`LocationBill${ind}}`" id="`LocationBill${ind}}`" class="`LocationBill${ind}}`" v-model="loc.LocationBill" :true-value="1">
                                  <span class="cr"><i class="cr-icon fa fa-check"></i></span>
                                </label>
                            </div>
                        </td>
                        <td>
                            <input class="form-control input-small bg-yellow" type="text" :id="`ShipToCompanyName${ind}`" :name="`ShipToCompanyName${ind}`" :value="loc.ShipToCompanyName"/>
                        </td>
                        <td>
                            <input class="form-control input-small bg-yellow" type="text" :id="`LocationName${ind}`" :name="`LocationName${ind}`" :value="`LocationName${ind}`" />
                        </td>

                        <td>
                            <input class="form-control input-small bg-yellow" type="text" :id="`Address${ind}`" :name="`Address${ind}`" :value="loc.Address"/>
                        </td>

                        <td class="w-80">
                            <input class="form-control input-small bg-yellow" type="text" :id="`City${ind}`" :name="`City${ind}`" :value="loc.City" />
                        </td>

                        <td class="w-65">
                            <input class="form-control input-small bg-yellow" type="text" id="`State${ind}`" :name="`State${ind}`" :value="loc.State" />
                        </td>
                        <td class="w-65">
                            <input class="form-control input-small bg-yellow" type="text" id="`Zip${ind}`" :name="`Zip${ind}`" :value="loc.Zip" />
                        </td>
                        <td class="w-65">
                        <input class="form-control input-small bg-yellow" type="text" id="`Country${ind}`" :name="`Country${ind}`" :value="loc.Country" />
                        </td>
                        <td>
                            <input class="form-control input-small bg-yellow" type="text" id="`Phone${ind}`" :name="`Phone${ind}`" :value="loc.Phone" />
                        </td>
                        <td class="btn-td">
                            <a class="btn btn-primary btn-sm" href="#"><i class="fas fa-share"></i></a>
                            <a class="btn btn-danger btn-sm"><i class="far fa-trash-alt"></i></a>
                        </td>
                    </tr>
            </tbody>
        </table>
    </div>
    </div>
</template>

<script>
export default {

  name: 'LocationList',
  props: ['AbLocationData'],
  data () {
    return {

    }
  },
  methods:{
    AddLocation(){
        // alert('Click');
        let ABDATA = this.$parent.getAbNameData;
        EventBus.$emit('SHOW_CONTACT_MODAL', {ABID: ABDATA.ABID, Name: ABDATA.Name});
        // this.$emit();
    }
  },
  created(){
    EventBus.$on('ADD_LOCATION', data => {
        this.AbLocationData.push(data);
    });
  },
  destroyed(){
    EventBus.$off('ADD_LOCATION');
  }
}
</script>

<style lang="css" scoped>
</style>
