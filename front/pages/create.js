export default {

  data: () => ({
    /* open dialog */
    dialog: false,
    /* register validate */
    valid: true,
    // eye icon
    show: false,
    loading: false,
    name: '', 
    nameRules: [
      v => !!v || '入力してください',
      v => (v && v.length <= 15) || '15文字以下で入力してください',
    ],
    userId: '',
    userIdRules: [
      v => !!v || '入力してください',
      v => (v && v.length <= 15) || '15文字以下で入力してください',
      v => /^(?=.*[a-zA-Z])[a-zA-Z0-9\d.?/-_]{1,15}$/.test(v) || '',
    ],
    email: '',
    emailRules: [
      v => !!v || '入力してください',
      v => /.+@.+\..+/.test(v) || '',
    ],
    phoneNumber: '',
    phoneNumberRules: [
      v => !!v || '入力してください'
    ],
    score: '',
    scoreRules: [
      v => /^[0-9]*$/.test(v) || '',
    ],
    password: '',
    passwordRules: [
      v => !!v || '入力してください',
      v => /^(?=.*[a-z])(?=.*[.?/-_])[a-zA-Z0-9\d.?/-_]{8,30}$/.test(v) || '',
    ],
    snackbar: false,
    text: '',

  }),

  computed:{
    params() {
      return {
        name: this.name,
        user_id: this.userId,
        email: this.email,
        phone_number: this.phoneNumber,
        score: this.score,
        password: this.password
      }
    }

  },

  methods: {
    //全て入力されているか
    async submit () {
      if (this.$refs.form.validate()) {
        this.loading = true 
        try {
          // this.loading = true
          const res = await this.$axios.post('/v1/auth', this.params)
          await this.$auth.loginWith('local', {
            data: {
              // name: this.name,
              // user_id: this.userId,
              email: this.email,
              password: this.password
            }
          })
            console.log(res)
            this.loading = false
            this.$store.dispatch(
              'snackbar/showMessage', {
                icon: 'mdi-golf',
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