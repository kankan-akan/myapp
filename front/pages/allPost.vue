<template>
  <v-main>
    <v-container>
      <v-row>
        <v-col
          v-for="(post, i) in allPost"
          :key=" i "
          cols="3"
        > 
          <v-card>
            <v-card-title>
              <div class="d-flex align-end">
                <v-avatar size="40px">
                  <img :src="post.user.avatar.url">
                </v-avatar>
                  <div class="text-h6" @click="user(post.user.id)">@{{ post.user.user_id }}</div>
              </div>
            </v-card-title>

            <v-card-text>
              <v-col>{{ post.content }}</v-col>
              <div>user_id:{{ post.user.id }}</div>
            </v-card-text>

            <PostLike :post="post"/>

            <v-img :src="post.image.url"></v-img>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </v-main>
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