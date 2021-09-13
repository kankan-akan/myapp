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
          v-model="valid"
          lazy-validation
        >
          <v-text-field
            v-model="name"
            :counter="10"
            :rules="nameRules"
            label="名前（15文字以内）"
            required
          ></v-text-field>

          <v-text-field
            v-model="userName"
            :counter="10"
            :rules="UserNameRules"
            label="＠ユーザー名（15文字以内）"
            required
          ></v-text-field>

          <v-text-field
            v-model="email"
            :rules="emailRules"
            label="メールアドレス"
            required
          ></v-text-field>

          <v-checkbox
            v-model="checkbox"
            :rules="[v => !!v || 'You must agree to continue!']"
            label="Do you agree?"
            required
          ></v-checkbox>
          <v-card-action>
            <v-btn
              class="mr-4"
              type="submit"
              :disabled="!valid"
            >
              登録
            </v-btn>

            <v-btn
              color="error"
              class="mr-4"
              @click="reset"
            >
              やり直す
            </v-btn>
          </v-card-action>
        </v-form>
      </v-card-text>
    </v-card>
  </v-main>
  </v-app>
</template>

<script src ="./create.js"></script>