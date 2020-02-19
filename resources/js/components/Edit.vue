<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-10">
                <p>Update Record</p>
                <form @submit.prevent="onSubmit">
                    <div class="form-group">
                        <label for="email" class="control-label">Email:</label>
                        <input
                            v-model="model.email"
                            v-validate="'required|email'"
                            type="text"
                            name="email"
                            class="form-control form-control-lg"
                            :class="{ 'is-invalid': errors.has('email') }"
                        />
                        <span
                            v-if="errors.has('email')"
                            class="help text-danger"
                        >
                            {{ errors.first('email') }}
                        </span>
                    </div>
                    <div class="form-group">
                        <label for="password" class="control-label">
                            Password:
                        </label>
                        <input
                            id="password"
                            v-model="model.password"
                            v-validate="'required|min:3'"
                            type="password"
                            name="password"
                            class="form-control form-control-lg"
                            :class="{ 'is-invalid': errors.has('password') }"
                        />
                        <span
                            v-if="errors.has('password')"
                            class="help text-danger"
                        >
                            {{ errors.first('password') }}
                        </span>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="first_name">First Name</label>
                            <input
                                id="first_name"
                                v-model="model.first_name"
                                v-validate="'required'"
                                type="text"
                                class="form-control form-control-lg"
                                data-vv-as="First Name"
                                name="first_name"
                                placeholder="First Name"
                                :class="{
                                    'is-invalid': errors.has('first_name'),
                                }"
                            />
                            <span
                                v-if="errors.has('first_name')"
                                class="help text-danger"
                            >
                                {{ errors.first('first_name') }}
                            </span>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="last_name">last Name</label>
                            <input
                                id="last_name"
                                v-model="model.last_name"
                                v-validate="'required'"
                                type="text"
                                class="form-control form-control-lg"
                                data-vv-as="Last Name"
                                name="last_name"
                                placeholder="Last Name"
                                :class="{
                                    'is-invalid': errors.has('last_name'),
                                }"
                            />
                            <span
                                v-if="errors.has('last_name')"
                                class="help text-danger"
                            >
                                {{ errors.first('last_name') }}
                            </span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="address">Address</label>
                        <input
                            id="address"
                            v-model="model.address"
                            v-validate="'required'"
                            type="text"
                            class="form-control form-control-lg"
                            name="address"
                            placeholder="1234 Main St"
                            :class="{ 'is-invalid': errors.has('address') }"
                        />
                        <span
                            v-if="errors.has('address')"
                            class="help text-danger"
                        >
                            {{ errors.first('address') }}
                        </span>
                    </div>
                    <div class="form-group">
                        <label for="address2">Address 2</label>
                        <input
                            id="address2"
                            v-model="model.address2"
                            type="text"
                            class="form-control form-control-lg"
                            name="address2"
                            placeholder=""
                            :class="{ 'is-invalid': errors.has('address2') }"
                        />
                        <span
                            v-if="errors.has('address2')"
                            class="help text-danger"
                        >
                            {{ errors.first('address2') }}
                        </span>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="city">City</label>
                            <input
                                id="city"
                                v-model="model.city"
                                v-validate="'required'"
                                type="text"
                                class="form-control form-control-lg"
                                name="city"
                                :class="{ 'is-invalid': errors.has('city') }"
                            />
                            <span
                                v-if="errors.has('city')"
                                class="help text-danger"
                            >
                                {{ errors.first('city') }}
                            </span>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="state">State</label>
                            <select
                                id="state"
                                v-model="model.state"
                                v-validate="'required'"
                                class="form-control form-control-lg"
                                name="state"
                                :class="{ 'is-invalid': errors.has('state') }"
                            >
                                <option
                                    v-for="st in states"
                                    :key="st.value"
                                    :value="st.value"
                                >
                                    {{ st.name }}
                                </option>
                            </select>
                            <span
                                v-if="errors.has('state')"
                                class="help text-danger"
                            >
                                {{ errors.first('state') }}
                            </span>
                        </div>
                        <div class="form-group col-md-2">
                            <label for="zip">Zip</label>
                            <input
                                id="zip"
                                v-model="model.zip"
                                v-validate="'required'"
                                type="text"
                                class="form-control form-control-lg"
                                name="zip"
                                :class="{ 'is-invalid': errors.has('zip') }"
                            />
                            <span
                                v-if="errors.has('zip')"
                                class="help text-danger"
                            >
                                {{ errors.first('zip') }}
                            </span>
                        </div>
                    </div>
                    <div class="form-group">
                        <!-- <label for="chk"></label> -->
                        <div class="custom-control custom-checkbox">
                            <input
                                id="offers"
                                v-model="model.offers"
                                type="checkbox"
                                class="custom-control-input"
                                name="offers"
                                :true-value="1"
                            />
                            <label class="custom-control-label" for="offers">
                                Send Me offers
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="gender">Gender</label>
                        <div class="custom-control custom-radio">
                            <input
                                id="male"
                                v-model="model.gender"
                                v-validate="'required'"
                                type="radio"
                                name="gender"
                                class="custom-control-input"
                                :value="'male'"
                            />
                            <label class="custom-control-label" for="male">
                                Male
                            </label>
                        </div>
                        <div class="custom-control custom-radio">
                            <input
                                id="female"
                                v-model="model.gender"
                                v-validate="'required'"
                                type="radio"
                                name="gender"
                                class="custom-control-input"
                                :value="'female'"
                            />
                            <label class="custom-control-label" for="female">
                                Female
                            </label>
                        </div>
                        <span
                            v-if="errors.has('gender')"
                            class="help text-danger"
                        >
                            {{ errors.first('gender') }}
                        </span>
                    </div>
                    <!-- <div class="form-group">
                        <label for="image">Profile Image</label>
                        <div class="custom-file">
                            <input type="file" class="custom-file-input form-control form-control-lg" id="" v-validate="'required|mimes:image/*'" name="image" data-vv-name="image" data-vv-as="image" @change="readFile($event)" :class="{ 'is-invalid': errors.has('image') }">
                            <label class="custom-file-label" for="image">Choose file...</label>
                            <span class="help text-danger" v-if="errors.has('image')">{{ errors.first('image') }}</span>
                        </div>
                    </div> -->

                    <div v-if="model.image_link != ''" class="image-preview">
                        <img
                            :src="model.image_link"
                            alt="prfileimage"
                            class="img-thumbnail"
                            height="200px"
                            width="200px"
                        />
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlFile1">
                            Profile Image
                        </label>
                        <input
                            v-validate="'mimes:image/*'"
                            type="file"
                            class="form-control-file form-control form-control-lg"
                            name="image"
                            data-vv-name="image"
                            data-vv-as="image"
                            :class="{ 'is-invalid': errors.has('image') }"
                            @change="readFile($event)"
                        />
                        <span
                            v-if="errors.has('image')"
                            class="help text-danger"
                        >
                            {{ errors.first('image') }}
                        </span>
                    </div>

                    <div class="form-group">
                        <label for="about">Example textarea</label>
                        <textarea
                            id="about"
                            v-model="model.about"
                            v-validate="'required|min:100'"
                            class="form-control form-control-lg"
                            name="about"
                            rows="4"
                            :class="{ 'is-invalid': errors.has('about') }"
                        />
                        <span
                            v-if="errors.has('about')"
                            class="help text-danger"
                        >
                            {{ errors.first('about') }}
                        </span>
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
    import Student from '~/api/student'
    import Vue from 'vue'
    import VeeValidate from 'vee-validate'
    // Vue.use(VeeValidate);

    Vue.use(VeeValidate, { fieldsBagName: 'formFields' })

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
            console.log(this.$route)
            this.getStudent()
            // Student.allStudent(data => {
            //     console.log(data);
            // }, err =>{
            //     console.log(err);
            // });
        },
        methods: {
            readFile(e) {
                const files = e.target.files || e.dataTransfer.files
                if (!files.length) return
                this.createImage(files[0])
                this.bimage = files[0]
            },
            createImage(file) {
                const reader = new FileReader()
                const vm = this
                reader.onload = e => {
                    vm.model.image = e.target.result
                    vm.model.image_link = e.target.result
                }
                reader.readAsDataURL(file)
            },

            onSubmit() {
                const id = this.$route.params.id
                const self = this
                self.$validator.validateAll().then(result => {
                    if (result) {
                        self.busy = true
                        console.log(self.model)
                        Student.update(
                            id,
                            self.model,
                            data => {
                                self.busy = false
                                self.$router.push({ name: 'index' })
                                Notify.success('Scuuess ...')
                            },
                            err => {
                                self.busy = false
                                console.log(err)
                                this.$setErrorsFromResponse(err)
                            }
                        )
                    }
                })
            },
            getStudent() {
                Student.getSingle(
                    this.$route.params.id,
                    resp => {
                        this.model = resp
                    },
                    err => {
                        Notify.error('Something went wrong.')
                        this.$router.push({ path: '/index' })
                    }
                )
            },
        },
    }
</script>
<style lang="css" scoped></style>
