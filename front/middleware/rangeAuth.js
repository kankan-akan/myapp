export default function ({ store, redirect, route }) {
  // ユーザーが認証されていない場合
  // if (route.path == '/rangeAdmin/info') {
    if (!store.state.rangeAuth.loginRange && route.path !== '/') {
      console.log('middleware-rangeAuth')
      return redirect('/rangeLogin')
    }
  // }
}