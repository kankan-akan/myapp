<template>
  <v-container>
    <v-row dense>
      <v-col
        v-for="(post, i) in allPost"
        :key=" i "
        cols="4"
      > 
        <v-card>
          <v-card-title>
            <div class="d-flex align-end">
              <v-avatar v-if="post.user.avatar.url" size="40px">
                <img :src="post.user.avatar.url">
              </v-avatar>
              <v-avatar v-else size="40px" color="indigo">
                <v-icon dark size="20px">mdi-account</v-icon>
              </v-avatar>
                <div class="cursor text-h6 px-2" @click="user(post.user.id)">@{{ post.user.user_id }}</div>
            </div>
          </v-card-title>
        <div class="d-flex flex-no-wrap justify-space-between">
          <v-card-text>
            <v-col class="kaigyo">{{ post.content }}</v-col>
            <div>user_id:{{ post.user.id }}</div>
          </v-card-text>
          <v-img max-width="150px" max-height="180px" :src="post.image.url"></v-img>
        </div>
        <v-divider></v-divider>
        <div class="pa-2 d-flex justify-end align-center">
          <PostLike :post="post"/>
        </div>
       
        <!-- <v-avatar tile size="210" class="mx-auto">
          <v-img  :src="post.image.url"></v-img>
        </v-avatar> -->
        </v-card>
      </v-col>
    </v-row>
  </v-container>
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
  },

  methods: {
    user(id) {
      this.$router.push(`/users/${id}`)
    }
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