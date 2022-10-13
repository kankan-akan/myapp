<template>
  <v-container>
    <v-card max-width="600" class="mx-auto mt-16 rounded-xl">
      <v-card-title class="font-weight-bold">新規登録</v-card-title>
      <v-card-text>
        <v-form
          ref="form"
          v-model="valid"
          lazy-validation 
        >
          <v-text-field
            outlined
            v-model="name"
            :counter="15"
            :rules="nameRules"
            label="登録名"
            required
          ></v-text-field>

          <v-text-field
            outlined
            v-model="userId"
            :counter="15"
            :rules="userIdRules"
            label="ユーザー名（半角英数字・記号(.?/-_)で15文字以内）"
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
            :rules="phoneNumberRules"
            label="電話番号"
            required
          ></v-text-field>

          <v-text-field
            outlined
            v-model="score"
            :rules="scoreRules"
            label="あなたのベストスコアは？"
            required
          ></v-text-field>

          <v-text-field
            outlined
            v-model="password"
            :rules="passwordRules"
            :append-icon="show ? 'mdi-eye' : 'mdi-eye-off'"
            :type="show? 'text' : 'password'"
            label="パスワード（半角英数字・記号(.?/-_)を各1つ含む8文字以上30文字以内）"
            required
            @click:append="show = !show"
          ></v-text-field>

          <v-card-actions class="justify-end">
            <v-btn
              class="mr-4 font-weight-bold white--text"
              :disabled="!valid || loading" 
              :loading="loading"
              @click="submit"
              color="indigo accent-2"
              large
            >
              登録
            </v-btn>
            <v-btn
              color="error"
              @click="reset"
              large
              text
            >
              リセット
            </v-btn>
          </v-card-actions>
        </v-form>
      </v-card-text>
    </v-card>
  </v-container>
</template>

<script src ="./create.js"></script>