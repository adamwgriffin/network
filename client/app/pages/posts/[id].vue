<script lang="ts" setup>
const route = useRoute();

const postId = getRouteParam(route.params.id);

const { data } = await useAsyncQuery<GetPostQuery>(GetPostDocument, {
  id: postId
} satisfies GetPostQueryVariables);

const post = computed(() => data.value?.post);

const commentEdges = computed(
  () =>
    data.value?.post.postComments?.edges?.filter(
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
    >
      <template v-if="commentEdges.length" #comments>
        <PostComments :comments="commentEdges" />
      </template>
    </FeedPost>
  </div>
  <div v-else>
    <p>Nothing to see here</p>
  </div>
</template>
