<template>
  <v-sheet
    class="reccomend rounded-lg mx-2"
    elevation="8"
  >
    <div class="title font-weight-bold rounded-lg">
      <p class="title-content ml-2 my-1">ベストスコアが近いユーザーが利用しているレッスン</p>
    </div>
    <template v-if="reccomendLesson">
      <v-slide-group
        v-model="model"
        class="py-2"
        active-class="success"
        show-arrows
      >
        <v-slide-item
          v-for="(lesson, i) in reccomendLesson"
          :key="i"
        >
          <v-card
            class="mx-2 rounded-lg"
            height="100"
            width="250"
            elevation="4"
            @click="showLesson(lesson.id)"
          >
            <v-list
              class="mx-auto"
              width="250"
              height="95"
              three-line
            >
              <v-list-item dense>
                <v-list-item-content>
                  <v-list-item-title class="font-weight-bold">{{ lesson.title }}</v-list-item-title>
                  <v-list-item-subtitle>{{ lesson.coach }} インストラクター</v-list-item-subtitle>
                  <v-divider></v-divider>
                  <v-list-item-subtitle class="mt-2">{{ lesson.content }}</v-list-item-subtitle>
                </v-list-item-content>
              </v-list-item>
            </v-list>
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
      setTimeout(this.getReccomends, 500)
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
    background-color: #96ffa9e7;
  }

  .title {
    background-color: #ffff;
    background: linear-gradient(#ffff, #f0f0f0);
    box-shadow: 0 5px 5px #f0f0f0;
    border-top: 5px solid #0ca111;
  }

  @media screen and (min-width: 601px) {
    .title-content {
      font-size: 20px;
    }
  }

  @media screen and (max-width: 600px) {
    .title-content {
      font-size: 13px;
    }
  }

</style>