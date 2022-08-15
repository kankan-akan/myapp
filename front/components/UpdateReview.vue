<template>
  <div>
    <v-dialog
      v-model="dialog"
      max-width="550"
    >
      <template v-slot:activator="{ on, attrs }">
        <v-btn
          outlined
          depressed
          color="green white--text lighten-1"
          v-bind="attrs"
          v-on="on"
          @click="dialog = true"
        >
          編集
        </v-btn>
      </template>
      <v-card>
        <v-card-title class="text-h5">
          レビューを編集
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
                <span class="grey--text text--darken-1">({{ rate }})</span>
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
            @click="updateReview(review.id)"
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
    
    <v-menu offset-y>
      <template v-slot:activator="{ on, attrs }">
        <v-btn
          outlined
          depressed
          color="red"
          v-bind="attrs"
          v-on="on"
        >
          削除
        </v-btn>
      </template>
      <v-list>
        <v-list-item>
          <v-list-item-title 
            class="cursor" 
            @click="deleteReview(review.id)"
          >
            レビューを削除
          </v-list-item-title>
        </v-list-item>  
      </v-list>
    </v-menu>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex';

export default {
  props: ['review'],

  data: function () {
    return {
      dialog: false,
      valid: true,
      rules: [v => !!v || '入力してください'],
      title: this.review.title,
      rate: this.review.rate,
      content: this.review.content
    }
  },

  computed: {
    ...mapState({
      loginUser: (state) => state.myData.loginUser
    })
  },

  methods: {
    ...mapActions({
      getReview: 'myData/getReview'
    }),
    updateReview(id) {
      this.$axios.put(`/v1/reviews/${id}`, {
        title: this.title,
        rate: this.rate,
        content: this.content,
        user_id: this.loginUser.id,
        lesson_id: this.review.lesson_id,
        reservation_id: this.review.reservation_id
      })
      .then((res) => {
        console.log(res)
        this.getReview()
        this.dialog = false
        this.$store.dispatch(
          'snackbar/showMessage', {
            icon: 'mdi-checkbox-marked-circle-outline',
            message: 'レビューを編集しました。',
            type: 'success',
            status: true,
          },
          { root: true }
        )
      })
      .catch((err) => {
        console.log(err)
        this.dialog = false
        this.$store.dispatch(
          'snackbar/showMessage', {
            icon: 'mdi-alert-outline',
            message: '編集に失敗しました。',
            type: 'error',
            status: true,
          },
          { root: true }
        )
      })
    },
    deleteReview(id) {
      this.$axios.delete(`/v1/reviews/${id}`)
      .then((res) => {
        console.log(res)
        this.getReview()
        this.dialog = false
        this.$store.dispatch(
          'snackbar/showMessage', {
            icon: 'mdi-checkbox-marked-circle-outline',
            message: 'レビューを削除しました。',
            type: 'success',
            status: true,
          },
          { root: true }
        )
      })
      .catch((err) => {
        console.log(err)
        this.dialog = false
        this.$store.dispatch(
          'snackbar/showMessage', {
            icon: 'mdi-alert-outline',
            message: '削除に失敗しました。',
            type: 'error',
            status: true,
          },
          { root: true }
        )
      })
    }
  }
}
</script>
