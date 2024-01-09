<template>
  <v-app>
    <Snackbar />

    <RangeHeader />

    <v-main class="range-color">
      <v-container fluid>
        <v-row>

          <RangeNavBar />

          <Nuxt />

        </v-row>
      </v-container>
    </v-main>

  </v-app>
</template>

<script>
export default {
  name: "rangeAdmin",
  middleware: 'rangeAuth',
  data: () => ({
    title: [
      {name: '基本情報', to:'/rangeAdmin/info'},
      {name: ''}
    ]
  })
}
</script>