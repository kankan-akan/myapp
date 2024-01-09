<template>
  <div>
    <v-dialog
      v-model="dialog"
      width="800"
    >
      <template v-slot:activator="{ on, attrs }">
        <v-btn
          v-on="on"
          v-bind="attrs"
          color="light-green lighten-4"
        >
          <v-icon>{{ 'mdi-pen' }}</v-icon>
          編集
        </v-btn>
      </template>
      <v-card>
        <v-card-title class="text-h5 cyan lighten-3">
          編集
        </v-card-title>
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
              :rules ="[rules.required]"
              label ="＊市町村名"
              :items="cities"
              required
            ></v-select>
          </v-col>
          <v-col>
            <v-text-field
              outlined
              v-model ="name"
              :rules ="[rules.required]"
              label ="＊ゴルフ場名"
              required
            ></v-text-field>
          </v-col>
          <v-col>
            <v-text-field
              outlined
              v-model ="address"
              :rules ="[rules.required]"
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
              :rules ="[rules.required]"
              label ="＊広さ(距離)"
              required
              suffix="yd"
              hint="(半角入力)"
              persistent-hint
            ></v-text-field>
          </v-col>
          <div class="px-3 mt-4">画像</div>
          <v-row no-gutter justify="center">
            <v-col cols="10">
              <v-file-input
                v-model="inputImage"
                accept="image/png, image/jpeg, image/bmp"
                prepend-icon="mdi-camera-plus-outline"
                label="画像を選択してください"
                @change="uploadImage"
              ></v-file-input>
              <template v-if="image && image.url !== null">
                <v-img
                  v-if="preImage !== ''"
                  :src="preImage"
                  contain
                  aspect-ratio="1.7"
                ></v-img>
                <v-img
                  v-else
                  :src="image.url"
                  contain
                  aspect-ratio="1.7"
                >
                  <div class="d-flex justify-end my-2">
                    <v-btn
                      dark
                      icon
                      @click="deleteImage()"
                    >
                      <v-icon large>mdi-close</v-icon>
                    </v-btn>
                  </div>
                </v-img>
              </template>
              <template v-else>
                <v-img
                  v-if="preImage !== ''"
                  :src="preImage"
                  contain
                  aspect-ratio="1.7"
                ></v-img>
                <v-sheet
                  v-else
                  class="d-flex justify-center align-center"
                  color="grey lighten-2"
                  height="280"
                  aspect-ratio="1.7"
                >
                  <v-icon size="80">{{ 'mdi-image' }}</v-icon>
                </v-sheet>
              </template>
            </v-col>
          </v-row>
          <div class="px-3 mt-8">＊設備</div>
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
              v-model="features"
              label="特徴"
              height="200"
            ></v-textarea>
          </v-col>
          <v-col cols="3">
            <v-text-field
              outlined
              v-model="booths"
              :rules="[rules.required]"
              label="＊打席数"
              required
              suffix="打席"
            ></v-text-field>
          </v-col>
          <v-col>
            <v-text-field
              outlined
              v-model="link"
              label="ホームページリンク"
              hint="例: www.example.com/page"
              persistent-hint
            ></v-text-field>
          </v-col>
          <v-col>
            <v-text-field
              outlined
              v-model="phone_number"
              :rules="[rules.required, rules.phoneNumber]"
              label="＊電話番号(固定電話)"
              required
              hint="例: 078-123-1234(半角入力)"
              persistent-hint
            ></v-text-field>
          </v-col>
            <h5>'＊'は必須項目です</h5>
            <v-card-actions>
              <v-btn
                class="mr-4"
                :disabled="!valid"
                @click="edit()"
                large
                outlined
              >
                登録
              </v-btn>
              <v-btn
                color ="error"
                class ="mr-4"
                @click="dialog = false"
                large
                outlined
              >
                閉じる
              </v-btn>
            </v-card-actions>
          </v-form>
        </v-card-text>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
import { mapState,mapActions } from 'vuex';

