<script setup lang="ts">
const toast = useToast();

const { result, refetch } = useGetReceivedConnectionRequestsQuery({
  slug: "gregory-house"
} satisfies GetReceivedConnectionRequestsQueryVariables);

const { mutate: acceptRequest } = useAcceptConnectionRequestMutation();

const { mutate: declineRequst } = useDeclineConnectionRequestMutation();

async function handleAccept(connectionId: string) {
  try {
    await acceptRequest({ connectionId });
    toast.add({
      title: "Request accepted!",
      color: "success",
      progress: false
    });
    refetch();
  } catch {
    toast.add({
      description: "An error occurred",
      color: "error",
      progress: false
    });
  }
}

async function handleDecline(connectionId: string) {
  try {
    await declineRequst({ connectionId });
    toast.add({
      title: "Request ignored",
      color: "success",
      progress: false
    });
    refetch();
  } catch {
    toast.add({
      description: "An error occurred",
      color: "error",
      progress: false
    });
  }
}

const requests = computed(
  () => result.value?.user?.pendingReceivedRequests ?? []
);
</script>

<template>
  <div>
    <h1 class="text-2xl font-bold pb-6">Received Connection Requests</h1>
    <ul class="space-y-4">
      <li v-for="request in requests" :key="request.id" class="flex gap-12">
        <NuxtLink :to="`/users/${request.requester.slug}`">
          <UUser
            :name="request.requester.nameWithCredentials"
            :avatar="{ alt: request.requester.nameWithCredentials }"
            size="xl"
          />
        </NuxtLink>
        <div class="flex gap-2">
          <UButton
            color="secondary"
            variant="outline"
            class="cursor-pointer"
            icon="lucide:thumbs-up"
            @click="handleAccept(request.id)"
          >
            Accept
          </UButton>
          <UButton
            color="secondary"
            variant="outline"
            class="cursor-pointer"
            icon="lucide:thumbs-down"
            @click="handleDecline(request.id)"
          >
            Nope
          </UButton>
        </div>
      </li>
    </ul>
  </div>
</template>
