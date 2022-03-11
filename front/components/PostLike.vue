<template>
  <v-container>
    <v-row>
      <v-col>
        <div>post_id:{{ post.id }}</div>
      </v-col>
    </v-row>
    <v-row>
      <v-btn
        v-if="isActive"
        icon
        color="pink"
        @click="unlike()"
      >
        <v-icon>{{ 'mdi-heart' }}</v-icon>
      </v-btn>
      <v-btn
        v-else 
        icon
        @click="postLike()"
      >
        <v-icon>{{ 'mdi-heart-outline' }}</v-icon>
      </v-btn>
      <!-- <div>{{ post.like_users.length }}</div> -->
      <div>{{ countLike }}</div>
    </v-row>
  </v-container>
</template>

<script>
import { mapState } from 'vuex';

export default {
  props: [ 'post' ],

  data: () => ({
    isActive: false,
    countLike: ' '
  }),

  computed: {
    ...mapState ({
      loginUser: (state) => state.authentication.loginUser
    }),
    
  },

  watch: {
    
    },

  mounted() {
    this.count()
    if (this.$auth.loggedIn) {
      this.isActive = false
        this.post.like_users.forEach((f) => {
          if (this.loginUser.id === f.id) {
            this.isActive = true
          }
        })
    }
  },

  methods: {
    postLike() {
      this.$axios.post('/v1/likes', {
        user_id: this.loginUser.id,
        post_id: this.post.id
      })
      .then((res) => {
        if(res.data.status == 200) {
          this.isActive = true
        }
        this.count()
      })
      .catch((err) => {
        console.log(err)
      })
    },
    unlike() {
      this.$axios.delete('/v1/likes', {
        params:{
          user_id: this.loginUser.id,
          post_id: this.post.id
        }
      })
      .then((res) => {
        if(res.data.status == 200) {
          this.isActive = false
        }
        this.count()
      })
      .catch((err) => {
        console.log(err)
      })
    },
    count() {
      this.$axios.get(`/v1/posts/${this.post.id}/likes/count`) 
      .then((res) => {
        this.countLike = res.data
      })
    }
  },

}
</script>
