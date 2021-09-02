<template>
<v-app>
  <v-app-bar app
    height ="90"
    color ="blue white--text darken-2"
  >
    <v-container>
      <v-row>
        <v-col class ="header-logo my-auto">LOGO</v-col>
        <v-btn class ="float-right my-auto">
          ログイン
            <v-icon>mdi-account-arrow-left-outline</v-icon>
        </v-btn> 
      </v-row> 
    </v-container>
  </v-app-bar>
  <v-main >
    <v-container >
      <v-row>
      <v-col 
        v-for = "n in 4"
        :key = "n"
        cols = "12"
        xs = "1"
        sm = "3"
      >
        <v-card 
          class = "text-center"
          justify = "space-around"
        >
          <v-card-text>
            <div class >しょしゃぐりーんくらぶ</div>
            <div class ="text-h6">書写グリーン倶楽部</div>
              <table>
                <tr>
                  <td class ="empty"></td class ="empty"> <th>平日</th>　<th>土日</th>
                </tr>
                <tr>
                  <th>ボール単価</th>　<td>10円/1球</td>　<td>12円/1球</td>
                </tr>
              </table>
          </v-card-text>
        <v-btn 
          color="green white--text lighten-1" 
          class = "ma-2"
          @click="overlay = !overlay"
        >
              詳細
              <br>
                <v-icon>mdi-chevron-double-down</v-icon>
              </br>
        </v-btn>

        <div @click="overlay = false">
        <v-overlay :value="overlay" >
          <v-container>
            <v-col>
              <v-card color ="white black--text" width ="400">
                <v-card-title>Hello vue</v-card-title>
                <v-card-text> 
                  <div class ="black--text text-subtitle-1">
                    Hello world
                  </div>
                </v-card-text>
                <v-card-action>
                  <v-btn
                  color="success"
                  class = "ma-5"
                  @click="overlay = false"
                  >
                  close</v-btn>
                </v-card-action>
              </v-card>
            </v-col>
          </v-container>
        </v-overlay>
        </div>
        </v-card>

      </v-col>
      </v-row>
      
    </v-container>
  </v-main>
</v-app>
</template>

<script>
export default {
  data: () => ({
    absolute: true,
    overlay: false,
  }),
    
}
</script>