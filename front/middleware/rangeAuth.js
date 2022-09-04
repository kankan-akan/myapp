export default function ({ store, redirect, route }) {
  // ユーザー認証がされていない場合
    if (!store.state.rangeAuth.isLoggedIn && route.path !== '/') {
      return redirect('/rangeLogin')
    }
}