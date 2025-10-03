<script setup lang="ts">
const { result } = useGetUserConnectionsQuery({
  slug: "gregory-house"
});

const connectionEdges = computed(
  () =>
    result.value?.user?.connections?.edges?.filter(
      (e): e is UserEdge & { node: User } => !!e && !!e.node
    ) ?? []
);
</script>

<template>
  <div v-if="connectionEdges">
    <h2 class="text-1xl font-bold pb-2">
      {{ getConnectionsText(result?.user?.connectionTotal ?? 0) }}
    </h2>
    <ul class="space-y-4">
      <li v-for="{ node } in connectionEdges" :key="node.id">
        <NuxtLink
          :to="`/users/${node.slug}`"
          class="flex items-center gap-2 text-secondary"
        >
          <UAvatar :alt="node.nameWithCredentials" />
          <div>
            {{ node.nameWithCredentials }}
          </div>
        </NuxtLink>
      </li>
    </ul>
  </div>
</template>
