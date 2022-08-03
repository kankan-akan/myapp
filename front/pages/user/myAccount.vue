<template>
  <v-main>
    <v-container justify="center">
      <v-col>アカウント設定</v-col>
      <v-col>変更したい項目を書き換えてください。</v-col>
      <v-form
        ref="form"
        v-model="valid"
        lazy-validation
      >
        <v-col class="text-center">
          <v-file-input
            v-model="inputImage"
            accept="image/png, image/jpeg, image/bmp"
            
            prepend-icon="mdi-camera-plus-outline"
            label="画像を選択してください"
            @change="uploadImage"
          ></v-file-input>
          <template v-if="avatar == null">
            <v-avatar v-if="preImage !== ''" size="200">
              <img :src="preImage">
            </v-avatar>
            <v-avatar v-else size="200" color="indigo">
              <v-icon dark size="120">mdi-account</v-icon>
            </v-avatar>
            <v-chip
              v-if="preImage !== ''"
              @click="deletePreImage()"
            >
              cancel
            </v-chip>
          </template>
          <template v-else>
            <v-avatar size="200">
              <img v-if="preImage !== ''" :src="preImage">
              <img v-else :src="avatar">
            </v-avatar>
            <v-chip
              v-if="preImage !== ''"
              @click="deletePreImage()"
            >
              cancel
            </v-chip>
            <v-btn
              v-else
              small
              icon
              @click="deleteAvatar()"
            >
              <v-icon small>{{ 'mdi-close' }}</v-icon>
            </v-btn>
          </template>
        </v-col>
        
        <v-divider class="mb-3"></v-divider>

        <v-col>
          <v-text-field
            outlined
            v-model="name"
            :rules="nameRules"
            label="登録名"
            required
          ></v-text-field>
        </v-col>

        <v-divider class="mb-3"></v-divider>

        <v-col>
          <v-text-field
            outlined
            v-model="userId"
            :counter="15"
            :rules="userIdRules"
            label="ユーザー名（半角英数字・記号(.?/-_)で15文字以内"
            required
          ></v-text-field>
        </v-col>

        <v-divider class="mb-3"></v-divider>

        <v-col>
          <v-text-field
            outlined
            v-model="email"
            :rules="emailRules"
            label="メールアドレス"
            required
          ></v-text-field>
        </v-col>

        <v-divider class="mb-3"></v-divider>

        <v-col>
          <v-text-field
            outlined
            v-model="phoneNumber"
            label="電話番号"
            required
          ></v-text-field>
        </v-col>

        <!-- <v-divider class="mb-3"></v-divider> -->

        <!-- <v-col>
          <v-text-field
            outlined
            v-model="password"
            :rules="passwordRules"
            :append-icon="show ? 'mdi-eye' : 'mdi-eye-off'"
            :type="show? 'text' : 'password'"
            label="パスワード（半角英数字・記号(.?/-_)を各1つ含む8文字以上30文字以内）"
            required
            @click:append="show = !show"
          ></v-text-field>
        </v-col> -->
        <v-btn
          class="mr-4"
          :disabled="!valid || loading" 
          :loading="loading"
          @click.prevent="editInfo"
          large
          outlined
        >
          登録
        </v-btn>
      </v-form>
    </v-container>
  </v-main>
</template>

<script>
import { mapState } from 'vuex';

export default {
  data: function () {
    return {
      /* open dialog */
      dialog: false,
      /* register validate */
      valid: true,
      // eye icon
      show: false,
      loading: false,
      name: this.$store.state.myData.loginUser.name, 
      nameRules: [
      ],
      userId: this.$store.state.myData.loginUser.user_id,
      userIdRules: [
        v => (v && v.length <= 15) || '15文字以下で入力してください',
        v => /^(?=.*[a-zA-Z])[a-zA-Z0-9\d.?/-_]{1,15}$/.test(v) || '',
      ],
      email: this.$store.state.myData.loginUser.email,
      emailRules: [
        v => !!v || '入力してください',
        v => /.+@.+\..+/.test(v) || '',
      ],
      phoneNumber: this.$store.state.myData.loginUser.phone_number,
      // password: 'password.',
      // passwordRules: [
      //   v => !!v || '入力してください',
      //   v => /^(?=.*[a-z])(?=.*[.?/-_])[a-zA-Z0-9\d.?/-_]{8,30}$/.test(v) || '',
      // ],
      avatar: this.$store.state.myData.loginUser.avatar.url,
      // avatar: null,
      // avatar: 'https://cdn.vuetifyjs.com/images/john.jpg',
      inputImage: null,
      preImage: ''
    }
  },

  computed: {
    ...mapState({
      loginUser: (state) => state.myData.loginUser
    }),
  },

  methods: {
    async editInfo () {
      if (this.$refs.form.validate()) {
        const formData = new FormData()
          formData.append('name', this.name)
          formData.append('user_id', this.userId)
          formData.append('email', this.email)
          formData.append('phone_number', this.phoneNumber)
          if (this.inputImage !== '') {
            formData.append('avatar', this.inputImage)
          }
        await this.$axios.put('/v1/auth', formData, { 
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        })
        .then((res) => {
          console.log(res)
        })
        .catch((err) => {
          console.log(err)
        })
      }
    },
    // uploadImage(){
    //   if (this.avatar == null) {
    //     return;
    //   }
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
    deletePreImage() {
      this.preImage = ''
      this.inputImage = null
    },
    deleteAvatar() {
      this.avatar = null
      this.inputImage = null
    }
  }
}
</script>
