<template>
    <div class="container">
        <div class="row justify-content-start">
            <div class="col-6 pl-0">
                <p>Update Record</p>
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
    Vue.use(VeeValidate, { fieldsBagName: 'formFields' })

    export default {
        name: 'Add',
        data() {
            return {
                busy: false,
                model: {},
                id: this.$route.params.id,
            }
        },
        mounted() {
            this.getPermissionById()
        },
        methods: {
            onSubmit() {
                const self = this
                self.$validator.validateAll().then(result => {
                    if (result) {
                        self.busy = true
                        Permission.update(
                            this.id,
                            self.model,
                            data => {
                                self.busy = false
                                self.$router.push({
                                    path: '/permissions/index',
                                })
                                Notify.success(
                                    'Permission Updated Successfully!'
                                )
                            },
                            err => {
                                self.busy = false
                                console.log(err)
                                this.$setErrorsFromResponse(err)
                                Notify.error('Fail, Permission Not Updated!')
                            }
                        )
                    }
                })
            },
            async getPermissionById() {
                try {
                    const { data } = await axios.get(
                        API_URL + 'permissions/' + this.id
                    )
                    this.model = {
                        name: data.name,
                        permissionkey: data.key,
                        permissiontype: data.type,
                    }
                } catch (e) {
                    Notify.error('Something went wrong.')
                    this.$router.push({ path: '/permissions/index' })
                    console.log(e.response)
                }
            },
        },
    }
</script>
<style lang="css" scoped></style>
