<template>
  <v-container>
    <v-card-title class="pa-2">@{{ user.user_id }}</v-card-title>
    <v-divider></v-divider>
    <v-row class="justify-center ma-auto pt-3">
      <v-avatar size="120">
        <img
          src="https://cdn.vuetifyjs.com/images/john.jpg"
        >
      </v-avatar>
    </v-row>
    <v-row class="justify-center">
      <div>{{ user.name }}</div>
    </v-row>

    <v-row>
      <v-tabs  fixed-tabs color="cyan">
        <v-tab>post</v-tab>
        <v-tab>like</v-tab>
        <v-tab>bookmark</v-tab>
        <v-tab>reservation</v-tab>
        <v-tab>review</v-tab>

        <v-tab-item>
          <v-card>
            <v-col class="pa-1" v-for="post in posts" :key="post.id">
              <v-card class="pa-2">
                <div class="d-flex">
                  <v-avatar size="120">
                    <v-img></v-img>
                  </v-avatar>
                  <v-card-text>
                    <div>{{ post.content }}</div>
                  </v-card-text>
                </div>
              </v-card>
            </v-col>
            </v-card>
        </v-tab-item>
        <v-tab-item>
          <v-card>
            <v-col class="pa-1" v-for="(like, i) in likes" :key="i">
              <v-card class="pa-2" >
                <div class="d-flex">
                  <v-avatar size="120">
                    <v-img></v-img>
                  </v-avatar>
                  <v-card-text>
                    <div>{{ like.post.content }}</div>
                  </v-card-text>
                </div>
              </v-card>
            </v-col>
          </v-card>
        </v-tab-item>
        <v-tab-item>
          <v-card>
            <v-col 
              class="pa-0"
              v-for="(bookmark, i) in bookmarks" 
              :key="i"
            >
            <v-card-text>
              {{ bookmark.range_outline.name }}
            </v-card-text>
              <v-divider></v-divider>
            </v-col>
          </v-card>
        </v-tab-item>
        <v-tab-item>
          <v-card>
            <v-col class="pa-0" v-for="(reservation, i) in reservations" :key="i">
              <v-card-text>
                {{ reservation.lesson.title }} / {{ reservation.date }}
              </v-card-text>
              <v-divider></v-divider>
            </v-col>
          </v-card>
        </v-tab-item>
        <v-tab-item>
          <v-card>
            <v-col class="pa-0" v-for="(review, i) in reviews" :key="i">
              <v-card-text>
                {{ review.rate }} / {{ review.review }}
              </v-card-text>
              <v-divider></v-divider>
            </v-col>
          </v-card>
        </v-tab-item>
      </v-tabs>
    </v-row>
  </v-container>
</template>

<script>

export default {
  props: ['user', 'posts', 'likes', 'bookmarks', 'reservations', 'reviews'], 
}
</script>
