<script lang="ts" setup>
const queryVariables: GetUsersToConnectWithQueryVariables = { userId: 6 };
const { result, fetchMore, refetch, loading } =
  useGetUsersToConnectWithQuery(queryVariables);

const toast = useToast();
const { mutate, loading: sendConnectionLoading } =
  useSendConnectionRequestMutation();

async function sendConnectionRequest(recipientId: string) {
  try {
    await mutate({
      requesterId: "6",
      recipientId
    });
    toast.add({
      title: "Request sent",
      color: "success",
      progress: false
    });
    refetch();
  } catch {
    toast.add({
      description: "Error sending request",
      color: "error",
      progress: false
    });
  }
}

function loadMore() {
  fetchMore({
    variables: {
      ...queryVariables,
      after: result.value?.usersToConnectWith.pageInfo.endCursor
    } satisfies GetUsersToConnectWithQueryVariables,
    updateQuery: (previousResult, { fetchMoreResult }) => {
      const newEdges = fetchMoreResult.usersToConnectWith.edges ?? [];
      const pageInfo = fetchMoreResult.usersToConnectWith.pageInfo;

      if (newEdges.length) {
        const newResult: GetUsersToConnectWithQuery = {
          ...previousResult,
          ...{
            users: {
              // Concat edges
              edges: [
                ...(previousResult.usersToConnectWith.edges ?? []),
                ...newEdges
              ],
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
    <ul class="grid grid-cols-[repeat(auto-fill,minmax(10rem,_1fr))] gap-4">
      <li
        v-for="edge in result?.usersToConnectWith.edges ?? []"
        :key="edge?.node?.slug"
      >
        <UserCard
          :name="edge?.node?.nameWithCredentials ?? ''"
          :slug="edge?.node?.slug ?? ''"
          :connect-disabled="sendConnectionLoading"
          @connect-clicked="sendConnectionRequest(edge?.node?.id ?? '')"
        />
      </li>
    </ul>
    <UContainer class="flex justify-center py-6">
      <button
        v-if="result?.usersToConnectWith?.pageInfo?.hasNextPage"
        :disabled="loading"
        class="cursor-pointer flex items-center gap-2"
        @click="loadMore"
      >
        Give me more doctors!
        <UIcon name="lucide:circle-plus" class="size-6" />
      </button>
    </UContainer>
  </div>
</template>
