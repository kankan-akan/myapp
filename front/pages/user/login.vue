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
          <p>{{ $auth.user }}</p>
          <v-spacer />
            <v-btn>
              username
            </v-btn>
            <v-btn @click ="$auth.logout()">
             LOGOUT
            </v-btn>
        </v-row>
      </v-container>
    </v-app-bar>

</template>

<script>
// import Vuex from 'vuex';

// Vue.use(Vuex);

export default {
  data: () => ({
    
  }),

  computed: {
    user () {
      return this.$auth.user
    }
  },

  methods: {

  },
}

</script>

<style>

</style>