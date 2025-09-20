<script setup lang="ts">
const props = defineProps<{
  count: number;
  useSlug: string;
  isLoggedInUser: boolean;
}>();

const connectionText = computed(() => getConnectionsText(props.count));
</script>

<template>
  <NuxtLink
    v-if="isLoggedInUser"
    to="/mynetwork/connections"
    class="lowercase text-secondary"
  >
    {{ connectionText }}
  </NuxtLink>
  <span v-else class="lowercase">{{ connectionText }}</span>
</template>
