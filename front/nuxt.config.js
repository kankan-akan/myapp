
export default {
  // publicRuntimeConfig: {
  //   baseURL: process.env.baseURL || 'https://par-match.com'
  // },

  server: {
    port: 8080,
    // host: '0'
  },

  // Disable server-side rendering: https://go.nuxtjs.dev/ssr-mode
  ssr: false,

  // Global page headers: https://go.nuxtjs.dev/config-head
  head: {
    title: 'ParMatch',
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
    { src: '~/plugins/localStorage.js', ssr: false },
    { src: '~/plugins/axios.js', ssr: false }
  ],

  // Auto import components: https://go.nuxtjs.dev/config-components
  components: true,

  // Modules for dev and build (recommended): https://go.nuxtjs.dev/config-modules
  buildModules: [
    '@nuxtjs/vuetify',
    '@nuxtjs/google-fonts'
  ],

  googleFonts: {
    families: {
      'Kosugi Maru': [400],
      'Quicksand': [400]
    }
  },

  // Modules: https://go.nuxtjs.dev/config-modules
  modules: [
    // https://go.nuxtjs.dev/axios
    'nuxt-client-init-module',
    '@nuxtjs/axios',
    '@nuxtjs/auth'
  ],

  // Axios module configuration: https://go.nuxtjs.dev/config-axios
  axios: {
    proxy: true,
    prefix: '/api'
  },

  proxy: {
    '/api': {
      // target: 'http://localhost:3000',
      // target: 'http://api:3000',    //docker-compose
      // target: 'https://par-match-api.com',
      target: process.env.NODE_ENV === 'production'
            ? 'https://par-match-api.com'
            : 'http://localhost:3000',
        pathRewrite: {
          '^/api' : ''
        },
      }
    },

  // axios: {
  //   baseURL:
  //     process.env.NODE_ENV === 'production'
  //       ? 'https://par-match-api.com'
  //       : 'http://localhost:3000'
  // },

  // Build Configuration: https://go.nuxtjs.dev/config-build
  build: {
  },

  // router: {
  // },

  auth: {
    redirect: {
      login: '/',
      logout: '/',
      callback: false,
      home: '/',
    },

    strategies: {
      local: {
      token: {
        property: 'access_token',
        required: true,
        // type: 'Bearer'
      },
      user: {
        property: 'user',
      },
        endpoints: {
          login: { url: '/v1/auth/sign_in', method: 'post', propertyName: false },
          logout: { url: '/v1/auth/sign_out', method: 'delete' },
          // user: { url: '/v1/auth/user', method: 'get' },
          user : false,
        },
      }
    }

  }

}
