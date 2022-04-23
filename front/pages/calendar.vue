<template>
  <v-main>
    <v-container>
      <v-row>
        <v-col cols="10">
          <v-sheet>
            <h2>予約一覧</h2>
            <v-btn
              class="mr-4"
              @click="setToday"
              text
              outlined
            >
              今日
            </v-btn>
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
                  <template v-for="date in dateList">
                    <th :key="date">
                      {{ date }}
                    </th>
                  </template>
                </tr>
              </thead>
              <tbody>
                <template v-for="hourlyWorkList in hourlyWorkList">
                  <tr :key="hourlyWorkList.time">
                    <td class="time">{{hourlyWorkList.time}} ~</td>
                    <td
                      v-for="(work, i) in hourlyWorkList.workList" 
                      :key="hourlyWorkList.time + '_' + i"
                    >
                      <a 
                        class="d-flex justify-center"
                        @mouseover="sendReservation(dateList[i], hourlyWorkList.time, work)"
                      >
                        {{ showWorkStatus(work) }}
                      </a>
                    </td>
                  </tr>
                </template>
              </tbody>
            </table>
            <v-col>{{ text }}</v-col>
          </v-sheet>
         
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
      hourlyWorkList: [
        // {
        //     time: "11:00" ,
        //     workList: this.setWorkList()
        //   },
        //   {
        //     time: "12:00" ,
        //     workList: this.setWorkList()
        //   },
        //   {
        //     time: "13:00" ,
        //     workList: this.setWorkList()
        // }
      ]
    }),

    created () {
      this.setDateList(this.startDate)
      this.setHourlyWorkList()
    },

    computed: {
      startDate: {
        get() {
          return moment()
        },
        set(date) {
          this.setDateList(date)
          this.setHourlyWorkList()
        }
      }
    },

    methods: {
      setToday() {
        this.setHourlyWorkList()
        this.dateList = []
        const date = moment()
        this.dateList.push(date.format('MM/DD(dd)'))
        for (let i = 0; i < (this.weekNumber - 1); i++ ) {
          this.dateList.push(date.add(1, 'day').format('MM/DD(dd)'))
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
        this.dateList.push(date.format('MM/DD(dd)'))
        for (let i = 0; i < (this.weekNumber - 1); i++ ) {
          this.dateList.push(date.add(1, 'day').format('MM/DD(dd)'))
        }
      },
      setWorkList() {
        //ダミー配列データ生成
        var array = [];
        for (let i = 0; i < this.weekNumber; i++) {
          array.push(Math.random() < 0.5);
        }
        return array
      },
      setHourlyWorkList() {
        this.hourlyWorkList = [
          {
            time: "11:00" ,
            workList: this.setWorkList()
          },
          {
            time: "12:00" ,
            workList: this.setWorkList()
          },
          {
            time: "13:00" ,
            workList: this.setWorkList()
        }]
      },
      sendReservation(date, time, work) {
        this.text = []
        if (work == true) {
          this.text = date + time
        } else {
          this.text = "この日程は選択できません。"
        }

      },
      showWorkStatus(work) {
        return work ? "o" : "x"
      }
    
    },

  mounted() {
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

  .time {
    border-right: solid 2.5px #d8d8d8;
  }

</style>