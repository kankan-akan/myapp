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
        <template v-if="loginRange">
          <h2>{{ $store.state.rangeAuth.isLoggedIn }}</h2>
          <div>{{ loginRange.name }}</div>
        </template>
        <v-menu 
          bottom
          offset-y
        >
          <template v-slot:activator="{ on, attrs }">
            <v-btn
              class="align-self-center"
              color="white"
              v-bind="attrs"
              v-on="on"
             large
              icon
            >
              <v-icon >{{ 'mdi-cog' }}</v-icon>
            </v-btn>
          </template>
          <v-list>
            <v-list-item to ="/rangeAdmin/account">
              <v-list-item-title>アカウント設定</v-list-item-title>
            </v-list-item>
            <v-divider></v-divider>
            <v-list-item to ="">
              <v-list-item-title>ログアウト</v-list-item-title>
            </v-list-item>
          </v-list>
        </v-menu>
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
    setTimeout(this.getRangeData, 100)
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