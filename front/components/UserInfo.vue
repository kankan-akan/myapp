<template>
  <v-container>
    <div class="d-flex flex-no-wrap justify-space-between">
      <v-card-title class="pa-2">@{{ user.user_id }}</v-card-title>
      <BtnFollow v-if="loginUser.id !== user.id" :user="user" />
    </div>

    <v-divider></v-divider>

    <div class="d-flex justify-space-around">
      <div class="ma-4">
        <v-avatar v-if="user.avatar && user.avatar.url" size="120">
          <img :src="user.avatar.url">
        </v-avatar>
        <v-avatar v-else size="120" color="indigo">
          <v-icon dark size="80">mdi-account</v-icon>
        </v-avatar>
      </div>
      <v-col>
        <v-col class="text-h5 mx-1">{{ user.name }}</v-col>
        <FollowCount :user="user" />
      </v-col>
    </div>

    <v-row>
      <v-tabs  fixed-tabs color="cyan">
        <v-tab>post</v-tab>
        <v-tab>like</v-tab>
        <template v-if="loginUser && loginUser.id == user.id">
          <v-tab>bookmark</v-tab>
          <v-tab>reservation</v-tab>
          <v-tab>review</v-tab>
        </template>


        <v-tab-item>
          <v-container>
            <v-col class="pa-1" v-for="post in posts" :key="post.id">
              <v-card class="pa-2">
                <div class="d-flex">
                  <v-avatar v-if="post.image && post.image.url" tile size="140">
                    <img :src="post.image.url">
                  </v-avatar>
                  <v-avatar v-else color="grey lighten-2" tile size="140">
                    <v-icon>mdi-image-outline</v-icon>
                  </v-avatar>
                  <div>
                      <v-chip v-if="post.range" class="ml-2" outlined># {{ post.range }}</v-chip>
                    <v-card-text>
                      <div class="kaigyo">{{ post.content }}</div>
                    </v-card-text>
                    <v-menu v-if="loginUser && loginUser.id == user.id" offset-y>
                      <template v-if="loginUser && loginUser.id == user.id" v-slot:activator="{ on, attrs }">
                        <v-btn
                          class="post-trash"
                          v-bind="attrs"
                          v-on="on"
                          icon
                        >
                          <v-icon color="red">mdi-trash-can-outline</v-icon>
                        </v-btn>
                      </template>
                      <v-list>
                        <v-list-item>
                          <v-list-item-title
                            class="cursor"
                            @click="deletePost(post.id)"
                          >
                            投稿を削除
                          </v-list-item-title>
                        </v-list-item>
                      </v-list>
                    </v-menu>
                    <div class="like-btn">
                      <BtnLike :post="post" />
                    </div>
                  </div>
                </div>
              </v-card>
            </v-col>
          </v-container>
        </v-tab-item>
        <v-tab-item>
          <v-container>
            <v-col class="pa-1" v-for="(like, i) in likes" :key="i">
              <v-card class="pa-2">
                <div class="d-flex">
                  <v-avatar tile size="140">
                    <img :src="like.post.image.url">
                  </v-avatar>
                  <v-card-text>
                    <div class="kaigyo">{{ like.post.content }}</div>
                    <div class="like-btn">
                      <BtnLike :post="like.post" />
                    </div>
                  </v-card-text>
                </div>
              </v-card>
            </v-col>
          </v-container>
        </v-tab-item>
        <v-tab-item>
          <v-card>
            <v-col
              class="pa-1"
              v-for="(bookmark, i) in bookmarks"
              :key="bookmark.id"
            >
              <v-card-text class="d-flex justify-space-between">
                <div>
                  <div class="grey--text text--darken-2">{{ bookmark.range_outline.city }}</div>
                  <div class="my-1 text-h5">{{ bookmark.range_outline.name }}</div>
                  <div class="grey--text text--darken-2">{{ bookmark.range_outline.address }}</div>
                </div>
                <div class="d-flex">
                  <DetailIndex class="align-center" :place="bookmark.range_outline" />
                  <BtnBookmark :outline="bookmark.range_outline" />
                </div>
              </v-card-text>
              <v-divider v-if="i < bookmarks.length -1" :key="i" class="grey lighten-2"></v-divider>
            </v-col>
          </v-card>
        </v-tab-item>
        <v-tab-item>
          <v-card>
            <v-col class="pa-0" v-for="(reservation, i) in reservations" :key="i">
              <v-card-text class="d-flex justify-space-between">
                <div>
                  <div class="text-h6">{{ reservation.lesson.title }}</div>
                  <div class="text-subtitle-1">{{ reservation.date }}</div>
                  <v-btn
                    text
                    color="primary"
                    @click="showLesson(reservation.lesson.id)"
                  >
                    詳細
                  </v-btn>
                </div>
                <div>
                  <PostReview class="mb-2" :reservation="reservation" />
                  <DeleteReservation :reservation="reservation" />
                </div>
              </v-card-text>
              <v-divider v-if="i < reservations.length -1" :key="i" class="grey lighten-2"></v-divider>
            </v-col>
          </v-card>
        </v-tab-item>
        <v-tab-item>
          <v-card>
            <v-col class="pa-0" v-for="(review, i) in reviews" :key="i">
              <v-card-text>
                <div class="d-flex justify-space-between">
                  <div class="ml-3 d-flex align-end">レッスン名：{{ review.lesson.title }}</div>
                  <UpdateReview :review="review" />
                </div>
                <v-col class="text-h6">{{ review.title }}</v-col>
                <v-rating
                  class="ml-3"
                  v-model="review.rate"
                  background-color="grey"
                  color="yellow accent-4"
                  dense
                  half-increments
                  size="25"
                  readonly
                ></v-rating>
                <v-col class="kaigyo">{{ review.content }}</v-col>
              </v-card-text>
              <v-divider v-if="i < reviews.length -1" :key="i" class="grey lighten-2"></v-divider>
            </v-col>
          </v-card>
        </v-tab-item>
      </v-tabs>
    </v-row>
  </v-container>
</template>

<script>
import { mapState, mapActions } from 'vuex';

export default {
  props: ['user', 'posts', 'likes', 'bookmarks', 'reservations', 'reviews'],

  data:() => ({
  }),

  computed: {
    ...mapState({
      loginUser: (state) => state.myData.loginUser
    })
  },

  methods: {
    ...mapActions ({
      getPost: 'myData/getPost'
    }),
    showLesson(id) {
      this.$router.push(`/lessons/${id}`)
    },
    deletePost (id) {
      this.$axios.delete(`v1/posts/${id}`)
      .then((res) => {
        this.getPost()
        this.$store.dispatch(
          'snackbar/showMessage', {
            icon: 'mdi-checkbox-marked-circle-outline',
            message: '投稿を削除しました。',
            type: 'success',
            status: true,
          },
          { root: true }
        )
      })
      .catch((err) => {
        this.$store.dispatch(
          'snackbar/showMessage', {
            icon: 'mdi-alert-outline',
            message: '削除に失敗しました。',
            type: 'error',
            status: true,
          },
          { root: true }
        )
      })
    }
  }
}
</script>

<style scoped>
  .post-trash {
    position: absolute;
    top: 4px;
    right: 8px;
  }
</style>