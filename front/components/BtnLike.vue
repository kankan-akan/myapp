<template>
  <div>
    <!-- <div>post_id:{{ post.id }}</div> -->
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
    <span class="grey--text text--darken-1">{{ countLike }}</span>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex';

export default {
  props: [ 'post' ],

  data: function () {
    return {
      isActive: false,
      countLike: this.post.like_users.length
    }
  },

  computed: {
    ...mapState ({
      loginUser: (state) => state.myData.loginUser
    }),
  },

  watch: {

    },

  mounted() {
    if (this.$store.state.auth.loggedIn) {
      this.isActive = false
        this.post.like_users.forEach((f) => {
          if (this.loginUser.id === f.id) {
            this.isActive = true
          }
        })
    }
  },

  methods: {
    ...mapActions({
      loginCheck: 'snackbar/loginCheck'
    }),
    postLike() {
      if(this.$store.state.auth.loggedIn) {
        this.$axios.post('/v1/likes', {
          user_id: this.loginUser.id,
          post_id: this.post.id
        })
        .then((res) => {
          if(res.data.status == 200) {
            this.isActive = true
          }
          this.increment()
        })
        .catch((err) => {
          console.log(err)
        })
      } else {
        this.loginCheck()
      }
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
        this.decrement()
      })
      .catch((err) => {
        console.log(err)
      })
    },
    // count() {
    //   this.$axios.get(`/v1/posts/${this.post.id}/likes/count`)
    //   .then((res) => {
    //     this.countLike = res.data
    //   })
    // },
    increment() {
      this.countLike++
    },
    decrement() {
      this.countLike--
    }
  },

}
</script>
