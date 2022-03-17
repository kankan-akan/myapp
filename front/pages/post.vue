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
    ]
  }),

  computed:{
    ...mapState({
      loginUser: (state) => state.authentication.loginUser
    })
  },

  methods:{
    submit() {
      if(this.$refs.form.validate()) {
        this.$axios.post('/v1/posts', {
          user_id: this.loginUser.id,
          content: this.content
        })
      }

    }
  }
}
</script>