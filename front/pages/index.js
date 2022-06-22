import { mapActions, mapState } from 'vuex';

export default {

  data: () => ({
    // modalwindow 
    selectedPlace: null,
    isOpened: {}
  }),

methods: {
    ...mapActions({
        getOutline: 'getOutline',
        getLoginUser: 'authentication/getLoginUser'
        // getLsson: 'getlesson'
    }),
    showLesson(key) {
      // this.isOpened = !this.isOpened
      this.$set(this.isOpened, key, !this.isOpened[key])
    },
    // detailLesson(id) {
    //   this.$router.push(`/lessons/${id}`)
    // },
    closeContent() {
      this.isOpened = false
    }
  },

  created: async function() {
    await this.getOutline()

    if(this.$store.state.auth.loggedIn) {
      this.getLoginUser()
    }
    // this.getLesson()
        this.$store.commit('rangeAuth/setIsLoggedIn', false)
        this.$store.commit('rangeAuth/setLoginRange', null)
        this.$store.commit('rangeAuth/setRangeData', null)
  },

  computed: {
    ...mapState({
      outline: (state) => state.outline,
      // lesson: (state) => state.lesson
    }),
    overlay() {
      return !!this.selectedPlace
    },
  }
}