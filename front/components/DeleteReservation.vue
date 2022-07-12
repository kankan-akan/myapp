<template>
  <div>
    <v-btn
      rounded
      outlined
      color="green white--text lighten-1"
      @click="deleteReservation(reservation.id)"
    >
      予約キャンセル
    </v-btn>
  </div>
</template>

<script>
import { mapActions } from 'vuex';

export default {
  props:['reservation'],

  methods: {
    ...mapActions ({
      getReservation: 'myData/getReservation',
    }),
    deleteReservation(id) {
      this.$axios.delete(`/v1/reservations/${id}`)
      .then((res) => {
        console.log(res)
        this.getReservation()
      })
      .catch((err) => {
        console.log(err)
      })
    }
  }
}
</script>
