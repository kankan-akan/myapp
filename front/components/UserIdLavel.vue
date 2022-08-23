<template>
  <v-col class="d-flex align-end">
    <v-avatar v-if="user.avatar && user.avatar.url" size="40px">
      <img :src="user.avatar.url">
    </v-avatar>
    <v-avatar v-else size="40px" color="indigo">
      <v-icon dark size="20px">mdi-account</v-icon>
    </v-avatar>
    <div class="cursor text-h6 px-2" @click="findUser(user.id)">@{{ user.user_id }}</div>
  </v-col>
</template>

<script>
export default {
  props: ['user'],

  methods: {
    findUser(id) {
      this.$router.push(`/users/${id}`)
    },
  }
}
</script>
