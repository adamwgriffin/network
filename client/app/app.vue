<template>
  <UApp>
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
