export default function ({ store, redirect }) {
  // ユーザーが認証されていない場合
  if (!store.state.rangeAuth.isLoggedIn) {
    return redirect('/rangeLogin')
    // console.log('middleware/rangeAuth')
  }
}