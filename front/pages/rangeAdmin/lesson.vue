<template>
  <v-main>
    <v-container v-if="$store.state.rangeAuth.rangeData">
      <v-col class="d-flex align-center">
        <div class="text-h5 font-weight-bold mr-4">開講レッスン一覧</div>
        <RangeAddLesson />
      </v-col>

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
            cols="8"
          >
            <v-card>
              <v-card-actions class="d-inline-flex float-right">
                <RangeEditLesson :selectedLesson="lesson" />
              </v-card-actions>
              <v-card-title>{{ lesson.title }}</v-card-title>
              <v-card-subtitle>{{ lesson.coach }}</v-card-subtitle>
              <v-card-text>
                <div
                  style="white-space:pre-wrap; word-wrap:break-word;"
                >{{ lesson.content }}</div>
                  <!-- <div>レッスン時間: {{ lesson.calendar.lesson_time }}</div>
                  <div>開始時間: {{ lesson.calendar.start_time }}</div>
                  <div>休業日: {{ lesson.calendar.holiday }}</div> -->
              </v-card-text>
            </v-card>
          </v-col>
        </v-row>
      </template>
    </v-container>
    <v-container v-else>
      <v-col class="d-flex justify-center" style="margin: 20px;">
        <h2 class="grey--text lighten-1">基本情報を登録して下さい。</h2>
      </v-col>
    </v-container>
  </v-main>
</template>

<script>
// (:title, :coach, :content, :admin_range_id, :range_outline_id)
import { mapState } from 'vuex';

export default {
  
  computed: {
    ...mapState({
      lessons: (state) => state.rangeAuth.lessons
    })
  },

}
</script>
