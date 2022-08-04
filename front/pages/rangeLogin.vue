<template>
  <v-main>
    <v-card max-width = "600">
      <v-container>
        <v-card-title>
          <div class="text-h5">ログイン</div>
        </v-card-title>
        <v-card-text>
        <v-form
          ref="form"
          v-model="valid"
          lazy-validation
        >
          <v-row>
            <!-- <v-col cols="12" sm="6" md="4">
              <v-text-field
                v-model ="name"
                label="登録名*"
                :rules="nameRules"
                required
              ></v-text-field>
            </v-col> -->
            <v-col cols="12">
              <v-text-field
                v-model="email"
                :rules="emailRules"
                label="メールアドレス*"
                required
              ></v-text-field>
            </v-col>
            <v-col cols="12">
              <v-text-field
                v-model="password"
                :rules="passwordRules"
                :append-icon ="show ? 'mdi-eye' : 'mdi-eye-off'"
                :type="show? 'text' : 'password'"
               
                required
                @click:append="show = !show"
              ></v-text-field>
            </v-col>
          </v-row>
          <small>*は必須項目です</small>
          <v-card-actions class="justify-end">
            <v-btn 
              color="blue darken-1" 
              text 
              :disabled="!valid" 
              @click="login"
            >
              ログイン
            </v-btn>
            <v-btn 
              color="blue darken-1" 
              text 
              to="/"
            >
              閉じる
            </v-btn>
          </v-card-actions>
          <div>
            管理者登録はお済みですか？
            <NuxtLink to="/rangeCreate">ー新規登録</NuxtLink>
          </div>
          </v-form>
        </v-card-text>
        
      </v-container>
    </v-card>
  </v-main>
</template>

<script>
import { mapActions } from 'vuex';

export default {
  data: () => ({
    valid: true,
    show: false,
    nameRules: [ v => !!v || '入力してください' ],
    emailRules: [
      v => !!v || '入力してください',
      v => /.+@.+\..+/.test(v) || '',
    ],
    passwordRules: [
      v => !!v || '入力してください',
      // v => /^(?=.*[a-z])(?=.*[.?/-_])[a-zA-Z0-9\d.?/-_]{8,30}$/.test(v) || '',
    ],
    name: 'hogeゴルフ練習場',
    email: 'a@example.com',
    password: 'password.',
  }),

  methods: {
    ...mapActions({
      getLoginRange: 'rangeAuth/getLoginRange'
    }),
    async login () {
      if (this.$refs.form.validate()) {
        try {
          const res = await this.$axios.post('/v1/range_auth/sign_in', {
            // name: this.name,
            email: this.email,
            password: this.password
          })
          console.log(res)
          this.getLoginRange()
          this.$store.commit('rangeAuth/setIsLoggedIn', true)
          this.$router.push('/rangeAdmin/info')
        }catch(err) {
          console.log(err)
        }
      }
    },

  },

}
</script>
