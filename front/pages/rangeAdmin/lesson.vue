<template>
  <v-main>
    <v-container>
      <v-col>
        <div>hogehoge</div>
      </v-col>
  </v-container>
</v-main>
  
</template>

<script>
import { mapActions, mapState } from 'vuex';

export default {

computed: {
  ...mapState({
    loginRange: (state) => state.rangeAuth.loginRange,
    lesson: (state) => state.lesson
  }),
  lesson() {
  this.getLesson()
  }
},

methods: {
  ...mapActions({
    getLesson: 'getLesson'
  }),

}
}
</script>
