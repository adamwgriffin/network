<script setup lang="ts">
import type { DropdownMenuItem } from "@nuxt/ui";

// TODO: the View Profile href should be dynamic based on logged in user
const items = ref<DropdownMenuItem[]>([
  {
    label: "View Profile",
    icon: "i-lucide-user",
    href: "/users/gregory-house"
  },
  {
    label: "Settings",
    icon: "i-lucide-cog",
    href: "/settings"
  }
]);
</script>

<template>
  <UDropdownMenu :items="items">
    <div class="flex flex-col items-center cursor-pointer">
      <UAvatar alt="Gregory House" size="sm" class="cursor-pointer" />
      <div>Me</div>
    </div>
  </UDropdownMenu>
</template>
