<template>
    <div class="container">
        <div class="row justify-content-start">
            <div class="col-6 pl-0">
                <p>Add Record</p>
                <form @submit.prevent="onSubmit">
                    <div class="form-group">
                        <label for="name" class="control-label">
                            Permission Name:
                        </label>
                        <input
                            v-model="model.name"
                            v-validate="'required'"
                            type="text"
                            name="name"
                            class="form-control form-control-lg"
                            :class="{ 'is-invalid': errors.has('name') }"
                            placeholder="Permission Name"
                            data-vv-as="Permission Name.."
                        />
                        <span
                            v-if="errors.has('name')"
                            class="help text-danger"
                        >
                            {{ errors.first('name') }}
                        </span>
                    </div>
                    <div class="form-group">
                        <label for="permissionkey" class="control-label">
                            Permission Display Name:
                        </label>
                        <input
                            id="permissionkey"
                            v-model="model.permissionkey"
                            v-validate="'required'"
                            type="text"
                            name="permissionkey"
                            class="form-control form-control-lg"
                            :class="{
                                'is-invalid': errors.has('permissionkey'),
                            }"
                            placeholder="Permission Display Name"
                            data-vv-as="Permission Display Name"
                        />
                        <span
                            v-if="errors.has('permissionkey')"
                            class="help text-danger"
                        >
                            {{ errors.first('permissionkey') }}
                        </span>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label for="permissiontype" class="control-label">
                                Permission Type:
                            </label>
                            <input
                                id="permissiontype"
                                v-model="model.permissiontype"
                                v-validate="'required'"
                                type="text"
                                class="form-control form-control-lg"
                                name="permissiontype"
                                placeholder="Permission Type"
                                data-vv-as="Permission Type"
                                :class="{
                                    'is-invalid': errors.has('permissiontype'),
                                }"
                            />
                            <span
                                v-if="errors.has('permissiontype')"
                                class="help text-danger"
                            >
                                {{ errors.first('permissiontype') }}
                            </span>
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
    import Permission from '~/api/permission'
    import Vue from 'vue'
    import VeeValidate from 'vee-validate'
    // Vue.use(VeeValidate);

    Vue.use(VeeValidate, { fieldsBagName: 'formFields' })

    export default {
        name: 'Add',

        data() {
            return {
                busy: false,
                model: {},
            }
        },
        mounted() {
            // Permission.allPermission(data => {
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
                }
                reader.readAsDataURL(file)
            },

            onSubmit() {
                const self = this
                self.$validator.validateAll().then(result => {
                    if (result) {
                        self.busy = true
                        console.log(self.model)
                        Permission.save(
                            self.model,
                            data => {
                                self.busy = false
                                self.$router.push({
                                    path: '/permissions/index',
                                })
                                Notify.success('Permission Added Successfully!')
                            },
                            err => {
                                self.busy = false
                                console.log(err)
                                Notify.error('Fail, Permission not Added!')
                                this.$setErrorsFromResponse(err)
                            }
                        )
                    }
                })
            },
        },
    }
</script>
<style lang="css" scoped></style>
