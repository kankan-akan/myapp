import { mapActions, mapState } from 'vuex';

export default {

  data: () => ({
      // modalwindow 
      selectedPlace: null,

  }),

methods: {
    ...mapActions({
        getOutline: 'getOutline',
        getLoginUser: 'authentication/getLoginUser'
        // getLsson: 'getlesson'
    })
  },

  created: async function() {
    await this.getOutline()

    if(this.$store.state.auth.loggedIn) {
      this.getLoginUser()
    }
    // this.getLesson()

  },

  computed: {
    ...mapState({
      outline: (state) => state.outline,
      // lesson: (state) => state.lesson
    }),
    overlay: function () {
      return !!this.selectedPlace
    },
  }
}