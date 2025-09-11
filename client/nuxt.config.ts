// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: "2025-07-15",
  devtools: { enabled: true },
  modules: [
    "@nuxt/eslint",
    "@nuxt/image",
    "@nuxt/test-utils",
    "@nuxt/ui",
    "@nuxtjs/apollo"
  ],
  css: ["~/assets/css/main.css"],
  apollo: {
    clients: {
      default: {
        // Use a relative url in the browser. In prod, the Nuxt build may be
        // served up by Rails, so a relative URI could work. This would also
        // work when using an API gateway to serve up Nuxt and route API
        // requests to the server. In dev it just gets proxied via the devProxy
        // config in here.
        browserHttpEndpoint: "/graphql",
        // When Nuxt makes the request on the server using SSR it needs the
        // fully qualified domain to work correctly.
        httpEndpoint: `${process.env.NUXT_API_BASE}/graphql`
      }
    }
  },
  nitro: {
    // We need the dev proxy because in development Nuxt runs on a different
    // port than Rails, which causes CORS issues when the browser client makes
    // API requests to the server.
    devProxy: {
      "/graphql": {
        target: `${process.env.NUXT_API_BASE}/graphql`,
        changeOrigin: true
      }
    }
  }
});
