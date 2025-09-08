<script setup lang="ts">
import type { DropdownMenuItem } from "@nuxt/ui";

const items = ref<DropdownMenuItem[]>([
  {
    label: "View Profile",
    icon: "i-lucide-user",
    href: "/users/6"
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
