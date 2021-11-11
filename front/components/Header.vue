<template>
    <v-app-bar 
      app 
      height="100" 
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
          <h2>{{ $store.state.auth.loggedIn }}</h2>
          <h2>{{ $auth.$state.loggedIn }}</h2>
          <p>{{ $auth.user }}</p>
          <div v-if ="$auth.loggedIn">
            <v-btn>
              {{ user.userId }}
            </v-btn>
            <v-btn @click ="$auth.logout()">
             LOGOUT
            </v-btn>
          </div>

          <div v-else>
            <v-btn to ="/loggedIn">
              logout
            </v-btn>
            <v-btn
              color="primary" 
              dark 
              large
              to ="/loginForm"
            >
              ログイン
              <v-icon>mdi-account-arrow-left-outline</v-icon>
            </v-btn>

            <v-btn 
              color="" 
              class="my-1"
              to="/user/create" 
              outlined 
              dark
              large
            >
              新規登録
            </v-btn>
          </div>
        </v-row>
      </v-container>
    </v-app-bar>
</template>

<script>
import Vuex from 'vuex';

export default {

  computed: {
    user () {
      return this.$auth.user
    }
  },
  method: {
    logout() {
      this.$auth.logout();
    },
  },

}

</script>

<style>

</style>