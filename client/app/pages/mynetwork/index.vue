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
          usersToConnectWith: {
            ...previousResult.usersToConnectWith,
            // Concatenate edges
            edges: [
              ...(previousResult.usersToConnectWith.edges ?? []),
              ...newEdges
            ],
            // Override with new pageInfo
            pageInfo
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
  <div class="md:flex md:gap-12">
    <nav class="pb-8">
      <h1 class="text-2xl font-bold pb-6">Manage my network</h1>
      <ul class="space-y-4">
        <li>
          <NuxtLink to="/mynetwork/connections" class="flex items-center gap-2">
            <UIcon name="lucide:users" class="size-5" />
            Connections
          </NuxtLink>
        </li>
        <li>
          <NuxtLink
            to="/mynetwork/connections/received"
            class="flex items-center gap-2"
          >
            <UIcon name="lucide:mail" class="size-5" />
            Received Connections
          </NuxtLink>
        </li>
        <li>
          <NuxtLink
            to="/mynetwork/connections/sent"
            class="flex items-center gap-2"
          >
            <UIcon name="lucide:send" class="size-5" />
            Sent Connections
          </NuxtLink>
        </li>
      </ul>
    </nav>
    <section class="md:min-w-md">
      <h2 class="text-2xl font-bold pb-6">People to connect with</h2>
      <ul class="grid md:grid-cols-2 gap-4">
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
          Load more
          <UIcon name="lucide:circle-plus" class="size-6" />
        </button>
      </UContainer>
    </section>
  </div>
</template>
