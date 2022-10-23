<template>
  <v-sheet
    class="my-2 reccomend rounded-xl"
    elevation="8"
  >
    <div class="mx-4 pt-2 text-subtitle-1 font-weight-bold">ベストスコアが近いユーザーが利用しているレッスン</div>
    <template v-if="reccomendLesson">
      <v-slide-group
        
        v-model="model"
        class="pa-3"
        active-class="success"
        show-arrows
      >
        <v-slide-item
          v-for="(lesson, i) in reccomendLesson"
          :key="i"
        >
          <v-card
            class="mx-5"
            height="100"
            width="300"
            @click="showLesson(lesson.id)"
          >
            <v-row class="fill-height">
              <v-list three-line>
                <v-list-item>
                  <v-list-item-content>
                    <v-list-item-title class="font-weight-bold">{{ lesson.title }}</v-list-item-title>
                    <v-list-item-subtitle class="mb-2">{{ lesson.coach }} インストラクター</v-list-item-subtitle>
                    <v-list-item-subtitle>{{ lesson.content }}</v-list-item-subtitle>
                  </v-list-item-content>
                </v-list-item>
              </v-list>
            </v-row>
          </v-card>
        </v-slide-item>
      </v-slide-group>
    </template>
    <template v-else>
      <v-col class="d-flex justify-center align-center">
        <div class="mx-6 grey--text lighten-1 font-weight-bold">ベストスコアを登録してみよう！</div>
        <v-btn rounded outlined to="/user/myAccount">アカウント設定</v-btn>
      </v-col>
    </template>
  </v-sheet>
</template>

<script>
import { mapState } from 'vuex'

  export default {
    data: function () {
      return {
        model: null,
        reccomendLesson: []
        // score: this.$store.state.myData.loginUser.score,
      }
    },

    computed: {
      ...mapState({
      loginUser: (state) => state.myData.loginUser
      })
    },

    mounted () {
      setTimeout(this.getReccomends, 300)
    },

    methods: {
      showLesson(id) {
        this.$router.push(`/lessons/${id}`)
      },
      getReccomends () {
        if (this.$store.state.auth.loggedIn) {
          this.$axios.get('/v1/lessons/reccomends', {
            params: {
              score: this.loginUser.score
            }
          })
          .then((res) => {
            console.log(res)
            this.reccomendLesson = res.data
          })
        }
      }
    }
  }
</script>

<style scoped>
  .reccomend {
    position: sticky;
    bottom: 0;
    background-color: rgba(228, 228, 228, 0.8);

  }
</style>