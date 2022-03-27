<template>
  <v-main>
    <v-snackbar
      top
      v-model ="snackbar"
    >
      {{ text }}
    <template v-slot:action ="{ attrs }">
     <v-btn
        color ="pink"
        text
        v-bind ="attrs"
        @click ="snackbar = false"
      >
        Close
      </v-btn>
    </template>
    </v-snackbar>

    <v-card>
      <v-card-title>新規登録</v-card-title>
      <v-card-text>
        <v-form
          ref="form"
          v-model ="valid"
          lazy-validation 
        >
          <v-text-field
            outlined
            v-model ="name"
            :counter ="15"
            :rules ="nameRules"
            label ="登録名"
            required
          ></v-text-field>

          <!-- <v-text-field
            outlined
            v-model ="userId"
            :counter ="15"
            :rules ="userIdRules"
            label ="ユーザー名（半角英数字・記号(.?/-_)で15文字以内）"
            required
          ></v-text-field> -->
          
          <v-text-field
            outlined
            v-model ="email"
            :rules ="emailRules"
            label ="メールアドレス"
            required
          ></v-text-field>

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
<!-- autocomple ="off" -->
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
              :disabled ="!valid || loading" 
              :loading ="loading"
              @click.prevent ="submit"
              large
              outlined
            >
              登録
            </v-btn>
            
            <v-btn
              color ="error"
              class ="mr-4"
              @click ="reset"
              large
              outlined
            >
              やり直す
            </v-btn>
          </v-card-actions>
        </v-form>
      </v-card-text>
    </v-card>
    
  </v-main>
</template>

<script src ="./rangeCreate.js"></script>