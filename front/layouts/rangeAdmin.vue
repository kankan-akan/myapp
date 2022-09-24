<template>
  <v-app>
    <Snackbar />

    <RangeHeader />

    <v-main class="range-color">
      <v-container>
        <!-- <v-row dense>
          <v-col cols="3"> -->
            <v-card elevetion="12" rounded="xl">
            <v-navigation-drawer 
              app
              clipped
              floating 
              permanent
            >
              <v-list color="transparent">
                <v-list-item
                  v-for="(list, i) in listItem"
                  :key="i"
                  :to="list.to"
                  link
                >
                  <v-list-item-content>
                    <v-list-item-title>
                      {{ list.title }}
                    </v-list-item-title>
                  </v-list-item-content>
                </v-list-item>

                <v-divider class="my-2"></v-divider>

                <v-list-item
                  link
                  color="grey lighten-4"
                >
                  <v-list-item-content>
                    <v-list-item-title>
                      Refresh
                    </v-list-item-title>
                  </v-list-item-content>
                </v-list-item>
              </v-list>

              <!-- <template v-slot:append>
                <div class="pa-2">
                  <v-btn block @click="logout()">
                    Logout
                  </v-btn>
                </div>
              </template> -->
            </v-navigation-drawer>
            </v-card>
          <!-- </v-col> -->
          <v-col>
            <Nuxt />
          </v-col>
        <!-- </v-row> -->
      </v-container>
    </v-main>

  </v-app>
</template>

<script>
export default {
  name: "rangeAdmin",
  middleware: 'rangeAuth',
  data: () => ({
    listItem: [
      {title: '基本情報', to: "/rangeAdmin/info"},
      { title: '開講レッスン', to: "/rangeAdmin/lesson" },
      { title: '予約状況', to: "/rangeAdmin/status" },
      { title: 'アカウント設定', to: "/rangeAdmin/account" }
    ]
  })
}
</script>