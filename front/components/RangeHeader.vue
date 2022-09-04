<template>
  <div>
    <RangeNavBar />
    <v-app-bar
      app
      clipped-left
      color="blue lighten-4"
    >
      <v-row>
        <NuxtLink to="/">
          <img class="my-2" src="~/assets/image/logo.png" width="280">
        </NuxtLink>
        <div class="d-flex align-end my-auto font-weight-bold">＜練習場管理者専用ページ＞</div>
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
    setTimeout(this.getRangeData, 300)
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