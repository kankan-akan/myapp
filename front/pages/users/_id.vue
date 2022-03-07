<template>
  <v-main>
    <v-container>
      <v-card max-width="700" class="justify-center mx-auto">
        <UserInfo :user="selectedUser" :posts="userPosts" :likes="userLikes"/>
      </v-card>
    </v-container>
  </v-main>
</template>

<script>
export default {
  data: () => ({
    selectedUser: [ ],
    userPosts: [ ],
    userLikes: [ ]
  }),

  created() {
    this.$axios.get(`/v1/users/${this.$route.params.id}`)
      .then((res) => {
        this.selectedUser = res.data
      })
    this.$axios.get(`/v1/posts/user_posts/${this.$route.params.id}`)
      .then((res) => {
        this.userPosts = res.data
      })
    this.$axios.get(`/v1/likes/user_likes/${this.$route.params.id}`)
      .then((res) => {
        this.userLikes = res.data
      })
  }

}
</script>