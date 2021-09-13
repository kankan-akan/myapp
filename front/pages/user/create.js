export default {

  data: () => ({
    /* open dialog */
    dialog: false,
    /* register validate */
    valid: true,
    name: '',
    nameRules: [
      v => !!v || '名前が空欄です',
      v => (v && v.length <= 15) || '10文字以下で入力してください',
    ],
    userName: '＠',
    userNameRules: [
      v => !!v || 'ユーザー名が空欄です',
      v => (v && v.length <= 15) || '10文字以下で入力してください',
    ],
    email: '',
    emailRules: [
      v => !!v || 'メールアドレスが空欄です',
      v => /.+@.+\..+/.test(v) || 'メールアドレスが正しくありません',
    ],
      
    checkbox: false,
  }),

  methods: {
    submit () {
      this.$refs.observer.validate()
    },
    reset () {
      this.$refs.form.reset()
    },
  },
}