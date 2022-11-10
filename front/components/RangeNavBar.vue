<template>
    <div>
      <v-card class="rounded-xl ma-4 sticky" elevation="8">
        <v-navigation-drawer floating>
        <v-list rounded>
          <v-list-item
            color="primary"
            v-for="item in items"
            :key="item.title"
            :to="item.to"
          >
            <v-list-item-content>
              <v-list-item-title>{{ item.title }}</v-list-item-title>
            </v-list-item-content>
          </v-list-item>

          <v-divider class="my-2"></v-divider>

          <v-list-item
            link
            color="grey lighten-4"
          >
            <v-list-item-content>
              <v-list-item-title @click="logout()">
                ログアウト
              </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </v-list>
        </v-navigation-drawer>
      </v-card>
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

<style scoped>
  .sticky {
    position: sticky;
    top: 80px;

  }
</style>
