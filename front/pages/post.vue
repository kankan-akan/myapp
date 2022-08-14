<template>
  <v-main>
    <v-container>
      <v-card>
        <v-card-title>New Post</v-card-title>
        <v-form 
          ref="form"
          v-model ="valid"
          lazy-validation 
        >
        <v-col>
          <v-textarea
            outlined
            v-model="content"
            label="ご利用になった練習場はいかがでしたか？"
            :counter="140"
            :rules="contentRules"
            required
          ></v-textarea>
        </v-col>
        <v-col>
          <v-file-input
            v-model="inputImage"
            accept="image/png, image/jpeg, image/bmp"
            
            prepend-icon="mdi-image-plus"
            @change="uploadImage"
            
          ></v-file-input>
          <!-- <template v-for="(image, i) in preImage">
          <img 
            v-if="preImage" 
            :key="i"
            :src="image"
          >
          </template> -->
          <v-sheet class="image grey lighten-3">
            <v-row v-if="preImage == ''" justify="center" align="center" class="fill-height">
              <v-icon size="82">mdi-image</v-icon>
            </v-row>
            <img v-else class="image" :src="preImage">
          </v-sheet>
          
        </v-col>
        </v-form>
        <v-card-actions>
          <v-btn @click="submit()">post</v-btn>
        </v-card-actions>
      </v-card>
    </v-container>
  </v-main>
</template>

<script>
import { mapState } from 'vuex'

export default {
  data: () => ({
    valid: true,
    content: '',
    contentRules: [
      v => !!v && (v && v.length <= 140)
    ],
    inputImage: null,
    preImage: ''
  }),

  computed:{
    ...mapState({
      loginUser: (state) => state.myData.loginUser
    })
  },

  methods:{
    async submit () {
      if (this.$refs.form.validate()) {
        const formData = new FormData()
          formData.append('user_id', this.loginUser.id)
          formData.append('content', this.content)
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
      }
    },
    // uploadImage(){
    //   // if (this.avatar == null) {
    //   //   return;
    //   // }
    //   const reader = new FileReader();
    //   reader.onload = (e) => {
    //     this.preImage = e.target.result;
    //   }
    //   reader.readAsDataURL(this.inputImage);
    // },
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
  }
}
</script>

<style scoped>
  .image {
    height: 250px;
    width: 250px;
  }
</style>