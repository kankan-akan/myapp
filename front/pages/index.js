import { mapActions, mapState } from 'vuex';

export default {

  data: () => ({
      // modalwindow 
      selectedPlace: null,

  }),

methods: {
    ...mapActions({
        getOutline: 'getOutline',
        // getLsson: 'getlesson'
    })
  },

  created: async function() {
    await this.getOutline()
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