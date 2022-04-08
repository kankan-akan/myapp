<template>
  <v-main>
    <v-container>
      <v-row class="justify-start">
        <v-col>
          <h2>基本情報</h2>
        </v-col>
          <v-col>
            <v-btn>
              <v-icon>{{ 'mdi-pen' }}</v-icon>
              編集
            </v-btn>
            <div>{{ loginRange.id }}</div>
            <div>{{ rangeData }}</div>
          </v-col>
      </v-row>
      <v-row>
        <v-col cols="10">
        <!-- <RangeInfo /> -->
        <!-- <Equipment :equipment="rangeData.equipment" /> -->
      </v-col>
      </v-row>
      
    </v-container>
  </v-main>
</template>

<script>
import { mapState } from 'vuex';

export default {
  data:() => ({

  }),

  computed: {
    ...mapState({
    loginRange: (state) => state.rangeAuth.loginRange,
    rangeData: (state) => state.rangeAuth.rangeData
    }),
    
  },

  methods: {
  },

  created() {
    console.log(this.loginRange.id)
    //   this.$axios.get(`/v1/outlines/${this.loginRange.id}`)
    // .then((res) => {
    //   // console.log(res)
    //   commit('rangeAuth/setRangeData', res.data)
    //   this.rangeData = res.data
    // })
    
  },

  mounted() {
    console.log(this.loginRange.id)
  }
}
</script>
