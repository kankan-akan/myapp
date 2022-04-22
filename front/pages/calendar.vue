<template>
  <v-main>
    <!-- <v-container>
      <v-row>
        <v-col>
          <v-sheet height="60">
           
          </v-sheet>
         
        </v-col>
      </v-row>
    </v-container> -->
    
    
      <h2>
      {{ now }} 
      </h2>
      <h2>
      {{ now2 }} 
      </h2>

  </v-main>
</template>

<script>
  export default {
    data: () => ({
    now: "",
    now2: ''
    }),

    methods: {
      
    },

  mounted() {
    this.now = this.$dayjs().format('LLLL')
    this.now2 = this.$dayjs().add(1, 'month')
  }

  }
</script>