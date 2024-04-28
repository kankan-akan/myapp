<template>
<div>
  <div class="main d-flex justify-center">
    <v-tooltip>
      <template v-slot:activator="{ on, attrs }">
        <v-btn
          large
          icon
          to="/"
          v-bind="attrs"
          v-on="on"
        >
          <v-icon>mdi-magnify</v-icon>
        </v-btn>
      </template>
      <span>検索</span>
    </v-tooltip>
    <template v-if="$store.state.auth.loggedIn">
      <v-tooltip>
        <template v-slot:activator="{ on, attrs }">
          <v-btn
            class="ml-14"
            large
            icon
            to="/user/post"
            v-bind="attrs"
            v-on="on"
          >
              <v-icon>mdi-pencil-plus-outline</v-icon>
            </v-btn>
        </template>
        <span>新しい投稿</span>
      </v-tooltip>
    </template>
    <v-tooltip>
      <template v-slot:activator="{ on, attrs }">
        <v-btn
          class="ml-14"
          large
          icon
          to="/allPost"
          v-bind="attrs"
          v-on="on"
        >
            <v-icon>mdi-golf-tee</v-icon>
          </v-btn>
      </template>
      <span>みんなの投稿</span>
    </v-tooltip>
  </div>
  <v-divider></v-divider>
  </div>
</template>

<style scoped>
.main {
  height: 55px;
  align-items: center;
  background-color: white;
}

</style>
