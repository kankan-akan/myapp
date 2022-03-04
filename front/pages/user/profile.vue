<template>
    <v-main>
      <v-card max-width="700" class="justify-center mx-auto">
        <v-container>
          <v-card-title>profile</v-card-title>
          <UserInfo :user="loginUser" :posts="posts" :likes="likes" :bookmarks="bookmarks" :reservations="reservations" :reviews="reviews" />
         
        </v-container>
      </v-card>
    </v-main>
</template>

<script>
import { mapActions, mapState } from 'vuex';
  export default {
    data: () => ({
      title: "contents",
      items: [
        {
          src: 'backgrounds/bg.jpg',
        },
        {
          src: 'backgrounds/md.jpg',
        },
        {
          src: 'backgrounds/bg-2.jpg',
        },
        {
          src: 'backgrounds/md2.jpg',
        },
      ],
      selected: [],
    }),

  methods: {
    ...mapActions ({
      getPost: 'user/getPost',
      getLike: 'user/getLike',
      getBookmark: 'user/getBookmark',
      getReservation: 'user/getReservation',
      getReview: 'user/getReview'
    })
  },

  created () {
   this.getPost()
   this.getLike()
   this.getBookmark()
   this.getReservation()
   this.getReview()
  },

  computed: {
    ...mapState ({
      loginUser: (state) => state.authentication.loginUser,
      posts: (state) => state.user.posts,
      likes: (state) => state.user.likes,
      bookmarks: (state) => state.user.bookmarks,
      reservations: (state) => state.user.reservations,
      reviews: (state) => state.user.reviews
    })

  }

  }
</script>