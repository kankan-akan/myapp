<template>
  <div>
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
        <h2>{{ $store.state.auth.loggedIn }}</h2>
        <h3>{{ $auth.loggedIn }}</h3>
        <v-btn to="/rangeLogin">練習場管理者の方はこちら</v-btn>
        <div v-if ="$auth.loggedIn">
          <v-btn @click ="$auth.logout()">
            LOGOUT
          </v-btn>
          <v-btn icon large to="/post">
            <v-icon>
              {{ 'mdi-pencil-plus' }}
            </v-icon>
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
    </v-app-bar>
  </div>
</template>

<script>
import { mapState } from 'vuex'

export default {

  methods: {
    logout() {
      this.$auth.logout();
      this.$store.commmit('myData/loginUser', false)
    }
  },

  computed: {
    ...mapState({
      loginUser: (state) => state.myData.loginUser
    })
  },
}
</script>
