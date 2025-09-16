<script lang="ts" setup>
const body = ref("");
const modalOpen = ref(false);

const toast = useToast();
const { mutate, loading, error, onDone } = useCreatePostMutation();

function submit() {
  mutate({
    userId: "6",
    body: body.value
  });
}

onDone(() => {
  modalOpen.value = false;
  body.value = "";
  toast.add({
    title: "Post created 🎉",
    color: "success",
    progress: false
  });
});

watch(error, (err) => {
  if (err) {
    toast.add({
      description: "Error creating post",
      color: "error",
      progress: false
    });
  }
});
</script>

<template>
  <div class="flex gap-2 rounded-lg p-4 mb-4 border border-blue-300">
    <UAvatar alt="Gregory House" size="xl" />
    <UModal
      v-model:open="modalOpen"
      title="Create Post"
      description="Create a network post"
    >
      <UButton
        block
        size="xl"
        color="info"
        variant="subtle"
        class="font-bold rounded-full"
        @click="modalOpen = true"
      >
        Start a post
      </UButton>

      <template #body>
        <UTextarea
          v-model="body"
          autoresize
          variant="none"
          placeholder="What's on your mind?"
          block
          class="w-full"
        />
      </template>

      <template #footer>
        <div class="flex justify-end w-full">
          <UButton
            size="xl"
            color="info"
            :loading="loading"
            :disabled="!body"
            @click="submit"
          >
            Post
          </UButton>
        </div>
      </template>
    </UModal>
  </div>
</template>
