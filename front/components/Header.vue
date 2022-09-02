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
      <v-row align="center" justify="space-between">
        <div class="d-flex align-center">
          <v-toolbar-title>
            <NuxtLink to="/">
              <img class="my-auto" src="~/assets/image/logo.png" width="280">
            </NuxtLink>
          </v-toolbar-title>
        </div>
        <!-- <div>$store.state.auth.loggedIn: {{ $store.state.auth.loggedIn }}</div>
        <div>$auth.loggedIn: {{ $auth.loggedIn }}</div> -->

        <div class="mr-8">
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
          <template v-if="$store.state.auth.loggedIn">
            <v-tooltip bottom>
              <template v-slot:activator="{ on, attrs }">
                <v-btn 
                  large 
                  icon 
                  to="/user/post"
                  v-bind="attrs"
                  v-on="on"
                >
                    <v-icon>mdi-pencil-plus-outline</v-icon>
                  </v-btn>
              </template>
              <span>新しい投稿</span>
            </v-tooltip>
          </template>
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
        <div v-if="!$store.state.auth.loggedIn" class="mr-2">
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
        <v-list-item to ="/user/delete">
          <v-list-item-title class="red--text">退会</v-list-item-title>
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
