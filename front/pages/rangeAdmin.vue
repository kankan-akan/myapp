<template>

    <nuxt-child />

</template>

<script>
  export default {
    layout: 'rangeAdmin',

    validate ({ route }) {
      return route.name !== 'rangeAdmin'
    }
  }
</script>