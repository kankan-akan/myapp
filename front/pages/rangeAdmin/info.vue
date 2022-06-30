<template>
  <v-main >
    <v-container >
      <v-row>
        <v-col>
          <div>基本情報</div>
        </v-col>
        <template v-if="rangeData == null">
          <v-col>
            <RangeAddInfo />
          </v-col>
        </template>
        <template v-else>
          <v-col>
            <RangeEditInfo />
          </v-col>
        </template>
      </v-row>

      <template v-if="rangeData == null">
        <v-row>
          <v-col class="d-flex justify-center">
            <h2 class="grey--text lighten-1" style="margin: 20px;">基本情報を登録して下さい。</h2>
          </v-col>
        </v-row>
      </template>
      <template v-else>
      <v-row dense class="justify-center">
      <v-col cols="10">
        <v-card>
          <v-card-text>
            <v-row>
              <v-col cols="2">
              <h3>市町村</h3>
              </v-col>
              <v-col>
                <div class="content">{{ rangeData.city }}</div>
              </v-col>
            </v-row>
          </v-card-text>
        </v-card>
      </v-col>

      <v-col cols="10">
        <v-card>
          <v-card-text>
            <v-row>
              <v-col cols="2">
              <h3>練習場名</h3>
              </v-col>
              <v-col>
                <div class="content">{{ rangeData.name }}</div>
              </v-col>
            </v-row>
          </v-card-text>
        </v-card>
      </v-col>

      <v-col cols="10">
        <v-card>
          <v-card-text>
            <v-row>
              <v-col cols="2">
              <h3>所在地</h3>
              </v-col>
              <v-col>
                <div class="content">{{ rangeData.address }}</div>
              </v-col>
            </v-row>
          </v-card-text>
        </v-card>
      </v-col>

      <v-col cols="10">
        <v-card>
          <v-card-text>
            <v-row>
              <v-col cols="2">
              <h3>広さ(距離)</h3>
              </v-col>
              <v-col>
                <div class="content">{{ rangeData.distance }}  yd</div>
              </v-col>
            </v-row>
          </v-card-text>
        </v-card>
      </v-col>

      <v-col cols="10">
        <v-card>
            <v-card-text>
              <v-row>
              <v-col cols="2">
                <h3>設備</h3>
              </v-col>
            <v-col cols="9">
              <Equipment :equipment="rangeData.equipment" />
            </v-col>
            </v-row>
            </v-card-text>
        </v-card>
      </v-col>

      <v-col cols="10">
        <v-card>
          <v-card-text>
            <v-row>
              <v-col cols="2">
              <h3>特徴</h3>
              </v-col>
              <v-col>
                <div 
                  class="content"
                  style="white-space:pre-wrap; word-wrap:break-word;"
                >{{ rangeData.features }}</div>
              </v-col>
            </v-row>
          </v-card-text>
        </v-card>
      </v-col>

      <v-col cols="10">
        <v-card>
          <v-card-text>
            <v-row>
              <v-col cols="2">
              <h3>打席数</h3>
              </v-col>
              <v-col>
                <div class="content">{{ rangeData.booths }}  打席</div>
              </v-col>
            </v-row>
          </v-card-text>
        </v-card>
      </v-col>

      <v-col cols="10">
        <v-card>
          <v-card-text>
            <v-row>
              <v-col cols="2">
              <h3>HPリンク</h3>
              </v-col>
              <v-col>
                <div class="content">{{ rangeData.link }}</div>
              </v-col>
            </v-row>
          </v-card-text>
        </v-card>
      </v-col>

      <v-col cols="10">
        <v-card>
          <v-card-text>
            <v-row>
              <v-col cols="2">
                <h3>電話番号</h3>
              </v-col>
              <v-col>
                <div class="content">{{ rangeData.phone_number }}</div>
              </v-col>
            </v-row>
          </v-card-text>
        </v-card>
      </v-col>
      </v-row>
      </template>
    
    </v-container>
  </v-main>
</template>

<script>
import { mapState } from 'vuex';

export default {

  computed: {
    ...mapState({
      loginRange: (state) => state.rangeAuth.loginRange,
      rangeData: (state) => state.rangeAuth.rangeData,
    })
  },

}
</script>

<style scoped>
.content {
  font-size: 18px;
}
</style>
