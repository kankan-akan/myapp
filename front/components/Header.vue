<template>
  <div>
    <v-app-bar 
      app
      color="blue lighten-4"
    >
      <v-app-bar-nav-icon 
        v-if="$store.state.auth.loggedIn"
        @click="drawer = !drawer"
      >
      </v-app-bar-nav-icon>

      <v-toolbar-title>
        <NuxtLink 
          to="/"
          class="header-logo my-auto"
        >
          LOGO
        </NuxtLink>
      </v-toolbar-title>
      <div>$store.state.auth.loggedIn: {{ $store.state.auth.loggedIn }}</div>
      <div>$auth.loggedIn: {{ $auth.loggedIn }}</div>
      <v-row align="center">
        <v-spacer></v-spacer>
        <div v-if="$store.state.auth.loggedIn">
          <v-btn @click="logout()">
            LOGOUT
          </v-btn>
          <v-btn large to="/post">
            <v-icon>{{ 'mdi-pencil-plus' }}</v-icon>
            <div>投稿する</div>
          </v-btn>
        </div>
        <div v-else>
          <v-btn
            color="primary" 
            large
            text
            to ="/loginForm"
          >
            <v-icon>mdi-account-arrow-left-outline</v-icon>
            ログイン
          </v-btn>

          <v-btn 
            class="my-1"
            to="/user/create" 
            outlined 
            rounded 
            large
          >
            新規登録
          </v-btn>
        </div>
      </v-row>
    </v-app-bar>
    <v-navigation-drawer
      v-if="$store.state.auth.loggedIn"
      v-model="drawer"
      fixed
      temporary
    >
      <v-sheet
        color="grey lighten-5"
        class="pa-4"
      >
        <v-avatar
          v-if="loginUser.avatar && loginUser.avatar.url"
          class="mb-4"
          size="100"
        >
          <img :src="loginUser.avatar.url">
        </v-avatar>
        <div class="text-h5">{{ loginUser.name }}</div>
        <div class="text-subtitle-2">@{{ loginUser.user_id }}</div>
      </v-sheet>

      <v-divider></v-divider>

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
    </v-navigation-drawer>
  </div>
</template>

<script>
import { mapState } from 'vuex'

export default {
  data: () => ({
    drawer: null
  }),

  methods: {
    logout() {
      this.$auth.logout();
      this.$store.commit('myData/setLoginUser', null)
      // window.localStorage.removeItem('persisted-key')
    }
  },

  computed: {
    ...mapState({
      loginUser: (state) => state.myData.loginUser
    })
  },
}
</script>
