<template>
  <v-app>
    <v-app-bar 
      app 
      height="80" 
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
          <h3>{{ $auth.loggedIn }}</h3>
          <div v-if ="$auth.loggedIn">
            <v-btn @click ="$auth.logout()">
             LOGOUT
            </v-btn>
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
                  @{{ loginUser.user_id }}
                </v-btn>
              </template>
              <v-list>
                <v-list-item to ="/user/profile">
                  <v-list-item-title>マイページ</v-list-item-title>
                </v-list-item>
                <v-list-item to ="/user/myAccount">
                  <v-list-item-title>アカウント設定</v-list-item-title>
                </v-list-item>
                <v-divider></v-divider>
                <v-list-item to ="/logout">
                  <v-list-item-title>ログアウト</v-list-item-title>
                </v-list-item>
              </v-list>
            </v-menu>
          </div>
          <div v-else>
            <v-btn @click ="$auth.logout()">
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

    <Nuxt />

  </v-app>
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