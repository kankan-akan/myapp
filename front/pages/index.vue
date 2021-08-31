<template>
<v-app>
  <header>
    <div class ="container">
        <div class ="header-logo">LOGO</div>
      <div class = "float-right">
        <v-btn >
          ログイン
          <v-icon>mdi-account-arrow-left-outline</v-icon>
        </v-btn>  
      </div>
    </div>
  </header>
  <div class ="main">
    <div class ="container">
      <div class ="contents">
        <p>しょしゃぐりーんくらぶ</p>
        <p1>書写グリーン倶楽部</p1>
          <table>
            <tr>
              <td class ="empty"></td class ="empty"> <th>平日</th>　<th>土日</th>
            </tr>
            <tr>
              <th>ボール単価</th>　<td>10円/1球</td>　<td>12円/1球</td>
            </tr>
          </table>
        
        <v-btn 
          color="green white--text lighten-1" 
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
            <v-row justify = "center">
              <v-card color ="white black--text" width ="400">
                <v-card-title>Hello title</v-card-title>
                <v-card-text >
                  Hello world
                </v-card-text>
                <v-btn
                  color="success"
                  @click="overlay = false"
                >
                  close</v-btn>
              </v-card>
            </v-row>
          </v-container>
        </v-overlay>
        </div>
      </div>
      <div class ="contents">
        <p>さいがごるふれんしゅうじょう</p>
        <p1>才加ゴルフ練習場</p1>
          <table>
            <tr>
              <td class ="empty"></td class ="empty"> <th>平日</th>　<th>土日</th>
            </tr>
            <tr>
              <th>ボール単価</th>　<td>10円/1球</td>　<td>12円/1球</td>
            </tr>
          </table>
      </div>
      <div class ="contents">
        <p>にっけごるふくらぶきょうぐちせんたー</p>
        <p1>ニッケゴルフ倶楽部京口センター</p1>
          <table>
            <tr>
              <td class ="empty"></td> <th>平日</th> <th>土日</th>
            </tr>
            <tr>
              <th>ボール単価</th> <td>10円/1球</td> <td>12円/1球</td>
            </tr>
          </table>
      </div>
      <div class ="contents">
        <p>あおやまごるふれんしゅうじょう</p>
        <p1>青山ゴルフ練習場</p1>
          <table>
            <tr>
              <td class ="empty"> </td class ="empty"><th>平日</th> <th>土日</th>
            </tr>
            <tr>
              <th>ボール単価</th> <td>10円/1球</td><td>12円/1球</td>
            </tr>
          </table>
      </div>
    </div>
  </div>
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