<template>
    <div class="mian">
        <div class="row justify-content-end mt-3">
            <div class="col-4">
                <router-link :to="{name: 'index'}">
                    <button class="btn btn-primary">Home</button>
                </router-link>
                <router-link :to="{name: 'add'}">
                    <button class="btn btn-primary">Add</button>
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

export default {
  name: 'MainComponent',
  props:['sdata'],
  data () {
    return {
        msg: '',
        dta: _.cloneDeep(this.sdata),
     }
    },
    router: new VueRouter({
        mode: 'history',
        base: PREFIX+'/',
        routes: [
            {
                path: '/index',
                name: 'index',
                component: () => import('~/components/SampleComponent.vue'),
            },
            {
                path: '/',
                redirect: {name: 'index'}
            },
            {
                path: '/add',
                name: 'add',
                component: () => import('~/components/Test.vue'),
            },
            // {
            //     path: '/add-item',
            //     name: 'add-item',
            //     component: MenuItem
            // },
            // {
            //     path: '/edit-item/:id',
            //     name: 'edit-item',
            //     component: MenuItem,
            //     props: true
            // },
            {
                path: '*',
                redirect: '/'
            }
        ]
    }),
  created(){

  },
  mounted(){
    console.log(this.dta);
    // console.log('Hello Web');
    // axios.get(API_URL+'user').then(resp => {
    //     console.log(resp);
    // }).catch(err =>{
    //     console.log(err.response);
    // });
  },
  methods:{
     hello(){
        console.log('Hello Web');
     }
  }
}
</script>

<style lang="css" scoped>
</style>
