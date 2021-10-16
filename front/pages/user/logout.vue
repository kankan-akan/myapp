<template>
  <v-app>
    <v-container class ="text-center">
      <div >
      ログアウトを実行します。
      </div>
      <v-btn @click ="$auth.logout()">
        OK
      </v-btn>
      <v-btn to="/user/login">
        キャンセル
      </v-btn>
    </v-container>

  </v-app>
</template>

<script>

export default {
 
}
</script>
