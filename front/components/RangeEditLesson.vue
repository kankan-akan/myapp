<template>
  <v-dialog
    v-model="dialog"
    width="900"
  >
    <template v-slot:activator="{ on, attrs }">
      <v-btn
        v-on="on"
        v-bind="attrs"
      >
        <v-icon>{{ 'mdi-pen' }}</v-icon>
        編集
      </v-btn>
    </template>
    <v-card>
      <v-card-title class="text-h5 light-blue lighten-4">
        編集
      </v-card-title>
      <v-card-text>
        <v-form
          ref="form"
          v-model ="valid"
          lazy-validation 
        >
          <v-col>
            <v-text-field
              outlined
              v-model ="title"
              :rules ="[rules.required]"
              label ="＊タイトル"
              required
            ></v-text-field>
          </v-col>

          <v-col>
            <v-text-field
              outlined
              v-model ="coach"
              :rules ="[rules.required]"
              label ="＊指導担当者名"
              required
            ></v-text-field>
          </v-col>

          <v-col>
            <v-textarea
              outlined
              v-model ="content"
              label ="特徴"
              height="200"
            ></v-textarea>
          </v-col>

          <v-col cols="3">
            <v-text-field
              outlined
              v-model ="lessonTime"
              :rules ="[rules.required]"
              label ="＊レッスン時間"
              suffix="分"
              required
            ></v-text-field>
          </v-col>

          <v-col>
            <div style="font-size: 18px;">開始時間</div>
          </v-col>
          <v-col class="d-flex align-center overflow-x-auto" >
            <div class="d-flex align-center">
              <input class="input" type="time" v-model="startTime1" />
              <input class="input" type="time" v-model="startTime2" />
              <input class="input" type="time" v-model="startTime3" />
              <input class="input" type="time" v-model="startTime4" />
              <input class="input" type="time" v-model="startTime5" />
              <input class="input" type="time" v-model="startTime6" />
              <input class="input" type="time" v-model="startTime7" />
              <input class="input" type="time" v-model="startTime8" />
              <input class="input" type="time" v-model="startTime9" />
              <input class="input" type="time" v-model="startTime10" />
              <input class="input" type="time" v-model="startTime11" />
              <input class="input" type="time" v-model="startTime12" />
            </div>
          </v-col>

          <v-col style="margin-top: 36px;">
            <v-select
              v-model="holiday"
              :items="items"
              chips
              label="休業日"
              multiple
              outlined
            ></v-select>
          </v-col>
          <h5>'＊'は必須項目です</h5>
          <div>{{ test }}</div>
          <div>{{ selectedLesson.id }}</div>
          <v-card-actions>
            <v-btn
              class="mr-4"
              :disabled="!valid" 
              @click="edit()"
              large
              outlined
            >
              登録
            </v-btn>
            <v-btn
              color ="error"
              class ="mr-4"
              @click="dialog = false"
              large
              outlined
            >
              閉じる
            </v-btn>
          </v-card-actions>
        </v-form>
      </v-card-text>
    </v-card>
  </v-dialog>
</template>

<script>
import { mapState, mapActions } from 'vuex';

export default {
  props: [ 'selectedLesson' ],
  data () {
    return {
      dialog: false,
      valid: true,
      rules: {
        required: v => !!v || '入力してください'
      },
      title: this.selectedLesson.title,
      coach: this.selectedLesson.coach,
      content: this.selectedLesson.content,
      lessonTime: this.selectedLesson.calendar.lesson_time,
      holiday: [],
      items: ['月', '火', '水', '木', '金', '土', '日'],
      startTime1: this.selectedLesson.calendar.start_time1,
      startTime2: this.selectedLesson.calendar.start_time2,
      startTime3: this.selectedLesson.calendar.start_time3,
      startTime4: this.selectedLesson.calendar.start_time4,
      startTime5: this.selectedLesson.calendar.start_time5,
      startTime6: this.selectedLesson.calendar.start_time6,
      startTime7: this.selectedLesson.calendar.start_time7,
      startTime8: this.selectedLesson.calendar.start_time8,
      startTime9: this.selectedLesson.calendar.start_time9,
      startTime10: this.selectedLesson.calendar.start_time10,
      startTime11: this.selectedLesson.calendar.start_time11,
      startTime12: this.selectedLesson.calendar.start_time12,
      test: []
    }
  },

  computed: {
    ...mapState({
      loginRange: (state) => state.rangeAuth.loginRange.data,
      rangeData: (state) => state.rangeAuth.rangeData,
    })
  },

  mounted() {
    // this.setStartTime()
    // this.setHoliday()
  },

 methods: {
    ...mapActions({
     getLesson: 'rangeAuth/getLesson'
   }),
    edit() {
      if (this.$refs.form.validate()) {
        this.$axios.put(`/v1/lessons/${this.selectedLesson.id}`, {
          title: this.title,
          coach: this.coach,
          content: this.content,
          admin_range_id: this.loginRange.id,
          range_outline_id: this.rangeData.id,
          calendar_attributes: {
            lesson_time: this.lessonTime,
            start_time1: this.startTime1, 
            start_time2: this.startTime2, 
            start_time3: this.startTime3, 
            start_time4: this.startTime4, 
            start_time5: this.startTime5, 
            start_time6: this.startTime6, 
            start_time7: this.startTime7, 
            start_time8: this.startTime8, 
            start_time9: this.startTime9, 
            start_time10: this.startTime10, 
            start_time11: this.startTime11, 
            start_time12: this.startTime12, 
            holiday: this.holiday
          }
        })
        .then((res) => {
          console.log(res)
          this.getLesson()
          this.dialog = false
        })
        .catch((err) => {
          console.log(err)
        })
      }
    },
    setHoliday() {
      if(this.selectedLesson.calendar.holiday) {
        this.holiday = []
        const date = this.selectedLesson.calendar.holiday
        const holiday = date.split( ',' )
        this.holiday = holiday
      }
    }
  }

}
</script>

<style scoped>
.input {
  padding: 12px; 
  margin: 5px;
  background-color: rgb(233, 246, 255);
  border-radius: 15px;
}
</style>