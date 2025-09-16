<script lang="ts" setup>
const route = useRoute();

const { data } = await useAsyncQuery<GetPostQuery>(GetPostDocument, {
  id: getRouteParam(route.params.id)
} satisfies GetPostQueryVariables);

const post = computed(() => data.value?.post);
const commentEdges = computed(() => {
  const edges = data.value?.post.postComments?.edges ?? [];
  return edges.filter((e) => e?.node);
});
</script>

<template>
  <div v-if="post" class="flex flex-col gap-6 min-w-2xs max-w-2/3 mx-auto">
    <div>
      <NuxtLink :to="`/users/${post.user.slug}`" class="text-secondary text-sm">
        {{ post.user.nameWithCredentials }}
      </NuxtLink>
    </div>
    <pre class="whitespace-pre-line font-sans">
      {{ post.body }}
    </pre>
    <ul class="space-y-4 pl-6">
      <li v-for="edge in commentEdges" :key="edge?.node?.id">
        <div v-if="edge?.node?.user">
          <NuxtLink
            :to="`/users/${edge.node.user.slug}`"
            class="text-secondary text-sm"
          >
            {{ edge.node.user.nameWithCredentials }}
          </NuxtLink>
        </div>
        <p v-if="edge?.node?.body" class="py-2">
          {{ edge.node.body }}
        </p>
      </li>
    </ul>
  </div>
  <div v-else>
    <p>Nothing to see here</p>
  </div>
</template>
