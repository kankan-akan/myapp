
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
    
  },
  async getOutline({ commit }){
    await this.$axios.get('/v1/outlines')
    .then((res) => {
      commit('setOutline', res.data)
      
    })
  },
  async getLesson({ commit }, id){
    await this.$axios.get('/v1/lessons/range_lesson')
    .then((res) => {
      commit('setLesson', res.data)
    })
  } 

}
