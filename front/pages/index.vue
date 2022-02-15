<template>
<v-app>
<Header />
  <v-main> 
    <v-container>
      <v-row>
        <v-col 
          v-for= "(place, i) in outline"
          :key = "i"
          cols = "12"
          xs = "12"
          sm = "3"
        >
        <v-card 
          justify = "space-around"
        >
          <v-card-text class="my-0 pa-2 black--text">
            <div v-text = "place.city"></div>
            <div v-text= "place.ruby"></div>
            <div 
              class = "text-h6"
              v-text = "place.name"
            >
            </div>
            <div v-text = "place.address"></div>
            <div v-text = "place.distance"></div>
          </v-card-text>
            <v-divider class="my-2"></v-divider>
              <table>
                <tr>
                  <td class ="empty"></td> <th>平日</th><th>土日</th>
                </tr>
                <tr>
                  <th>ボール単価</th> <td>10円/1球</td><td>12円/1球</td>
                </tr>
              </table>
            <Equipment />
          <v-card-actions class ="justify-center">
              <v-btn 
                block
                color ="green white--text lighten-1"
                class ="ma-2"
                @click= "selectedPlace = outline"
              >
                詳細
                <v-icon>mdi-chevron-double-down</v-icon>
              </v-btn>
          </v-card-actions>
        </v-card>
        </v-col>
      </v-row>

          <div v-if = "overlay" @click ="selectedPlace = null">
          <v-overlay  :value= "overlay">
            <v-container @click.stop>
              <v-row>
              <v-col>
                <v-card 
                  class ="white"
                  width ="400"
                >
                  <v-card-text class ="black--text"> 
                    <div 
                      v-if = "selectedPlace"
                      v-text = "selectedPlace.ruby"
                    ></div>
                    <div 
                      class = "text-h6"
                      v-if = "selectedPlace"
                      v-text = "selectedPlace.name"
                    ></div>
                    <div 
                      v-if = "selectedPlace"
                      v-text = "selectedPlace.address"
                    ></div>
                    <div 
                      v-if = "selectedPlace"
                      v-text = "selectedPlace.distance"
                    ></div>
                    <v-divider class ="grey lighten-2 my-2"></v-divider>

                    <div 
                      v-if = "selectedPlace"
                      v-text = "selectedPlace.features"
                    ></div>
                    <div 
                      v-if = "selectedPlace"
                      v-text = "selectedPlace.link"
                    ></div>
                    <div 
                      v-if = "selectedPlace"
                      v-text = "selectedPlace.phone_number"
                    ></div>
                    <div 
                      v-if = "selectedPlace"
                      v-text = "selectedPlace.booths"
                    ></div>

                  </v-card-text>
                  <v-card-actions class ="justify-center">
                    <v-btn
                      color ="success"
                      class ="ma-5"
                      @click = "selectedPlace = null"
                    >
                    close
                    </v-btn>
                  </v-card-actions>
                </v-card>
              </v-col>
              </v-row>
            </v-container>
          </v-overlay>
          </div>
      
    </v-container>
  </v-main>
</v-app>
</template>

<script src ="./index.js"></script>
