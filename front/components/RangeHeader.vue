<template>
<div>
  <RangeNavBar />
    <v-app-bar 
      app
      clipped-left
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
          
          <h2>{{ $store.state.rangeAuth.isLoggedIn }}</h2>
          <v-btn to="/rangeLogin">練習場管理者はこちら</v-btn>
          
        </v-row>
      </v-container>
    </v-app-bar>
  </div>
</template>

<script>
export default {

}
</script>