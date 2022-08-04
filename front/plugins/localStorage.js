import createPersistedState from 'vuex-persistedstate';

export default ({ store }) => {
  window.onNuxtReady(() => {
    createPersistedState({
      key: 'persisted-key',
      // paths: ["myData"],
      storage: window.sessionStorage
    })(store)
  });
}