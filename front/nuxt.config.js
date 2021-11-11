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
  plugins: [
    { src: '~/plugins/localStrage.js', ssr: false },
    { src: '~/plugins/axios.js', ssr: false },
  ],

  // Auto import components: https://go.nuxtjs.dev/config-components
  components: true,

  // Modules for dev and build (recommended): https://go.nuxtjs.dev/config-modules
  buildModules: [
    '@nuxtjs/vuetify'
  ],

  // Modules: https://go.nuxtjs.dev/config-modules
  modules: [
    // https://go.nuxtjs.dev/axios
    'nuxt-client-init-module',
    '@nuxtjs/axios',
    '@nuxtjs/auth-next'
    
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
    redirect: {
        login: '/',
        logout: '/',
        callback: false,
        home: '/loggedIn',
    },

    strategies: {
      local: {
      token: {
        type: 'Bearer',
        property: 'token'
      },
      user: {
        property: false
      },
        endpoints: {
          login: { url: '/v1/auth/sign_in', method: 'post', propertyName: 'token' },
          logout: { url: '/v1/auth/sign_out', method: 'delete' },
          user: { url: '/v1/auth/me', method: 'get', propertyName: false },
        },
      }
    }

  }

}
