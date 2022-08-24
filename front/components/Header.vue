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
      <v-btn text to="/rangeAdmin/info">練習場管理者の方はこちら</v-btn>
      <!-- <div>$store.state.auth.loggedIn: {{ $store.state.auth.loggedIn }}</div>
      <div>$auth.loggedIn: {{ $auth.loggedIn }}</div> -->
      <v-row align="center">
        <v-spacer></v-spacer>
        <div 
          class="mr-4"
          v-if="$store.state.auth.loggedIn"
        >
          <v-btn @click="logout()">
            LOGOUT
          </v-btn>
          <v-tooltip bottom>
            <template v-slot:activator="{ on, attrs }">
              <v-btn 
                large 
                icon 
                to="/"
                v-bind="attrs"
                v-on="on"
              >
                  <v-icon>mdi-home</v-icon>
                </v-btn>
            </template>
            <span>ホーム</span>
          </v-tooltip>
          <v-tooltip bottom>
            <template v-slot:activator="{ on, attrs }">
              <v-btn 
                large 
                icon 
                to="/post"
                v-bind="attrs"
                v-on="on"
              >
                  <v-icon>mdi-pencil-plus-outline</v-icon>
                </v-btn>
            </template>
            <span>新しい投稿</span>
          </v-tooltip>
          <v-tooltip bottom>
            <template v-slot:activator="{ on, attrs }">
              <v-btn 
                large 
                icon 
                to="/allPost"
                v-bind="attrs"
                v-on="on"
              >
                  <v-icon>mdi-magnify</v-icon>
                </v-btn>
            </template>
            <span>みんなの投稿</span>
          </v-tooltip>
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
            to="/create" 
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
        v-if="loginUser"
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
        <v-avatar v-else class="mb-4" size="100" color="indigo">
          <v-icon dark size="80">mdi-account</v-icon>
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
        <v-list-item to ="/user/logout">
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
