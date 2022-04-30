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

            <v-col>
              <template v-for="(time, index) in startTime" >
                <div :key="index">
                  <input type="text">
                  <v-btn 
                    @click="del(index)" 
                    text
                  >
                    <v-icon>{{ 'mdi-close' }}</v-icon>
                  </v-btn>
                </div>
              </template>
              <v-btn
                @click="add()"
                text
              >
                <v-icon>{{ 'mdi-plus-circle-outline' }}</v-icon>
              </v-btn>
            </v-col>

            <v-col>
              <v-select
                v-model="date"
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
    date: [],
    items: ['月', '火', '水', '木', '金', '土', '日'],
    startTime: ''
  }),

  computed: {
    ...mapState({
      loginRange: (state) => state.rangeAuth.loginRange,
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
          range_outline_id: this.rangeData.id
        })
        .then((res) => {
          console.log(res)
          this.dialog = false
          this.getLesson()
        })
        .catch((err) => {
          console.log(err)
        })
      }
    },
    add(){
      this.startTime.push('')
    },
    del(index){
      this.startTime.splice(index, 1)
    },
  }

}
</script>
