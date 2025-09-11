<script lang="ts" setup>
const queryVariables: GetUsersQueryVariables = { first: 5 };
const { result, fetchMore, error, loading } = useGetUsersQuery(queryVariables);

function loadMore() {
  fetchMore({
    variables: {
      ...queryVariables,
      after: result.value?.users.pageInfo.endCursor
    } satisfies GetUsersQueryVariables,
    updateQuery: (previousResult, { fetchMoreResult }) => {
      const newEdges = fetchMoreResult.users.edges ?? [];
      const pageInfo = fetchMoreResult.users.pageInfo;

      if (newEdges.length) {
        const newResult: GetUsersQuery = {
          ...previousResult,
          ...{
            users: {
              // Concat edges
              edges: [...(previousResult.users.edges ?? []), ...newEdges],
              // Override with new pageInfo
              pageInfo
            }
          }
        };

        return newResult;
      }

      return previousResult;
    }
  });
}
</script>

<template>
  <div>
    <h2 class="text-2xl font-bold pb-6">Connect with some cool doctors 😎</h2>
    <ul class="space-y-4">
      <li v-for="edge in result?.users.edges ?? []" :key="edge?.node?.slug">
        <NuxtLink :to="`/users/${edge?.node?.slug}`">
          {{ edge?.node && getFullNameAndCredentials(edge.node) }}
        </NuxtLink>
      </li>
    </ul>
    <UContainer class="py-6 text-center">
      <UTooltip text="Load more">
        <button
          v-if="result?.users?.pageInfo?.hasNextPage"
          :disabled="loading"
          class="cursor-pointer"
          @click="loadMore"
        >
          <UIcon name="lucide:circle-plus" class="size-6" />
        </button>
      </UTooltip>
    </UContainer>
    <p v-if="error">
      {{ error }}
    </p>
  </div>
</template>
