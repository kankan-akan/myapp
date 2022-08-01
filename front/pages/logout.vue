<template>
  <v-main>
    <v-container class ="text-center">
      <div >
      ログアウトを実行します。
      </div>
      <v-btn @click ="logout()">
        OK
      </v-btn>
      <v-btn to="/">
        キャンセル
      </v-btn>
    </v-container>

  </v-main>
</template>

<script>

export default {

  methods: {
    logout() {
      this.$auth.logout()
      this.$store.commit('myData/setLoginUser', null)
    },
  },
 
}
</script>
