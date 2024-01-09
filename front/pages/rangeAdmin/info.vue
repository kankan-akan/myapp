<template>
  <v-col>
    <v-col class="d-flex align-center">
      <div class="text-h5 font-weight-bold mr-4">基本情報</div>
      <template v-if="rangeData == null">
        <RangeAddInfo />
      </template>
      <template v-else>
        <RangeEditInfo />
      </template>
    </v-col>

    <template v-if="!rangeData">
      <v-row>
        <v-col class="d-flex justify-center">
          <h2 class="grey--text lighten-1" style="margin: 20px;">基本情報を登録して下さい。</h2>
        </v-col>
      </v-row>
    </template>
    <template v-else>
      <v-row dense class="justify-center">
        <v-col cols="8">
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

        <v-col cols="8">
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

        <v-col cols="8">
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

        <v-col cols="8">
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

        <v-col cols="8">
          <v-card>
            <template v-if="rangeData.image && rangeData.image.url">
              <v-img
                v-if="rangeData.image.url"
                class="grey lighten-2"
                contain
                aspect-ratio="1.7"
                :src="rangeData.image.url"
              ></v-img>
            </template>
            <template v-else>
              <v-sheet
                class="d-flex justify-center align-center"
                color="grey lighten-2"
                height="250"
                aspect-ratio="1.7"
              >
                <v-icon size="80">{{ 'mdi-image' }}</v-icon>
              </v-sheet>
            </template>
          </v-card>
        </v-col>

        <v-col cols="8">
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

        <v-col cols="8">
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

        <v-col cols="8">
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

        <v-col cols="8">
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

        <v-col cols="8">
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
</v-col>
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
