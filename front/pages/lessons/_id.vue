<template>
  <v-main>
    <v-container>
      <div v-if="selectedLesson == ''">Lesson is undefined.</div>
      <template v-else>
        <v-col>{{ selectedLesson.lesson.title }}</v-col>
        <v-col>{{ selectedLesson.lesson.coach }}</v-col>
        <v-col>{{ selectedLesson.lesson.content }}</v-col>
      </template>
      <v-row>
        <v-col cols="10">
          <v-sheet>
            <h2>予約一覧</h2>
            <v-btn 
              color="grey darken-2"
              @click="previousWeek" 
              outlined
            >
              <v-icon small>
                mdi-chevron-left
              </v-icon>
              1週間前
            </v-btn>
            <strong>{{startDate.format('YY/MM')}}月</strong>
            <v-btn 
              color="grey darken-2"
              @click="nextWeek" 
              outlined
            >
              1週間後
              <v-icon small>
                mdi-chevron-right
              </v-icon>
            </v-btn>
          </v-sheet>

          <v-sheet>
            <table class="table-date">
              <thead>
                <tr>
                  <td class="start">開始時間</td>
                  <template v-for="date in dateList" >
                    <th class="th-date" :key="date">
                      {{ date }}
                    </th>
                  </template>
                </tr>
              </thead>
              <tbody>
                <tr v-for="(time, i) in selectedLesson.start_times" :key="i">
                  <td class="td-date time">{{ time }} ~</td>
                  <td class="td-date" v-for="(date, j) in dateList" :key="j">
                    <a
                      v-if="isActive(date, time)"
                      class="d-flex justify-center"
                    >
                      <v-icon>{{ 'mdi-close' }}</v-icon>
                    </a>
                    <v-tooltip
                      v-else
                      right
                    >
                      <template v-slot:activator="{ on, attrs }">
                        <a 
                          class="d-flex justify-center"
                          @mouseover="selectedDay(date, time)"
                          @click="overlay = !overlay"
                          v-bind="attrs"
                          v-on="on"
                        >
                          <v-icon>{{ 'mdi-circle-outline' }}</v-icon>
                        </a>
                      </template>
                      <span>{{ text }}</span>
                    </v-tooltip>
                  </td>
                </tr>
            </tbody>
          </table>
          <div v-if="overlay" @click="overlay = false">
            <v-overlay
              :value="overlay"
              max-width="300"
            >
              <v-card class="white content">
                <v-container @click.stop>
                <v-card-title class="text-h5 black--text">
                  予約しますか？
                </v-card-title>

                <v-card-text class="black--text">
                  <v-col class="text-h5">日時: {{ text }}</v-col>
                  <v-col>予約者: {{ this.loginUser.name }}</v-col>
                  <v-col>電話番号: {{ this.loginUser.phone_number }}</v-col>
                </v-card-text>

                <v-card-actions>
                  <v-spacer></v-spacer>

                  <v-btn
                    color="green darken-1"
                    text
                    @click="overlay = false"
                  >
                    キャンセル
                  </v-btn>

                  <v-btn
                    color="green darken-1"
                    text
                    @click="sendReservation()"
                  >
                    予約
                  </v-btn>
                </v-card-actions>
                </v-container>
              </v-card>
            </v-overlay>
          </div>
          <v-col>{{ text }}</v-col>
          </v-sheet>
          <v-col>{{ startDate }}</v-col>
        </v-col>
      </v-row>
    </v-container>
  </v-main>
</template>

<script>
import moment from 'moment';
import { mapState } from 'vuex';
  moment.locale('ja');

  export default {
    data: () => ({
      overlay: false,
      text: '',
      dateList: [],
      weekNumber: 7,
      // startTime: [ "11:00", "12:00", "13:00"],
      // holiday: ['月', '火'],
      // selectedLesson: []
    }),
    created () {
      this.setDateList(this.startDate)
      this.$axios.get(`/v1/lessons/${this.$route.params.id}`)
          .then((res) => {
            console.log(res)
            // this.selectedLesson = res.data
            this.$store.commit('setSelectedLesson', res.data)
          })
    },
    computed: {
      ...mapState({
        loginUser: (state) => state.authentication.loginUser,
        selectedLesson: (state) => state.selectedLesson
      }),
      startDate: {
        get() {
          return moment()
        },
        set(date) {
          this.setDateList(date)
        }
      }
    },
    methods: {
      nextWeek() {
        this.startDate = this.startDate.add(this.weekNumber, 'day')
      },
      previousWeek() {
        this.startDate = this.startDate.subtract(this.weekNumber, 'day')
      },
      setDateList () {
        this.dateList = []
        const date = moment(this.startDate)
        this.dateList.push(date.format('YY/MM/DD(dd)'))
        for (let i = 0; i < (this.weekNumber - 1); i++ ) {
          this.dateList.push(date.add(1, 'day').format('YY/MM/DD(dd)'))
        }
      },
      isActive(day) {
        const today = moment().startOf('day').format('YY/MM/DD(dd)')
          if (day < today) {
            return true
          }
        const date = day.charAt(9)
          if(this.selectedLesson.holiday.includes(date)) {
            return true
          }
      },
      selectedDay(date, time) {
        this.text = []
        this.text = date + time
      },
      sendReservation() {
        if(this.$auth.loggedIn) {
          this.$axios.post('/v1/reservations', {
            lesson_id: this.selectedLesson.lesson.id,
            user_id: this.loginUser.id,
            date: this.text
          })
          .then((res) => {
            console.log(res)
            this.overlay = false
          })
        }
      }
    }
  }
</script>

<style scoped>
</style>
