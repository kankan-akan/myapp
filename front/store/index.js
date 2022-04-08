
export const state = () => ({
  outline: [ ],
  equipment: [ ],
  lesson: [ ]

})

export const mutations = {
  setOutline ( state, outline ){
    state.outline = outline;
  },
  
  setLesson ( state, lesson ){
    state.lesson = lesson;
  }

}

export const actions = {
  nuxtClientInit({ commit }, context) {
    const data = JSON.parse(localStorage.getItem('persisted-key')) || []
      commit('rangeAuth/setLoginRange', data.rangeAuth.loginRange)
  },
  async getOutline({ commit }){
    await this.$axios.get('/v1/outlines')
    .then((res) => {
      commit('setOutline', res.data)
      
    })
  },
  async getLesson({ commit }){
    await this.$axios.get('/v1/lessons/range_lesson')
    .then((res) => {
      commit('setLesson', res.data)
    })
  } 

}
