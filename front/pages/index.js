import { mapActions, mapState } from 'vuex';

export default {
  data: function () {
    return {
      dialog: false,
      panel: [],
      city: [],
      loading: false,
      items: [],
      cities: [ '相生市', '赤穂市', '明石市', '朝来市', '芦屋市', '尼崎市', '淡路市', '伊丹市', '市川町', '猪名川町', '稲美町', '小野市', '加古川市', '加西市', '加東市', '神河町', '香美町', '上郡町', '川西市','神戸市', '佐用町', '三田市', '宍粟市', '新温泉町', '洲本市', '太子町', '多可町', '高砂市', '宝塚市', 'たつの市', '丹波市', '丹波篠山市', '豊岡市', '西宮市', '西脇市', '播磨町', '姫路市', '福崎町', '三木市', '南あわじ市', '養父市' ],
      range: null
    }
  },

  computed: {
    ...mapState({
      outline: (state) => state.outline
    }),
    filteredOutlines() {
      if(this.city !== '') {
      const outline = this.outline.filter((f) => {
        return this.city.some(x => f["city"] == x)
      })
        return outline
        // let city = this.city
        // for(let i in city) {
        //   if (f.city[i] === undefined || f.city[i] !== city[i])
        //     return this.outline
        // }
        // return true
        
      }else{
        return this.outline
      }
    }
  },

  created: async function() {
    await this.getOutline()
      if(this.$store.state.auth.loggedIn) {
        this.getLoginUser()
    }
    this.$store.commit('rangeAuth/setIsLoggedIn', false)
    this.$store.commit('rangeAuth/setLoginRange', null)
    this.$store.commit('rangeAuth/setRangeData', null)
  },

  methods: {
    ...mapActions({
      getOutline: 'getOutline',
      getLoginUser: 'authentication/getLoginUser'
    }),
    showLesson(id) {
      this.$router.push(`/lessons/${id}`)
    },
    nonePanel() {
      this.panel = []
    },
    querySelections (v) {
      this.loading = true
      // Simulated ajax query
      setTimeout(() => {
        this.items = this.ranges.filter(e => {
          return (e || '').toLowerCase().indexOf((v || '').toLowerCase()) > -1
        })
        this.loading = false
      }, 500)
    },
  }
}