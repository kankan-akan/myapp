<template>
  <div>
    <RangeNavBar />
    <v-app-bar 
      app
      clipped-left
      color="blue lighten-2"
    >
      <v-row class ="justify-space-between">
        <NuxtLink 
          to="/"
          class="header-logo my-auto"
        >
          LOGO
        </NuxtLink>
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
    setTimeout(this.getRangeData, 200)
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