<template>
  <v-main> 
    <v-container>
      <v-row >
        <v-btn to="/allPost">all post</v-btn>
      </v-row>
      <v-row>
        <v-col 
          v-for="(place, i) in outline"
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

                <BookmarkButton :outline="place" />

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
      </v-row>
    </v-container>
  </v-main>
</template>

<script src ="./index.js"></script>
