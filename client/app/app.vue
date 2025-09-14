<script setup lang="ts">
import type { ToasterProps } from "@nuxt/ui";

const toaster: ToasterProps = { position: "top-right", duration: 1600 };
</script>

<template>
  <UApp :toaster="toaster">
    <NuxtRouteAnnouncer />
    <div class="min-h-screen grid grid-rows-[auto_1fr_auto]">
      <AppHeader />
      <main class="max-w-4xl mx-auto pt-18">
        <NuxtPage />
      </main>
      <AppFooter />
    </div>
  </UApp>
</template>
