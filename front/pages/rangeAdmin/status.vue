<template>
  <v-main>
    <v-container>
      <v-col class="d-flex align-center">
        <div class="text-h5 font-weight-bold mr-4">予約状況</div>
      </v-col>
      <div v-if="$store.state.rangeAuth.rangeData">
        <template v-if="lessons == ''">
          <v-row>
            <v-col class="d-flex justify-center">
              <h2 class="grey--text lighten-1" style="margin: 20px;">レッスンを新規作成して下さい。</h2>
            </v-col>
          </v-row>
        </template>
        <template v-else>
          <v-row class="justify-center">
            <v-col
              v-for="(lesson, i) in lessons"
              :key="i"
              cols="10"
            >
              <v-card @click="status(lesson.id)">
                <v-card-title>{{ lesson.title }}</v-card-title>
                <v-card-subtitle>{{ lesson.coach }}</v-card-subtitle>
                <v-card-text>
                  <v-col class="d-flex align-center">
                    <p class="youbi">開始時間:</p>
                    <p v-if="lesson.calendar.start_time1" class="youbi">{{ lesson.calendar.start_time1 }}</p>
                    <p v-if="lesson.calendar.start_time2" class="youbi">{{ lesson.calendar.start_time2 }}</p>
                    <p v-if="lesson.calendar.start_time3" class="youbi">{{ lesson.calendar.start_time3 }}</p>
                    <p v-if="lesson.calendar.start_time4" class="youbi">{{ lesson.calendar.start_time4 }}</p>
                    <p v-if="lesson.calendar.start_time5" class="youbi">{{ lesson.calendar.start_time5 }}</p>
                    <p v-if="lesson.calendar.start_time6" class="youbi">{{ lesson.calendar.start_time6 }}</p>
                    <p v-if="lesson.calendar.start_time7" class="youbi">{{ lesson.calendar.start_time7 }}</p>
                    <p v-if="lesson.calendar.start_time8" class="youbi">{{ lesson.calendar.start_time8 }}</p>
                    <p v-if="lesson.calendar.start_time9" class="youbi">{{ lesson.calendar.start_time9 }}</p>
                    <p v-if="lesson.calendar.start_time10" class="youbi">{{ lesson.calendar.start_time10 }}</p>
                    <p v-if="lesson.calendar.start_time11" class="youbi">{{ lesson.calendar.start_time11 }}</p>
                    <p v-if="lesson.calendar.start_time12" class="youbi">{{ lesson.calendar.start_time12 }}</p>
                  </v-col>
                  <v-col class="d-flex align-center">
                    <p class="youbi">休業日:</p>
                    <p v-if="lesson.calendar.sun" class="youbi">{{ lesson.calendar.sun }}</p>
                    <p v-if="lesson.calendar.mon" class="youbi">{{ lesson.calendar.mon }}</p>
                    <p v-if="lesson.calendar.tue" class="youbi">{{ lesson.calendar.tue }}</p>
                    <p v-if="lesson.calendar.wed" class="youbi">{{ lesson.calendar.wed }}</p>
                    <p v-if="lesson.calendar.thu" class="youbi">{{ lesson.calendar.thu }}</p>
                    <p v-if="lesson.calendar.fri" class="youbi">{{ lesson.calendar.fri }}</p>
                    <p v-if="lesson.calendar.sat" class="youbi">{{ lesson.calendar.sat }}</p>
                  </v-col>
                </v-card-text>
              </v-card>
            </v-col>
          </v-row>
        </template>
      </div>
      <div v-else>
        <v-col class="d-flex justify-center" style="margin: 20px;">
          <h2 class="grey--text lighten-1">基本情報を登録して下さい。</h2>
        </v-col>
      </div>
    </v-container>
  </v-main>
</template>

<script>
import { mapState } from 'vuex';

  export default {
    data: () => ({
    }),

    computed: {
      ...mapState({
      lessons: (state) => state.rangeAuth.lessons
      }),
    },

    methods: {
     status(id) {
       this.$router.push(`/rangeAdmin/reservation/${id}`)
     }
    }
  }
</script>
  
<style scoped>
  .youbi {
    margin-right: 20px;
  }

</style>