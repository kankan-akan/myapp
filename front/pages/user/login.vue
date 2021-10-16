<template>
  <v-app>
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
            <v-btn @click ="$auth.logout()">
             logout
            </v-btn>
           <div>
            <v-menu 
              bottom
              offset-y
            >
              <template v-slot:activator="{ on, attrs }">
                <v-btn
                  color="primary"
                  dark
                  v-bind="attrs"
                  v-on="on"
                >
                  @username
                </v-btn>
              </template>
              <v-list>
                <v-list-item
                  v-for="(item, index) in items"
                  :key="index"
                  :to="item.link"
                  link
                >
                  <v-list-item-title>{{ item.title }}</v-list-item-title>
                </v-list-item>
              </v-list>
            </v-menu>
          </div>
        </v-row>
      </v-container>
    </v-app-bar>
  </v-app>
</template>

<script>
// import Vuex from 'vuex';

// Vue.use(Vuex);

export default {
  data: () => ({
    items: [
        { title: 'プロフィール', link: '' },
        { title: 'ユーザー設定', link: '' },
        {title: 'ログアウト', link: '/user/logout'},

      ],
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