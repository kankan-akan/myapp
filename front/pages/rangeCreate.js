import { mapActions } from 'vuex';

export default {
  data: () => ({
    /* open dialog */
    dialog: false,
    /* register validate */
    valid: true,
    // eye icon
    show: false,
    // checkbox: false,
    loading: false,
    name: 'hogeゴルフ練習場', 
    nameRules: [ v => !!v || '入力してください' ],
    // userId: '',
    // userIdRules: [
    //   v => !!v || '入力してください',
    //   v => (v && v.length <= 15) || '15文字以下で入力してください',
    //   v => /^(?=.*[a-zA-Z])[a-zA-Z0-9\d.?/-_]{1,15}$/.test(v) || '',
    // ],
    email: 'aa-1@example.com',
    emailRules: [
      v => !!v || '入力してください',
      v => /.+@.+\..+/.test(v) || '',
    ],
    password: 'password.',
    passwordRules: [
      v => !!v || '入力してください',
      v => /^(?=.*[a-z])(?=.*[.?/-_])[a-zA-Z0-9\d.?/-_]{8,30}$/.test(v) || '',
    ]
  }),

  computed:{
    params() {
      return {
        // user_id: this.userId,
        name: this.name,
        email: this.email,
        password: this.password
      }
    }
  },

  methods: {
    ...mapActions({
      getLoginRange: 'rangeAuth/getLoginRange'
    }),
    async submit () {
      if (this.$refs.form.validate()) {
        this.loading = true
        try {
          const res = await this.$axios.post('/v1/range_auth', this.params)
          await this.$axios.post('/v1/range_auth/sign_in', {
            // name: this.name,
            email: this.email,
            password: this.password
          })
          console.log(res)
          this.loading = false
          this.getLoginRange()
          this.$store.commit('rangeAuth/setIsLoggedIn', true)
          this.$router.push('/rangeAdmin/info')
          this.$store.dispatch(
            'snackbar/showMessage', {
              icon: 'mdi-golf-tee',
              message: 'Welcome！',
              type: 'info',
              status: true,
            },
            { root: true }
          )
        }catch(err) {
          console.log(err)
          this.loading = false
          this.$store.dispatch(
            'snackbar/showMessage', {
              icon: 'mdi-alert-outline',
              message: 'ログインに失敗しました。',
              type: 'error',
              status: true,
            },
            { root: true }
          )
        }
      }
    },
    reset () {
      this.$refs.form.reset()
    },
  },
}