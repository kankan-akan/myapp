<template>
  <v-container>
    <v-sheet class="rounded-xl mx-auto">
      <v-col>
        <div v-if="selectedLesson == ''">レッスンが見つかりません</div>
        <template v-else>
          <v-col class="text-h4 font-weight-bold">{{ selectedLesson.lesson.title }}</v-col>
          <div class="text-h6 pl-3">インストラクター：{{ selectedLesson.lesson.coach }}プロ</div>
          <v-col class="kaigyo my-6">{{ selectedLesson.lesson.content }}</v-col>
        </template>

        <v-col class="text-h5">予約日一覧</v-col>
        <v-divider></v-divider>
        <v-col class="my-2">予約する日時を選択してください。</v-col>
        <v-row>
          <v-col class="d-flex justify-center align-center">
            <v-btn 
              class="mr-4"
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
              class="ml-4"
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
            <table class="table-date mx-auto">
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
                  <template  v-if="time !== ''">
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
                            @click="detailReservation()"
                            v-bind="attrs"
                            v-on="on"
                          >
                            <v-icon>{{ 'mdi-circle-outline' }}</v-icon>
                          </a>
                        </template>
                        <span>{{ text }}</span>
                      </v-tooltip>
                    </td>
                  </template>
                </tr>
              </tbody>
            </table>
            <div @click="overlay = false">
              <v-overlay
                :value="overlay"
                max-width="300"
              >
                <v-card class="white content">
                  <v-container @click.stop>
                  <v-card-title class="text-h5 black--text">
                    予約しますか？
                  </v-card-title>

                  <v-card-text class="black--text" v-if="loginUser">
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
        <!-- <v-col>{{ startDate }}</v-col> -->

        <v-col class="text-h5 mt-10">レビュー</v-col>
        <v-divider></v-divider>
        <v-col class="d-flex align-center">
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
          <span>( {{ rating }} )</span>
        </v-col>
        <template v-if="selectedLesson.lesson && selectedLesson.lesson.reviews">
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
        </template>
      </v-col>
    </v-sheet>
  </v-container>
</template>

<script>
import moment from 'moment';
import { mapState, mapActions } from 'vuex';
  moment.locale('ja');

  export default {
    data: () => ({
      overlay: false,
      text: '',
      dateList: [],
      weekNumber: 7,
      rating: 0,
      total: 0,
      selectedLesson: []
    }),

    computed: {
      ...mapState({
        loginUser: (state) => state.myData.loginUser,
        // selectedLesson: (state) => state.selectedLesson
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

    created() {
      this.setDateList(this.startDate)
      this.$axios.get(`/v1/lessons/${this.$route.params.id}`)
      .then((res) => {
        console.log(res)
        this.selectedLesson = res.data
        // this.$store.commit('setSelectedLesson', res.data)
      })
    },

    mounted() {
      setTimeout(this.rateCount, 500)
    },

    methods: {
       ...mapActions({
        loginCheck: 'snackbar/loginCheck'
      }),
      detailReservation () {
        if(this.$store.state.auth.loggedIn) {
          this.overlay = true
        } else {
          this.loginCheck()
        }
      },
      rateCount() {
        if (this.selectedLesson.lesson.reviews.length !== 0 ) {
          this.selectedLesson.lesson.reviews.forEach((f) => {
            this.total += f.rate
          })
          const val = this.total / this.selectedLesson.lesson.reviews.length
          const average = Math.round( val * 10) / 10
          this.rating = average
        } else {
          this.rating = 0
        }
      },
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
        if(this.$store.state.auth.loggedIn) {
          this.$axios.post('/v1/reservations', {
            lesson_id: this.selectedLesson.lesson.id,
            user_id: this.loginUser.id,
            date: this.text
          })
          .then((res) => {
            console.log(res)
            this.overlay = false
            this.$store.dispatch(
              'snackbar/showMessage', {
                icon: 'mdi-checkbox-marked-circle-outline',
                message: '予約が完了しました。',
                type: 'success',
                status: true,
              },
              { root: true }
            )
          })
          .catch((err) => {
            console.log(err)
            this.overlay = false
            this.$store.dispatch(
              'snackbar/showMessage', {
                icon: 'mdi-alert-outline',
                message: '予約に失敗しました。',
                type: 'error',
                status: true,
              },
              { root: true }
            )
          })
        }
      }
    }
  }
</script>