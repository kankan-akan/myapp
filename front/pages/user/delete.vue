<template>
  <v-container>
    <v-card max-width="600" class="mx-auto mt-16 rounded-xl">
      <v-card-text class="text-center">
       <div>退会処理を実行します。よろしいですか？</div>
      </v-card-text>
      <v-card-actions class="justify-center">
        <template v-if="$store.state.guestLoggedIn">
          <v-btn disabled>
            ゲストユーザーのため実行出来ません
          </v-btn>
        </template>
        <template v-else>
          <v-btn
            class="white--text"
            color="indigo accent-2"
            :disabled="loading"
            :loading="loading"
            large
            @click ="deleteUser"
          >
            退会
          </v-btn>
          <v-btn
            large
            text
            to="/"
          >
            キャンセル
          </v-btn>
        </template>
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
    deleteUser() {
      this.loading = true
      this.$axios.delete('/v1/auth')
      .then((res) => {
        console.log(res)
        this.$store.commit('myData/setLoginUser', null)
        this.$store.dispatch(
          'snackbar/showMessage', {
            icon: 'mdi-checkbox-marked-circle-outline',
            message: '退会が完了しました。',
            type: 'success',
            status: true,
          },
          { root: true }
        )
        this.loading = false
      })
      .catch((err) => {
        console.log(err)
      })
      this.$auth.logout()
    },
  },

}
</script>