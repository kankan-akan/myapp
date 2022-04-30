<template>
  <v-main>
    <v-container>
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
            <strong>{{startDate.format('MM')}}月</strong>
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
            <table >
              <thead>
                <tr>
                  <td class="date"></td>
                  <template v-for="date in dateList" >
                    <th :key="date">
                      {{ date }}
                    </th>
                  </template>
                </tr>
              </thead>
              <tbody>
                <tr v-for="(time, i) in startTime" :key="i">
                  <td class="d1">{{ time }} ~</td>
                  <td v-for="(date, j) in dateList" :key="j">
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
                  <div>日時: {{ text }}</div>
                  <div>予約者: {{ }}</div>
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
                    @click="overlay = false"
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
      a: [],
      overlay: false,
      text: '',
      dateList: [],
      weekNumber: 7,
      startTime: [ "11:00" ,"12:00" ,"13:00" ],
      holiday: []
    }),
    created () {
      this.setDateList(this.startDate)
      // this.$axios.get('/v1/開始時間')
          // .then((res) => {
          //   console.log(res)
          //   this.startTime = res.data
          // })
      // this.$axios.get('/v1/休業日')
          // .then((res) => {
          //   console.log(res)
          //   this.holiday = res.data
          // })
    },
    computed: {
      ...mapState({
        loginUser: (state) => state.authentication.loginUser
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
        this.dateList.push(date.format('MM/DD(dd)'))
        for (let i = 0; i < (this.weekNumber - 1); i++ ) {
          this.dateList.push(date.add(1, 'day').format('MM/DD(dd)'))
        }
      },
      isActive(day, time) {
        const today = moment().startOf('day').format('MM/DD(dd)')
        if (day < today) {
          return true
        }
          // const date = day.chrAt(6)
          // this.holiday.find((f) =>{
          // if(date == f.holiday) {
            // return true
          // }
          // })
        
      },
      //  test(date) {
      //   this.a = []
      //   this.a = date.charAt(6)
      //     },
      selectedDay(date, time) {
        this.text = []
        this.text = date + time
      },
      sendReservation() {
        if(this.$auth.loggedIn) {
          this.$axios.post('/v1/reservations', {
            // lesson_id: ,
            // user_id: this.loginUser.id,
            // date: this.text
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
  table,th,td{
    border: solid 1px #d8d8d8;
    padding: 5px;

  }

  th {
    border-bottom: solid 2px #d8d8d8;
    background-color: rgb(227, 240, 255);

  }

  .date {
    border-bottom: solid 2.5px #d8d8d8;
    border-right: solid 2.5px #d8d8d8;

  }

  .d1 {
    border-right: solid 2.5px #d8d8d8;

  }

</style>