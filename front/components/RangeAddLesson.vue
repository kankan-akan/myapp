<template>
  <v-row>
    <v-dialog
      v-model="dialog"
      width="900"
    >
      <template v-slot:activator="{ on, attrs }">
        <v-btn
          v-on="on"
          v-bind="attrs"
        >
          <v-icon>{{ 'mdi-plus' }}</v-icon>
          新規作成
        </v-btn>
      </template>
      <v-card>
        <v-card-title class="text-h5 cyan lighten-3">
          新規作成
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

            <v-col class="d-flex align-center">
              <div style="font-size: 18px;">開始時間</div>
              <input class="input" type="time" v-model="text" />
              <v-btn
                @click="add()"
                text
                outlined
              >
                追加
              </v-btn>
            </v-col>
            <v-col class="d-flex align-center overflow-x-auto">
              <div class="d-flex align-center">
                <template v-for="(time, index) in startTime">
                  <v-chip
                    :key="index"
                    close
                    @click:close="del(index)"
                  >
                    <h3>{{ time }}</h3>
                  </v-chip>
                </template>
              </div>
            </v-col>

            <v-col>
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
            <v-card-actions>
              <v-btn
                class="mr-4"
                :disabled="!valid" 
                @click="register()"
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
  </v-row>
</template>

<script>
import { mapState, mapActions } from 'vuex';

export default {
  data: () => ({
    dialog: false,
    valid: true,
    rules: {
      required: v => !!v || '入力してください' ,
    },
    title: '',
    coach: '',
    content: '',
    lessonTime: '',
    holiday: [],
    items: ['月', '火', '水', '木', '金', '土', '日'],
    text: '',
    startTime: [ '09:00', '10:00', '11:00', '12:00', '14:00', '15:00', '16:00', '17:00', '18:00', '19:00' ]
  }),

  computed: {
    ...mapState({
      loginRange: (state) => state.rangeAuth.loginRange.data,
      rangeData: (state) => state.rangeAuth.rangeData
    })
  },

 methods: {
   ...mapActions({
     getLesson: 'rangeAuth/getLesson'
   }),
    async register () {
      if (this.$refs.form.validate()) {
        await this.$axios.post('/v1/lessons', {
          title: this.title,
          coach: this.coach,
          content: this.content,
          admin_range_id: this.loginRange.id,
          range_outline_id: this.rangeData.id,
          calendar_attributes: {
            lesson_time: this.lessonTime,
            start_time: this.startTime,
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
    add(){
      if(this.text !== '') {
        this.startTime.push(this.text)
        this.text = ''
      }
    },
    del(index){
      this.startTime.splice(index, 1)
    },
  }

}
</script>

<style scoped>
.input {
  padding: 10px; 
  margin: 5px 5px 5px 20px;
  background-color: rgb(233, 246, 255);
  border-radius: 15px;
}
</style>
