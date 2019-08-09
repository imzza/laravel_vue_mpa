import * as types from '../types.js';

export const state = {
    categories: [],
    items: {},
    getalldbuser: [],
    getallshippinginfo: [],
    getallshippingterm: [],
    getallabnamecategory: [],
}

export const getters = {
    categories: state => state.categories,
    getalldbuser: state => state.getalldbuser,
    getallshippinginfo: state => state.getallshippinginfo,
    getallshippingterm: state => state.getallshippingterm,
    getallabnamecategory: state => state.getallabnamecategory
}


export const mutations = {
    [types.SET_ALL_DB_USER] (state, alldbuser) {
        state.getalldbuser = alldbuser;
    },
    [types.SET_ALL_SHIPPING_INFO] (state, allshippinginfo) {
        state.getallshippinginfo = allshippinginfo;
    },
    [types.SET_ALL_SHIPPING_TERM] (state, allshippingterm) {
        state.getallshippingterm = allshippingterm;
    },
    [types.SET_ALL_ABNAME_CATEGORY] (state, allabnamecategory) {
        state.getallabnamecategory = allabnamecategory;
    }
}

export const actions = {
    saveCategories({commit, state}) {
        axios.post('/api/categories/upsert', {
            categories: state.categories
        })
        .then((res) => {
            if (res.data.success) {
                commit('SET_FEEDBACK', 'Changes saved.');
                setTimeout(() => commit('SET_FEEDBACK', ''), 2000);
                commit('SET_CATEGORIES', res.data.categories);
            }
        });
    },
    async fetchUser ({ commit }) {
        try {
          const { data } = await axios.get('/api/user')
          commit(types.SET_ALL_ABNAME_CATEGORY, { user: data })
        } catch (e) {
          commit(types.SET_ALL_ABNAME_CATEGORY)
        }
    },
}
