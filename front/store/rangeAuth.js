export const state = () => ({
  loginRange: [ ],
  loggedIn: false
})

export const mutations = {
  setLogin (state, loginRange ) {
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
    })
    }

}