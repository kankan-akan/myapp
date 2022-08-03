<template>
  <v-main>
    <v-container>
      <v-row>
        <v-btn to="/allPost">all post</v-btn>
        <v-btn to="/rangeLogin">練習場管理者の方はこちら</v-btn>
      </v-row>
      <v-row justify="center">
        <v-col cols="6">
          <div class="text-subtitle-1">市町村から検索</div>
          <v-autocomplete
            v-model="city"
            :items="cities"
            chips
            clearable
            deletable-chips
            multiple
            solo
            rounded
            label="市町村を選択"
          ></v-autocomplete>
        </v-col>
        <!-- <v-col cols="6">
          <div class="text-subtitle-1">練習場名から検索</div>
          <v-autocomplete
            v-model="range"
            :loading="loading"
            :items="items"
            clearable
            solo
            rounded
            label="練習場名を入力"
          ></v-autocomplete>
        </v-col> -->
      </v-row>
    <!-- <v-col>{{ filteredOutlines }}</v-col> -->
      <v-row>
        <template v-if="filteredOutlines.length !== 0">
          <v-col
            v-for="(place, i) in filteredOutlines"
            :key="i"
            cols="12"
            xs="12"
            sm="3"
          >
            <v-card justify="space-around">
              <v-card-text class="my-0 pa-2 black--text">
                <div class="d-flex justify-space-between">
                  <div>
                    <div class="grey--text text--darken-2" v-text="place.city"></div>
                    <div v-text="place.ruby"></div>
                    <div 
                      class="text-h5"
                      v-text="place.name"
                    >
                    </div>
                    <div v-text="place.address"></div>
                    <div>{{ place.distance }}yd</div>
                  </div>

                  <BookmarkButton v-if="place" :outline="place" />

                </div>
              </v-card-text>
              <v-divider class="my-2"></v-divider>
              <table class="table-price">
                <tr>
                  <td class="empty"></td> <th class="th-price">平日</th><th class="th-price">土日</th>
                </tr>
                <tr>
                  <th class="th-price">ボール単価</th> <td class="td-price">10円/1球</td><td class="td-price">12円/1球</td>
                </tr>
              </table>

              <Equipment :equipment="place.equipment" />

              <v-card-actions class="justify-center">
                <DetailIndex :place="place" />
              </v-card-actions>
            </v-card>
          </v-col>
        </template>
        <template v-else>
          <v-col
            cols="3"
            v-for="n in 21"
            :key="n"
          >
            <v-skeleton-loader
              type="table-heading, article"
            >
            </v-skeleton-loader>
          </v-col>
        </template>
      </v-row>
    </v-container>
  </v-main>
</template>

<script src ="./index.js"></script>
