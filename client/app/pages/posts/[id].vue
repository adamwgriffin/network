<script lang="ts" setup>
const route = useRoute();

const postId = getRouteParam(route.params.id);

const toast = useToast();
const { result, refetch } = await useGetPostQuery({
  id: postId
} satisfies GetPostQueryVariables);
const { mutate, loading, error, onDone } = useUpdatePostMutation();

const body = ref(result.value?.post.body ?? "");
const modalOpen = ref(false);

function submit() {
  mutate({
    postId,
    body: body.value
  });
}

onDone(() => {
  modalOpen.value = false;
  refetch();
  toast.add({
    title: "Post updated 👍",
    color: "success",
    progress: false
  });
});

watch(error, (err) => {
  if (err) {
    toast.add({
      description: "Error updating post",
      color: "error",
      progress: false
    });
  }
});

const post = computed(() => result.value?.post);

const commentEdges = computed(
  () =>
    result.value?.post.postComments?.edges?.filter(
      (e): e is PostCommentEdge & { node: PostComment } => !!e && !!e.node
    ) ?? []
);
</script>

<template>
  <div v-if="post" class="w-140 mx-auto">
    <FeedPost
      :id="postId"
      :body="post.body"
      :author="post.user.nameWithCredentials"
      :author-slug="post.user.slug"
      @edit="modalOpen = true"
    >
      <template v-if="commentEdges.length" #comments>
        <PostComments :comments="commentEdges" />
      </template>
    </FeedPost>
    <UModal
      v-model:open="modalOpen"
      title="Update Post"
      description="Update your network post"
    >
      <template #body>
        <UTextarea
          v-model="body"
          autoresize
          variant="none"
          block
          class="w-full"
        />
      </template>

      <template #footer>
        <div class="flex justify-end w-full">
          <UButton size="xl" color="info" :loading="loading" @click="submit">
            Save
          </UButton>
        </div>
      </template>
    </UModal>
  </div>
  <div v-else>
    <p>Nothing to see here</p>
  </div>
</template>
