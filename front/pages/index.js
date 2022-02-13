export default {

  data: () => ({
      // modalwindow 
    selectedPlace: null,
      // output 
    places: [ ],
    message: 'hello world!'
  }),

  mounted() {
    this.$axios.get('/v1/outlines')
                    .then((res) => {this.places = res.data})

  },

  computed: {
    overlay: function () {
      return !!this.selectedPlace
    },
  },
}