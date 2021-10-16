export default {
  server: {
  port: 8080
  },

  // Disable server-side rendering: https://go.nuxtjs.dev/ssr-mode
  ssr: false,

  // Global page headers: https://go.nuxtjs.dev/config-head
  head: {
    title: 'front',
    htmlAttrs: {
      lang: 'ja'
    },
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: '' },
      { name: 'format-detection', content: 'telephone=no' }
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }
    ]
  },

  // Global CSS: https://go.nuxtjs.dev/config-css
  css: [
    '@/assets/main.css',
  ],

  // Plugins to run before rendering page: https://go.nuxtjs.dev/config-plugins

  // Auto import components: https://go.nuxtjs.dev/config-components
  components: true,

  // Modules for dev and build (recommended): https://go.nuxtjs.dev/config-modules
  buildModules: [
    '@nuxtjs/vuetify'
  ],

  // Modules: https://go.nuxtjs.dev/config-modules
  modules: [
    // https://go.nuxtjs.dev/axios
    '@nuxtjs/axios',
    '@nuxtjs/auth-next',
    
  ],

  // Axios module configuration: https://go.nuxtjs.dev/config-axios
  axios: {
    proxy: true,
    prefix: '/api'
  },

 proxy: {
  '/api': {
    target: 'http://localhost:3000',
      pathRewrite: {
        '^/api' : ''
      },
    }
  },

  // Build Configuration: https://go.nuxtjs.dev/config-build
  build: {
  },

  auth: {
    plugins: [
      {src: '~/plugins/axios.js', ssr: false }
    ],
    redirect: {
        login: '/',
        logout: '/',
        callback: false,
        home: '/user/login',
    },

    strategies: {
      local: {
        tokenType: 'bearer',
        endpoints: {
          login: { url: '/v1/auth/sign_in', method: 'post', propertyName: 'token' },
          logout: { url: '/v1/auth/sign_out', method: 'delete' },
          user: { url: '/v1/auth/user', method: 'get' }
        },
      }
    }

  }

}
