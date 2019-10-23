<template>
    <div class="borderdBox">
        <div class="row">
            <div class="col-md-10">
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group d-flex">
                            <label>Name:</label>
                            <input type="text" name="ADDRESSBOOK_NAME" id="ADDRESSBOOK_NAME" class="form-control input-small bg-yellow"  @change="updAddrBook($event)" v-model="AbNameData.Name">
                        </div>

                        <div class="form-group d-flex">
                            <label>Account Holder:</label>
                            <select class="form-control input-small" name="ADDRESSBOOK_AccountHolder" id="ADDRESSBOOK_AccountHolder" @change="updAddrBook($event)" v-model="AbNameData.AccountHolder">
                                    <option value=""></option>
                                    <option  @change="updAddrBook($event)" v-model="AbNameData.AccountHolder">{{ AbNameData.AccountHolder }}</option>
                            </select>
                        </div>
                        <div class="form-group d-flex">
                            <label>Customer Rating:</label>
                             <select class="form-control bg-yellow input-small"name="ADDRESSBOOK_CustomerRating" id="ADDRESSBOOK_CustomerRating" @change="updAddrBook($event)" v-model="AbNameData.CustomerRating">
                                <option value="A Customer">A Customer</option>
                                <option value="B Customer">B Customer</option>
                                <option value="C Customer">C Customer</option>
                                <option value="D Customer">D Customer</option>
                            </select>
                        </div>

                        <div class="form-group d-flex">
                            <label>Category:</label>
                            <select class="form-control bg-yellow input-small"  name="ADDRESSBOOK_CategoryID" id="ADDRESSBOOK_CategoryID" @change="updAddrBook($event)" v-model="AbNameData.CategoryID">
                                <option></option>
                                <option v-for="(cat, ind) in AllAbNameCategory" @change="updAddrBook($event)" v-model="cat.CategoryID"> {{ cat.Name }}</option>
                            </select>
                        </div>

                        <div class="form-group d-flex">
                            <label>Customer Industry:</label>
                            <!-- <select class="form-control input-small">
                                <option >{{ AbNameData.AccountHolder }}</option>
                            </select> -->

                            <select class="form-control bg-yellow input-small" name="ADDRESSBOOK_CustomerIndustry" id="ADDRESSBOOK_CustomerIndustry" @change="updAddrBook($event)" v-model="AbNameData.CustomerIndustry">
                                <option value=""></option>
                                <option value="Candle">Candle</option>
                                <option value="Other">Other</option>
                                <option value="Filler">Filler</option>
                                <option value="I&I">I&I</option>
                                <option value="Vendor">Vendor</option>
                                <option value="Soap">Soap</option>
                                <option value="Personal Care">Personal Care</option>
                                <option value="Body Oils">Body Oils</option>
                                <option value="Body Oil">Body Oil</option>
                                <option value="INI">INI</option>
                                <option value="Misc">Misc</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="d-flex inline-form flex-auto">
                            <div class="form-group">
                                <label>Sales Comments:</label>
                                <textarea name="ADDRESSBOOK_Comments" id="ADDRESSBOOK_Comments" class="form-control input-small"  @change="updAddrBook($event)" v-model="AbNameData.Comments"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Warehouse Comments:</label>
                                <textarea name="ADDRESSBOOK_WHComments" id="ADDRESSBOOK_WHComments" class="form-control input-small" @change="updAddrBook($event)" v-model="AbNameData.WHComments"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Lab Comments:</label>
                                <textarea name="ADDRESSBOOK_LABComments" id="ADDRESSBOOK_LABComments" class="form-control input-small" @change="updAddrBook($event)" v-model="AbNameData.LABComments"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="d-flex inline-form flex-wrap my-4">
                    <div class="form-group">
                        <label>Credit Limit</label>
                        <span>$</span><input class="form-control input-small" type="number" id="CreditLimit" name="CreditLimit" @change="updAddrBook($event)" v-model="AbNameData.CreditLimit">
                    </div>

                    <div class="form-group">
                        <label>Discount %</label>
                        <input class="form-control input-small" type="text" name="DiscountPercentage" id="DiscountPercentage" @change="updAddrBook($event)" v-model="AbNameData.DiscountPercentage">
                    </div>

                    <div class="form-group">
                        <label>Sales Rep.</label>
                        <select class="form-control bg-yellow input-small" id="salesRep" name="salesRep" @change="updAddrBook($event)" v-model="AbNameData.salesRep">
                            <option v-for="(usr, ind) in AllDbUser" @change="updAddrBook($event)" v-model="usr.Name">{{ usr.Name }}</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>CommercialTerms</label>
                            <select class="form-control bg-yellow input-small" id="commercialTerms" name="commercialTerms"  @change="updAddrBook($event)" v-model="AbNameData.CustomerCommercialTerms">
                                <option v-for="(cct, ind) in AllShippingTerm" @change="updAddrBook($event)" v-model="cct.ShippingTermsName">{{ cct.ShippingTermsName }}</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Customer Collect</label>
                            <input class="form-control input-small" type="text" @change="updAddrBook($event)" v-model="AbNameData.CustomerCollectNum">
                    </div>
                    <div class="form-group">
                        <label>FOB</label>
                        <select class="form-control bg-yellow input-small" id="customerFOB" name="customerFOB" @change="updAddrBook($event)" v-model="AbNameData.CustomerFOB">
                            <option value="COLLECT">COLLECT</option>
                            <option value="PREPAID">PREPAID</option>
                            <option value="PREPAY&ADD">PREPAY&ADD</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Ship Via</label>
                        <select class="form-control bg-yellow input-small" id="shipVia" name="shipVia" @change="updAddrBook($event)" v-model="AbNameData.ShipVia">
                            <option v-for="(ship, ind) in AllShippingInfo" :key="ind" @change="updAddrBook($event)" v-model="ship.ShippingCode">{{ ship.ShippingCode }}</option>
                            <!-- Disable Selected -->
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Created</label>
                        <input class="form-control input-small datepicker" type="text" name="createdDate" id="createdDate" @change="updAddrBook($event)" v-model="AbNameData.CreatedDate">
                    </div>
                    <div class="form-group">
                        <label>Modified</label>
                        <!-- <input class="datepicker" data-date-format="mm/dd/yyyy "  onclick="pickDateTime(this.id)" id="LastModifiedDate" type="text"class="form-control input-small "> -->
                        <input id="modifyDate" class="form-control input-small datepicker"  @change="updAddrBook($event)" v-model="AbNameData.LastModifiedDate">
                    </div>
                </div>
            </div>
            <div class="col-md-2 space-sm">
                <div class="form-group">
                    <label>Tax ID:</label>
                    <input type="text" name="tax_id" id="tax_id" class="form-control input-small"  @change="updAddrBook($event)" v-model="AbNameData.TAXID">
                </div>
                <div class="form-group">
                    <label>DEA:</label>
                    <input type="text" name="DEA" id="DEA" class="form-control input-small"  @change="updAddrBook($event)" v-model="AbNameData.DEA">
                </div>
                <div class="form-group">
                    <button type="button" class="btn btn-primary btn_small" data-toggle="modal" data-target="#uploadLogo">Add Logo</button>
                </div>
                <div class="logo-thumb">
                        <!-- <img src="" alt=""> -->
                </div>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-md-12">
                <div class="d-flex inline-form ">
                    <div class="control-group">
                        <div class="checkbox">
                            <label>
                              <input type="checkbox" :true-value="1" v-model="AbNameData.Display" name="ADDRESSBOOK_Display" id="ADDRESSBOOK_Display">
                              <span class="cr"><i class="cr-icon fa fa-check"></i></span>
                              <span>Active</span>
                            </label>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="checkbox">
                            <label>
                             <input type="checkbox" :true-value="1" v-model="AbNameData.NewCustomer" name="ADDRESSBOOK_NewCustomer" id="ADDRESSBOOK_NewCustomer">
                              <span class="cr"><i class="cr-icon fa fa-check"></i></span>
                              <span>New Customer</span>
                            </label>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="checkbox">
                            <label>
                              <input type="checkbox" :true-value="1" v-model="AbNameData.Verified" name="ADDRESSBOOK_Verified" id="ADDRESSBOOK_Verified">
                              <span class="cr"><i class="cr-icon fa fa-check"></i></span>
                              <span>Verified</span>
                            </label>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="checkbox">
                            <label>
                              <input type="checkbox" :true-value="1" v-model="AbNameData.BlankLabels" name="ADDRESSBOOK_BlankLabels" id="ADDRESSBOOK_BlankLabels">
                              <span class="cr"><i class="cr-icon fa fa-check"></i></span>
                              <span>BlankLabels</span>
                            </label>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="checkbox">
                            <label>
                               <input type="checkbox" :true-value="1" v-model="AbNameData.LoGoLabels" name="ADDRESSBOOK_LoGoLabels" id="ADDRESSBOOK_LoGoLabels">
                              <span class="cr"><i class="cr-icon fa fa-check"></i></span>
                              <span>LoGoLabels</span>
                            </label>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="checkbox">
                            <label>
                               <input type="checkbox" :true-value="1" v-model="AbNameData.IncludeSDS" name="ADDRESSBOOK_IncludeSDS" id="ADDRESSBOOK_IncludeSDS">
                              <span class="cr"><i class="cr-icon fa fa-check"></i></span>
                              <span>IncludeSDS</span>
                            </label>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="checkbox">
                            <label>
                               <input type="checkbox" :true-value="1" v-model="AbNameData.IncludeIFRA" name="ADDRESSBOOK_IncludeIFRA" id="ADDRESSBOOK_IncludeIFRA">
                              <span class="cr"><i class="cr-icon fa fa-check"></i></span>
                              <span>IncludeIFRA</span>
                            </label>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="checkbox">
                            <label>
                               <input type="checkbox" :true-value="1" v-model="AbNameData.IncludeEU" name="ADDRESSBOOK_IncludeEU" id="ADDRESSBOOK_IncludeEU">
                              <span class="cr"><i class="cr-icon fa fa-check"></i></span>
                              <span>IncludeEU</span>
                            </label>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="checkbox">
                            <label>
                              <input type="checkbox" :true-value="1" v-model="AbNameData.IncludeCofA" name="ADDRESSBOOK_IncludeCofA" id="ADDRESSBOOK_IncludeCofA">
                              <span class="cr"><i class="cr-icon fa fa-check"></i></span>
                              <span>IncludeCofA</span>
                            </label>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="checkbox">
                            <label>
                              <input type="checkbox" :true-value="1" v-model="AbNameData.CreditHold" name="ADDRESSBOOK_CreditHold" id="ADDRESSBOOK_CreditHold">
                              <span class="cr"><i class="cr-icon fa fa-check"></i></span>
                              <span>Credit Hold</span>
                            </label>
                        </div>
                    </div>
                    <div class="control-group">
                        <button type="button" class="btn btn-primary btn_small">Hold/Release</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>

// import { mapState } from 'vuex';
import { mapGetters } from 'vuex';



export default {

  name: 'AbNameAddressbook',
  props: ['gAbNameData'],
  data () {
    return {
        AbNameData: _.cloneDeep(this.gAbNameData),
    }
  },
  computed: {
     // use mapGetters if you have same
    ...mapGetters({
        AllShippingInfo : 'addressbook/getallshippinginfo',
        AllShippingTerm: 'addressbook/getallshippingterm',
        AllAbNameCategory: 'addressbook/getallabnamecategory',
        AllDbUser: 'addressbook/getalldbuser'
    })
  },
  created(){
    console.log('component created');
  },
  mounted(){
     console.log('Component Mounted');
  },
  methods:{
    updAddrBook(e){
        let id = e.target.id;
        let name = e.target.name;
        let val = e.target.value;

        console.log(e);
    }
  }
}
</script>

<style lang="css" scoped>
</style>
