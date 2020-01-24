<template>
    <div class="mian">
        <div class="row justify-content-start mt-3">
            <div class="col-6 d-flex justify-content-start">
                <router-link :to="{ name: 'index' }">
                    <button class="btn btn-primary mr-3">Roles</button>
                </router-link>
                <router-link :to="{ name: 'permissions-list' }">
                    <button class="btn btn-primary mr-3">Permissions</button>
                </router-link>
                <router-link :to="{ name: 'roles-add' }">
                    <button class="btn btn-primary mr-3"><i class="fa fa-plus" aria-hidden="true"></i> Role</button>
                </router-link>
                <router-link :to="{ name: 'permissions-add' }">
                    <button class="btn btn-primary mr-3"><i class="fa fa-plus" aria-hidden="true"></i> Permission</button>
                </router-link>
            </div>
        </div>
        <div>
            <router-view></router-view>
        </div>
    </div>
</template>
<script>
import VueRouter from 'vue-router';
// () => import('~/components/Index.vue')

let url = ProjectUrl('');

export default {
    name: 'RolesAndPermissionsIndex',
    data() {
        return {
            msg: ''
            // dta: _.cloneDeep(this.sdata),
        };
    },
    router: new VueRouter({
        mode: 'history',
        base: PREFIX + '/roles_and_permissions/',
        linkActiveClass: 'active',
        routes: [{
                path: '/index',
                name: 'index',
                component: require('./List.vue').default,
            },
            {
                path: '/',
                redirect: { name: 'index' },
            },
            {
                path: '/add',
                name: 'roles-add',
                component: require('./Add.vue').default,
            },
            {
                path: '/edit/:id',
                name: 'edit-item',
                component: require('./Edit.vue').default,
                props: true,
            },
            {
                path: '/assign/:id?',
                name: 'assign-permissions',
                component: require('./AssignPermissions.vue').default,
                props: true,
            },
            {
                path: '/permissions',
                name: 'permissions-index',
                component: { template: '<router-view></router-view>' },
                children: [{
                        path: 'index',
                        name: 'permissions-list',
                        component: require('./List.vue').default,
                    },
                    {
                        path: 'add',
                        name: 'permissions-add',
                        component: require('./AddPermission.vue').default,
                    },
                    {
                        path: 'edit/:id',
                        name: 'permissions-edit',
                        component: require('./EditPermission.vue').default,
                        props: true,
                    },
                ]
            },
            {
                path: '*',
                redirect: '/',
            },
        ],
    }),
    created() {},
    mounted() {
        console.log(this.dta);
        console.log(window.Permissions);
    },
    methods: {
        hello() {
            console.log('Hello Web');
        },
    },
};

</script>
<style lang="css" scoped></style>
.btn-cus {
min-width: 100px;
}
