<template>
<v-app>
<body>
  <header>
    <div class ="container">
      <div class ="header-logo">LOGO</div>
      <div class ="header-left">
        <a class = "searchdetail" href="">詳細検索</a>
        <a class = "searchmap" href="">地図から探す</a>
      </div>
      <a class ="login" href="">ログイン</a>  
    </div>
    <div>
        <v-btn @click="getApi( )">GET API</v-btn>
  　　<div>{{ message }}</div>
    </div>
  </header>
  <div class ="main">
    <div class ="container">
      <div class ="contents">
        <p1>しょしゃぐりーんくらぶ</p1>
        <p>書写グリーン倶楽部</p>
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
              Show Overlay
        </v-btn>
        <v-overlay :value="overlay"></v-overlay>
        
      </div>
      <div class ="contents">
        <p1>さいがごるふれんしゅうじょう</p1>
        <p>才加ゴルフ練習場</p>
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
        <p1>にっけごるふくらぶきょうぐちせんたー</p1>
        <p>ニッケゴルフ倶楽部京口センター</p>
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
        <p1>あおやまごるふれんしゅうじょう</p1>
        <p>青山ゴルフ練習場</p>
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
</body>
</v-app>
</template>

<script>
export default {
  data: () => {
    return {
      name: ' ',
      message: ' '
    }
  },
  methods: {
    getApi() {
      const url = "/api/v1/hello"
      this.$axios.get(url)
        .then((res) => {
          this.message = res.data
        })
        .catch((error) => {
          console.log(error)
        })
    }
  }
}
</script>

<script>
export default {
  data: () => ({
    overlay: false,
  }),
    watch: {
      overlay (val) {
        val && setTimeout(() => {
          this.overlay = false
        }, 2000)
      },
    },
}
</script>