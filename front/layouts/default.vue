<template>
  <v-app>
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