<template>
  <div>
    <v-btn
      v-if="isActive"
      icon
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
import { mapState } from 'vuex';

export default {
  props: ['outline'],

  data: () => ({
    isActive: false
  }),

  computed: {
    ...mapState({
      loginUser: (state) => state.authentication.loginUser
    })
  },

  mounted() {
    if (this.$auth.loggedIn) {
      this.isActive = false
      this.outline.bookmark_users.forEach((f) => {
        if (this.loginUser.id === f.id) {
          this.isActive = true
        }
      })
    }
  },

  methods: {
    postBookmark() {
      this.$axios.post('/v1/bookmarks', {
        user_id: this.loginUser.id,
        range_outline_id: this.outline.id
      })
      .then((res) => {
        console.log(res)
        this.isActive = true
      })
      .catch((err) => {
        console.log(err)
      })
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
