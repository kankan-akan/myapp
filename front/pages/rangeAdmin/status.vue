<template>
  <v-main>
    <v-container>
      <v-row>
        <v-col cols="10">
          <v-sheet>
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
            <table>
              <thead>
                <tr>
                  <td class="date">開始時間</td>
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
                          @click="getReservation()"
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
          </v-sheet>

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
      startTime: [ "11:00", "12:00", "13:00"],
      holiday: ['月', '火']
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
      isActive(day, time) {
        const today = moment().startOf('day').format('YY/MM/DD(dd)')
          if (day < today) {
            return true
          }
        const date = day.charAt(9)
          if(this.holiday.includes(date)) {
            return true
          }
      },
      selectedDay(date, time) {
        this.text = []
        this.text = date + time
      },
      getReservation() {
        // this.$axios.get('/v1/reservation', {
        //   date: this.text
        // })
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