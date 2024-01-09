<template>
  <v-container>
    <v-card max-width="600" class="mx-auto mt-16 rounded-xl">
      <v-card-title  class="font-weight-bold">新規登録＜練習場管理者専用＞</v-card-title>
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
            v-model="email"
            :rules="emailRules"
            label="メールアドレス"
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
          <!-- autocomple ="off" -->
          <!-- <v-checkbox
            v-model ="checkbox"
            :rules ="[v => !!v || '新規登録には利用規約への同意が必要です。']"
            label ="利用規約に同意"
            required
          ></v-checkbox> -->
          <v-card-actions class="justify-end">
            <v-btn
              class ="mr-4"
              :disabled="!valid || loading"
              :loading="loading"
              @click="submit"
              large
              outlined
            >
              登録
            </v-btn>
            <v-btn
              color="error"
              class="mr-4"
              @click="reset"
              large
              outlined
            >
              キャンセル
            </v-btn>
          </v-card-actions>
        </v-form>
      </v-card-text>
    </v-card>
  </v-container>
</template>

<script src ="./rangeCreate.js"></script>