export default {
  data: function () {
    return {
      dialog: false,
      /* register validate */
      valid: true,
      rules: {
        required: v => !!v || '入力してください' ,
        phoneNumber: v => /^\d{1,4}-\d{3}-\d{4}$/.test(v) || '入力が正しくありません'
      },
      city: this.$store.state.rangeAuth.rangeData.city,
      name: this.$store.state.rangeAuth.rangeData.name,
      address: this.$store.state.rangeAuth.rangeData.address,
      distance: this.$store.state.rangeAuth.rangeData.distance,
      image: this.$store.state.rangeAuth.rangeData.image,
      inputImage: null,
      preImage: '',
      features:this.$store.state.rangeAuth.rangeData.features,
      booths: this.$store.state.rangeAuth.rangeData.booths,
      link: this.$store.state.rangeAuth.rangeData.link,
      phone_number: this.$store.state.rangeAuth.rangeData.phone_number,
      uchihoudai: this.$store.state.rangeAuth.rangeData.equipment.uchihoudai,
      approach: this.$store.state.rangeAuth.rangeData.equipment.approach,
      lefty: this.$store.state.rangeAuth.rangeData.equipment.lefty,
      patting: this.$store.state.rangeAuth.rangeData.equipment.patting,
      bunker: this.$store.state.rangeAuth.rangeData.equipment.bunker,
      shop: this.$store.state.rangeAuth.rangeData.equipment.shop,
      restaurant: this.$store.state.rangeAuth.rangeData.equipment.restaurant,
      lesson: this.$store.state.rangeAuth.rangeData.equipment.lesson,
      cities: [ '相生市', '赤穂市', '明石市', '朝来市', '芦屋市', '尼崎市', '淡路市', '伊丹市', '市川町', '猪名川町', '稲美町', '小野市', '加古川市', '加西市', '加東市', '神河町', '香美町', '上郡町', '川西市','神戸市', '佐用町', '三田市', '宍粟市', '新温泉町', '洲本市', '太子町', '多可町', '高砂市', '宝塚市', 'たつの市', '丹波市', '丹波篠山市', '豊岡市', '西宮市', '西脇市', '播磨町', '姫路市', '福崎町', '三木市', '南あわじ市', '養父市' ]
    }
  },

  computed:{
    ...mapState({
      loginRange: (state) => state.rangeAuth.loginRange,
      rangeData: (state) => state.rangeAuth.rangeData
    })
  },

  methods: {
    ...mapActions({
      getRangeData: 'rangeAuth/getRangeData',
    }),
    async edit () {
      if (this.$refs.form.validate()) {
        const formData = new FormData()
        formData.append('city', this.city)
        formData.append('name', this.name)
        formData.append('address', this.address)
        formData.append('distance', this.distance)
        formData.append('features', this.features)
        formData.append('booths', this.booths)
        formData.append('link', this.link)
        formData.append('phone_number', this.phone_number)
        formData.append('uchihoudai', this.uchihoudai)
        formData.append('approach', this.approach)
        formData.append('lefty', this.lefty)
        formData.append('patting', this.patting)
        formData.append('bunker', this.bunker)
        formData.append('shop', this.shop)
        formData.append('restaurant', this.restaurant)
        formData.append('lesson', this.lesson)
        formData.append('admin_range_id', this.loginRange.id)
        if (this.inputImage || this.inputImage == '') {
          formData.append('image', this.inputImage)
        }
        await this.$axios.put(`/v1/outlines/${this.loginRange.id}`, formData, {
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        })
        .then((res) => {
          console.log(res)
          this.getRangeData()
          this.dialog = false
          this.$store.dispatch(
            'snackbar/showMessage', {
              icon: 'mdi-checkbox-marked-circle-outline',
              message: '変更が保存されました。',
              type: 'success',
              status: true,
            },
            { root: true }
          )
        })
        .catch((err) => {
          console.log(err)
          this.$store.dispatch(
            'snackbar/showMessage', {
              icon: 'mdi-alert-outline',
              message: '変更に失敗しました。',
              type: 'error',
              status: true,
            },
            { root: true }
          )
        })
      }
    },
    reset () {
      this.$refs.form.reset()
    },
    uploadImage (file) {
      if (file !== undefined && file !== null) {
        if (file.name.lastIndexOf('.') <= 0) {
          return
        }
        const fr = new FileReader()
        fr.readAsDataURL(file)
        fr.addEventListener('load', () => {
          this.preImage = fr.result
        })
      } else {
        this.preImage = ''
      }
    },
    deleteImage () {
      this.image = null
      this.inputImage = []
    }
  },
}
</script>