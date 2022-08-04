export default function({ $axios }) {
  $axios.onRequest(config => {
    config.headers.client = window.sessionStorage.getItem("client")
    config.headers["access-token"] = window.sessionStorage.getItem("access-token")
    config.headers.uid = window.localStorage.getItem("uid")
    config.headers["token-type"] = window.sessionStorage.getItem("token-type")
  })

  $axios.onResponse(response => {
    if (response.headers.client) {
      sessionStorage.setItem("access-token", response.headers["access-token"])
      sessionStorage.setItem("client", response.headers.client)
      sessionStorage.setItem("uid", response.headers.uid)
      sessionStorage.setItem("token-type", response.headers["token-type"])
    }
  })
}