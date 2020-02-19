<template>
	<div class="mian">
		<div class="row justify-content-start mt-3">
			<div class="col-4 d-flex justify-content-start">
				<router-link :to="{ name: 'index' }">
					<button class="btn btn-primary mr-3">
						Home
					</button>
				</router-link>
				<router-link :to="{ name: 'add' }">
					<button class="btn btn-primary mr-3">
						Add
					</button>
				</router-link>
			</div>
		</div>
		<div>
			<router-view />
		</div>
	</div>
</template>
<script>
	import VueRouter from 'vue-router'
	// () => import('~/components/Index.vue')

	const url = ProjectUrl('')

	export default {
		name: 'Index',
		props: ['sdata'],
		data() {
			return {
				msg: '',
				dta: _.cloneDeep(this.sdata),
			}
		},
		router: new VueRouter({
			mode: 'history',
			base: PREFIX + '/',
			routes: [
				{
					path: '/index',
					name: 'index',
					component: require('./Index.vue').default,
				},
				{
					path: '/',
					redirect: { name: 'index' },
				},
				{
					path: '/add',
					name: 'add',
					component: require('./Add.vue').default,
				},
				{
					path: '/edit/:id',
					name: 'edit-item',
					component: require('./Edit.vue').default,
					props: true,
				},
				{
					path: '*',
					redirect: '/',
				},
			],
		}),
		created() {},
		mounted() {},
		methods: {},
	}
</script>
<style lang="css" scoped></style>
