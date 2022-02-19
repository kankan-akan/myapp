<template>
  <v-app>
    <Header />
    <v-main>
      <v-card max-width="700" class="justify-center mx-auto">
        <v-container>
          <v-card-title>plofile</v-card-title>
          <v-row class="justify-center pa-3">
            <v-avatar size="120">
              <img
                src="https://cdn.vuetifyjs.com/images/john.jpg"
                alt="John"
              >
            </v-avatar>
          </v-row>
          <v-row class="justify-center">
            <div>username</div>
          </v-row>
          <v-row class="justify-center">
            <div>@userid</div>
            <div v-for="(post, i) in post" :key="i">{{ post.content }}</div>
          </v-row>
          <v-row>
          <v-tabs  fixed-tabs color="cyan">
            <v-tab>post</v-tab>
            <v-tab>like</v-tab>
            <v-tab>bookmark</v-tab>
            <v-tab>reservation</v-tab>
            <v-tab>review</v-tab>

            <v-tab-item>
              <v-card flat>
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
                      xs="3"
                    >
                      <v-item v-slot="{ active, toggle }">
                        <v-img
                          :src="`https://cdn.vuetifyjs.com/images/${item.src}`"
                          aspect-ratio="1"
                          class="text-right pa-1"
                          
                        >
                        <v-btn icon dark>
                          <v-icon @click="toggle">
                            {{ active ? 'mdi-heart' : 'mdi-heart-outline' }}
                          </v-icon>
                        </v-btn>
                        </v-img>
                      </v-item>
                    </v-col>
                  </v-row>
                </v-item-group>
              </v-card>
            </v-tab-item>
            <v-tab-item>
              <v-card>

              </v-card>
            </v-tab-item>
            <v-tab-item>
              <v-card>

              </v-card>
            </v-tab-item>
            <v-tab-item>
              <v-card>

              </v-card>
            </v-tab-item>
            <v-tab-item>
              <v-card>

              </v-card>
            </v-tab-item>
          </v-tabs>
          </v-row>
        </v-container>
      </v-card>
    </v-main>
  </v-app>
</template>

<script>
import { mapActions, mapState } from 'vuex';
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

  methods: {
    ...mapActions ({
      getPost: 'user/getPost'

    })
  },

  created () {
   this.getPost()
  },

  computed: {
    ...mapState ({
      post: (state) => state.user.post
    })

  }

  }
</script>