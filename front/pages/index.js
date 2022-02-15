import { mapActions, mapState } from 'vuex';

export default {

  data: () => ({
      // modalwindow 
      selectedPlace: null,
      // output 
    // places: [ ]
  }),

methods: {
    ...mapActions({
        getOutline: 'getOutline'
    })
  },

  created: async function() {
    await this.getOutline()

  },

  computed: {
    ...mapState({
      outline: (state) => state.outline
    }),
    overlay: function () {
      return !!this.selectedPlace
    },
  }
}