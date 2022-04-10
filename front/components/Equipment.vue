<template>
  <v-container>
    <v-row no-gutters>
    <v-col>
      <div class="e1" v-bind:class="{ 'active' : equipment.uchihoudai }">打ち放題</div>
      <div class="e1" v-bind:class="{ 'active' : equipment.approach }">アプローチ</div>
    </v-col>
    <v-col>
      <div class="e1" v-bind:class="{ 'active' : equipment.lefty }">左打席</div>
      <div class="e1" v-bind:class="{ 'active' : equipment.patting }">パター</div>
    </v-col>
    <v-col>
      <div class="e1" v-bind:class="{ 'active' : equipment.bunker }">バンカー</div>
      <div class="e1" v-bind:class="{ 'active' : equipment.shop }">ショップ</div>
    </v-col>
    <v-col>
      <div class="e1" v-bind:class="{ 'active' : equipment.restaurant }">レストラン</div>
      <div class="e1" v-bind:class="{ 'active' : equipment.lesson }">レッスン</div>
    </v-col>
    </v-row>
  </v-container>
</template>

<script>
import { mapActions, mapState } from 'vuex';

export default {
  props: ['equipment'],

  data:()=> ({
  }),

methods: {
   
  },

}
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