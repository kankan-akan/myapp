<template>
  <v-main>
    
    <v-container>
      <div>Index board</div>
      <div>{{ $store.state.rangeAuth.isLoggedIn }}</div>
    
    </v-container>
  </v-main>
</template>

<script>

export default {
  layout: 'rangeAdmin',

  data:() => ({
  }),

  methods: {
    // async logout () {
    //   try {
    //     const res = await this.$axios.delete('/v1/range_auth/sign_out')
    //     console.log(res)
    //     this.$store.commit('rangeAuth/setIsLoggedIn', false)
    //     this.$router.push('/')
    //   }
    //   catch(err){
    //     console.log(err)
    //   }
    // }
  }
}
</script>
