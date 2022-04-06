<template>
  <v-main>
    <v-card max-width = "600">
                <v-card-title>
                  <div class="text-h5">ログイン</div>
                </v-card-title>
                <v-card-text>
                  <v-container>
                    <v-row>
                      <!-- <v-col cols="12" sm="6" md="4">
                        <v-text-field
                          v-model ="userId"
                          label="ユーザー名*"
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
                  </v-container>
                  <small>*は必須項目です</small>
                </v-card-text>
                <div>
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
                </div>
                <v-card-text>
                  <div>
                    ユーザー登録はお済みですか？
                    <NuxtLink to="/user/create">ー新規登録</NuxtLink>
                  </div>
                  <!-- <p>{{ $store.state.message }}</p>
                  <p>{{ $store.state.count }}</p> -->
                </v-card-text>
              </v-card>
  </v-main>
</template>

<script>
export default {

  data: () => ({
    // userId: 'ichiro_tanaka',
    email: 'a@example.com',
    password: 'password.',
  }),

  methods: {
    async login () {
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
    },

  },

}
</script>
