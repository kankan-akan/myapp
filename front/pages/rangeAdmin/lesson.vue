<template>
  <v-main>
    <v-container>
      <v-row>
        <v-col>
          <div>開講レッスン一覧</div>
        </v-col>
        <v-col>
          <RangeAddLesson />
        </v-col>
      </v-row>
      <template v-if="lessons == ''">
        <v-row>
          <v-col class="d-flex justify-center">
            <h3 class="grey--text lighten-1">レッスンを新規作成してください。</h3>
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
              </v-card-text>
            </v-card>
          </v-col>
        </v-row>
      </template>
  </v-container>
</v-main>
</template>

<script>
// (:title, :coach, :content, :admin_range_id, :range_outline_id)
import { mapActions, mapState } from 'vuex';

export default {
  
  computed: {
    ...mapState({
      loginRange: (state) => state.rangeAuth.loginRange,
      lessons: (state) => state.rangeAuth.lessons
    })
  },

  created() {
    this.getLesson()

  },

  methods: {
    ...mapActions({
      getLesson: 'rangeAuth/getLesson'
    }),

  }
}
</script>
