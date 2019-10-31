<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-10">
                <p>Update Record</p>
                <form @submit.prevent="onSubmit">
                    <div class="form-group">
                        <label for="email" class="control-label">Email:</label>
                        <input type="text" name="email" class="form-control form-control-lg" :class="{'is-invalid': errors.has('email') }" v-model="model.email" v-validate="'required|email'">
                        <span class="help text-danger" v-if="errors.has('email')">{{ errors.first('email') }}</span>
                    </div>
                    <div class="form-group">
                        <label for="password" class="control-label">Password:</label>
                        <input type="password" name="password" id="password" class="form-control form-control-lg" v-validate="'required|min:3'" v-model="model.password" :class="{'is-invalid': errors.has('password') }">
                        <span class="help text-danger" v-if="errors.has('password')">{{ errors.first('password') }}</span>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="first_name">First Name</label>
                            <input type="text" class="form-control form-control-lg" data-vv-as="First Name" name="first_name" id="first_name" placeholder="First Name" v-model="model.first_name" :class="{'is-invalid': errors.has('first_name') }" v-validate="'required'">
                            <span class="help text-danger" v-if="errors.has('first_name')">{{ errors.first('first_name') }}</span>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="last_name">last Name</label>
                            <input type="text" class="form-control form-control-lg" data-vv-as="Last Name" name="last_name" id="last_name" placeholder="Last Name" v-model="model.last_name" :class="{'is-invalid': errors.has('last_name') }" v-validate="'required'">
                            <span class="help text-danger" v-if="errors.has('last_name')">{{ errors.first('last_name') }}</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="address">Address</label>
                        <input type="text" class="form-control form-control-lg" id="address" name="address" placeholder="1234 Main St" v-model="model.address" :class="{ 'is-invalid': errors.has('address') }" v-validate="'required'">
                        <span class="help text-danger" v-if="errors.has('address')">{{ errors.first('address') }}</span>
                    </div>
                    <div class="form-group">
                        <label for="address2">Address 2</label>
                        <input type="text" class="form-control form-control-lg" name="address2" id="address2" placeholder="" v-model="model.address2" :class="{ 'is-invalid': errors.has('address2') }">
                        <span class="help text-danger" v-if="errors.has('address2')">{{ errors.first('address2') }}</span>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="city">City</label>
                            <input type="text" class="form-control form-control-lg" id="city" name="city" v-model="model.city" :class="{ 'is-invalid': errors.has('city') }" v-validate="'required'">
                            <span class="help text-danger" v-if="errors.has('city')">{{ errors.first('city') }}</span>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="state">State</label>
                            <select id="state" class="form-control form-control-lg" name="state" v-model="model.state" :class="{ 'is-invalid': errors.has('state') }" v-validate="'required'">
                                <option v-for="(st,ind) in states" :key="st.value" :value="st.value">{{ st.name }}</option>
                            </select>
                            <span class="help text-danger" v-if="errors.has('state')">{{ errors.first('state') }}</span>
                        </div>
                        <div class="form-group col-md-2">
                            <label for="zip">Zip</label>
                            <input type="text" class="form-control form-control-lg" id="zip" name="zip" v-model="model.zip" :class="{ 'is-invalid': errors.has('zip') }" v-validate="'required'">
                            <span class="help text-danger" v-if="errors.has('zip')">{{ errors.first('zip') }}</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <!-- <label for="chk"></label> -->
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" name="offers" id="offers" v-model="model.offers" :true-value="1">
                            <label class="custom-control-label" for="offers">Send Me offers</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="gender">Gender</label>
                        <div class="custom-control custom-radio">
                            <input type="radio" id="male" name="gender" class="custom-control-input" :value="'male'" v-model="model.gender" v-validate="'required'">
                            <label class="custom-control-label" for="male">Male</label>
                        </div>
                        <div class="custom-control custom-radio">
                            <input type="radio" id="female" name="gender" class="custom-control-input" v-model="model.gender" v-validate="'required'" :value="'female'">
                            <label class="custom-control-label" for="female">Female</label>
                        </div>
                        <span class="help text-danger" v-if="errors.has('gender')">{{ errors.first('gender') }}</span>
                    </div>
                    <!-- <div class="form-group">
                        <label for="image">Profile Image</label>
                        <div class="custom-file">
                            <input type="file" class="custom-file-input form-control form-control-lg" id="" v-validate="'required|mimes:image/*'" name="image" data-vv-name="image" data-vv-as="image" @change="readFile($event)" :class="{ 'is-invalid': errors.has('image') }">
                            <label class="custom-file-label" for="image">Choose file...</label>
                            <span class="help text-danger" v-if="errors.has('image')">{{ errors.first('image') }}</span>
                        </div>
                    </div> -->

                     <div class="image-preview" v-if="model.image!=''">
                        <img :src="model.image" alt="prfileimage" class="img-thumbnail" height="200px" width="200px">
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlFile1">Profile Image</label>
                        <input type="file" class="form-control-file form-control form-control-lg" v-validate="'required|mimes:image/*'" name="image" data-vv-name="image" data-vv-as="image" @change="readFile($event)" :class="{ 'is-invalid': errors.has('image') }">
                        <span class="help text-danger" v-if="errors.has('image')">{{ errors.first('image') }}</span>
                    </div>


                    <div class="form-group">
                        <label for="about">Example textarea</label>
                        <textarea class="form-control form-control-lg" id="about" name="about" rows="4" v-model="model.about" :class="{ 'is-invalid': errors.has('about') }" v-validate="'required|min:100'"></textarea>
                        <span class="help text-danger" v-if="errors.has('about')">{{ errors.first('about') }}</span>
                    </div>
                    <div class="form-group">
                        <v-button :loading="busy">
                            Submit
                        </v-button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</template>
<script>
import User from '~/api/user';
import Vue from 'vue';
import VeeValidate from 'vee-validate';
// Vue.use(VeeValidate);

Vue.use(VeeValidate, { fieldsBagName: 'formFields' });

export default {

    name: 'Add',

    data() {
        return {
            busy: false,
            states: [
                { name: 'Choose...', value: '' },
                { name: 'Los Angles', value: 'LA' },
                { name: 'New Yark', value: 'NY' },
                { name: 'Paris', value: 'PA' },
            ],
            model: {
                image: '',
            },
            bimage: '',
        }
    },
    mounted() {
        console.log(this.$route);
        this.getStudent();
        // User.all(data => {
        //     console.log(data);
        // }, err =>{
        //     console.log(err);
        // });

    },
    methods: {
        readFile(e) {
            let files = e.target.files || e.dataTransfer.files;
            if (!files.length)
                return;
            this.createImage(files[0]);
            this.bimage = files[0];
        },
        createImage(file) {
            let reader = new FileReader();
            let vm = this;
            reader.onload = (e) => {
                vm.model.image = e.target.result;
            };
            reader.readAsDataURL(file);
        },

        onSubmit() {
            let self = this;
            self.$validator.validateAll().then(result => {
                if (result) {
                    self.busy = true;
                    console.log(self.model);
                    User.save(self.model, data => {
                        self.busy = false;
                        self.$router.push({ name: 'index' });
                        Notify.success('Oh No Scuuess ...');
                    }, err => {
                        self.busy = false;
                        console.log(err);
                        this.$setErrorsFromResponse(err);
                    });
                }
            });
        },
        getStudent(){
            User.getSingle(this.$route.params.id, resp => {
                this.model = resp;
            }, err =>{
                Notify.error('Something went wrong.');
                this.$router.push({path: '/index'});
            });
        }
    }
}

</script>
<style lang="css" scoped>
</style>
