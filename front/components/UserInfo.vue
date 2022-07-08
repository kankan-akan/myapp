<template>
  <v-container>
    <div class="d-flex flex-no-wrap justify-space-between">
    <v-card-title class="pa-2">@{{ user.user_id }}</v-card-title>
    <FollowButton :user=user />
    </div>

    <v-divider></v-divider>

    <div class="d-flex justify-space-around">
      <div class="ma-4">
        <v-avatar v-if="user.avatar.url" size="120">
          <img :src="user.avatar.url">
        </v-avatar>
        <v-avatar v-else size="120" color="indigo">
          <v-icon dark size="80">mdi-account</v-icon>
        </v-avatar>
      </div>
      <v-col>
        <v-col class="text-h5 mx-1">{{ user.name }}</v-col>
        <div>
          <FollowCount :user=user />
        </div>
      </v-col>
    </div>
      
    

    <v-row>
      <v-tabs  fixed-tabs color="cyan">
        <v-tab>post</v-tab>
        <v-tab>like</v-tab>
        <v-tab>bookmark</v-tab>
        <v-tab>reservation</v-tab>
        <v-tab>review</v-tab>

        <v-tab-item>
          <v-card>
            <v-col class="pa-1" v-for="post in posts" :key="post.id">
              <v-card class="pa-2">
                <div class="d-flex">
                  <v-avatar tile size="120">
                    <img :src="post.image.url">
                  </v-avatar>
              
                  <v-card-text>
                    <div class="kaigyo">{{ post.content }}</div>
                  </v-card-text>
                </div>
              </v-card>
            </v-col>
            </v-card>
        </v-tab-item>
        <v-tab-item>
          <v-card>
            <v-col class="pa-1" v-for="(like, i) in likes" :key="i">
              <v-card class="pa-2" >
                <div class="d-flex">
                  <v-avatar size="120">
                    <v-img></v-img>
                  </v-avatar>
                  <v-card-text>
                    <div class="kaigyo">{{ like.post.content }}</div>
                  </v-card-text>
                </div>
              </v-card>
            </v-col>
          </v-card>
        </v-tab-item>
        <v-tab-item>
          <v-card>
            <v-col 
              class="pa-0"
              v-for="(bookmark, i) in bookmarks" 
              :key="i"
            >
            <v-card-text>
              {{ bookmark.range_outline.name }}
            </v-card-text>
              <v-divider></v-divider>
            </v-col>
          </v-card>
        </v-tab-item>
        <v-tab-item>
          <v-card>
            <v-col class="pa-0" v-for="(reservation, i) in reservations" :key="i">
              <v-card-text>
                {{ reservation.lesson.title }} / {{ reservation.date }}
              </v-card-text>
              <v-divider></v-divider>
            </v-col>
          </v-card>
        </v-tab-item>
        <v-tab-item>
          <v-card>
            <v-col class="pa-0" v-for="(review, i) in reviews" :key="i">
              <v-card-text>
                {{ review.rate }} / {{ review.review }}
              </v-card-text>
              <v-divider></v-divider>
            </v-col>
          </v-card>
        </v-tab-item>
      </v-tabs>
    </v-row>
  </v-container>
</template>

<script>
import { mapState } from 'vuex';

export default {
  props: ['user', 'posts', 'likes', 'bookmarks', 'reservations', 'reviews'], 

  data:() => ({
    follow: false,
    message: 'フォロー中',
    color: 'blue white--text'
  }),

  computed: {
    ...mapState({
      loginUser: (state) => state.authentication.loginUser
    })
  },

  mounted() {
    if (this.$auth.loggedIn) {
      this.follow = false
      this.user.followers.forEach((f) => {
        if (this.loginUser.id === f.id) {
          this.follow = true
        }
      })
    }
  },

  methods: {
    mouseover() {
      this.color = 'red white--text'
      this.message = 'フォロー解除'
    },
    mouseleave() {
      this.color = 'blue white--text'
      this.message = 'フォロー中'
    },
    followUser () {
      this.$axios.post('/v1/relationships', {
        user_id: this.loginUser.id,
        follower_id: this.user.id
      })
      .then((res) => {
        console.log(res)
        this.follow = true
      })
      .catch((err) => {
        console.log(err)
      })
    },
    unFollowUser () {
      this.$axios.delete('/v1/relationships', {
        user_id: this.loginUser.id,
        follower_id: this.user.id
      })
      .then((res) => {
        console.log(res)
        this.follow = false
      })
      .catch((err) => {
        console.log(err)
      })
    }
  }
}
</script>
