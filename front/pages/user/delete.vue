<template>
  <v-container>
    <v-card max-width="600" class="mx-auto mt-16 rounded-xl">
      <v-card-text class="text-center">
       <div>退会処理を実行します。よろしいですか？</div>
      </v-card-text>
      <v-card-actions class="justify-center">
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
      this.$axios.delete('/v1/auth')
      .then((res) => {
        console.log(res)
        this.loading = true
        this.$auth.logout()
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
    },
  },
 
}
</script>