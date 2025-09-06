// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: "2025-07-15",
  devtools: { enabled: true },
  nitro: {
    devProxy: {
      "/api": {
        target: "http://localhost:4000",
        changeOrigin: true
      }
    }
  },
  modules: ["@nuxt/eslint", "@nuxt/image", "@nuxt/test-utils", "@nuxt/ui"]
});
