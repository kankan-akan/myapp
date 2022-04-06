export default {

  data: () => ({
    /* open dialog */
    dialog: false,
    /* register validate */
    valid: true,
    // eye icon
    show: false,
    // checkbox: false,
    loader: 'null',
    loading: false,

    name: 'hogeゴルフ練習場', 
    nameRules: [
      v => !!v || '入力してください',
      v => (v && v.length <= 20) || '',
    ],
    
    // userId: '',
    // userIdRules: [
    //   v => !!v || '入力してください',
    //   v => (v && v.length <= 15) || '15文字以下で入力してください',
    //   v => /^(?=.*[a-zA-Z])[a-zA-Z0-9\d.?/-_]{1,15}$/.test(v) || '',
    // ],
    
    email: 'a@example.com',
    emailRules: [
      v => !!v || '入力してください',
      v => /.+@.+\..+/.test(v) || '',
    ],

    password: 'password.',
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
        // user_id: this.userId,
        name: this.name,
        email: this.email,
        password: this.password
      }
    }

  },

  methods: {
    //全て入力されているか
    async submit () {
      if (this.$refs.form.validate()) {
        try {
          // this.loading = true
          const res = await this.$axios.post('/v1/range_auth', this.params)
          await this.$axios.post('/v1/range_auth/sign_in', {
              // name: this.name,
              email: this.email,
              password: this.password
            })
            console.log(res)
            this.$store.commit('rangeAuth/setIsLoggedIn', true)
            this.$router.push('/rangeAdmin/info')
            // this.snackbar = true
        }catch(err) {
            console.log(err)
          }
      }

    },

    reset () {
      this.$refs.form.reset()
    },
  },
}