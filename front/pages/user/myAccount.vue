<template>
  <v-container>
    <v-sheet class="rounded-xl">
      <v-col class="text-h5 font-weight-bold">アカウント設定</v-col>
      <div class="text-h6 ml-6 mb-6 font-weight-bold">登録情報変更</div>
      <div class="ml-6">変更したい項目を書き換えてください。</div>
      <v-row justify="center">
        <v-col class="my-6" cols="8">
          <v-form
            ref="formInfo"
            v-model="validInfo"
            lazy-validation
          >
            <v-col class="text-center">
              <v-file-input
                v-model="inputImage"
                accept="image/png, image/jpeg, image/bmp"
                prepend-icon="mdi-camera-plus-outline"
                label="画像を選択してください"
                @change="uploadImage"
              ></v-file-input>
              <template v-if="avatar && avatar.url !== null">
                <v-avatar size="200">
                  <img v-if="preImage !== ''" :src="preImage">
                  <img v-else :src="avatar.url">
                </v-avatar>
                <v-btn
                  v-if="!preImage"
                  small
                  icon
                  @click="deleteAvatar()"
                >
                  <v-icon small>{{ 'mdi-close' }}</v-icon>
                </v-btn>
              </template>
              <template v-else>
                <v-avatar v-if="preImage !== ''" size="200">
                  <img :src="preImage">
                </v-avatar>
                <v-avatar v-else size="200" color="indigo">
                  <v-icon dark size="120">mdi-account</v-icon>
                </v-avatar>
              </template>
            </v-col>

            <v-divider class="my-10"></v-divider>

            <v-text-field
              outlined
              v-model="name"
              :rules="nameRules"
              label="登録名"
              required
            ></v-text-field>

            <v-text-field
              outlined
              v-model="userId"
              :counter="15"
              :rules="userIdRules"
              label="ユーザー名（半角英数字・記号(.?/-_)で15文字以内"
              required
            ></v-text-field>

            <v-text-field
              outlined
              v-model="email"
              :rules="emailRules"
              label="メールアドレス"
              required
            ></v-text-field>

            <v-text-field
              outlined
              v-model="phoneNumber"
              label="電話番号"
              required
            ></v-text-field>

            <v-text-field
              outlined
              v-model="score"
              label="あなたのベストスコア"
              :rules="scoreRules"
              required
            ></v-text-field>
            <div class="d-flex justify-end">
              <v-btn v-if="$store.state.guestLoggedIn" disabled>
                ゲストユーザーのため変更出来ません
              </v-btn>
              <v-btn
                v-else
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

      <v-divider class="my-6"></v-divider>

      <div class="text-h6 ml-6 mb-6 font-weight-bold">パスワード変更</div>
      <v-row justify="center">
        <v-col class="my-6" cols="8">
          <v-form
            ref="form"
            v-model="valid"
            lazy-validation
          >
            <v-text-field
              outlined
              v-model="password"
              :rules="passwordRules"
              :append-icon="show ? 'mdi-eye' : 'mdi-eye-off'"
              :type="show? 'text' : 'password'"
              label="新しいパスワード（半角英数字・記号(.?/-_)を各1つ含む8文字以上30文字以内）"
              @click:append="show = !show"
              required
            ></v-text-field>

            <v-text-field
              outlined
              v-model="passwordConfirmation"
              :rules="passwordRules"
              :append-icon="showConfirm ? 'mdi-eye' : 'mdi-eye-off'"
              :type="showConfirm? 'text' : 'password'"
              label="新しいパスワード（確認用）"
              required
              @click:append="showConfirm = !showConfirm"
            ></v-text-field>
            <div class="d-flex justify-end">
              <v-btn v-if="$store.state.guestLoggedIn" disabled>
                ゲストユーザーのため変更出来ません
              </v-btn>
              <v-btn
                v-else
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
    </v-sheet>
  </v-container>
</template>

<script>
import { mapState, mapActions } from 'vuex';

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
      name: this.$store.state.myData.loginUser.name, 
      nameRules: [
      ],
      userId: this.$store.state.myData.loginUser.user_id,
      userIdRules: [
        v => (v && v.length <= 15) || '15文字以下で入力してください',
        v => /^(?=.*[a-zA-Z])[a-zA-Z0-9\d.?/-_]{1,15}$/.test(v) || '',
      ],
      email: this.$store.state.myData.loginUser.email,
      emailRules: [
        v => !!v || '入力してください',
        v => /.+@.+\..+/.test(v) || '',
      ],
      phoneNumber: this.$store.state.myData.loginUser.phone_number,
      score: this.$store.state.myData.loginUser.score,
      scoreRules: [
        v => (v.length <= 3) || '3文字以下で入力してください',
        v => /^[0-9]{0,3}$/.test(v) || '半角数字で入力してください',
      ],
      password: '',
      passwordConfirmation: '',
      passwordRules: [
        v => !!v || '入力してください',
        v => /^(?=.*[a-z])(?=.*[.?/-_])[a-zA-Z0-9\d.?/-_]{8,30}$/.test(v) || '',
      ],
      avatar: this.$store.state.myData.loginUser.avatar,
      // avatar: null,
      // avatar: 'https://cdn.vuetifyjs.com/images/john.jpg',
      inputImage: null,
      preImage: ''
    }
  },

  computed: {
    ...mapState({
      loginUser: (state) => state.myData.loginUser
    }),
  },

  methods: {
    ...mapActions({
      getLoginUser: 'myData/getLoginUser'
    }),
    editPassword () {
      if (this.$refs.form.validate()) {
        this.loading2 = true
        this.$axios.put('/v1/auth/password', {
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
              message: 'パスワードの変更に失敗しました。もう一度やり直してください。',
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
        const formData = new FormData()
          formData.append('name', this.name)
          formData.append('user_id', this.userId)
          formData.append('email', this.email)
          formData.append('phone_number', this.phoneNumber)
          formData.append('score', this.score)
          if (this.inputImage || this.inputImage == '') {
            formData.append('avatar', this.inputImage)
          }
        await this.$axios.put('/v1/auth', formData, { 
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        })
        .then((res) => {
          console.log(res)
          this.loading = false
          this.getLoginUser()
          this.$store.dispatch(
            'snackbar/showMessage', {
              icon: 'mdi-checkbox-marked-circle-outline',
              message: '変更が保存されました。',
              type: 'success',
              status: true,
            },
            { root: true }
          )
        })
        .catch((err) => {
          console.log(err)
          this.loading = false
          this.$store.dispatch(
            'snackbar/showMessage', {
              icon: 'mdi-alert-outline',
              message: '変更に失敗しました。',
              type: 'error',
              status: true,
            },
            { root: true }
          )
        })
      }
    },
    uploadImage (file) {
      if (file !== undefined && file !== null) {
        if (file.name.lastIndexOf('.') <= 0) {
          return
        }
        const fr = new FileReader()
        fr.readAsDataURL(file)
        fr.addEventListener('load', () => {
          this.preImage = fr.result
        })
      } else {
        this.preImage = ''
      }
    },
    deleteAvatar () {
      this.avatar = null
      this.inputImage = []
    }
  }
}
</script>