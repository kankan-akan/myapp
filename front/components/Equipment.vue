<template>
  <v-container>
    <v-row no-gutters>
    <v-col>
      <div class="e1" v-bind:class="{  }">打ち放題</div>
      <div class="e1">アプローチ</div>
    </v-col>
    <v-col>
      <div class="e1">左打席</div>
      <div class="e1">パター</div>
    </v-col>
    <v-col>
      <div class="e1">バンカー</div>
      <div class="e1">ショップ</div>
    </v-col>
    <v-col>
      <div class="e1">レストラン</div>
      <div class="e1">レッスン</div>
    </v-col>
    </v-row>
  </v-container>
</template>

<script>
import { mapActions, mapState } from 'vuex';

export default ({
 data:()=> ({
  isActive: true

 }),

methods: {
   
  },

 computed: {
   ...mapState({
     equipment: (state) => state.equipment
   })
 }

})
</script>


<style scoped>
.active {
  color: white;
  background-color: rgb(99, 204, 0);

}

.e1 {
  text-align: center;
  margin: 1px;
  font-size: 10px;
  border: 1.5px solid rgb(172, 172, 172);
  border-radius: 9px;

}
</style>