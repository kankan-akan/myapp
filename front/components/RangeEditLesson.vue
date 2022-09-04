<template>
  <div>
    <v-dialog
      v-model="dialog"
      width="900"
    >
      <template v-slot:activator="{ on, attrs }">
        <v-btn
          v-on="on"
          v-bind="attrs"
          outlined
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
              <div style="font-size: 18px;">休業日</div>
            </v-col>
            <v-col class="d-flex align-center">
              <p>選択した曜日：</p>
              <p v-if="sun" class="youbi">{{ sun }}</p>
              <p v-if="mon" class="youbi">{{ mon }}</p>
              <p v-if="tue" class="youbi">{{ tue }}</p>
              <p v-if="wed" class="youbi">{{ wed }}</p>
              <p v-if="thu" class="youbi">{{ thu }}</p>
              <p v-if="fri" class="youbi">{{ fri }}</p>
              <p v-if="sat" class="youbi">{{ sat }}</p>
            </v-col>
            <v-col class="d-flex align-center">
              <v-checkbox
                class="youbi"
                v-model="sun"
                label="日"
                value="日"
              ></v-checkbox>

              <v-checkbox
                class="youbi"
                v-model="mon"
                label="月"
                value="月"
              ></v-checkbox>

              <v-checkbox
                class="youbi"
                v-model="tue"
                label="火"
                value="火"
              ></v-checkbox>

              <v-checkbox
                class="youbi"
                v-model="wed"
                label="水"
                value="水"
              ></v-checkbox>

              <v-checkbox
                class="youbi"
                v-model="thu"
                label="木"
                value="木"
              ></v-checkbox>

              <v-checkbox
                class="youbi"
                v-model="fri"
                label="金"
                value="金"
              ></v-checkbox>

              <v-checkbox
                class="youbi"
                v-model="sat"
                label="土"
                value="土"
              ></v-checkbox>
            </v-col>
            <h5>'＊'は必須項目です</h5>
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

    <v-btn
      outlined
      color="red"
      @click="overlay = !overlay"
    >
      <v-icon>mdi-trash-can</v-icon>
      削除
    </v-btn>
    <v-overlay :value="overlay">
      <v-card width="400" class="white black--text">
        <v-card-text class="black--text">
          <v-col class="d-flex justify-center font-weight-bold">
          レッスンを削除しますか？
          </v-col>
        </v-card-text>
        <v-card-actions class="white black--text justify-center">
          <v-btn outlined class="red--text" @click="deleteLesson">
            削除
          </v-btn>
          <v-btn outlined @click="overlay = false" class="blue--text">
            キャンセル
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-overlay>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex';

export default {
  props: [ 'selectedLesson' ],
  data () {
    return {
      dialog: false,
      overlay: false,
      valid: true,
      rules: {
        required: v => !!v || '入力してください'
      },
      title: this.selectedLesson.title,
      coach: this.selectedLesson.coach,
      content: this.selectedLesson.content,
      lessonTime: this.selectedLesson.calendar.lesson_time,
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
      sun: this.selectedLesson.calendar.sun,
      mon: this.selectedLesson.calendar.mon,
      tue: this.selectedLesson.calendar.tue,
      wed: this.selectedLesson.calendar.wed,
      thu: this.selectedLesson.calendar.thu,
      fri: this.selectedLesson.calendar.fri,
      sat: this.selectedLesson.calendar.sat
    }
  },

  computed: {
    ...mapState({
      loginRange: (state) => state.rangeAuth.loginRange,
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
            sun: this.sun,
            mon: this.mon,
            tue: this.tue,
            wed: this.wed,
            thu: this.thu,
            fri: this.fri,
            sat: this.sat
          }
        })
        .then((res) => {
          console.log(res)
          this.getLesson()
          this.dialog = false
          this.$store.dispatch(
            'snackbar/showMessage', {
              icon: 'mdi-checkbox-marked-circle-outline',
              message: '変更が保存されました。',
              type: 'success',
              status: true,
            },
            { root: true }
          )
        })
        .catch((err) => {
          console.log(err)
          this.$store.dispatch(
            'snackbar/showMessage', {
              icon: 'mdi-alert-outline',
              message: '変更に失敗しました。',
              type: 'error',
              status: true,
            },
            { root: true }
          )
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
    },
    deleteLesson() {
      this.$axios.delete(`/v1/lessons/${this.selectedLesson.id}`)
      .then((res) => {
        this.getLesson()
        this.$store.dispatch(
          'snackbar/showMessage', {
            icon: 'mdi-checkbox-marked-circle-outline',
            message: 'レッスンを削除しました。',
            type: 'success',
            status: true,
          },
          { root: true }
        )
        this.overlay = false
      })
      .catch((err) => {
        this.$store.dispatch(
          'snackbar/showMessage', {
            icon: 'mdi-alert-outline',
            message: '削除に失敗しました。',
            type: 'error',
            status: true,
          },
          { root: true }
        )
      })
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

  .youbi {
    margin-right: 20px;
  }
</style>