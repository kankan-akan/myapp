<template>
  <v-main>
    <v-card max-width = "600">
                <v-card-title>
                  <div class="text-h5">ログイン</div>
                </v-card-title>
                <v-card-text>
                  <v-form
                    ref="form"
                    v-model ="valid"
                    lazy-validation 
                  >
                    <v-row>
                      <!-- <v-col cols="12" sm="6" md="4">
                        <v-text-field
                          v-model ="userId"
                          :rules="userIdRules"
                          label="ユーザー名*"
                          required
                        ></v-text-field>
                      </v-col> -->
                      <v-col cols="12">
                        <v-text-field
                          outlined
                          v-model ="email"
                          :rules="emailRules"
                          label="メールアドレス*"
                          required
                        ></v-text-field>
                      </v-col>
                      <v-col cols="12">
                        <v-text-field
                          outlined
                          v-model ="password"
                          :rules ="passwordRules"
                          :append-icon ="show ? 'mdi-eye' : 'mdi-eye-off'"
                          :type ="show? 'text' : 'password'"
                          label ="パスワード（半角英数字・記号(.?/-_)を各1つ含む8文字以上30文字以内）"
                          required
                          @click:append ="show = !show"
                        ></v-text-field>
                      </v-col>
                    </v-row>
                  </v-form>
                  <small>*は必須項目です</small>
                </v-card-text>
                <div>
                  <v-card-actions class="justify-end">
                    <v-btn
                      :disabled="!valid" 
                      @click="login"
                      large
                    >
                      ログイン
                    </v-btn>
                    <v-btn 
                      class="mr-4"
                      color="blue darken-1" 
                      text 
                      to ="/"
                    >
                      閉じる
                    </v-btn>
                  </v-card-actions>
                </div>
                <v-card-text>
                  <div>
                    ユーザー登録はお済みですか？
                    <NuxtLink to="/user/create">ー新規登録</NuxtLink>
                  </div>
                </v-card-text>
              </v-card>
  </v-main>
</template>

<script>
export default {

  data: () => ({
    valid: true,
    show: false,
    // userId: 'ichiro_tanaka',
    // userIdRules: [
    //   v => !!v || '入力してください',
    //   v => (v && v.length <= 15) || '15文字以下で入力してください',
    //   v => /^(?=.*[a-zA-Z])[a-zA-Z0-9\d.?/-_]{1,15}$/.test(v) || '',
    // ],
    email: 'a@example.com',
    emailRules: [
      v => !!v || '入力してください',
      v => /.+@.+\..+/.test(v) || '',
    ],
    password: 'password.',
    passwordRules: [
      v => !!v || '入力してください',
      v => /^(?=.*[a-z])(?=.*[.?/-_])[a-zA-Z0-9\d.?/-_]{8,30}$/.test(v) || '',
    ],
  }),

  methods: {
    async login () {
      if (this.$refs.form.validate()) {
        try {
        const res = await this.$auth.loginWith('local', {
          data:{
          // user_id: this.userId,
            email: this.email,
            password: this.password
          }
        })
        console.log(res)
        console.log(this.$auth)
        }catch(err) {
          console.log(err)
        }
      }
    },
  },

}
</script>
