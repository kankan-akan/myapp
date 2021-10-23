import Vuex from 'vuex'
import createPersistedState from 'vuex-persistedstate'

const initialState = {

  loggedIn: false
}

export const store = new Vuex.Store({
  state: initialState,
  mutations: {},
  actions: {},
  getters: {},
  plugins: [createPersistedState()],
})

export const actions = {
  nuxtClientInit({ commit }, context) {
    
  }
}
