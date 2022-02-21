export const state = () => ({
  currentUser: [ ]
})

export const mutations = {
  setCurrentUser (state, currentUser ) {
    state.currentUser = currentUser
  }
}

export const actions = {
  user ({ commit }) {
    if(this.$store.state.auth.loggedIn) {
      this.$auth.user
    .then((res) => {
      commit('setCurrentUser', res.data)
    })
    }
  }

}