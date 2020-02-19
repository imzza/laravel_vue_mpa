<template>
    <div class="container">
        <div class="row justify-content-start">
            <div class="col-6 pl-0">
                <p>Update Record</p>
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
            // Get Role by Id
            this.getRoleById()
        },
        methods: {
            onSubmit() {
                const self = this
                self.$validator.validateAll().then(result => {
                    if (result) {
                        self.busy = true
                        Role.update(
                            this.id,
                            self.model,
                            data => {
                                self.busy = false
                                self.$router.push({ name: 'index' })
                                Notify.success('Role Updated Successfully!')
                            },
                            err => {
                                self.busy = false
                                console.log(err)
                                this.$setErrorsFromResponse(err)
                                Notify.error('Fail, Role Not Updated!')
                            }
                        )
                    }
                })
            },
            async getRoleById() {
                try {
                    const { data } = await axios.get(
                        API_URL + 'roles/' + this.id
                    )
                    /// Here we map form names with dataabase colms
                    this.model = {
                        id: data.id,
                        name: data.name,
                        rolename: data.rolename,
                        roledescription: data.role_descrip,
                    }
                } catch (e) {
                    Notify.error('Something went wrong.')
                    this.$router.push({ path: '/index' })
                    console.log('e:', e.response)
                }
            },
        },
    }
</script>
<style lang="css" scoped></style>
