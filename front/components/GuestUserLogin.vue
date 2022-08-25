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
    loading: false
  }),

  methods: {
    async guestLogin () {
      this.loading = true
      await this.$axios.post('/v1/auth/guests')
      .then((res) => {
        console.log(res)
        this.$auth.loginWith('local', {
          data: {
            email: res.data.email,
            password: res.data.password
          }
        })
        .then((res) => {
          console.log(res)
          // console.log(this.$auth)
          this.$store.commit('setGuestLoggedIn', true)
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
        })
        .catch((err) => {
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
        })
      })
      .catch((err) => {
        console,log(err)
        this.$store.dispatch(
          'snackbar/showMessage', {
            icon: 'mdi-alert-outline',
            message: 'ユーザー登録に失敗しました。',
            type: 'error',
            status: true,
          },
          { root: true }
        )
        this.loading = false
      })
    },
  },
}
</script>
