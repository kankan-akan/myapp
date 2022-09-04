<template>
  <div>
    <v-navigation-drawer 
      permanent
      app 
      clipped 
    >
      <v-list rounded>
        <v-list-item-group
          mandatory
          color="primary"
        >
        <v-list-item 
          v-for="item in items"
          :key="item.title"
          :to="item.to"
        >
          <v-list-item-icon>
            <v-icon></v-icon> 
          </v-list-item-icon> 
          <v-list-item-content>
            <v-list-item-title>{{ item.title }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        </v-list-item-group>
      </v-list>

      <template v-slot:append>
        <div class="pa-2">
          <v-btn block @click="logout()">
            Logout
          </v-btn>
        </div>
      </template>
    </v-navigation-drawer>
  </div>
</template>

<script>
  export default {
    data:() => ({
    items:[
      { title: '基本情報', to: "/rangeAdmin/info" },
      { title: '開講レッスン', to: "/rangeAdmin/lesson" },
      { title: '予約状況', to: "/rangeAdmin/status" },
      { title: 'アカウント設定', to: "/rangeAdmin/account" }
    ],
  }),

  methods: {
    // logout () {
    //   this.$store.commit('rangeAuth/setIsLoggedIn', false)
    //   this.$router.push('/')
    //   this.$router.replace('/')
    // }
    async logout () {
      try {
        const res = await this.$axios.delete('/v1/range_auth/sign_out')
        console.log(res)
        this.$router.push('/')
        this.$store.commit('rangeAuth/setIsLoggedIn', false)
        this.$store.commit('rangeAuth/setLoginRange', null)
        this.$store.commit('rangeAuth/setRangeData', null)
        this.$store.dispatch(
          'snackbar/showMessage', {
            icon: 'mdi-checkbox-marked-circle-outline',
            message: 'ログアウトしました。',
            type: 'success',
            status: true,
          },
          { root: true }
        )
      }
      catch(err){
        console.log(err)
        this.$store.dispatch(
          'snackbar/showMessage', {
            icon: 'mdi-alert-outline',
            message: 'ログアウトに失敗しました。',
            type: 'error',
            status: true,
          },
          { root: true }
        )
      }
    }
  }
  
  }
</script>
