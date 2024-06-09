<template>
  <div>
    <v-row justify="center" no-gutter>
      <v-col cols="6">
        <div class="text-subtitle-1 font-weight-bold">市町村から検索</div>
        <v-autocomplete
          v-model="city"
          :items="cities"
          chips
          clearable
          deletable-chips
          multiple
          solo
          rounded
          label="市町村を選択"
        ></v-autocomplete>
      </v-col>
      <v-col cols="6">
        <div class="text-subtitle-1 font-weight-bold">練習場名で検索</div>
        <v-autocomplete
          v-model="range"
          :loading="loading"
          :items="items"
          :search-input.sync="search"
          hide-no-data
          clearable
          solo
          rounded
          label="練習場名を入力"
        ></v-autocomplete>
      </v-col>
    </v-row>
    <v-row
      class="justify-end"
      no-gutters
    >
      <v-btn
        dense
        small
        text
      >
        <v-icon>mdi-plus-circle-outline</v-icon>
          詳細条件を指定
      </v-btn>
      <v-btn @click="sendEmit()">検索</v-btn>
    </v-row>
      <!-- <div>{{ filteredOutlines }}</div> -->
  </div>
</template>

<script>
import { mapActions, mapState } from 'vuex';

export default {
  data: function () {
    return {
      dialog: false,
      city: [],
      cities: [ '相生市', '赤穂市', '明石市', '朝来市', '芦屋市', '尼崎市', '淡路市', '伊丹市', '市川町', '猪名川町', '稲美町', '小野市', '加古川市', '加西市', '加東市', '神河町', '香美町', '上郡町', '川西市','神戸市', '佐用町', '三田市', '宍粟市', '新温泉町', '洲本市', '太子町', '多可町', '高砂市', '宝塚市', 'たつの市', '丹波市', '丹波篠山市', '豊岡市', '西宮市', '西脇市', '播磨町', '姫路市', '福崎町', '三木市', '南あわじ市', '養父市' ],
      items: [],
      loading: false,
      range: '',
      rangeName: '',
      search: null
    }
  },

  computed: {
    ...mapState({
      outline: (state) => state.outline
    }),
    filteredOutlines() {
      if (this.city.length === 0 && !this.range) {
        return this.outline
      } else if (this.city.length !== 0) {
        const outline = this.outline.filter((f) => {
          return this.city.some(x => f["city"] == x)
        })
        return outline
      } else {
        const outline = this.outline.filter((f) => {
          return f.name.includes(this.range)
        })
        return outline
      }
    },
  },

  watch: {
    search (val) {
      val && val !== this.range && this.querySelections(val)
    }
  },

  created: async function() {
    await this.getOutline()
    if(this.$store.state.auth.loggedIn) {
      this.getLoginUser()
    }
    const val = this.outline.map(v => v.name)
    this.rangeName = val
    // this.$store.commit('rangeAuth/setIsLoggedIn', false)
    // this.$store.commit('rangeAuth/setLoginRange', null)
    // this.$store.commit('rangeAuth/setRangeData', null)
  },

  methods: {
    ...mapActions({
      getOutline: 'getOutline',
      getLoginUser: 'myData/getLoginUser'
    }),
    showLesson(id) {
      this.$router.push(`/lessons/${id}`)
    },
    querySelections (v) {
      this.loading = true
      // Simulated ajax query
      setTimeout(() => {
        this.items = this.rangeName.filter(e => {
          return (e || '').toLowerCase().indexOf((v || '').toLowerCase()) > -1
        })
        this.loading = false
      }, 500)
    },
    sendEmit() {
      this.$emit('outlines', this.filteredOutlines)
    }
  }
}
</script>
