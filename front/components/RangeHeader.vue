<template>
  <div>
    <v-app-bar
      app
      clipped-left
      color="blue lighten-4"
      height=90
    >
      <v-row>
        <NuxtLink to="/">
          <img class="d-flex align-center my-auto" src="~/assets/image/Design1.png" width="150">
        </NuxtLink>
        <div class="d-flex my-auto font-weight-bold">＜練習場管理者専用ページ＞</div>
      </v-row>
    </v-app-bar>
  </div>
</template>

<script>
import { mapActions, mapState } from 'vuex';

export default {

  computed: {
    ...mapState({
      loginRange: (state) => state.rangeAuth.loginRange
    }),
  },

  mounted () {
    setTimeout(this.getRangeData, 700)
    this.getLesson()
  },

  methods: {
    ...mapActions({
      getRangeData: 'rangeAuth/getRangeData',
      getLesson: 'rangeAuth/getLesson'
    })
  }

}
</script>