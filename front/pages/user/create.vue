<template>
  <v-app>
  <v-app-bar app
    height ="100"
    color ="blue white--text darken-2"
  >
    <v-container>
      <v-row>
        <v-col class ="header-logo my-auto">LOGO</v-col>
        <v-btn to ="/">home</v-btn>
        <v-col>
          <v-row justify ="end">
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
                    <v-col
                      cols="12"
                      sm="6"
                      md="4"
                    >
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
              <div >
              <v-card-actions class ="justify-center">
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
                <div>ユーザー登録はお済みですか？<NuxtLink to="/user/create">ー新規登録</NuxtLink></div>
              </v-card-text>
            </v-card>
          </v-dialog>
          </v-row>
          <v-row justify ="end">
          <v-btn 
            class ="my-1"
            to ="/user/create" 
          >
            新規登録
          </v-btn>
          </v-row>
        </v-col>

      </v-row> 
    </v-container>
  </v-app-bar>
  <v-main>
    <v-card>
      <v-card-title>新規登録</v-card-title>

    </v-card>
  </v-main>
  </v-app>
</template>

<script src ="./create.js"></script>