
export const state = () => ({
  outline: [ ],
  equipment: [ ]

})

export const mutations = {
  setOutline ( state, outline ){
    state.outline = outline;
  },
  setEquipment ( state, equipment ){
    state.equipment = equipment;
  }
}

export const actions = {
  nuxtClientInit({ commit }, context) {
    
  },
  async getOutline({ commit }){
    await this.$axios.get('/v1/outlines')
    .then((res) => {
      commit('setOutline', res.data)
      commit('setEquipment', res.data.outline.equipment)
    })
  } 

}
