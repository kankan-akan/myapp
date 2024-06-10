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
      <!-- <v-row
        class="justify-end"
        no-gutters
      >
        <v-btn
          dense
          small
          text
          @click="toggleSearchPanel = !toggleSearchPanel"
        >
          <v-icon>mdi-plus-circle-outline</v-icon>
          詳細条件を指定
        </v-btn>
      </v-row> -->
      <!-- <Transition name="slide-fade">
        <v-card
          v-if="toggleSearchPanel"
          class="mx-auto"
          elevation="4"
          rounded="xl"
          max-width="950"
        >
          <v-card-text>
            <div class="text-subtitle-1 font-weight-bold">設備</div>
            <v-row class="mx-auto">
              <v-col cols="12" sm="3">
                <v-checkbox
                  class="label"
                  v-model="uchihoudai"
                  label="打ち放題"
                ></v-checkbox>
                <v-checkbox
                  class="label"
                  v-model="approach"
                  label="アプローチ場"
                ></v-checkbox>
              </v-col>
              <v-col cols="12" sm="3">
                <v-checkbox
                  class="label"
                  v-model="lefty"
                  label="左打席"
                ></v-checkbox>
                <v-checkbox
                  v-model="patting"
                  label="パター場"
                ></v-checkbox>
              </v-col>
              <v-col cols="12" sm="3">
                <v-checkbox
                  class="label"
                  v-model="bunker"
                  label="バンカー場"
                ></v-checkbox>
                <v-checkbox
                  class="label"
                  v-model="shop"
                  label="ショップ"
                ></v-checkbox>
              </v-col>
              <v-col cols="12" sm="3">
                <v-checkbox
                  class="label"
                  v-model="restaurant"
                  label="レストラン"
                ></v-checkbox>
                <v-checkbox
                  class="label"
                  v-model="lesson"
                  label="レッスン"
                ></v-checkbox>
              </v-col>
            </v-row>
            <v-card-actions class="justify-end">
            <v-btn
              color="blue white--text"
              small
              @click="toggleSearchPanel = !toggleSearchPanel"
            >
              OK
            </v-btn>
            </v-card-actions>
          </v-card-text>
        </v-card>
      </Transition> -->
      <v-btn
        class="mt-4"
        v-if="!$store.state.auth.loggedIn"
        text
        to="/rangeAdmin/info"
      >
        練習場管理者の方はこちら
      </v-btn>
      <v-row>
        <template v-if="filteredOutlines.length !== 0">
          <v-col
            v-for="(place, i) in filteredOutlines"
            :key="`first-${i}`"
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
    <v-sheet
      v-if="!$store.state.auth.loggedIn"
      class="reccomend rounded-lg mx-2"
      elevation="8"
    >
      <div class="title font-weight-bold rounded-lg">
        <p class="title-content ml-2 my-1">ベストスコアが近いユーザーが利用しているレッスン</p>
      </div>
      <v-col class="d-flex justify-center align-center">
        <div class="font-weight-bold">スコアを設定してみましょう！</div>
        <v-btn rounded outlined to="/loginForm">ログイン</v-btn>
      </v-col>
    </v-sheet>
    <ReccomendLesson v-if="$store.state.auth.loggedIn && loginUser" />
  </div>
</template>

<script src ="./index.js"></script>

<style scoped>
  .reccomend {
    position: sticky;
    bottom: 0;
    background-color: #96ffa9e7;
  }

  .title {
    position: relative;
    background-color: #ffff;
    background: linear-gradient(#ffff, #f0f0f0);
    box-shadow: 0 8px 5px #f0f0f0;
    border-top: 5px solid #0ca111;
  }

  .slide-fade-enter-active, .slide-fade-leave-active {
    transition: transform 0.6s cubic-bezier(0.22, 1, 0.36, 1);
  }

  @media screen and (min-width: 601px) {
    .title-content {
      font-size: 20px;
    }
  }

  @media screen and (max-width: 600px) {
    .title-content {
      font-size: 13px;
    }
  }

  .slide-fade-enter, .slide-fade-leave-to {
    transform: translateY(-50px);
    opacity: 0;
  }

</style>