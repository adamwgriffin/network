<script lang="ts" setup>
const route = useRoute();
const { data } = await useAsyncQuery<GetPostQuery>(GetPostDocument, {
  id: getRouteParam(route.params.id)
} satisfies GetPostQueryVariables);
</script>

<template>
  <div v-if="data?.post">
    <div class="pb-6">
      {{ getFullNameAndCredentials(data.post.user) }}
    </div>
    <pre class="whitespace-pre-line font-sans">
      {{ data.post.body }}
    </pre>
  </div>
  <div v-else>
    <p>Nothing to see here</p>
  </div>
</template>
