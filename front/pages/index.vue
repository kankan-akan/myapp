<template>
<div class="container">
  <v-btn @click="getApi( )">GET API</v-btn>
  <div>{{ message }}</div>
</div>
</template>

<script>
export default {
  data: () => {
    return {
      message: ''
    }
  },
  methods: {
    getApi() {
      const url = "/api/v1/hello"
      this.$axios.get(url)
        .then((res) => {
          this.message = res.data
        })
        .catch((error) => {
          console.log(error)
        })
    }
  }
}
</script>
