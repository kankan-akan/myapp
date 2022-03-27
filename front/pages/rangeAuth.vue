<template>
  <v-main>
    <v-container>
      <v-card max-width = "600">
        <v-card-title>
          <div class="text-h5">ログイン</div>
        </v-card-title>
        <v-card-text>
          <v-row>
            <v-col cols="12" sm="6" md="4">
              <v-text-field
                v-model ="userId"
                label="練習場名*"
                required
              ></v-text-field>
            </v-col>
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
        </v-card-text>
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
        <v-card-text>
          <div>
            ユーザー登録はお済みですか？
            <NuxtLink to="/rangeCreate">ー新規登録</NuxtLink>
          </div>
        <!-- <p>{{ $store.state.message }}</p>
              <p>{{ $store.state.count }}</p> -->
        </v-card-text>
      </v-card>
    </v-container>
  </v-main>
</template>