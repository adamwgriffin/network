<script setup lang="ts">
defineProps<{ iconName: string; to: string }>();
</script>

<template>
  <NuxtLink :to="to" class="flex flex-col content-center items-center">
    <UIcon :name="iconName" class="size-5" />
    <slot />
  </NuxtLink>
</template>
