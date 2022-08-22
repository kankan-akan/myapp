export default function ({ store, redirect, route }) {
  // ユーザー認証がされていない場合
    if (!store.state.rangeAuth.isLoggedIn && route.path !== '/') {
      console.log('middleware-rangeAuth')
      return redirect('/rangeLogin')
    }
}