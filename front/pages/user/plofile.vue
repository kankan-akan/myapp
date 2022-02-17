<template>
  <v-app>
    <Header />
    <v-main>
      <v-card max-width="700" class="mx-auto">
        <v-container>
          <v-card-title>plofile</v-card-title>
        
          <div></div>
          <v-tabs>
            <v-tab>post</v-tab>
            <v-tab>like</v-tab>
            <v-tab>comment</v-tab>
            <v-tab>reservation</v-tab>
            <v-tab>bookmark</v-tab>
          </v-tabs>
          <v-item-group
            v-model="selected"
            multiple
          >
            <v-row dense>
              <v-col
                v-for="(item, i) in items"
                :key="i"
                cols="12"
                sm="3"
              >
                <v-item v-slot="{ active, toggle }">
                  <v-img
                    :src="`https://cdn.vuetifyjs.com/images/${item.src}`"
                    height="150"
                    class="text-right pa-1"
                    @click="toggle"
                  >
                    <v-btn
                      icon
                      dark
                    >
                      <v-icon>
                        {{ active ? 'mdi-heart' : 'mdi-heart-outline' }}
                      </v-icon>
                    </v-btn>
                  </v-img>
                </v-item>
              </v-col>
            </v-row>
          </v-item-group>
        </v-container>
      </v-card>
    </v-main>
  </v-app>
</template>

<script>
  export default {
    data: () => ({
      items: [
        {
          src: 'backgrounds/bg.jpg',
        },
        {
          src: 'backgrounds/md.jpg',
        },
        {
          src: 'backgrounds/bg-2.jpg',
        },
        {
          src: 'backgrounds/md2.jpg',
        },
      ],
      selected: [],
    }),
  }
</script>