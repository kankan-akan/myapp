export const state = () => ({
  loginUser: [ ]
})

export const mutations = {
  setLoginUser (state, loginUser ) {
    state.loginUser = loginUser
  }
}

export const actions = {
  getLoginUser ({ commit }) {
      this.$axios.get('/v1/auth/user')
    .then((res) => {
      commit('setLoginUser', res.data)
    })
    }

}