<template>
  <div>
    <template v-if="loginUser.id !== user.id">
      <v-btn
        v-if="follow"
        :color="color"
        @click="unFollowUser()"
        @mouseover="mouseover()"
        @mouseleave="mouseleave()"
      >
        {{ message }}
      </v-btn>
      <v-btn v-else @click="followUser()">
        フォローする
      </v-btn>
    </template>
  </div>
</template>

<script>
import { mapActions, mapState } from 'vuex';

export default {
  props: [ 'user' ],

  data:() => ({
    follow: false,
    message: 'フォロー中',
    color: 'blue white--text'
  }),

  computed: {
    ...mapState({
      loginUser: (state) => state.myData.loginUser
    }),
    userFollow() {
      return this.$store.state.myData.loginUser
    },
  },

  watch: {
    userFollow() {
      if (this.$auth.loggedIn) {
        this.follow = false
        this.loginUser.followings.forEach((f) => {
          if (this.user.id === f.id) {
            this.follow = true
          }
        })
      }
    }
  },

  mounted() {
    if (this.$auth.loggedIn) {
      this.follow = false
      this.loginUser.followings.forEach((f) => {
        if (this.user.id === f.id) {
          this.follow = true
        }
      })
    }
  },

  methods: {
    ...mapActions({
      getLoginUser: 'myData/getLoginUser'
    }),
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
        this.getLoginUser()
      })
      .catch((err) => {
        console.log(err)
      })
    },
    unFollowUser () {
      this.$axios.delete('/v1/relationships', {
        params: {
          user_id: this.loginUser.id,
          follower_id: this.user.id
        }
      })
      .then((res) => {
        console.log(res)
        this.follow = false
        this.getLoginUser()
      })
      .catch((err) => {
        console.log(err)
      })
    }
  }
}
</script>
