<template>
  <v-container>
    <v-row dense>
      <v-col
        v-for="(post, i) in allPost"
        :key=" i "
        cols="12"
        xs="12"
        sm="4"
      >
        <v-card @click.stop="openPost(post)">

          <UserIdLavel @click.stop :user="post.user" />

          <v-img
            v-if="post.image && post.image.url"
            class="align-end"
            :src="post.image.url"
            height="280"
          >
            <v-chip v-if="post.range" class="ma-1" >#{{ post.range }}</v-chip>
          </v-img>
          <v-sheet
            v-else
            class="d-flex justify-center align-center grey lighten-2 sheet"
            height="280"
          >
            <v-icon size="80">mdi-image</v-icon>
            <v-chip outlined v-if="post.range" class="chip">#{{ post.range }}</v-chip>
          </v-sheet>

          <v-list-item>
            <v-list-item-content>
              <v-list-item-subtitle>{{ post.content }}</v-list-item-subtitle>
            </v-list-item-content>
          </v-list-item>

          <v-divider></v-divider>
          <div @click.stop class="pa-2 d-flex justify-end align-center">
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
        <div class="d-flex flex-nowrap ">
          <v-row>
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
          </v-row>
          <v-row>
          <v-col>
            <div class="d-flex justify-space-around">
              <UserIdLavel :user=currentPost.user />
              <div>
                <v-icon large @click.stop="dialog = false">mdi-close</v-icon>
              </div>
            </div>
            <v-col class="kaigyo">{{ currentPost.content }}</v-col>
          </v-col>
          </v-row>
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

.sheet {
  position: relative;
}

.chip {
  position: absolute;
  left: 4px;
  bottom: 4px;
}

</style>