<template>
  <v-container>
    <v-row class="justify-center pa-3">
      <!-- <v-avatar size="120">
        <img
          :src="img"
          
        >
      </v-avatar> -->
      <slot name="name"></slot>
    </v-row>
      <v-row class="justify-center">
        <slot name="id"></slot>
    </v-row>

    <!-- <v-row>
      <v-tabs  fixed-tabs color="cyan">
        <v-tab>post</v-tab>
        <v-tab>like</v-tab>
        <v-tab>bookmark</v-tab>
        <v-tab>reservation</v-tab>
        <v-tab>review</v-tab>

        <v-tab-item>
          <v-card>
            <v-col class="pa-1" v-for="(post, i) in post" :key="i">
              <v-card class="pa-2">
                <div class="d-flex">
                  <v-avatar size="120">
                    <v-img :src="items.src"></v-img>
                  </v-avatar>
                  <v-card-text v-text="post.content"></v-card-text>
                </div>
              </v-card>
            </v-col>
            </v-card>
        </v-tab-item>
        <v-tab-item>
          <v-card>
            <v-col v-for="(like, i) in like" :key="i">{{ }}</v-col>
          </v-card>
        </v-tab-item>
        <v-tab-item>
          <v-card>
            <v-col 
              v-for="(bookmark, i) in bookmark" 
              :key="i"
            >
              {{ bookmark.range_outline.name }}
            </v-col>
          </v-card>
        </v-tab-item>
        <v-tab-item>
          <v-card>

          </v-card>
        </v-tab-item>
        <v-tab-item>
          <v-card>

          </v-card>
        </v-tab-item>
      </v-tabs>
    </v-row> -->
  </v-container>
</template>

<script>

export default {

}
</script>
