<template>
  <v-app class="body">
    <Snackbar />
    <Header />
    <v-main class="color">
      <ContentBar />
      <Nuxt />
    </v-main>
  </v-app>
</template>

<script>
export default {
  name: "default"

}
</script>

<style>
  .body {
    font-family: "Kosugi Maru", "Quicksand";
  }
</style>