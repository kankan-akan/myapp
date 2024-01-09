export const state = () => ({
  loginUser: [],
  posts: [],
  likes: [],
  bookmarks: [],
  reservations: [],
  reviews: []
})

export const mutations = {
  setLoginUser (state, loginUser ) {
    state.loginUser = loginUser
  },
  setPost ( state, posts ){
    state.posts = posts;
  },
  setLike ( state, likes ){
    state.likes = likes;
  },
  setBookmark ( state, bookmarks ){
    state.bookmarks = bookmarks;
  },
  setReservation( state, reservations ){
    state.reservations = reservations;
  },
  setReview( state, reviews ){
    state.reviews = reviews;
  }

}

export const actions = {
  getLoginUser ({ commit }) {
    this.$axios.get('/v1/auth/user')
    .then((res) => {
      commit('setLoginUser', res.data)
    })
    .catch((error) => {
      console.log(error)
    })
  },
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
