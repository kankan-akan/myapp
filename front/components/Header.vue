<template>
    <v-app-bar 
      app 
      height="100" 
      color="blue lighten-2"
    >
      <v-container>
        <v-row class ="justify-space-between">
          <NuxtLink 
            to="/"
            class="header-logo my-auto"
          >
            LOGO
          </NuxtLink>
          <div>
            <v-dialog
              transition="fab-transition"
              v-model="dialog"
              persistent
              max-width="600px"
            >
              <template v-slot:activator="{ on, attrs }">
                <v-btn
                  color="primary" 
                  dark 
                  v-bind="attrs" 
                  v-on="on"
                  large
                >
                  ログイン
                  <v-icon>mdi-account-arrow-left-outline</v-icon>
                </v-btn>
              </template>

              <v-card>
                <v-card-title>
                  <div class="text-h5">ログイン</div>
                </v-card-title>
                <v-card-text>
                  <v-container>
                    <v-row>
                      <v-col cols="12" sm="6" md="4">
                        <v-text-field
                          label="ユーザー名*"
                          required
                        ></v-text-field>
                      </v-col>
                      <v-col cols="12">
                        <v-text-field
                          label="メールアドレス*"
                          required
                        ></v-text-field>
                      </v-col>
                      <v-col cols="12">
                        <v-text-field
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
                      @click="dialog = false"
                    >
                      閉じる
                    </v-btn>
                    <v-btn 
                      color="blue darken-1" 
                      text 
                      @click="dialog = false"
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
                </v-card-text>
              </v-card>
            </v-dialog>

            <v-btn 
              color="" 
              class="my-1"
              to="/user/create" 
              outlined 
              dark
              large
            >
              新規登録
            </v-btn>
          </div>
        </v-row>
      </v-container>
    </v-app-bar>
</template>

<script>
export default {
  data: () => ({
    //login
    dialog: false,
  }),
}
</script>

<style>

</style>