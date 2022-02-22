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
    this.getLoginUser()
    // this.getLesson()

  },

  computed: {
    ...mapState({
      outline: (state) => state.outline,
      // loginUser: (state) => state.authentication.loginUser
      // lesson: (state) => state.lesson
    }),
    overlay: function () {
      return !!this.selectedPlace
    },
  }
}