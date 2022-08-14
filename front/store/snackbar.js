export const state = () => ({
  icon: '',
  message: '',
  type: '',
  status: false,
})

export const getters = {
  icon: (state) => state.icon,
  message: (state) => state.message,
  type: (state) => state.type,
  status: (state) => state.status,
}

export const mutations = {
  setIcon(state, icon) {
    state.icon = icon
  },
  setMessage(state, message) {
    state.message = message
  },
  setType(state, type) {
    state.type = type
  },
  setStatus(state, bool) {
    state.status = bool
  },
}

export const actions = {
  showMessage({ commit }, { icon, message, type, status }) {
    commit('setIcon', icon)
    commit('setMessage', message)
    commit('setType', type)
    commit('setStatus', status)
    setTimeout(() => {
      commit('setStatus', !status)
    }, 5000)
  },

  loginCheck({ commit }) {
    commit('setIcon', 'mdi-alert-circle-outline')
    commit('setMessage', 'ログイン後にもう一度実行してください。')
    commit('setType', 'warning')
    commit('setStatus', true)
    setTimeout(() => {
      commit('setStatus', false)
    }, 3000)
  }
}