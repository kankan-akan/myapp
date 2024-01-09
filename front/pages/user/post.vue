<template>
  <v-container>
    <v-card max-width="900" class="mx-auto rounded-xl">
      <v-card-title class="font-weight-bold">新しい投稿</v-card-title>
      <v-row justify="center">
        <v-col cols="8">
          <v-form
            ref="form"
            v-model="valid"
            lazy-validation
          >
            <v-autocomplete
              v-model="range"
              :loading="loading"
              :items="items"
              :search-input.sync="search"
              cache-items
              class="mx-4"
              hide-no-data
              solo
              label="利用した練習場"
            ></v-autocomplete>
            <v-textarea
              outlined
              v-model="content"
              label="ご利用になった練習場はいかがでしたか？"
              :counter="140"
              :rules="contentRules"
            ></v-textarea>
            <v-file-input
              v-model="inputImage"
              accept="image/png, image/jpeg, image/bmp"
              prepend-icon="mdi-image-plus"
              @change="uploadImage"
            ></v-file-input>
            <div class="d-flex justify-center">
              <v-sheet v-if="preImage == ''" class="image grey lighten-3">
                <v-row justify="center" align="center" class="fill-height">
                  <v-icon size="82">mdi-image</v-icon>
                </v-row>
              </v-sheet>
              <v-img
                v-else
                :src="preImage"
                max-height="250px"
                contain
              ></v-img>
            </div>
          </v-form>
        </v-col>
      </v-row>
      <v-card-actions class="justify-end">
        <v-btn
          class="mr-4 font-weight-bold white--text"
          :disabled="!valid"
          color="indigo accent-2"
          @click="submit()"
          large
        >
          投稿する
        </v-btn>
      </v-card-actions>
    </v-card>
  </v-container>
</template>

<script>
import { mapState } from 'vuex'

export default {
  data: () => ({
    valid: true,
    range: '',
    content: '',
    contentRules: [
      v => v.length <= 140 || '140字以内で入力してください。'
    ],
    inputImage: null,
    preImage: '',
    loading: false,
    items: [],
    search: null,
    rangeNames: []
  }),

  computed:{
    ...mapState({
      loginUser: (state) => state.myData.loginUser,
      outline: (state) => state.outline
    })
  },

  watch: {
    search (val) {
      val && val !== this.range && this.querySelections(val)
    }
  },

  created () {
    const val = this.outline.map(value => value.name)
    this.rangeNames = val
  },

  methods: {
    async submit () {
      if (this.content || this.inputImage) {
        const formData = new FormData()
          formData.append('user_id', this.loginUser.id)
          formData.append('content', this.content)
          formData.append('range', this.range)
          if (this.inputImage !== '') {
            formData.append('image', this.inputImage)
          }
        await this.$axios.post('/v1/posts', formData, {
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        })
        .then((res) => {
          console.log(res)
          this.$router.push('/allPost')
          this.$store.dispatch(
            'snackbar/showMessage', {
              icon: 'mdi-checkbox-marked-circle-outline',
              message: '投稿が保存されました。',
              type: 'success',
              status: true,
            },
            { root: true }
          )
        })
        .catch((err) => {
          console.log(err)
          this.$store.dispatch(
            'snackbar/showMessage', {
              icon: 'mdi-alert-outline',
              message: '投稿に失敗しました。',
              type: 'error',
              status: true,
            },
            { root: true }
          )
        })
      } else {
        this.$store.dispatch(
          'snackbar/showMessage', {
            icon: 'mdi-alert-outline',
            message: '本文・画像いずれかを入力のうえ投稿してください。',
            type: 'error',
            status: true,
          },
          { root: true }
        )
      }
    },
    uploadImage(file) {
      if (file !== undefined && file !== null) {
        if (file.name.lastIndexOf('.') <= 0) {
          return
        }
        const fr = new FileReader()
        fr.readAsDataURL(file)
        fr.addEventListener('load', () => {
          this.preImage = fr.result
        })
      } else {
        this.preImage = ''
      }
    },
    querySelections (v) {
      this.loading = true
      // Simulated ajax query
      setTimeout(() => {
        this.items = this.rangeNames.filter(e => {
          return (e || '').toLowerCase().indexOf((v || '').toLowerCase()) > -1
        })
        this.loading = false
      }, 500)
    },
  }
}
</script>

<style scoped>
  .image {
    height: 250px;
    width: 250px;
  }
</style>