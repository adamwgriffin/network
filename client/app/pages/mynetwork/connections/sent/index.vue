<script setup lang="ts">
const toast = useToast();

const { result, refetch } = useGetSentConnectionRequestsQuery({
  slug: "gregory-house"
} satisfies GetSentConnectionRequestsQueryVariables);

const { mutate: removeConnection, loading: withdrawConnectionLoading } =
  useRemoveConnectionMutation();

async function withdrawRequest(connectionId: string) {
  try {
    await removeConnection({ connectionId });
    toast.add({
      title: "Request withdrawn",
      color: "success",
      progress: false
    });
    refetch();
  } catch {
    toast.add({
      description: "Error withdrawing request",
      color: "error",
      progress: false
    });
  }
}

const requests = computed(() => result.value?.user?.pendingSentRequests ?? []);
</script>

<template>
  <div>
    <h1 class="text-2xl font-bold pb-6">Sent Connection Requests</h1>
    <ul class="space-y-4">
      <li v-for="request in requests" :key="request.id" class="flex gap-12">
        <NuxtLink :to="`/users/${request.recipient.slug}`">
          <UUser
            :name="request.recipient.nameWithCredentials"
            :avatar="{ alt: request.recipient.nameWithCredentials }"
            size="xl"
          />
        </NuxtLink>
        <UButton
          color="secondary"
          variant="outline"
          class="cursor-pointer"
          :disabled="withdrawConnectionLoading"
          @click="withdrawRequest(request.id)"
        >
          Withdraw
        </UButton>
      </li>
    </ul>
  </div>
</template>
