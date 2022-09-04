<template>
  <div>
    <v-btn
      v-if="isActive"
      icon
      color="amber"
      @click="deleteBookmark()"
    >
      <v-icon>mdi-bookmark</v-icon>
    </v-btn>
    <v-btn
      v-else
      icon
      @click="postBookmark()"
    >
      <v-icon>mdi-bookmark-outline</v-icon>
    </v-btn>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex';

export default {
  props: ['outline'],

  data: () => ({
    isActive: false
  }),

  computed: {
    ...mapState({
      loginUser: (state) => state.myData.loginUser
    })
  },

  mounted() {
    setTimeout(this.activeCheck, 1000)
  },

  methods: {
    ...mapActions({
      loginCheck: 'snackbar/loginCheck'
    }),
    activeCheck() {
      if (this.$store.state.auth.loggedIn) {
        this.isActive = false
        this.outline.bookmark_users.forEach((f) => {
          if (this.loginUser && this.loginUser.id === f.id) {
            this.isActive = true
          }
        })
      }
    },
    postBookmark() {
      if(this.$store.state.auth.loggedIn) {
        this.$axios.post('/v1/bookmarks', {
          user_id: this.loginUser.id,
          range_outline_id: this.outline.id
        })
        .then((res) => {
          this.isActive = true
        })
        .catch((err) => {
          console.log(err)
        })
      }else{
        this.loginCheck()
      }
    },
    deleteBookmark() {
      this.$axios.delete('/v1/bookmarks', {
        params: {
          user_id: this.loginUser.id,
          range_outline_id: this.outline.id
        }
      })
      .then((res) => {
        console.log(res)
        this.isActive = false
      })
      .catch((err) => {
        console.log(err)
      })
    }
  }
}
</script>
