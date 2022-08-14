<template>
  <v-main>
    <v-container justify="center">
      <v-col>アカウント設定</v-col>
      <v-col>変更したい項目を書き換えてください。</v-col>
      <v-form
        ref="form"
        v-model="valid"
        lazy-validation
      >
        <v-col>
          <v-text-field
            outlined
            v-model="name"
            :rules="nameRules"
            label="登録名"
            required
          ></v-text-field>
        </v-col>

        <!-- <v-divider class="mb-3"></v-divider>

        <v-col>
          <v-text-field
            outlined
            v-model="userId"
            :counter="15"
            :rules="userIdRules"
            label="ユーザー名（半角英数字・記号(.?/-_)で15文字以内"
            required
          ></v-text-field>
        </v-col> -->

        <v-divider class="mb-3"></v-divider>

        <v-col>
          <v-text-field
            outlined
            v-model="email"
            :rules="emailRules"
            label="メールアドレス"
            required
          ></v-text-field>
        </v-col>

        <!-- <v-divider class="mb-3"></v-divider>

        <v-col>
          <v-text-field
            outlined
            v-model="phoneNumber"
            label="電話番号"
            required
          ></v-text-field>
        </v-col> -->

        <!-- <v-divider class="mb-3"></v-divider> -->

        <!-- <v-col>
          <v-text-field
            outlined
            v-model="password"
            :rules="passwordRules"
            :append-icon="show ? 'mdi-eye' : 'mdi-eye-off'"
            :type="show? 'text' : 'password'"
            label="パスワード（半角英数字・記号(.?/-_)を各1つ含む8文字以上30文字以内）"
            required
            @click:append="show = !show"
          ></v-text-field>
        </v-col> -->
        <v-btn
              class="mr-4"
              
              :disabled="!valid || loading" 
              :loading="loading"
              @click.prevent="editInfo"
              large
              outlined
            >
              登録
            </v-btn>
      </v-form>
    </v-container>
  </v-main>
</template>

<script>
import { mapActions } from 'vuex';

export default {
  data: function () {
    return {
      /* open dialog */
      dialog: false,
      /* register validate */
      valid: true,
      // eye icon
      show: false,
      loading: false,
      name: this.$store.state.rangeAuth.loginRange.name, 
      nameRules: [
      ],
      // userId: this.$store.state.authentication.loginUser.user_id,
      // userIdRules: [
      //   v => (v && v.length <= 15) || '15文字以下で入力してください',
      //   v => /^(?=.*[a-zA-Z])[a-zA-Z0-9\d.?/-_]{1,15}$/.test(v) || '',
      // ],
      email: this.$store.state.rangeAuth.loginRange.email,
      emailRules: [
        v => !!v || '入力してください',
        v => /.+@.+\..+/.test(v) || '',
      ],
      // phoneNumber: ’’,
      // password: 'password.',
      // passwordRules: [
      //   v => !!v || '入力してください',
      //   v => /^(?=.*[a-z])(?=.*[.?/-_])[a-zA-Z0-9\d.?/-_]{8,30}$/.test(v) || '',
      // ],
    }
  },

  methods: {
    ...mapActions({
      getLoginRange: 'rangeAuth/getLoginRange'
    }),
    async editInfo () {
      if (this.$refs.form.validate()) {
        try {
          const res = await this.$axios.put('/v1/range_auth', {
              name: this.name,
              email: this.email
          })
          console.log(res)
          this.getLoginRange()
          this.$store.dispatch(
            'snackbar/showMessage', {
              icon: 'mdi-checkbox-marked-circle-outline',
              message: '設定が更新されました。',
              type: 'success',
              status: true,
            },
            { root: true }
          )
        }catch(err) {
          console.log(err)
          this.$store.dispatch(
            'snackbar/showMessage', {
              icon: 'mdi-alert-outline',
              message: '設定の更新に失敗しました。',
              type: 'error',
              status: true,
            },
            { root: true }
          )
        }
      }
    },
  }
}
</script>
