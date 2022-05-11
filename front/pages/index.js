import { mapActions, mapState } from 'vuex';

export default {

  data: () => ({
    // modalwindow 
    selectedPlace: null,
    isOpened: false
  }),

methods: {
    ...mapActions({
        getOutline: 'getOutline',
        getLoginUser: 'authentication/getLoginUser'
        // getLsson: 'getlesson'
    }),
    detailLesson() {
      this.isOpened = !this.isOpened
    },
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