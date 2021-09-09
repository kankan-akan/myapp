<template>
<v-app>
  <v-app-bar app
    height ="90"
    color ="blue white--text darken-2"
  >
    <v-container>
      <v-row>
        <v-col class ="header-logo my-auto">LOGO</v-col>

        <v-col >
          <v-dialog
            transition="fab-transition"
            v-model="dialog"
            persistent
            max-width="600px"
          >
            <template v-slot:activator="{ on, attrs }">
              <v-btn
                class ="float-right my-auto"
                color="primary"
                dark
                v-bind="attrs"
                v-on="on"
              >
                ログイン
                <v-icon>mdi-account-arrow-left-outline</v-icon>
              </v-btn>
            </template>
            <v-card>
              <v-card-title>
                <span class="text-h5">User Profile</span>
              </v-card-title>
              <v-card-text>
                <v-container>
                  <v-row>
                    <v-col
                      cols="12"
                      sm="6"
                      md="4"
                    >
                      <v-text-field
                        label="Legal first name*"
                        required
                      ></v-text-field>
                    </v-col>
                    <v-col cols="12">
                      <v-text-field
                        label="Email*"
                        required
                      ></v-text-field>
                    </v-col>
                    <v-col cols="12">
                      <v-text-field
                        label="Password*"
                        type="password"
                        required
                      ></v-text-field>
                    </v-col>
                    <v-col
                      cols="12"
                      sm="6"
                    >
                      <v-select
                        :items="['0-17', '18-29', '30-54', '54+']"
                        label="Age*"
                        required
                      ></v-select>
                    </v-col>
                  </v-row>
                </v-container>
                <small>*indicates required field</small>
              </v-card-text>
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn
                  color="blue darken-1"
                  text
                  @click="dialog = false"
                >
                  Close
                </v-btn>
                <v-btn
                  color="blue darken-1"
                  text
                  @click="dialog = false"
                >
                  Save
                </v-btn>
              </v-card-actions>
            </v-card>
          </v-dialog>
        </v-col>

      </v-row> 
    </v-container>
  </v-app-bar>

  <v-main>
    <v-container>
      <v-row>
        <v-col 
          v-for= "place in places"
          :key = "place"
          cols = "12"
          xs = "12"
          sm = "3"
        >
        <v-card 
          justify = "space-around"
        >
          <v-card-text class="my-0 pa-2 black--text">
            <div v-text= "place.ruby"></div>
            <div 
              class = "text-h6"
              v-text = "place.place"
            >
            </div>
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
          
          <v-card-actions class ="justify-center">
              <v-btn 
                block
                color ="green white--text lighten-1"
                class ="ma-2"
                @click= "selectedPlace = place"
              >
                詳細
                <br/>
                  <v-icon>mdi-chevron-double-down</v-icon>
              </v-btn>
          </v-card-actions>
        </v-card>
        </v-col>
      </v-row>

          <div v-if = "overlay" @click = "selectedPlace = null">
          <v-overlay :value= "overlay">
            <v-container>
              <v-row >
              <v-col >
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
                      v-text = "selectedPlace.place"
                    ></div>
                    <div 
                      v-if = "selectedPlace"
                      v-text = "selectedPlace.adress"
                    ></div>
                    <v-divider class ="grey lighten-2 my-2"></v-divider>
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
