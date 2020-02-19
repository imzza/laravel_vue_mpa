<template>
    <div class="mian">
        <div class="row justify-content-start mt-3">
            <div class="col-6 d-flex justify-content-start">
                <router-link :to="{ name: 'index' }">
                    <button class="btn btn-primary mr-3">
                        Roles
                    </button>
                </router-link>
                <router-link :to="{ name: 'permissions-list' }">
                    <button class="btn btn-primary mr-3">
                        Permissions
                    </button>
                </router-link>
                <router-link :to="{ name: 'roles-add' }">
                    <button class="btn btn-primary mr-3">
                        <i class="fa fa-plus" aria-hidden="true" />
                        Role
                    </button>
                </router-link>
                <router-link :to="{ name: 'permissions-add' }">
                    <button class="btn btn-primary mr-3">
                        <i class="fa fa-plus" aria-hidden="true" />
                        Permission
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
        name: 'RolesAndPermissionsIndex',
        data() {
            return {
                msg: '',
                dta: _.cloneDeep(this.sdata),
            }
        },
        router: new VueRouter({
            mode: 'history',
            base: PREFIX + '/roles_and_permissions/',
            linkActiveClass: 'active',
            routes: [
                {
                    path: '/index',
                    name: 'index',
                    component: () => import('./List.vue'),
                },
                {
                    path: '/',
                    redirect: { name: 'index' },
                },
                {
                    path: '/add',
                    name: 'roles-add',
                    component: () => import('./Add.vue'),
                },
                {
                    path: '/edit/:id',
                    name: 'edit-item',
                    component: () => import('./Edit.vue'),
                    props: true,
                },
                {
                    path: '/assign/:id?',
                    name: 'assign-permissions',
                    component: () => import('./AssignPermissions.vue'),
                    props: true,
                },
                {
                    path: '/permissions',
                    name: 'permissions-index',
                    component: { template: '<router-view></router-view>' },
                    children: [
                        {
                            path: 'index',
                            name: 'permissions-list',
                            component: () => import('./ListPermissions.vue'),
                        },
                        {
                            path: 'add',
                            name: 'permissions-add',
                            component: () => import('./AddPermission.vue'),
                        },
                        {
                            path: 'edit/:id',
                            name: 'permissions-edit',
                            component: () => import('./EditPermission.vue'),
                            props: true,
                        },
                    ],
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
<style lang="css" scoped>
    .btn-cus {
        min-width: 100px;
    }
</style>
