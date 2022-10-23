<template>
  <v-row dense>
    <v-col>
    <v-btn 
      block
      depressed
      rounded
      color="green white--text lighten-1"
      @click.stop="dialog = true"
    >
      詳細
      <v-icon>mdi-chevron-double-down</v-icon>
    </v-btn>
    <v-dialog
      v-model="dialog"
      width="680"
      scrollable
    >
      <v-card>
        <v-card-text class="pa-3 black--text">
          <div class="grey--text text--darken-2" v-text="place.city"></div>
          <div class="text-h6" v-text="place.name"></div>
          <div v-text="place.address"></div>
          <div>{{ place.distance }}yd</div>

          <v-divider class="grey lighten-2 my-2"></v-divider>

          <v-tabs color="success">
            <v-tab class="text-subtitle-1 font-weight-bold">概要</v-tab>
            <v-tab class="text-subtitle-1 font-weight-bold">レッスン</v-tab>
          
            <v-tab-item>
              <v-row no-gutter justify="center">
                <v-col cols="10" class="mt-2">
                  <v-img
                    v-if="place.image && place.image.url"
                    class="grey lighten-2"
                    contain
                    aspect-ratio="1.7"
                    :src="place.image.url"
                  ></v-img>
                  <v-sheet
                    v-else
                    class="d-flex justify-center align-center"
                    color="grey lighten-2"
                    height="250"
                    aspect-ratio="1.7"
                  >
                    <v-icon size="80">{{ 'mdi-image' }}</v-icon>
                  </v-sheet>
                </v-col>
              </v-row>
              <!-- <table class="table-price">
                <tr>
                  <td class="empty-price"></td> <th class="th-price">平日</th><th class="th-price">土日</th>
                </tr>
                <tr>
                  <th class="th-price">ボール単価</th> <td class="td-price">10円/1球</td><td class="td-price">12円/1球</td>
                </tr>
              </table> -->
              <v-row dense justify="center">
                <v-col cols="11">
                  <Equipment :equipment="place.equipment" />
                </v-col>
              </v-row>
              <v-card outlined shaped>
                <v-col class="kaigyo text--primary">{{ place.features }}</v-col>
              </v-card>
              <v-col class="d-flex align-center">
                <v-icon>{{ 'mdi-golf-tee' }}</v-icon>
                <div class="text-subtitle-1 ml-2 mr-15">打席数</div>
                <v-divider vertical class="mr-3 grey lighten-1"></v-divider>
                <span>{{ place.booths }}打席</span>
              </v-col>
              <v-col class="d-flex align-center">
                <v-icon>{{ 'mdi-phone' }}</v-icon>
                <div class="text-subtitle-1 ml-2 mr-11">電話番号</div>
                <v-divider vertical class="mr-3 grey lighten-1"></v-divider>
                <span>{{ place.phone_number }}</span>
              </v-col>
              <v-col class="d-flex align-center">
                <v-icon>{{ 'mdi-monitor' }}</v-icon>
                <div class="text-subtitle-1 ml-2">ホームページ</div>
                <v-divider vertical class="mx-3 grey lighten-1"></v-divider>
                <span>{{ place.link }}</span>
              </v-col>
            </v-tab-item>

            <v-tab-item>
              <v-card-title 
                class="font-weight-bold"
              >
              レッスン一覧
              </v-card-title>
              <v-row dense>
                <template v-if="place.lessons.length !== 0">
                  <v-col 
                    v-for="(lesson, i) in place.lessons"
                    :key="i"
                    cols="12"
                  >
                    <v-card @click="showLesson(lesson.id)">
                      <v-card-title>{{ lesson.title }}</v-card-title>
                      <v-card-subtitle>{{ lesson.coach }}プロ</v-card-subtitle>
                      <v-card-text class="black--text">
                        <div class="kaigyo">{{ lesson.content }}</div>
                      </v-card-text>
                    </v-card>
                  </v-col>
                </template>
                <template v-else>
                  <v-col class="d-flex justify-center">
                    <div class="text-h6 font-weight-bold grey--text lighten-1">現在開講されているレッスンはありません</div>
                  </v-col>
                </template>
              </v-row>
            </v-tab-item>
          </v-tabs>
        </v-card-text>

        <v-divider class="grey lighten-2"></v-divider>

        <v-card-actions class="justify-center">
          <v-btn
            color="success"
            rounded
            @click="dialog = false"
          >
            <div class="px-6">
              close
            </div>
          </v-btn>
        </v-card-actions>

      </v-card>
    </v-dialog>
    </v-col>
  </v-row>
</template>

<script>
export default {
  props: ['place'],

  data: () => ({
    dialog: false
  }),

  methods: {
    showLesson(id) {
      this.$router.push(`/lessons/${id}`)
    }
  }
}
</script>
