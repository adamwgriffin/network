<script setup lang="ts">
defineProps<{ name: string; slug: string }>();
const emit = defineEmits<{
  (e: "connect-clicked"): void;
}>();
</script>

<template>
  <div
    class="h-full flex flex-col items-center gap-y-4 rounded-lg border border-blue-300"
  >
    <NuxtLink :to="`/users/${slug}`" class="grow text-center px-4 pt-4">
      <UAvatar :alt="name" class="size-24 text-5xl" />
      <div class="font-semibold">{{ name }}</div>
    </NuxtLink>
    <div class="px-4 pb-4">
      <UButton
        color="secondary"
        variant="outline"
        icon="lucide:user-plus"
        class="cursor-pointer"
        @click="emit('connect-clicked')"
      >
        Connect
      </UButton>
    </div>
  </div>
</template>
