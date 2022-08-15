<template>
  
    <nuxt-child />
  
</template>

<script>
  export default {
    middleware: 'userAuth',
    
    layout: 'default',

    validate ({ route }) {
      return route.name !== 'user'
    }

  }
</script>