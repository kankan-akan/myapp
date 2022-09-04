<template>
  <div>
    <v-dialog
      v-model="dialog"
      persistent
      max-width="370"
    >
      <template v-slot:activator="{ on, attrs }">
        <v-btn
          rounded
          outlined
          color="green white--text lighten-1"
          @click="dialog = true"
          v-bind="attrs"
          v-on="on"
        >
          予約キャンセル
        </v-btn>
      </template>
      <v-card>
        <v-card-title class="text-h5">
          予約をキャンセルしますか？
        </v-card-title>
        <v-card-text>
          <div class="text-h6">レッスン内容</div>
          <div class="ml-3 mt-3">
            <div class="text-subtitle-1">{{ reservation.lesson.title }}</div>
            <div>{{ reservation.date }}</div>
          </div>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn
            color="green darken-1"
            text
            @click="deleteReservation(reservation.id)"
          >
            予約キャンセル
          </v-btn>
          <v-btn
            color="green darken-1"
            text
            @click="dialog = false"
          >
            閉じる
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
import { mapActions } from 'vuex';

export default {
  props:['reservation'],

  data:() => ({
    dialog: false
  }),

  methods: {
    ...mapActions ({
      getReservation: 'myData/getReservation',
    }),
    deleteReservation(id) {
      this.$axios.delete(`/v1/reservations/${id}`)
      .then((res) => {
        this.getReservation()
        this.$store.dispatch(
          'snackbar/showMessage', {
            icon: 'mdi-checkbox-marked-circle-outline',
            message: '予約が削除されました。',
            type: 'success',
            status: true,
          },
          { root: true }
        )
        this.dialog = false
      })
      .catch((err) => {
        console.log(err)
        this.$store.dispatch(
          'snackbar/showMessage', {
            icon: 'mdi-alert-outline',
            message: '予約の削除に失敗しました。',
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
