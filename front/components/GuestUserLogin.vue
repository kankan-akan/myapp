<template>
  <div>
    <v-btn
      class="mr-4 font-weight-bold"
      color="blue lighten-5"
      :disabled="loading" 
      :loading="loading"
      @click="guestLogin"
      large
      block
    >
      ゲストユーザーとしてログイン
    </v-btn>
  </div>
</template>

<script>
export default {
  data: () => ({
    loading: false,
    email: 'guest-user@example.com',
    password: 'password.guestUser'
  }),

  methods: {
    async guestLogin () {
      this.loading = true
      try {
        const res = await this.$auth.loginWith('local', {
          data: {
          // user_id: this.userId,
            email: this.email,
            password: this.password
          }
        })
        console.log(res)
        console.log(this.$auth)
        this.$store.dispatch(
          'snackbar/showMessage', {
            icon: 'mdi-checkbox-marked-circle-outline',
            message: 'ゲストユーザーとしてログインしました！',
            type: 'success',
            status: true,
          },
          { root: true }
        )
        this.loading = false
      }catch(err) {
        console.log(err)
        this.$store.dispatch(
          'snackbar/showMessage', {
            icon: 'mdi-alert-outline',
            message: 'ログインに失敗しました。',
            type: 'error',
            status: true,
          },
          { root: true }
        )
        this.loading = false
      }
    }
  },
}
</script>
