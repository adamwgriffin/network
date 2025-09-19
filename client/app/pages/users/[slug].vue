<script lang="ts" setup>
const route = useRoute();
const { data } = await useAsyncQuery<GetUserQuery>(GetUserDocument, {
  slug: getRouteParam(route.params.slug)
} satisfies GetUserQueryVariables);

const user = computed(() => data.value?.user);
const connectionTotal = computed(
  () => `${data.value?.user?.connectionTotal} connections`
);
const postEdges = computed(
  () =>
    data.value?.user?.posts.edges?.filter(
      (e): e is PostEdge & { node: Post } => !!e && !!e.node
    ) ?? []
);
</script>

<template>
  <div v-if="user" class="flex flex-col gap-4 max-w-2xl">
    <UAvatar :alt="user.nameWithCredentials" class="size-32 text-6xl" />
    <h1 class="text-2xl font-bold">
      {{ user.nameWithCredentials }}
    </h1>
    <p>
      <NuxtLink :to="`/companies/${user.company.slug}`" class="text-secondary">
        {{ user.company.name }}
      </NuxtLink>
    </p>
    <NuxtLink
      v-if="user.slug === 'gregory-house'"
      to="/mynetwork/connections"
      class="text-secondary"
    >
      {{ connectionTotal }}
    </NuxtLink>
    <div v-else>{{ connectionTotal }}</div>
    <div v-if="user.about">
      <h2 class="text-1xl font-bold pb-2">About</h2>
      <p>{{ user.about }}</p>
    </div>
    <div v-if="postEdges">
      <h2 class="text-1xl font-bold pb-2">Posts</h2>
      <ul class="space-y-4">
        <li v-for="{ node } in postEdges" :key="node.id">
          <NuxtLink
            :to="`/posts/${node.id}`"
            class="line-clamp-1 text-secondary"
          >
            {{ node.body }}
          </NuxtLink>
        </li>
      </ul>
    </div>
  </div>
</template>
