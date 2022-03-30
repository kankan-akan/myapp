export default function ({ store, redirect, route }) {
  // ユーザーが認証されていない場合
  if (!store.state.rangeAuth && route.path !== '/rangeLogin') {
    return redirect('/rangeLogin')
  }
}