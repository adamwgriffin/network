<script setup lang="ts">
defineProps<{ iconName: string }>();
</script>

<template>
  <button class="flex items-center gap-1 cursor-pointer">
    <UIcon :name="iconName" class="size-5" /> <slot />
  </button>
</template>
