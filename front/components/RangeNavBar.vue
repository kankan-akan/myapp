<template>
<div>
  <v-navigation-drawer 
    class="light-blue lighten-5"
    floating
    permanent
    app 
    clipped 
  >
    <v-list rounded>
      <v-list-item-group
        mandatory
        color="primary"
      >
      <v-list-item 
        v-for="item in items"
        :key="item.title"
        :to="item.to"
      >
        <v-list-item-icon>
          <v-icon></v-icon> 
        </v-list-item-icon> 
        <v-list-item-content>
          <v-list-item-title>{{ item.title }}</v-list-item-title>
        </v-list-item-content>
      </v-list-item>
      </v-list-item-group>
    </v-list>

    <template v-slot:append>
      <div class="pa-2">
        <v-btn block @click="logout()">
          Logout
        </v-btn>
      </div>
    </template>
        
      
  </v-navigation-drawer>
  </div>
</template>

<script>
  export default {
    data:() => ({
    items:[
      { title: '基本情報', to: "/rangeAdmin/info" },
      { title: '開講レッスン', to: "/rangeAdmin/lesson" }
    ],
  }),

  methods: {
    logout () {
      this.$store.commit('rangeAuth/setIsLoggedIn', false)
      this.$router.push('/')
      // this.$router.replace('/')
    }
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
