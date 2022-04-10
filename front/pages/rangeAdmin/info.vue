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
        <v-col 
          cols="10"
        >
        <!-- <RangeInfo /> -->
        <Equipment :equipment="rangeData.equipment" />
      </v-col>
      </v-row>
      
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

  created() {
    this.getRangeData()
      
  },

}
</script>
