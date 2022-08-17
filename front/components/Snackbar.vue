<template>
  <v-snackbar
    v-model="status"
    transition="slide-y-transition"
    :color="type"
    elevation="20"
    top
  >
  <div class="d-flex align-center justify-center">
    <v-icon large dark>{{ icon }}</v-icon>
    <div class="ml-2 font-weight-bold">
      {{ message }}
    </div>
  </div>
  </v-snackbar>
</template>

<script>
import { mapGetters } from 'vuex'
export default {
  computed: {
    ...mapGetters({
      icon: 'snackbar/icon',
      message: 'snackbar/message',
      type: 'snackbar/type',
      // status: 'snackbar/status',
    }),
    status: {
      get () {
        return this.$store.getters['snackbar/status']
      },
      set (val) {
        return val
      }
    }
  },
}
</script>