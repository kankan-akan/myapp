export const state = () => ({
  loginData: [ ],
  isLoggedIn: false,
  loginRange: [ ]
})

export const mutations = {
  setLogin (state, loginData) {
    state.loginRange = loginData
  },
  setIsLoggedIn (state, isLoggedIn) {
    state.isLoggedIn = isLoggedIn
  },
  setLoginRange (state, loginRange) {
    state.loginRange = loginRange
  }
}

export const actions = {
  setLogin ({ commit }, data) {
      this.$axios.post('/v1/range_auth/sign_in', {
        email: data.email,
        password: data.password
      })
    .then((res) => {
      commit('setLogin', res.data)
      commit('setIsLoggedIn', true)
    })
    },
  getLoginRange({ commit }) {
    this.$axios.get('/v1/range_auth/range')
    .then((res) => {
      commit('setLoginRange', res.data)
    })
  }

}