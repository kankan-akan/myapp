<template>
  <v-main>
    <v-card max-width = "600">
      <v-container>
        <v-card-title>
          <div class="text-h5">ログイン</div>
        </v-card-title>
        <v-card-text>
          <v-row>
            <!-- <v-col cols="12" sm="6" md="4">
              <v-text-field
                v-model ="name"
                label="登録名*"
                required
              ></v-text-field>
            </v-col> -->
            <v-col cols="12">
              <v-text-field
                v-model ="email"
                label="メールアドレス*"
                required
              ></v-text-field>
            </v-col>
            <v-col cols="12">
              <v-text-field
                v-model ="password"
                label="パスワード*"
                type="password"
                required
              ></v-text-field>
            </v-col>
          </v-row>
          <small>*は必須項目です</small>
          <v-card-actions class="justify-center">
            <v-spacer></v-spacer>
            <v-btn 
              color="blue darken-1" 
              text 
              to ="/"
            >
              閉じる
            </v-btn>
            <v-btn 
              color="blue darken-1" 
              text 
              @click="login"
            >
              ログイン
            </v-btn>
          </v-card-actions>
          <div>
            管理者登録はお済みですか？
            <NuxtLink to="/rangeCreate">ー新規登録</NuxtLink>
          </div>
        </v-card-text>
      </v-container>
    </v-card>
  </v-main>
</template>

<script>
export default {
  data: () => ({
    // name: 'hogeゴルフ練習場',
    email: 'a@example.com',
    password: 'password.',
  }),

  methods: {
    async login () {
      try {
      const res = await this.$auth.loginWith('local', {
        data: {
        // name: this.name,
          email: this.email,
          password: this.password
        }
      })
      console.log(res)
      console.log(this.$auth);
        // this.$router.push('/')
      }catch(err) {
        console.log(err)
      }
    },

  },

}
</script>
