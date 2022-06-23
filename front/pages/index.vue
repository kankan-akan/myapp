<template>
  <v-main> 
    <v-container>
      <v-row >
        <v-btn to="/allPost">all post</v-btn>
      </v-row>
      <v-row>
        <v-col 
          v-for="(place, i) in outline"
          :key="i"
          cols="12"
          xs="12"
          sm="3"
        >
          <v-card justify="space-around">
            <v-card-text class="my-0 pa-2 black--text">
              <div v-text="place.city"></div>
              <div v-text="place.ruby"></div>
              <div 
                class="text-h6"
                v-text="place.name"
              >
              </div>
              <div v-text="place.address"></div>
              <div>{{ place.distance }}yd</div>
            </v-card-text>
            <v-divider class="my-2"></v-divider>
            <table>
              <tr>
                <td class="empty"></td> <th>平日</th><th>土日</th>
              </tr>
              <tr>
                <th>ボール単価</th> <td>10円/1球</td><td>12円/1球</td>
              </tr>
            </table>

            <Equipment :equipment="place.equipment" />

            <v-card-actions class="justify-center">
              <v-dialog
                v-model="dialog"
                width="600"
              >
                <template v-slot:activator="{ on, attrs }">
                  <v-btn 
                    block
                    color="green white--text lighten-1"
                    class="ma-2"
                    @click="dialog = true"
                    v-bind="attrs"
                    v-on="on"
                  >
                    詳細
                    <v-icon>mdi-chevron-double-down</v-icon>
                  </v-btn>
                </template>
                <v-card>
                  <v-row>
                    <v-col>
                      <v-card-text>
                        <div v-text="place.city"></div>
                        <div class="text-h6" v-text="place.name"></div>
                        <div v-text="place.address"></div>
                        <div>{{ place.distance }}yd</div>

                        <v-divider class="grey lighten-2 my-2"></v-divider>

                        <table>
                          <tr>
                            <td class="empty"></td> <th>平日</th><th>土日</th>
                          </tr>
                          <tr>
                            <th>ボール単価</th> <td>10円/1球</td><td>12円/1球</td>
                          </tr>
                        </table>

                        <Equipment :equipment="place.equipment" />

                        <div 
                          style="white-space:pre-wrap; word-wrap:break-word;"
                        >{{ place.features }}</div>
                        <div>ホームページ: {{ place.link }}</div>
                        <div>電話番号: {{ place.phone_number }}</div>
                        <div>打席数: {{ place.booths }}打席</div>

                        <v-card-title class="pa-1">レッスン一覧</v-card-title>
                        <v-row justify="center">
                          <v-expansion-panels popout>
                            <v-expansion-panel
                              v-for="(lesson, i) in place.lessons"
                              :key="i"
                            >
                              <v-expansion-panel-header>
                                <v-row>{{ lesson.title }}</v-row>
                                <v-row>{{ lesson.coach }}</v-row>
                              </v-expansion-panel-header>
                              <v-expansion-panel-content>
                                <div>{{ lesson.title }}</div>
                                <div>{{ lesson.coach }}</div>
                                <div>{{ lesson.content }}</div>
                                <v-btn @click="showLesson()">詳細・予約</v-btn>
                              </v-expansion-panel-content>
                            </v-expansion-panel>
                          </v-expansion-panels>
                        </v-row>
                      </v-card-text>

                      <v-card-actions class="justify-center">
                        <v-btn
                          color="success"
                          class="ma-3"
                          @click="dialog = false"
                        >
                          close
                        </v-btn>
                      </v-card-actions>
                    </v-col>
                  </v-row>
                </v-card>
              </v-dialog>
            </v-card-actions>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </v-main>
</template>

<script src ="./index.js"></script>
