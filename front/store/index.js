export const state = () => ({
  outline: [],
  equipment: [],
  selectedLesson: [],
  selectedUser: [],
  userPosts: [],
  userLikes: [],
  guestLoggedIn: false
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
  },
  setGuestLoggedIn (state, guestLoggedIn) {
    state.guestLoggedIn = guestLoggedIn
  }
}

export const actions = {
  nuxtClientInit({ commit }, context) {
    const data = JSON.parse(sessionStorage.getItem('persisted-key')) || []
    if(data.rangeAuth) {
      commit('rangeAuth/setIsLoggedIn', data.rangeAuth.isLoggedIn)
      commit('rangeAuth/setLoginRange', data.rangeAuth.loginRange)
    }
    if (data.auth) {
      commit('myData/setLoginUser', data.myData.loginUser)
    }
  },
  async getOutline({ commit }){
    await this.$axios.get('/v1/outlines')
    .then((res) => {
      commit('setOutline', res.data)
    })
  },

}
