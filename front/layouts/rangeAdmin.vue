<template>
  <v-app>
    <Snackbar />
    <RangeHeader />

    <Nuxt />

  </v-app>
</template>

<script>
export default {
  name: "rangeAdmin",
  middleware: 'rangeAuth',

}
</script>