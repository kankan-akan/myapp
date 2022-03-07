<template>
    <v-main>
      <v-container>
        <v-card max-width="700" class="justify-center mx-auto">
          <UserInfo :user="loginUser" :posts="posts" :likes="likes" :bookmarks="bookmarks" :reservations="reservations" :reviews="reviews" />
        </v-card>
      </v-container>
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
      getPost: 'myData/getPost',
      getLike: 'myData/getLike',
      getBookmark: 'myData/getBookmark',
      getReservation: 'myData/getReservation',
      getReview: 'myData/getReview'
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
      posts: (state) => state.myData.posts,
      likes: (state) => state.myData.likes,
      bookmarks: (state) => state.myData.bookmarks,
      reservations: (state) => state.myData.reservations,
      reviews: (state) => state.myData.reviews
    })

  }

  }
</script>