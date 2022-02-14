
export const state = () => ({
  outline: []

})

export const mutations = {
  setOutline ( set, outline ){
    state.outline = outline
  }
}

export const actions = {
  nuxtClientInit({ commit }, context) {
    
  },
  async getOutline({ commit }){
    await this.$axios.get('/v1/outlines')
    .then((res) => commit('setOutline', res.data)
    )
  } 

}
