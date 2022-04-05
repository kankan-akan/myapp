<template>
<v-card>
      <v-card-text>
        <v-form
          ref="form"
          v-model ="valid"
          lazy-validation 
        >
        <v-col cols="3">
          <v-select
            outlined
            v-model ="city"
            :rules ="cityRules"
            label ="＊市町村名"
            :items="cities"
            required
          ></v-select>
        </v-col>
        <v-col>
          <v-text-field
            outlined
            v-model ="name"
            :rules ="nameRules"
            label ="＊ゴルフ場名"
            required
          ></v-text-field>
        </v-col>
        <v-col>
          <v-text-field
            outlined
            v-model ="address"
            :rules ="addressRules"
            label ="＊所在地"
            required
            hint="例: 兵庫県神戸市中央区99-99"
            persistent-hint
          ></v-text-field>
        </v-col>
        <v-col cols="3">
          <v-text-field
            outlined
            v-model ="distance"
            :rules ="distanceRules"
            label ="＊広さ(距離)"
            required
            suffix="yd"
            hint="(半角入力)"
            persistent-hint
          ></v-text-field>
        </v-col>
        <div class="px-3">設備</div>
        <v-row class="px-3">
          <v-col>
            <v-checkbox
              v-model="uchihoudai"
              label="打ち放題"
            ></v-checkbox>
            <v-checkbox
              v-model="approach"
              label="アプローチ場"
            ></v-checkbox>
          </v-col>
          <v-col>
            <v-checkbox
              v-model="lefty"
              label="左打席"
            ></v-checkbox>
            <v-checkbox
              v-model="patting"
              label="パター場"
            ></v-checkbox>
          </v-col>
          <v-col>
            <v-checkbox
              v-model="bunker"
              label="バンカー場"
            ></v-checkbox>
            <v-checkbox
              v-model="shop"
              label="ショップ"
            ></v-checkbox>
          </v-col>
          <v-col>
            <v-checkbox
              v-model="restaurant"
              label="レストラン"
            ></v-checkbox>
            <v-checkbox
              v-model="lesson"
              label="レッスン"
            ></v-checkbox>
          </v-col>
        </v-row>
        <v-col>
          <v-textarea
            outlined
            v-model ="features"
            label ="特徴"
            height="200"
          ></v-textarea>
        </v-col>
        <v-col cols="3">
          <v-text-field
            outlined
            v-model ="booths"
            :rules ="boothsRules"
            label ="＊打席数"
            required
            suffix="打席"

          ></v-text-field>
        </v-col>
        <v-col>
          <v-text-field
            outlined
            v-model ="link"
            label ="ホームページリンク"
            hint="例: www.example.com/page"
            persistent-hint
          ></v-text-field>
        </v-col>
        <v-col>
          <v-text-field
            outlined
            v-model ="phoneNumber"
            :rules ="phoneNumberRules"
            label ="＊電話番号(固定電話)"
            required
            hint="例: 078-123-1234(半角入力)"
            persistent-hint
          ></v-text-field>
        </v-col>
          <h5>'＊'は必須項目です</h5>
          <v-card-actions>
            <v-btn
              class ="mr-4"
              type ="submit"
              :disabled ="!valid" 
              @click.prevent ="submit"
              large
              outlined
            >
              登録
            </v-btn>
            
            <v-btn
              color ="error"
              class ="mr-4"
              @click ="reset"
              large
              outlined
            >
              やり直す
            </v-btn>
          </v-card-actions>
        </v-form>
      </v-card-text>
    </v-card>
</template>

<script>
import { mapState } from 'vuex';

export default {

  data: () => ({
    /* register validate */
    valid: true,
    city: '神戸市',
    cityRules: [
      v => !!v || '入力してください'
    ],
    name: 'hogeゴルフ場', 
    nameRules: [
      v => !!v || '入力してください'
    ],
    address: '兵庫県神戸市中央区99-99',
    addressRules: [
      v => !!v || '入力してください'
    ],
    distance: '250',
    distanceRules: [
      v => !!v || '入力してください'
    ],
    features: '',
    booths: '50',
    boothsRules: [
      v => !!v || '入力してください'
    ],
    link: 'https://example.com',
    phoneNumber: '078-123-1234',
    phoneNumberRules: [
      v => !!v || '入力してください',
      v => /^\d{1,4}-\d{3}-\d{4}$/.test(v) || '入力が正しくありません'
    ],
    uchihoudai: false,
    approach: false,
    lefty: false,
    patting: false,
    bunker: false,
    shop: false,
    restaurant: false,
    lesson: false,

  cities: [ '相生市', '赤穂市', '明石市', '朝来市', '芦屋市', '尼崎市', '淡路市', '伊丹市', '市川町', '猪名川町', '稲美町', '小野市', '加古川市', '加西市', '加東市', '神河町', '香美町', '上郡町', '川西市','神戸市', '佐用町', '三田市', '宍粟市', '新温泉町', '洲本市', '太子町', '多可町', '高砂市', '宝塚市', 'たつの市', '丹波市', '丹波篠山市', '豊岡市', '西宮市', '西脇市', '播磨町', '姫路市', '福崎町', '三木市', '南あわじ市', '養父市' ]
  }),

  computed:{
    ...mapState({
      loginRange: (state) => state.rangeAuth.loginRange
    }),
    params() {
      return {
        city: this.city,
        name: this.name,
        address: this.address,
        distance: this.distance,
        features: this.features,
        booths: this.booths,
        link: this.link,
        phone_number: this.phoneNumber,
        uchihoudai: this.uchihoudai,
        approach: this.approach,
        lefty: this.lefty,
        patting: this.patting,
        bunker:this.bunker,
        shop: this.shop,
        restaurant: this.restaurant,
        lesson: this.lesson,
        
      }
    }

  },

  methods: {
    //全て入力されているか
    async submit () {
      if (this.$refs.form.validate()) {
        await this.$axios.post('/v1/outlines', {
          city: this.city,
          name: this.name,
          address: this.address,
          distance: this.distance,
          features: this.features,
          booths: this.booths,
          link: this.link,
          phone_number: this.phoneNumber,
          uchihoudai: this.uchihoudai,
          approach: this.approach,
          lefty: this.lefty,
          patting: this.patting,
          bunker:this.bunker,
          shop: this.shop,
          restaurant: this.restaurant,
          lesson: this.lesson,
          admin_range_id: this.loginRange.id
        })
        .then((res) => {
          console.log(res)
          // this.snackbar = true
        })
        .catch((err) => {
          console.log(err)
        })
      }
    },

    reset () {
      this.$refs.form.reset()
    },
  },
}
</script>