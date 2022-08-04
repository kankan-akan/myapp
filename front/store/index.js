export const state = () => ({
  outline: [],
  equipment: [],
  selectedLesson: [],
  selectedUser: [],
  userPosts: [],
  userLikes: []
})

export const mutations = {
  setOutline ( state, outline ){
    state.outline = outline;
  },
  setSelectedLesson (state, selectedLesson ) {
    state.selectedLesson = selectedLesson
  },
  setSelectedUser (state, selectedUser) {
    state.selectedUser = selectedUser
  },
  setUserPosts (state, userPosts) {
    state.userPosts = userPosts 
  },
  setUserLikes (state, userLikes) {
    state.userLikes = userLikes
  }
}

export const actions = {
  nuxtClientInit({ commit }, context) {
    const data = JSON.parse(localStorage.getItem('persisted-key')) || []
      // commit('rangeAuth/setLoginRange', data.rangeAuth.loginRange)
      // commit('rangeAuth/setRangeData', data.rangeAuth.rangeData)
  },
  async getOutline({ commit }){
    await this.$axios.get('/v1/outlines')
    .then((res) => {
      commit('setOutline', res.data)
    })
  },

}
