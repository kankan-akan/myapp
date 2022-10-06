<template>
  <v-container>
    <v-card max-width="600" class="mx-auto mt-16 rounded-xl">
      <v-card-text class="text-center">
       <div class="text-h6">ログアウトを実行します。</div>
      </v-card-text>
      <v-card-actions class="justify-center">
        <v-btn 
          class="white--text"
          color="indigo accent-2"
          :disabled="loading"
          :loading="loading"
          large
          @click ="logout"
        >
          OK
        </v-btn>
        <v-btn 
          large
          text
          to="/"
        >
          キャンセル
        </v-btn>
      </v-card-actions>
    </v-card>
  </v-container>
</template>

<script>

export default {
  data: () => ({
    loading: false
  }),

  methods: {
    logout() {
      this.loading = true
      this.$auth.logout()
      this.$store.commit('myData/setLoginUser', null)
      this.$store.dispatch(
        'snackbar/showMessage', {
          icon: 'mdi-checkbox-marked-circle-outline',
          message: 'ログアウトしました。',
          type: 'success',
          status: true,
        },
        { root: true }
      )
      this.loading = false
    }
  },
 
}
</script>
