<template>
  <v-main>
    <v-container>
      <v-card max-width="700" class="justify-center mx-auto">
        <UserInfo v-if="userLikes !== undefined" :user="selectedUser" :posts="userPosts" :likes="userLikes" :bookmarks="bookmarks" :reservations="reservations" :reviews="reviews"/>
      </v-card>
    </v-container>
  </v-main>
</template>

<script>
import { mapState, mapActions } from 'vuex';

export default {
  data: () => ({
    // selectedUser: [],
    // userPosts: [],
    // userLikes: []
  }),

  computed: {
    ...mapState({
      loginUser: (state) => state.authentication.loginUser,
      selectedUser: (state) => state.selectedUser,
      userPosts: (state) => state.userPosts,
      userLikes: (state) => state.userLikes,
      bookmarks: (state) => state.myData.bookmarks,
      reservations: (state) => state.myData.reservations,
      reviews: (state) => state.myData.reviews
    })
  },

  created() {
    this.$axios.get(`/v1/users/${this.$route.params.id}`)
      .then((res) => {
        // this.selectedUser = res.data
        this.$store.commit('setSelectedUser', res.data)
      })
    this.$axios.get(`/v1/posts/user_posts/${this.$route.params.id}`)
      .then((res) => {
        // this.userPosts = res.data
        this.$store.commit('setUserPosts', res.data)
      })
    this.$axios.get(`/v1/likes/user_likes/${this.$route.params.id}`)
      .then((res) => {
        // this.userLikes = res.data
        this.$store.commit('setUserLikes', res.data)
      })
      if (this.loginUser.id == this.$route.params.id) {
        this.getBookmark()
        this.getReservation()
        this.getReview()
      }
  },

  methods: {
    ...mapActions({
      getBookmark: 'myData/getBookmark',
      getReservation: 'myData/getReservation',
      getReview: 'myData/getReview'
    })
  }

}
</script>