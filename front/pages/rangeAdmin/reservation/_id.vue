<template>
  <v-main>
    <v-container>
      <v-row>
        <v-col cols="10">
          <v-col>
            <v-btn 
              color="grey darken-2"
              @click="previousWeek" 
              outlined
            >
              <v-icon small>mdi-chevron-left</v-icon>
              1週間前
            </v-btn>
            <strong>{{startDate.format('YY/MM')}}月</strong>
            <v-btn 
              color="grey darken-2"
              @click="nextWeek" 
              outlined
            >
              1週間後
              <v-icon small>mdi-chevron-right</v-icon>
            </v-btn>
          </v-col>

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
                <tr v-for="(time, i) in status.start_times" :key="i">
                  <td class="td-date time">{{ time }} ~</td>
                  <td class="td-date" v-for="(date, j) in dateList" :key="j">
                    <a
                      v-if="setHoliday(date)"
                      class="d-flex justify-center"
                    >
                      <v-icon>{{ 'mdi-minus' }}</v-icon>
                    </a>

                    <v-tooltip
                      v-else
                      right
                    >
                      <template v-slot:activator="{ on, attrs }">
                        <a
                          v-if="isActive(date)"
                          class="d-flex justify-center"
                          @mouseover="selectedDay(date, time)"
                          @click="getStatus(date, time)"
                          v-bind="attrs"
                          v-on="on"
                        >
                          <v-icon>{{ 'mdi-close' }}</v-icon>
                        </a>
                        <a
                          v-else
                          class="d-flex justify-center"
                          @mouseover="selectedDay(date, time)"
                          @click="getStatus(date, time)"
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
        
      <v-row>
        <v-col cols="10">
          <v-simple-table>
            <template v-slot:default>
              <thead>
                <tr>
                  <th class="text-left">
                    予約日時
                  </th>
                  <th class="text-left">
                    予約者名
                  </th>
                  <th class="text-left">
                    連絡先(電話番号)
                  </th>
                </tr>
              </thead>
              <tbody v-if="selectedStatus.length == 0">
                {{ message }}
              </tbody>
              <tbody v-else>
                <tr
                  v-for="(item,i) in selectedStatus"
                  :key="i"
                >
                  <td>{{ item.date }}</td>
                  <td>{{ item.user.name }}</td>
                  <td>{{ item.user.phone_number }}</td>
                </tr>
              </tbody>
            </template>
          </v-simple-table>
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
      // status: {
      //   start_times: [ "11:00", "12:00", "13:00"],
      //   holiday: ['月', '火'],
      // },
      status: [],
      selectedStatus: [],
      message: ''
    }),
    created () {
      this.setDateList(this.startDate)
      this.$axios.get(`/v1/lessons/${this.$route.params.id}`)
        .then((res) => {
          console.log(res)
          this.status = res.data
        })
        .catch((err) => {
          console.log(err)
        })
    },
    computed: {
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
      setHoliday(day) {
        const date = day.charAt(9)
        if (this.status.holiday.includes(date)) {
          return true
        }
      },
      isActive(day) {
        const today = moment().startOf('day').format('YY/MM/DD(dd)')
        if (day < today) {
          return true
        }
      },
      selectedDay(date, time) {
        this.text = []
        this.text = date + time
      },
      getStatus(date, time) {
        this.selectedDay(date, time)
        this.$axios.get(`/v1/reservations/search/${this.status.lesson.id}`, {
          params: {
            date: this.text
          }
        })
          .then((res) => {
            console.log(res)
            this.selectedStatus = res.data
            if(res.data == '') {
              this.message = "予約者が存在しません。"
            }
          })
          .catch((err) => {
            console.log(err)
          })
      }
    }
  }
</script>

<style scoped>
  th {
    background-color: rgb(227, 255, 235);
    
  }
</style>