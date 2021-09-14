export default {

  data: () => ({
    /* open dialog */
    dialog: false,
    /* register validate */
    valid: true,
    name: '',
    nameRules: [
      v => !!v || '入力してください',
      v => (v && v.length <= 15) || '15文字以下で入力してください',
    ],
    userName: '',
    userNameRules: [
      v => !!v || '入力してください',
      v => (v && v.length <= 15) || '15文字以下で入力してください',
    ],
    email: '',
    emailRules: [
      v => !!v || '入力してください',
      v => /.+@.+\..+/.test(v) || '入力が完了していません',
    ],

    passWard: '',
    passWardRules: [
      v => !!v || '入力してください',
      v => /^(?=.*[a-z])(?=.*[.?/-_])[a-zA-Z0-9\d.?/-_]{8,30}$/.test(v) || '条件を満たしていません',
    ],
    
    // checkbox: false,
    success: false,
  }),

  methods: {
    //全て入力されているか
    submit () {
      if (this.$refs.form.validate()) {
        this.success = true;
      } else { 
        this.success = false;
      }
    },

    reset () {
      this.$refs.form.reset()
    },
  },
}