<template>
<div>
  <RangeNavBar />
    <v-app-bar 
      app
      clipped-left
      color="blue lighten-2"
    >
      <v-container>
        <v-row class ="justify-space-between">
          <NuxtLink 
            to="/"
            class="header-logo my-auto"
          >
            LOGO
          </NuxtLink>
          <!-- <h2>{{ $store.state.auth.loggedIn }}</h2>
          <h3>{{ $auth.loggedIn }}</h3> -->
          <v-btn to="/rangeLogin">練習場管理者はこちら</v-btn>
          
        </v-row>
      </v-container>
    </v-app-bar>
  </div>
</template>

<script>
import { mapState } from 'vuex'

export default {

  method: {
    logout() {
      this.$auth.logout();
    },
  },

  computed: {
    ...mapState({
      loginUser: (state) => state.authentication.loginUser
    })
  },
}
</script>