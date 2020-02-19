<template>
    <div class="container">
        <div class="row justify-content-start">
            <div class="col-6 pl-0">
                <p>Add Record</p>
                <form @submit.prevent="onSubmit">
                    <div class="form-group">
                        <label for="name" class="control-label">
                            Role Name:
                        </label>
                        <input
                            v-model="model.name"
                            v-validate="'required'"
                            type="text"
                            name="name"
                            class="form-control form-control-lg"
                            :class="{ 'is-invalid': errors.has('name') }"
                            data-vv-as="Role name"
                            placeholder="Role Name.."
                        />
                        <span
                            v-if="errors.has('name')"
                            class="help text-danger"
                        >
                            {{ errors.first('name') }}
                        </span>
                    </div>
                    <div class="form-group">
                        <label for="rolename" class="control-label">
                            Role Display Name:
                        </label>
                        <input
                            id="rolename"
                            v-model="model.rolename"
                            v-validate="'required|min:3'"
                            type="text"
                            name="rolename"
                            class="form-control form-control-lg"
                            data-vv-as="Role display name"
                            :class="{ 'is-invalid': errors.has('rolename') }"
                            placeholder="Role Display Nam.."
                        />
                        <span
                            v-if="errors.has('rolename')"
                            class="help text-danger"
                        >
                            {{ errors.first('rolename') }}
                        </span>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label for="roledescription">
                                Role Description
                            </label>
                            <input
                                id="roledescription"
                                v-model="model.roledescription"
                                v-validate="'required'"
                                type="text"
                                class="form-control form-control-lg"
                                data-vv-as="Description"
                                name="roledescription"
                                placeholder="Short description.."
                                :class="{
                                    'is-invalid': errors.has('roledescription'),
                                }"
                            />
                            <span
                                v-if="errors.has('roledescription')"
                                class="help text-danger"
                            >
                                {{ errors.first('roledescription') }}
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
    import Role from '~/api/role'
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
            // User.allRole(data => {
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
                console.log('Role saved')
                const self = this
                self.$validator.validateAll().then(result => {
                    if (result) {
                        console.log('result:', result)
                        self.busy = true
                        console.log(self.model)
                        Role.save(
                            self.model,
                            data => {
                                self.busy = false
                                self.$router.push({ name: 'index' })
                                Notify.success('Role Added Successfully!')
                            },
                            err => {
                                self.busy = false
                                console.log(err)
                                Notify.error('Fail, Role Not Added!')
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
