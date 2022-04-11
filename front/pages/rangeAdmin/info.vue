<template>
  <v-main >
    <v-container >
      
      <v-row>
        <v-col>
          <div>基本情報</div>
        </v-col>
        <v-col>
          <v-btn>
            <v-icon>{{ 'mdi-pen' }}</v-icon>
            編集
          </v-btn>
          <p>{{ loginRange.id }}</p>
        </v-col>
      </v-row>

      
      <v-row dense>
      <v-col cols="10" >
        <v-card color="grey lighten-5">
          <v-card-text>
            <v-row>
              <v-col cols="2">
              <div>市町村</div>
              </v-col>
              <v-col>
                <h3>{{ rangeData.city }}</h3>
              </v-col>
            </v-row>
          </v-card-text>
        </v-card>
      </v-col>

      <v-col cols="10">
        <v-card>
          <v-card-text>
            <v-row>
              <v-col cols="2">
              <h3>練習場名</h3>
              </v-col>
              <v-col>
                <h3>{{ rangeData.name }}</h3>
              </v-col>
            </v-row>
          </v-card-text>
        </v-card>
      </v-col>

      <v-col cols="10">
        <v-card>
          <v-card-text>
            <v-row>
              <v-col cols="2">
              <h3>所在地</h3>
              </v-col>
              <v-col>
                <h3>{{ rangeData.address }}</h3>
              </v-col>
            </v-row>
          </v-card-text>
        </v-card>
      </v-col>

      <v-col cols="10">
        <v-card>
          <v-card-text>
            <v-row>
              <v-col cols="2">
              <h3>広さ(距離)</h3>
              </v-col>
              <v-col>
                <h3>{{ rangeData.distance }}  yd</h3>
              </v-col>
            </v-row>
          </v-card-text>
        </v-card>
      </v-col>

      <v-col cols="10">
        <v-card>
            <v-card-text>
              <v-row>
              <v-col cols="2">
                <h3>設備</h3>
              </v-col>
            <v-col>
              <!-- <RangeInfo /> -->
              <Equipment :equipment="rangeData.equipment" />
            </v-col>
            </v-row>
            </v-card-text>
        </v-card>
      </v-col>

      <v-col cols="10">
        <v-card>
          <v-card-text>
            <v-row>
              <v-col cols="2">
              <h3>特徴</h3>
              </v-col>
              <v-col>
                <div 
                  style="white-space:pre-wrap; word-wrap:break-word;"
                >{{ rangeData.features }}</div>
              </v-col>
            </v-row>
          </v-card-text>
        </v-card>
      </v-col>

      <v-col cols="10">
        <v-card>
          <v-card-text>
            <v-row>
              <v-col cols="2">
              <h3>打席数</h3>
              </v-col>
              <v-col>
                <h3>{{ rangeData.booths }}  打席</h3>
              </v-col>
            </v-row>
          </v-card-text>
        </v-card>
      </v-col>

      <v-col cols="10">
        <v-card>
          <v-card-text>
            <v-row>
              <v-col cols="2">
              <h3>HPリンク</h3>
              </v-col>
              <v-col>
                <h3>{{ rangeData.link }}</h3>
              </v-col>
            </v-row>
          </v-card-text>
        </v-card>
      </v-col>

      <v-col cols="10">
        <v-card>
          <v-card-text>
            <v-row>
              <v-col cols="2">
                <h3>電話番号</h3>
              </v-col>
              <v-col>
                <h3>{{ rangeData.phone_number }}</h3>
              </v-col>
            </v-row>
          </v-card-text>
        </v-card>
      </v-col>
      </v-row>

    <div>{{ rangeData }}</div>
    
    </v-container>
  </v-main>
</template>

<script>
import { mapActions,mapState } from 'vuex';

export default {
  data:() => ({

  }),

  computed: {
    ...mapState({
      loginRange: (state) => state.rangeAuth.loginRange,
      rangeData: (state) => state.rangeAuth.rangeData,
    }),
    
  },

  methods: {
    ...mapActions({
      getRangeData: 'rangeAuth/getRangeData',
    })
  },

  mounted() {
    this.getRangeData()
      
  },

}
</script>

<style scoped>
.border {
  border-bottom: 1px solid silver;
}
</style>
