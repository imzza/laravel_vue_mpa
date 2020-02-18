<template>
	<div>
		<!-- Content Header (Page header) -->
		<section class="content-header mb-4">
			<div class="card mt-4 border-0">
				<h3>Assign Permissions To Roles</h3>
				<div class="row justify-content-center">
					<div class="col-5">
						<select id="roles_select" v-model="model.selected_role" name="selected_role" class="form-control select-background" size="1" @change="getRolePer(model.selected_role)">
							<option value selected>
								Select
							</option>
							<option v-for="data in model.roles" :value="data.id" :key="data.id">
								{{ data.name }}
							</option>
						</select>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<h4 class="mb-4">
							Permission Modules
						</h4>
						<label for="all">Select All</label>
						<input id="all" type="checkbox" name="all" :checked="rolePerms.length == model.all_perms" @click="all($event)" />
						<div v-for="(data, index) in model.all_perms" :key="index" class="collapseable_sec">
							<h5>{{ index }}</h5>
							<span v-for="child in data" :key="child.id">
								<div class="checkbox">
									<label class="small-text">
										<input v-model="rolePerms" type="checkbox" :data-id="`${child.id}`" :true-value="child.id" :value="child.id" />
										{{ child.key }}
									</label>
								</div>
							</span>
						</div>
					</div>
					<div class="row justify-content-center">
						<div class="col-4">
							<!--   <button type="submit" class="btn btn-primary btn-block" @click="assignPermissions">
                                Submit
                            </button> -->
							<v-button class="btn btn-primary btn-block" :loading="busy" v-on:click="assignPermissions">
								Submit
							</v-button>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</template>
<script>
	// import Vue from "vue";
	// var moment = require("moment");
	import Role from '~/api/role.js'
	import Permission from '~/api/permission.js'

	export default {
		name: 'PermissionsAssign',
		components: {},
		data() {
			return {
				busy: false,
				model: {
					selected_role: '',
					roles: [],
					all_perms: [],
				},
				rolePerms: [],
			}
		},
		mounted() {
			this.viewRoles()
			this.getPermissions()
			if (this.$route.params.id) {
				this.model.selected_role = this.$route.params.id
				this.getRolePer(this.$route.params.id)
			}
		},
		destroyed: function() {},
		methods: {
			all(e) {
				// if (e.target.checked) {
				//     this.rolePerms = model.all_perms;
				// }else{
				//     this.rolePerms = [];
				// }
				document.querySelectorAll('body input[type=checkbox]').forEach((element, index) => {
					const id = element.getAttribute('data-id')
					if (e.target.checked) {
						if (this.rolePerms.indexOf(id)) {
							this.rolePerms.push(id)
						}
					} else {
						this.rolePerms = []
					}
					element.checked = e.target.checked
				})
			},
			viewRoles() {
				const self = this
				Role.view(
					data => {
						self.model.roles = data
						// Notify.success('view_roles');
					},
					err => {
						// Notify.error(err);
						console.log('assignP > viewRoles:', err)
					}
				)
			},
			getPermissions() {
				const self = this
				Permission.permission_by_group(
					data => {
						self.model.all_perms = data
					},
					err => {
						console.log('assignP > getPermissions:', err)
					}
				)
			},
			getRolePer(id) {
				const self = this
				if (id == '') {
					self.rolePerms = []
					return false
				}
				Permission.permission_by_role(
					id,
					data => {
						self.rolePerms = data
					},
					err => {
						console.log(err.response.data)
					}
				)
			},

			assignPermissions() {
				const self = this
				if (self.model.selected_role == '') {
					Notify.error('Please select a role')
					return false
				}
				const id = self.model.selected_role
				Role.assign_permissions(
					id,
					self.rolePerms,
					data => {
						Notify.success(data.message)
					},
					err => {
						Notify.error('Fail, Permission not assigned!')
					}
				)
			},
		},
	}
</script>
<style type="text/css" scoped lang="scss">
	.checkbox label input[type='checkbox'],
	.radio label input[type='radio'] {
		display: inline-block !important;
	}
</style>
