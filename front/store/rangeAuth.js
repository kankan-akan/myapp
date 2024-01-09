export const state = () => ({
  isLoggedIn: false,
  loginRange: null,
  rangeData: null,
  lessons: null
})

export const mutations = {
  setIsLoggedIn (state, isLoggedIn) {
    state.isLoggedIn = isLoggedIn
  },
  setLoginRange (state, loginRange) {
    state.loginRange = loginRange
  },
  setRangeData (state, rangeData) {
    state.rangeData = rangeData
  },
  setLesson ( state, lessons ){
    state.lessons = lessons;
  }
}

export const actions = {
  // setLogin ({ commit }, data) {
  //     this.$axios.post('/v1/range_auth/sign_in', {
  //       email: data.email,
  //       password: data.password
  //     })
  //   .then((res) => {
  //     commit('setLogin', res.data)
  //     commit('setIsLoggedIn', true)
  //   })
  //   },
  getLoginRange({ commit }) {
    this.$axios.get('/v1/range_auth/range')
    .then((res) => {
      commit('setLoginRange', res.data)
    })
  },
  getRangeData({ commit,state }) {
    this.$axios.get(`/v1/outlines/${state.loginRange.id}`)
    .then((res) => {
      commit('setRangeData', res.data)
    })
  },
    getLesson({ commit }){
      this.$axios.get('/v1/lessons/range_lesson')
    .then((res) => {
      commit('setLesson', res.data)
    })
  }

}