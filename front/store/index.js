export const state = () => ({
  outline: [ ],
  equipment: [ ],

})

export const mutations = {
  setOutline ( state, outline ){
    state.outline = outline;
  },

}

export const actions = {
  nuxtClientInit({ commit }, context) {
    const data = JSON.parse(localStorage.getItem('persisted-key')) || []
      commit('rangeAuth/setLoginRange', data.rangeAuth.loginRange)
      commit('rangeAuth/setRangeData', data.rangeAuth.rangeData)
  },
  async getOutline({ commit }){
    await this.$axios.get('/v1/outlines')
    .then((res) => {
      commit('setOutline', res.data)
      
    })
  },

}
