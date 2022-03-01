<template>
  <v-app>
    <v-main >
    <v-container>
      <v-row>
        <v-col
          v-for="  (post, i) in allPost"
          :key=" i "
          
          cols="3"
        > 
        <div @click="user()">@{{ post.user.user_id }}</div>
          <div>{{ post.content }}</div>
        </v-col>
      </v-row>
    </v-container>
    </v-main>
  </v-app>
</template>

<script>

export default {
  data: () => ({
    allPost: [ ]
  }),

  created: async function() {
      await this.$axios.get('/v1/posts')
      .then((res) => {
        this.allPost = res.data
      })
  }

}
</script>

<style scoped>
.v-img {
  transition: opacity .4s ease-in-out;
}

  .on-hover {
    opacity: 0.6;
    transition: opacity .4s ease-in-out;
  }

  .show-content {
  color: rgba(255, 255, 255, 1) !important;
}
</style>