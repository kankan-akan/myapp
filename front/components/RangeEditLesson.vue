<template>
  <v-dialog
      v-model="dialog"
      width="900"
    >
      <template v-slot:activator="{ on, attrs }">
        <v-btn
          v-on="on"
          v-bind="attrs"
        >
          <v-icon>{{ 'mdi-pen' }}</v-icon>
          編集
        </v-btn>
      </template>
      <v-card>
        <v-card-title class="text-h5 light-blue lighten-4">
          編集
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
            <h5>'＊'は必須項目です</h5>
            <div>{{ selectedLesson.id }}</div>
            <v-card-actions>
              <v-btn
                class="mr-4"
                
                :disabled="!valid" 
                @click="edit()"
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
</template>

<script>
import { mapState, mapActions } from 'vuex';

export default {
  props: [ 'selectedLesson' ],
  data () {
    return {
      dialog: false,
      valid: true,
      rules: {
        required: v => !!v || '入力してください'
      },
      title: this.selectedLesson.title,
      coach: this.selectedLesson.coach,
      content: this.selectedLesson.content
    }
  },

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
    edit() {
      if (this.$refs.form.validate()) {
        this.$axios.put(`/v1/lessons/${this.selectedLesson.id}`, {
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
    }
  }


}
</script>
