<template>
  <v-app>
    <Header />
    <v-main>
      <v-card max-width="700" class="justify-center mx-auto">
        <v-container>
          <v-card-title>plofile</v-card-title>
          <v-row class="justify-center pa-3">
            <v-avatar size="120">
              <img
                src="https://cdn.vuetifyjs.com/images/john.jpg"
                alt="John"
              >
            </v-avatar>
          </v-row>
          <v-row class="justify-center">
            <div>{{ loginUser.name}}</div>
          </v-row>
          <v-row class="justify-center">
            <div>@{{ loginUser.user_id }}</div>
          </v-row>
          <v-row>
          <v-tabs  fixed-tabs color="cyan">
            <v-tab>post</v-tab>
            <v-tab>like</v-tab>
            <v-tab>bookmark</v-tab>
            <v-tab>reservation</v-tab>
            <v-tab>review</v-tab>

            <v-tab-item>
              <v-card>
                <v-col v-for="(post, i) in post" :key="i">{{ post.content }}</v-col>
              </v-card>
            </v-tab-item>
            <v-tab-item>
              <v-card>
                <v-col v-for="(like, i) in like" :key="i">{{ }}</v-col>
              </v-card>
            </v-tab-item>
            <v-tab-item>
              <v-card>
                <v-col v-for="(bookmark, i) in bookmark" :key="i">{{ bookmark.range_outline.name }}</v-col>
              </v-card>
            </v-tab-item>
            <v-tab-item>
              <v-card>

              </v-card>
            </v-tab-item>
            <v-tab-item>
              <v-card>

              </v-card>
            </v-tab-item>
          </v-tabs>
          </v-row>
        </v-container>
      </v-card>
    </v-main>
  </v-app>
</template>

<script>
import { mapActions, mapState } from 'vuex';
  export default {
    data: () => ({
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
  //  this.getPost()
  //  this.getLike()
   this.getBookmark()
  //  this.getReservation()
  //  this.getReview()
  },

  computed: {
    ...mapState ({
      loginUser: (state) => state.authentication.loginUser,
      post: (state) => state.user.post,
      like: (state) => state.user.like,
      bookmark: (state) => state.user.bookmark,
      reservation: (state) => state.user.reservation,
      review: (state) => state.user.review
    })

  }

  }
</script>