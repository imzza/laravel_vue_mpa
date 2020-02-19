import * as types from '../types.js'

export const state = {
    states: [],
    countries: {},
}

export const getters = {
    states: state => state.states,
    countries: state => state.countries,
}

export const mutations = {
    [types.SET_ALL_STATES](state, states) {
        state.states = states
    },
    [types.SET_ALL_COUNTRIES](state, countries) {
        state.countries = countries
    },
}

export const actions = {
    getStates({ commit, state }) {
        axios.get('/api/states').then(res => {
            if (res.data.success) {
                // commit('SET_FEEDBACK', 'Changes saved.');
                // setTimeout(() => commit('SET_FEEDBACK', ''), 2000);
                // commit('SET_CATEGORIES', res.data.categories);
            }
        })
    },
    async fetchUser({ commit }) {
        try {
            const { data } = await axios.get('/api/user')
            commit(types.SET_ALL_STATES, { user: data })
        } catch (e) {
            commit(types.SET_ALL_STATES)
        }
    },
}
