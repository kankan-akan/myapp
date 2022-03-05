<template>
  <v-main>
    <v-container>
      <v-card max-width="700" class="justify-center mx-auto">
          <v-card-title>profile</v-card-title>
          <!-- <UserInfo :user="selectedUser" :posts="posts" :likes="likes" /> -->
        </v-card>
    </v-container>
  </v-main>
</template>

<script>
export default {
  data: () => ({
    selectedUser: [ ]
  }),

  created () {
    this.$axios.get(`/v1/users/${this.$route.params.id}`)
      console.log((res) =>  {
        this.selectedUser = res.data
      })
  },


}
</script>