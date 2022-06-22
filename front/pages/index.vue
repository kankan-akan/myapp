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
              <v-btn 
                block
                color="green white--text lighten-1"
                class="ma-2"
                @click="selectedPlace = place"
              >
                詳細
                <v-icon>mdi-chevron-double-down</v-icon>
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-col>
      </v-row>

      <div v-if="overlay" @click="selectedPlace = null || closeContent()">
      <v-overlay  :value="overlay">
        <v-container @click.stop>
          <v-card 
            class="white content"
            :class="{ open : isOpened[i] }"
          >
            <v-row>
              <v-col>
                <v-card-text class="black--text"> 
                  <div 
                    v-if="selectedPlace"
                    v-text="selectedPlace.city"
                  ></div>
                  <div 
                    class="text-h6"
                    v-if="selectedPlace"
                    v-text="selectedPlace.name"
                  ></div>
                  <div 
                    v-if="selectedPlace"
                    v-text="selectedPlace.address"
                  ></div>
                  <div 
                    v-if="selectedPlace"
                  >{{ selectedPlace.distance }}yd</div>

                  <v-divider class="grey lighten-2 my-2"></v-divider>

                  <table>
                    <tr>
                      <td class="empty"></td> <th>平日</th><th>土日</th>
                    </tr>
                    <tr>
                      <th>ボール単価</th> <td>10円/1球</td><td>12円/1球</td>
                    </tr>
                  </table>

                  <Equipment :equipment="selectedPlace.equipment" />

                  <div
                    v-if="selectedPlace" 
                    style="white-space:pre-wrap; word-wrap:break-word;"
                  >{{ selectedPlace.features }}</div>
                  <div 
                    v-if="selectedPlace"
                  >ホームページ: {{ selectedPlace.link }}</div>
                  <div 
                    v-if="selectedPlace"
                  >電話番号: {{ selectedPlace.phone_number }}</div>
                  <div 
                    v-if="selectedPlace"
                  >打席数: {{ selectedPlace.booths }}打席</div>

                  <v-card-title class="pa-1">レッスン一覧</v-card-title>
                  <v-col 
                    class="pa-1"
                    v-for="(lesson, i) in selectedPlace.lessons" 
                    :key="i"
                  >
                    <v-card @click="showLesson()" class="white">
                      <v-card-text class="black--text">
                        <div v-if="selectedPlace" v-text="lesson.title"></div>
                      </v-card-text>
                    </v-card>
                  </v-col>
                </v-card-text>
                
                  <transition name="accordion">
                      <div
                        v-show="isOpened"
                        class="pa-1 black--text"
                      >
                        <div v-if="selectedPlace">{{ lesson.title }}</div>
                        <div v-if="selectedPlace">{{ lesson.coach }}</div>
                        <div v-if="selectedPlace">{{ lesson.content }}</div>
                      </div>
                    </transition>

                <v-card-actions class="justify-center">
                  <v-btn
                    color="success"
                    class="ma-3"
                    @click="selectedPlace = null || closeContent()"
                  >
                    close
                  </v-btn>
                </v-card-actions>
              </v-col>
            </v-row>
          </v-card>
        
        </v-container>
      </v-overlay>
      </div>
        
    </v-container>
  </v-main>
</template>

<script src ="./index.js"></script>
