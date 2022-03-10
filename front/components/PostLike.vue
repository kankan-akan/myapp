<template>
  <v-container>
    <v-row>
    <v-col >
      <div>post_id:{{ post.id }}</div>
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
    </v-col>
    </v-row>
  </v-container>
</template>

<script>
import { mapState } from 'vuex';

export default {
  props: [ 'post' ],

  data: () => ({
    isActive: false

  }),

  computed: {
    ...mapState ({
      loginUser: (state) => state.authentication.loginUser
    })
  },

  watch: {
    },

  mounted() {
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
      })
      .catch((err) => {
        console.log(err)
      })
    }
  },

}
</script>
