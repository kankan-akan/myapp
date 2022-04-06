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
          </v-col>
      </v-row>
      <v-row>
        <v-col>
        <RangeInfo />
      </v-col>
      </v-row>
      
    </v-container>
  </v-main>
</template>

<script>

export default {
  data:() => ({
  }),

  computed: {
    
  },

  methods: {
    
  }
}
</script>
