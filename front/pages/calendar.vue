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
                      x
                    </a>
                    <a
                      v-else
                      class="d-flex justify-center"
                      @mouseover="selectedDay(date, time)"
                    >
                      o
                    </a>
                  </td>
                </tr>
            </tbody>
          </table>
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
 moment.locale('ja');

  export default {
    data: () => ({
      text: '',
      dateList: [],
      weekNumber: 7,
      startTime: [ "11:00" ,"12:00" ,"13:00" ]
    }),
    created () {
      this.setDateList(this.startDate)
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
        this.dateList.push(date.format('MM/DD(dd)'))
        for (let i = 0; i < (this.weekNumber - 1); i++ ) {
          this.dateList.push(date.add(1, 'day').format('MM/DD(dd)'))
        }
      },
      isActive(date, time) {
        const today = moment().startOf('day').format('MM/DD(dd)')
        if (date < today) {
          return true
        }
      },
      selectedDay(date, time) {
        this.text = []
          this.text = date + time
      },
      
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