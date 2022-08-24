<template>
  <v-container>
    <v-row dense>
      <v-col
        v-for="(post, i) in allPost"
        :key=" i "
        cols="3"
      > 
        <v-card @click.stop="openPost(post)">

          <UserIdLavel :user="post.user" />

          <v-img
            v-if="post.image && post.image.url"
            :src="post.image.url"
            max-height="280"
          ></v-img>
          <v-sheet
            v-else
            class="d-flex justify-center align-center grey lighten-2"
            height="280"
          >
            <v-icon size="80">mdi-image</v-icon>
          </v-sheet>
          
          <v-list-item>
            <v-list-item-content>
              <v-list-item-subtitle>{{ post.content }}</v-list-item-subtitle>
            </v-list-item-content>
          </v-list-item>
       
          <v-divider></v-divider>
          <div class="pa-2 d-flex justify-end align-center">
            <BtnLike :post="post"/>
          </div>
        </v-card>
      </v-col>
    </v-row>
    <v-dialog
      v-model="dialog"
      v-if="currentPost"
      width="850"
      @click.stop="dialog = false"
    >
      <v-card>
        <div class="d-flex flex-nowrap justify-space-between">
          <v-img
            v-if="currentPost.image.url"
            :src="currentPost.image.url"
            max-height="500"
            max-width="480"
            contain
          ></v-img>
          <v-sheet
            v-else
            class="grey lighten-2 d-flex justify-center align-center"
            height="500"
            width="480"
          >
            <v-icon size="80">mdi-image</v-icon>
          </v-sheet>
          <v-col>
            <div class="d-flex justify-space-around">
              <UserIdLavel :user=currentPost.user />
              <div>
                <v-icon large @click.stop="dialog = false">mdi-close</v-icon>
              </div>
            </div>
            <v-col class="kaigyo">{{ currentPost.content }}</v-col>
          </v-col>
        </div>
      </v-card>
    </v-dialog>
  </v-container>
</template>

<script>

export default {
  data: () => ({
    allPost: [ ],
    dialog: false,
    currentPost: null
  }),

  created: async function() {
      await this.$axios.get('/v1/posts')
      .then((res) => {
        this.allPost = res.data
      })
  },

  methods: {
    openPost(post) {
      this.currentPost = post
      this.dialog = true
    }
  }

}
</script>

<style scoped>
  .on-hover {
    opacity: 0.6;
    transition: opacity .4s ease-in-out;
  }

  .show-content {
  color: rgba(255, 255, 255, 1) !important;
}

</style>