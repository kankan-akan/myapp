<template>
  <div>
    <v-app-bar
      app
      height=90
    >
      <v-app-bar-nav-icon
        v-if="$store.state.auth.loggedIn"
        @click="drawer = !drawer"
        class="mr-4"
      ></v-app-bar-nav-icon>
      <v-row align="center" justify="space-between">
        <div class="d-flex align-center">
          <v-toolbar-title>
            <NuxtLink to="/">
              <img class="align-center" src="~/assets/image/Design1.png" width="150">
            </NuxtLink>
          </v-toolbar-title>
        </div>

        <template v-if="$store.state.rangeAuth.isLoggedIn">
          <div class="mr-4">練習場管理者としてログイン中</div>
        </template>
        <template v-else>
          <template v-if="!$store.state.auth.loggedIn">
            <div class="regist-btn mr-2">
              <v-btn
                class="font-weight-bold"
                color="blue darken-1 white--text"
                large
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
            <div class="regist-icon">
              <v-menu
                offset-y
              >
                <template v-slot:activator="{ on, attrs }">
                  <v-btn
                    class="mr-2"
                    color="primary"
                    dark
                    v-bind="attrs"
                    v-on="on"
                  >
                    <v-icon dark size="30">mdi-account</v-icon>
                  </v-btn>
                </template>
                <v-list>
                  <v-list-item to="/create">
                    <v-list-item-title>新規登録</v-list-item-title>
                  </v-list-item>
                  <v-list-item to ="/loginForm">
                    <v-list-item-title>ログイン</v-list-item-title>
                  </v-list-item>
                </v-list>
              </v-menu>
            </div>
          </template>
          <template v-else>
            <v-btn
              class="font-weight-bold"
              color="blue darken-1"
              large
              text
              to ="/user/logout"
            >
              <v-icon>mdi-account-arrow-right</v-icon>
              ログアウト
            </v-btn>
          </template>
        </template>
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
        <v-list-item to="/user/delete">
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

<style scoped>
@media screen and (min-width: 601px) {
  .regist-icon {
    display: none;
  }
}

@media screen and (max-width: 600px) {
  .regist-btn {
    display: none;
  }
}
</style>