<template>
  <v-main class="range-color">
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
                <v-card-title class="font-weight-bold">{{ lesson.title }}</v-card-title>
                <v-card-subtitle>インストラクター：{{ lesson.coach }}</v-card-subtitle>

                <LessonSchedule :calendar="lesson.calendar" />
                
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