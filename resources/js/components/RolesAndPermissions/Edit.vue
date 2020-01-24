<template>
    <div class="container">
        <div class="row justify-content-start">
            <div class="col-6 pl-0">
                <p>Update Record</p>
                <form @submit.prevent="onSubmit">
                   <div class="form-group">
                        <label for="name" class="control-label">Role Name:</label>
                        <input type="text" name="name" class="form-control form-control-lg" :class="{ 'is-invalid': errors.has('name') }" v-model="model.name" v-validate="'required'"  data-vv-as="Role name" placeholder="Role Name.." />
                        <span class="help text-danger" v-if="errors.has('name')">{{ errors.first('name') }}</span>
                    </div>
                    <div class="form-group">
                        <label for="rolename" class="control-label">Role Display Name:</label>
                        <input type="text" name="rolename" id="rolename" class="form-control form-control-lg" v-validate="'required|min:3'" data-vv-as="Role display name" v-model="model.rolename" :class="{ 'is-invalid': errors.has('rolename') }" placeholder="Role Display Nam.." />
                        <span class="help text-danger" v-if="errors.has('rolename')">{{ errors.first('rolename') }}</span>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label for="roledescription">Role Description</label>
                            <input type="text" class="form-control form-control-lg" data-vv-as="Description" name="roledescription" id="roledescription" placeholder="Short description.." v-model="model.roledescription" :class="{ 'is-invalid': errors.has('roledescription') }" v-validate="'required'" />
                            <span class="help text-danger" v-if="errors.has('roledescription')">{{ errors.first('roledescription') }}</span>
                        </div>
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
import User from '~/api/role';
import Vue from 'vue';
import VeeValidate from 'vee-validate';
Vue.use(VeeValidate, { fieldsBagName: 'formFields' });

export default {
    name: 'Add',

    data() {
        return {
            busy: false,
            model: {
            },
        };
    },
    mounted() {
        // this.getRole();
    },
    methods: {
        onSubmit() {
            let id = this.$route.params.id;
            let self = this;
            self.$validator.validateAll().then(result => {
                if (result) {
                    self.busy = true;


                    User.update(
                        id,
                        self.model,
                        data => {
                            self.busy = false;
                            self.$router.push({ name: 'index' });
                            Notify.success('Scuuess ...');
                        },
                        err => {
                            self.busy = false;
                            console.log(err);
                            this.$setErrorsFromResponse(err);
                        }
                    );
                }
            });
        },
        async getRole() {
            try {
                let { data }  = await axios.get(API_URL + 'roles/' + this.$route.params.id);
                this.model = data;
            } catch (e) {
                 Notify.error('Something went wrong.');
                 this.$router.push({ path: '/index' });
                console.log(e.response);
                }

        },
    },
};
</script>
<style lang="css" scoped></style>
