<template>
  <v-main>
    <v-container>
      <v-row justify="center">
        <v-col cols="10">
          <div v-if="selectedLesson == ''">Lesson is undefined.</div>
          <template v-else>
            <div class="text-h4">{{ selectedLesson.lesson.title }}</div>
            <div class="text-h6">{{ selectedLesson.lesson.coach }}プロ</div>
            <div class="mt-6 ml-3">{{ selectedLesson.lesson.content }}</div>
          </template>

          <h2 class="my-2 mt-6">予約日一覧</h2>
          <div class="my-2">予約したい日時を選択してください。</div>
          <v-row align="center">
            <v-col>
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
            </v-col>
          </v-row>

          <v-row dense>
            <v-col>
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
            </v-col>
          </v-row>
          <v-col>{{ startDate }}</v-col>

          <div class="text-h5">レビュー</div>
          <div class="ml-2 d-flex align-center">
            <span>平均評価：</span>
            <v-rating
              class="ml-1"
              v-model="rating"
              background-color="grey"
              color="yellow accent-4"
              dense
              half-increments
              size="25"
              readonly
            ></v-rating>
            <span>({{ rating }})</span>
          </div>
          <v-col
            v-for="(review, i) in selectedLesson.lesson.reviews"
            :key="i"
          >
            <v-col class="text-h6">{{ review.title }}</v-col>
            <v-rating
              class="ml-2"
              v-model="review.rate"
              background-color="grey"
              color="yellow accent-4"
              dense
              half-increments
              size="25"
              readonly
            ></v-rating>
            <v-col class="kaigyo">{{ review.content }}</v-col>
          </v-col>
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
      rating: 4,
      total: 0
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

    mounted() {
      this.selectedLesson.lesson.reviews.forEach((f) => {
        this.total += f.rate
      })
      const average = this.total / this.selectedLesson.lesson.reviews.length
      console.log(this.total / this.selectedLesson.lesson.reviews.length);
      this.rating = average
      
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
