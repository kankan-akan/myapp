export const state = () => ({
  post: [ ],
  like: [ ],
  bookmark: [ ],
  reservtion: [ ],
  review: [ ]
})

export const mutations = {
  setPost ( state, post ){
    state.post = post;
  },
  setLike ( state, like ){
    state.like = like;
  },
  setBookmark ( state, bookmark ){
    state.bookmark = bookmark;
  },
  setReservation( state, reservation ){
    state.reservation = reservation;
  },
  setReview( state, review ){
    state.review = review;
  }
  
}

export const actions = {
  async getPost ({ commit }) {
    await this.$axios.get('/v1/posts/my_post')
    .then((res) => {
      commit('setPost', res.data)
    })
    .catch((error) => {
      console.log(error)
    })
  },
  async getLike ({ commit }) {
    await this.$axios.get('/v1/likes/my_like')
    .then((res) => {
      commit('setLike', res.data)
    })
    .catch((error) => {
      console.log(error)
    })
  },
  async getBookmark ({ commit }) {
    await this.$axios.get('/v1/bookmarks/my_bookmark')
    .then((res) => {
      commit('setBookmark', res.data)
    })
    .catch((error) => {
      console.log(error)
    })
  },
  async getReservation ({ commit }) {
    await this.$axios.get('/v1/reservations/my_reservation')
    .then((res) => {
      commit('setReservation', res.data)
    })
    .catch((error) => {
      console.log(error)
    })
  },
  async getReview ({ commit }) {
    await this.$axios.get('/v1/reviews/my_review')
    .then((res) => {
      commit('setReview', res.data)
    })
    .catch((error) => {
      console.log(error)
    })
  }

}
