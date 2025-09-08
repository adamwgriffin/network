<script lang="ts" setup>
const queryVariables: GetUsersQueryVariables = { first: 5 };
const { data, error } = await useAsyncQuery<GetUsersQuery>(
  GetUsersDocument,
  queryVariables
);
// The filter function with "is" defines a type predicate in order to assert
// that nothing is null in the data. This way we don't have to constantly check
// it inside the template
const edges =
  data.value?.users.edges?.filter(
    (e): e is UserEdge & { node: User } => !!e && !!e.node
  ) ?? [];
</script>

<template>
  <main>
    <h1 class="text-2xl font-bold">Network</h1>
    <p>The ultimate doctors network</p>
    <ul>
      <li v-for="{ node } in edges" :key="node.id">
        <h2>{{ node.firstName }} {{ node.lastName }}</h2>
      </li>
    </ul>
    <p v-if="error">
      {{ error }}
    </p>
  </main>
</template>
