<template>
  <div>
    <v-dialog
      v-model="dialog"
      persistent
      max-width="550"
    >
      <template v-slot:activator="{ on, attrs }">
        <v-btn
          v-if="isActive"
          rounded
          outlined
          color="blue"
          @click="dialog = true"
          v-bind="attrs"
          v-on="on"
        >
          レビューを書く
        </v-btn>
        <v-btn
          v-else
          rounded
          outline
          disabled
        >
          レビュー済み
        </v-btn>
      </template>
      <v-card>
        <v-card-title class="text-h5">
        
        </v-card-title>
        <v-card-text>
          <v-form
            ref="form"
            v-model="valid"
            lazy-validation 
          >
            <v-col>
              <v-text-field
                outlined
                v-model="title"
                :rules="rules"
                label="＊タイトル"
                required
              ></v-text-field>
            </v-col>

            <v-col>
              <div class="d-flex align-center">
                <v-rating
                  v-model="rate"
                  background-color="grey"
                  color="yellow accent-4"
                  dense
                  half-increments
                  hover
                  size="30"
                ></v-rating>
                <div class="grey--text text--darken-1">({{ rate }})</div>
              </div>
            </v-col>

            <v-col>
              <v-textarea
                outlined
                v-model="content"
                label="ご利用になったレッスンはいかがでしたか？"
                :counter="140"
                :rules="rules"
                required
              ></v-textarea>
            </v-col>
          </v-form>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn
            color="blue"
            text
            @click="postReview()"
          >
            送信
          </v-btn>
          <v-btn
            color="blue"
            text
            @click="dialog = false"
          >
            キャンセル
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
import { mapActions,mapState } from 'vuex';

export default {
  props: ['reservation'],

  data:() => ({
    dialog: false,
    valid: true,
    disabled: false,
    isActive: true,
    rules: [v => !!v || '入力してください'],
    title: '',
    content: '',
    rate: 3
  }),

  computed: {
    ...mapState ({
      loginUser: (state) => state.myData.loginUser,
      reviews: (state) => state.myData.reviews
    })
  },

  mounted() {
    if (this.$store.state.auth.loggedIn) {
      this.isActive = true
      this.reviews.forEach((f) => {
        if (this.reservation.id === f.reservation_id) {
          this.isActive = false
        }
      })
    }
  },

  methods: {
    ...mapActions({
      getReview: 'myData/getReview'
    }),
    postReview() {
      if (this.$refs.form.validate()) {
        this.$axios.post('/v1/reviews', {
          title: this.title,
          content: this.content,
          rate: this.rate,
          user_id: this.loginUser.id,
          lesson_id: this.reservation.lesson_id,
          reservation_id: this.reservation.id
        })
        .then((res) => {
          console.log(res)
          this.dialog = false
          this.isActive = false
          this.getReview()
          this.$store.dispatch(
            'snackbar/showMessage', {
              icon: 'mdi-checkbox-marked-circle-outline',
              message: 'レビューを投稿しました。',
              type: 'success',
              status: true,
            },
            { root: true }
          )
        })
        .catch((err) => {
          console.log(err)
          this.$store.dispatch(
            'snackbar/showMessage', {
              icon: 'mdi-alert-outline',
              message: 'レビューの投稿に失敗しました。',
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
