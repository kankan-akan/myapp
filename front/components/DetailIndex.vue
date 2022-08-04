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
      width="600"
    >
      <v-card>
        <v-card-text class="pa-3 black--text">
          <div class="grey--text text--darken-2" v-text="place.city"></div>
          <div class="text-h6" v-text="place.name"></div>
          <div v-text="place.address"></div>
          <div>{{ place.distance }}yd</div>
              
          <v-divider class="grey lighten-2 my-2"></v-divider>
              
          <!-- <table class="table-price">
            <tr>
              <td class="empty-price"></td> <th class="th-price">平日</th><th class="th-price">土日</th>
            </tr>
            <tr>
              <th class="th-price">ボール単価</th> <td class="td-price">10円/1球</td><td class="td-price">12円/1球</td>
            </tr>
          </table> -->

          <Equipment :equipment="place.equipment" />
          <v-card outlined shaped>
            <v-col class="kaigyo text--primary">{{ place.features }}</v-col>
          </v-card>
          <v-col>ホームページ: {{ place.link }}</v-col>
          <v-col>電話番号: {{ place.phone_number }}</v-col>
          <v-col>打席数: {{ place.booths }}打席</v-col>
          <v-card-title class="pa-1">レッスン一覧</v-card-title>
          <v-row justify="center">
            <v-expansion-panels 
              v-model="panel"
              multiple
              popout
            >
              <v-expansion-panel
                v-for="(lesson, i) in place.lessons"
                :key="i"
              >
                <v-expansion-panel-header>
                  <v-row>{{ lesson.title }}</v-row>
                  <v-row>{{ lesson.coach }}</v-row>
                </v-expansion-panel-header>
                <v-expansion-panel-content>
                  <div>{{ lesson.title }}</div>
                  <div>{{ lesson.coach }}</div>
                  <div>{{ lesson.content }}</div>
                  <v-btn @click="showLesson(lesson.id)">詳細・予約</v-btn>
                </v-expansion-panel-content>
              </v-expansion-panel>
            </v-expansion-panels>
          </v-row>
        </v-card-text>
        <v-card-actions class="justify-center">
          <v-btn
            color="success"
            class="ma-3"
            @click="dialog = false || nonePanel()"
          >
            close
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
    dialog: false,
    panel: []

  }),

  methods: {
    showLesson(id) {
      this.$router.push(`/lessons/${id}`)
    },
    nonePanel() {
      this.panel = []
    }
  }
}
</script>
