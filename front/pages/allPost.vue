<template>
  <v-container>
    <v-row dense>
      <v-col
        v-for="(post, i) in allPost"
        :key=" i "
        cols="3"
      > 
        <v-card @click.stop="openDialog(post)">

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
    <DetailPost :dialog="dialog" :post="currentPost" @result="response"/>
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
    openDialog(post) {
      this.dialog = true
      this.currentPost = post
    },
    response() {
    this.dialog = false
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