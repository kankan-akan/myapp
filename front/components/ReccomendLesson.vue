<template>
  <v-sheet
    class="mx-auto reccomend justify-center"
    elevation="8"
  >
    <div class="mx-4 pt-2 text-subtitle-1 font-weight-bold">ベストスコアが近いユーザーが利用しています</div>
    <v-slide-group
      v-model="model"
      class="pa-3"
      active-class="success"
      show-arrows
    >
      <v-slide-item
        v-for="n in 4"
        :key="n"
        v-slot="{ active, toggle }"
      >
        <v-card
          :color="active ? undefined : 'grey lighten-1'"
          class="mx-4"
          height="90"
          width="300"
          @click="toggle"
        >
          <v-row
            class="fill-height"
            align="center"
            justify="center"
          >
            <v-scale-transition>
              <v-icon
                v-if="active"
                color="white"
                size="48"
                v-text="'mdi-close-circle-outline'"
              ></v-icon>
            </v-scale-transition>
          </v-row>
        </v-card>
      </v-slide-item>
    </v-slide-group>
  </v-sheet>
</template>

<script>
  export default {
    data: function () {
      return {
        model: null,
        score: this.$store.state.myData.loginUser.score,
        reccomendLesson: []
      }
    },

    mounted () {
      this.$axios.get('/v1/lessons/reccomends', {
        params: {
          score: this.score
        }
      })
      .then((res) => {
        console.log(res)
        this.reccomendLesson = res.data
      })
    }
  }
</script>

<style scoped>
  .reccomend {
    position: sticky;
    bottom: 0;
    background-color: rgba(255, 255, 255, 0.7);

  }
</style>