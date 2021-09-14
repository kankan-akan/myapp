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
      </v-row> 
    </v-container>
  </v-app-bar>

  <v-main>
    <v-card>
      <v-card-title>新規登録</v-card-title>
      <v-card-text>
        <v-form
          ref="form"
          v-model ="valid"
          lazy-validation
        >
          <v-text-field
            v-model ="name"
            :counter ="15"
            :rules ="nameRules"
            label ="氏名"
            required
          ></v-text-field>

          <v-text-field
            v-model ="userName"
            :counter ="15"
            :rules ="userNameRules"
            label ="ユーザー名（15文字以内）"
            required
          ></v-text-field>
          
          <v-text-field
            v-model ="email"
            :rules ="emailRules"
            label ="メールアドレス"
            required
          ></v-text-field>

          <v-text-field
            v-model ="passWard"
            :rules ="passWardRules"
            label ="パスワード（半角英数字・記号(.?/-_)のみで8文字以上30文字以内）"
            required
            autocomplete ="off"
          ></v-text-field>

          <!-- <v-checkbox
            v-model ="checkbox"
            :rules ="[v => !!v || '新規登録には利用規約への同意が必要です。']"
            label ="利用規約に同意"
            required
          ></v-checkbox> -->
          <v-card-actions>
            <v-btn
              class ="mr-4"
              type ="submit"
              :disabled ="!valid"
              @click ="submit"
            >
              登録
            </v-btn>
            
            <v-btn
              color ="error"
              class ="mr-4"
              @click ="reset"
            >
              やり直す
            </v-btn>
            <span v-if ="success">登録が完了しました</span>
          </v-card-actions>
        </v-form>
      </v-card-text>
    </v-card>
  </v-main>
  </v-app>
</template>

<script src ="./create.js"></script>