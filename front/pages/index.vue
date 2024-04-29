<template>
  <div>
    <v-container>
      <v-row justify="center" no-gutter>
        <v-col cols="6">
          <div class="text-subtitle-1 font-weight-bold">市町村から検索</div>
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
        <v-col cols="6">
          <div class="text-subtitle-1 font-weight-bold">練習場名で検索</div>
          <v-autocomplete
            v-model="range"
            :loading="loading"
            :items="items"
            :search-input.sync="search"
            hide-no-data
            clearable
            solo
            rounded
            label="練習場名を入力"
          ></v-autocomplete>
        </v-col>
      </v-row>
      <v-btn v-if="!$store.state.auth.loggedIn" text to="/rangeAdmin/info">練習場管理者の方はこちら</v-btn>
      <v-row>
        <template v-if="filteredOutlines.length !== 0">
          <v-col
            v-for="(place, i) in filteredOutlines"
            :key="i"
            cols="12"
            xs="12"
            sm="4"
          >
            <v-card class="rounded-xl" justify="space-around">
              <v-card-text class="pa-3 black--text">
                <div class="d-flex justify-space-between">
                  <div>
                    <div class="grey--text text--darken-2" v-text="place.city"></div>
                    <div v-text="place.ruby"></div>
                    <div
                      class="text-h6 font-weight-bold"
                      v-text="place.name"
                    >
                    </div>
                    <div v-text="place.address"></div>
                    <div>{{ place.distance }}yd</div>
                  </div>

                  <BtnBookmark v-if="place" :outline="place" />

                </div>
              </v-card-text>
              <template v-if="place.image && place.image.url">
                <v-img
                  v-if="place.image.url"
                  height="150"
                  :src="place.image.url"
                ></v-img>
              </template>
              <v-sheet
                v-else
                class="d-flex justify-center align-center"
                color="grey lighten-1"
                height="150"
              >
                  <v-icon size="80">{{ 'mdi-image' }}</v-icon>
                </v-sheet>
              <!-- <table class="table-price">
                <tr>
                  <td class="empty"></td> <th class="th-price">平日</th><th class="th-price">土日</th>
                </tr>
                <tr>
                  <th class="th-price">ボール単価</th> <td class="td-price">10円/1球</td><td class="td-price">12円/1球</td>
                </tr>
              </table> -->

              <Equipment :equipment="place.equipment" />

              <v-card-actions class="justify-center">
                <DetailIndex :place="place" />
              </v-card-actions>
            </v-card>
          </v-col>
        </template>
        <template v-else>
          <v-col
            cols="4"
            v-for="n in 24"
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
    <ReccomendLesson v-if="$store.state.auth.loggedIn && this.$store.state.myData.loginUser.score" />
  </div>
</template>

<script src ="./index.js"></script>