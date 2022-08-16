<template>
  <v-main>
    <v-container>
      <v-col class="text-h5 font-weight-bold mr-4">アカウント設定</v-col>
      <div class="text-h6 ml-6 mb-6 font-weight-bold">登録情報変更</div>
      <div class="ml-6">変更したい項目を書き換えてください。</div>
      <v-row justify="center">
        <v-col class="mt-6" cols="8">
          <v-form
            ref="formInfo"
            v-model="validInfo"
            lazy-validation
          >
            <v-text-field
              outlined
              v-model="name"
              :rules="nameRules"
              label="登録名"
              required
            ></v-text-field>

            <!-- <v-text-field
              outlined
              v-model="userId"
              :counter="15"
              :rules="userIdRules"
              label="ユーザー名（半角英数字・記号(.?/-_)で15文字以内"
              required
            ></v-text-field>  -->

            <v-text-field
              outlined
              v-model="email"
              :rules="emailRules"
              label="メールアドレス"
              required
            ></v-text-field>

            <!-- <v-col>
              <v-text-field
                outlined
                v-model="phoneNumber"
                label="電話番号"
                required
              ></v-text-field>
            </v-col> -->

            <div class="d-flex justify-end">
            <v-btn
              class="mr-4"
              :disabled="!validInfo || loading" 
              :loading="loading"
              @click="editInfo"
              large
              outlined
            >
              登録
            </v-btn>
            </div>
          </v-form>
        </v-col>
      </v-row>

      <v-divider class="my-10"></v-divider>

      <div class="text-h6 ml-6 mb-6 font-weight-bold">パスワード変更</div>
      <v-row justify="center">
        <v-col cols="8">
          <v-form
            ref="form"
            v-model="valid"
            lazy-validation
          >
            <v-text-field
              v-model="password"
              :rules="passwordRules"
              :append-icon="show ? 'mdi-eye' : 'mdi-eye-off'"
              :type="show? 'text' : 'password'"
              label="新しいパスワード（半角英数字・記号(.?/-_)を各1つ含む8文字以上30文字以内）"
              @click:append="show = !show"
              outlined
              required
            ></v-text-field>

            <v-text-field
              v-model="passwordConfirmation"
              :rules="passwordRules"
              :append-icon="showConfirm ? 'mdi-eye' : 'mdi-eye-off'"
              :type="showConfirm? 'text' : 'password'"
              label="新しいパスワード（確認用）"
              @click:append="showConfirm = !showConfirm"
              outlined
              required
            ></v-text-field>
            <div class="d-flex justify-end">
              <v-btn
                class="mr-4"
                :disabled="!valid || loading2" 
                :loading="loading2"
                @click="editPassword"
                large
                outlined
              >
                登録
              </v-btn>
            </div>
          </v-form>
        </v-col>
      </v-row>
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
      validInfo: true,
      valid: true,
      // eye icon
      show: false,
      showConfirm: false,
      loading: false,
      loading2: false,
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
      password: '',
      passwordConfirmation: '',
      passwordRules: [
        v => !!v || '入力してください',
        v => /^(?=.*[a-z])(?=.*[.?/-_])[a-zA-Z0-9\d.?/-_]{8,30}$/.test(v) || '',
      ],
    }
  },

  methods: {
    ...mapActions({
      getLoginRange: 'rangeAuth/getLoginRange'
    }),
    editPassword() {
      if (this.$refs.form.validate()) {
        this.loading2 = true
        this.$axios.put('/v1/range_auth/password', {
          password: this.password,
          password_confirmation: this.passwordConfirmation
        })
        .then((res) => {
          console.log(res)
          this.loading2 = false
          this.$store.dispatch(
            'snackbar/showMessage', {
              icon: 'mdi-checkbox-marked-circle-outline',
              message: 'パスワードが変更されました。',
              type: 'success',
              status: true,
            },
            { root: true }
          )
        })
        .catch((err) => {
          console.log(err)
          this.loading2 = false
          this.$store.dispatch(
            'snackbar/showMessage', {
              icon: 'mdi-alert-outline',
              message: 'パスワードの変更に失敗しました。',
              type: 'error',
              status: true,
            },
            { root: true }
          )
        })
      }
    },
    async editInfo () {
      if (this.$refs.formInfo.validate()) {
        this.loading = true
        try {
          const res = await this.$axios.put('/v1/range_auth', {
            name: this.name,
            email: this.email
          })
          console.log(res)
          this.loading = false
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
          this.loading = false
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
