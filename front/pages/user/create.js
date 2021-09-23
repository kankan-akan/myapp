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

    name: '', 
    nameRules: [
      v => !!v || '入力してください',
      v => (v && v.length <= 15) || '15文字以下で入力してください',
    ],
    
    // userId: '',
    // userIdRules: [
    //   v => !!v || '入力してください',
    //   v => (v && v.length <= 15) || '15文字以下で入力してください',
    //   v => /^(?=.*[a-zA-Z])[a-zA-Z0-9\d.?/-_]{1,15}$/.test(v) || '',
    // ],
    
    // email: '',
    // emailRules: [
    //   v => !!v || '入力してください',
    //   v => /.+@.+\..+/.test(v) || '',
    // ],

    // password: '',
    // passwordRules: [
    //   v => !!v || '入力してください',
    //   v => /^(?=.*[a-z])(?=.*[.?/-_])[a-zA-Z0-9\d.?/-_]{8,30}$/.test(v) || '',
    // ],
    
    snackbar: false,
    text: '',

  }),

  computed:{
    params() {
      return {
        name: this.name,
        // user_id: this.userId,
        // email: this.email,
        // password: this.password
      }
    }

  },

  methods: {
    //全て入力されているか
    submit () {
      if (this.$refs.form.validate()) {
        // this.loading = true
        const url = "/api/v1/users"
          this.$axios.post(url, this.params)
          .then((res) => {
            this.text = res.data.text
          })
          this.snackbar = true
      
          // .catch((err) => {
            
          // })
      }

    },

    reset () {
      this.$refs.form.reset()
    },
  },
}