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
          <h2>{{ $auth.loggedIn }}</h2>
          <p>{{ $auth.user }}</p>
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
                  @{{ }}
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
</template>

<script>
export default {
data: () => ({
    items: [
        { title: 'プロフィール', link: '' },
        { title: 'ユーザー設定', link: '' },
        {title: 'ログアウト', link: '/logout'},

      ],
  }),

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