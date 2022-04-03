<template>
<v-card>
      <v-card-text>
        <v-form
          ref="form"
          v-model ="valid"
          lazy-validation 
        >
          <v-text-field
            outlined
            v-model ="city"
            :rules ="cityRules"
            label ="所在地市町村名"
            required
          ></v-text-field>

          <v-text-field
            outlined
            v-model ="name"
            :rules ="nameRules"
            label ="ゴルフ場名"
            required
          ></v-text-field>

          <v-text-field
            outlined
            v-model ="address"
            :rules ="addressRules"
            label ="所在地"
            required
          ></v-text-field>

          <v-text-field
            outlined
            v-model ="distance"
            :rules ="distanceRules"
            label ="広さ（距離）"
            required
          ></v-text-field>
          
          <v-text-field
            outlined
            v-model ="features"
            :rules ="featuresRules"
            label ="特徴"
            required
          ></v-text-field>

          <v-text-field
            outlined
            v-model ="booths"
            :rules ="boothsRules"
            label ="設置ブース数"
            required
          ></v-text-field>

          <v-text-field
            outlined
            v-model ="link"
            :rules ="linkRules"
            label ="ホームページリンク"
            required
          ></v-text-field>

          <v-text-field
            outlined
            v-model ="phone_number"
            :rules ="phoneNumberRules"
            label ="電話番号"
            required
          ></v-text-field>

          <v-card-actions>
            <v-btn
              class ="mr-4"
              type ="submit"
              :disabled ="!valid || loading" 
              :loading ="loading"
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
export default {

  data: () => ({
    /* register validate */
    valid: true,
    loader: 'null',
    loading: false,

    city: '神戸市',
    cityRules: [
      v => !!v || '入力してください'
    ],

    name: 'hogeゴルフ場', 
    nameRules: [
      v => !!v || '入力してください'
    ],
    
    // userId: 'ichiro_tanaka',
    // userIdRules: [
    //   v => !!v || '入力してください',
    //   v => (v && v.length <= 15) || '15文字以下で入力してください',
    //   v => /^(?=.*[a-zA-Z])[a-zA-Z0-9\d.?/-_]{1,15}$/.test(v) || '',
    // ],
    
    address: '',
    addressRules: [
      v => !!v || '入力してください'
    ],

    distance: '',
    distanceRules: [
      v => !!v || '入力してください'
    ],

    features: '',
    featuresRules: [
      v => !!v || '入力してください'
    ],

    booths: '',
    boothsRules: [
      v => !!v || '入力してください'
    ],

    link: '',
    linkRules: [
      v => !!v || '入力してください'
    ],

    phone_number: '',
    phoneNumbeRules: [
      v => !!v || '入力してください'
    ],

    // password: 'password.',
    // passwordRules: [
    //   v => !!v || '入力してください',
    //   v => /^(?=.*[a-z])(?=.*[.?/-_])[a-zA-Z0-9\d.?/-_]{8,30}$/.test(v) || '',
    // ],

  }),

  computed:{
    params() {
      return {
        city: this.city,
        name: this.name,
        address: this.address,
        distance: this.distance,
        features: this.features,
        booths: this.booths,
        link: this.link,
        phone_number: this.phone_number
      }
    }

  },

  methods: {
    //全て入力されているか
    async submit () {
      if (this.$refs.form.validate()) {
        try {
          // this.loading = true
          const res = await this.$axios.post('/v1/', this.params)
          await this.$auth.loginWith('local', {
              city: this.city,
              name: this.name,
              address: this.address,
              distance: this.distance,
              features: this.features,
              booths: this.booths,
              link: this.link,
              phone_number: this.phone_number
          })
            console.log(res)
            // this.snackbar = true
        }catch(err) {
            console.log(err)
          }
      }

    },

    reset () {
      this.$refs.form.reset()
    },
  },
}
</script>