export default {

  data: () => ({
      // modalwindow 
    selectedPlace: null,
      // output 
    places: [
      {
        id: '1',
        ruby: 'しょしゃぐりーんくらぶ', 
        place: '書写グリーン倶楽部', 
        adress: '兵庫県姫路市' 
        },
      {
        id: '2',
        ruby: 'おおくぼすいじょうごるふせんたー', 
        place: '大久保水上ゴルフセンター', 
        adress: '兵庫県明石市'
        },
      {
        id: '3',
        ruby: 'ごるふぷらざこうべ', 
        place: 'ゴルフプラザ神戸', 
        adress: '兵庫県神戸市'
        },
      {
        id: '4',
        ruby: 'あまがさきてくのらんど', 
        place: '尼崎テクノランド', 
        adress: '兵庫県尼崎市'
        },

    ],
  }),

  computed: {
    overlay: function () {
      return !!this.selectedPlace
    },
  },
}