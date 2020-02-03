<template>
    <div class="container">
        <div class="row justify-content-start">
            <div class="col-6 pl-0">
                <p>Update Record</p>
                <form @submit.prevent="onSubmit">
                    <div class="form-group">
                        <label for="name" class="control-label">Permission Name:</label>
                        <input type="text" name="name" class="form-control form-control-lg" :class="{ 'is-invalid': errors.has('name') }" v-validate="'required'" v-model="model.name" placeholder="Permission Name" data-vv-as="Permission Name.." />
                        <span class="help text-danger" v-if="errors.has('name')">{{ errors.first('name') }}</span>
                    </div>
                    <div class="form-group">
                        <label for="permissionkey" class="control-label">Permission Display Name:</label>
                        <input type="text" name="permissionkey" id="permissionkey" class="form-control form-control-lg" v-validate="'required'" v-model="model.permissionkey" :class="{ 'is-invalid': errors.has('permissionkey') }" placeholder="Permission Display Name" data-vv-as="Permission Display Name" />
                        <span class="help text-danger" v-if="errors.has('permissionkey')">{{ errors.first('permissionkey') }}</span>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label for="permissiontype" class="control-label">Permission Type:</label>
                            <input type="text" class="form-control form-control-lg" name="permissiontype" id="permissiontype" placeholder="Permission Type" data-vv-as="Permission Type" v-model="model.permissiontype" :class="{ 'is-invalid': errors.has('permissiontype') }" v-validate="'required'" />
                            <span class="help text-danger" v-if="errors.has('permissiontype')">{{ errors.first('permissiontype') }}</span>
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
import Permission from '~/api/permission';
import Vue from 'vue';
import VeeValidate from 'vee-validate';
Vue.use(VeeValidate, { fieldsBagName: 'formFields' });

export default {
    name: 'Add',
    data() {
        return {
            busy: false,
            model: {},
            id: this.$route.params.id
        };
    },
    mounted() {
        this.getPermissionById();
    },
    methods: {
        onSubmit() {
            let self = this;
            self.$validator.validateAll().then(result => {
                if (result) {
                    self.busy = true;
                    Permission.updatePermission(
                        this.id,
                        self.model,
                        data => {
                            self.busy = false;
                            self.$router.push({ path: '/permissions/index' });
                            Notify.success('Permission Updated Successfully!')
                        },
                        err => {
                            self.busy = false;
                            console.log(err);
                            this.$setErrorsFromResponse(err);
                            Notify.error('Fail, Permission Not Updated!');
                        }
                    );
                }
            });
        },
        async getPermissionById() {
            try {
                let { data } = await axios.get(API_URL + 'permissions/' + this.id);
                this.model = {
                   'name': data.name,
                   'permissionkey' : data.key,
                   'permissiontype' : data.type
                };
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
