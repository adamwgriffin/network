<script lang="ts" setup>
const queryVariables: GetPostsQueryVariables = { first: 4 };
const { result, fetchMore } = useGetPostsQuery(queryVariables);

function loadMore() {
  fetchMore({
    variables: {
      ...queryVariables,
      after: result.value?.posts.pageInfo.endCursor
    } satisfies GetPostsQueryVariables,
    updateQuery: (previousResult, { fetchMoreResult }) => {
      const newEdges = fetchMoreResult.posts.edges ?? [];
      const pageInfo = fetchMoreResult.posts.pageInfo;

      if (newEdges.length) {
        const newResult: GetPostsQuery = {
          ...previousResult,
          ...{
            posts: {
              // Concat edges
              edges: [...(previousResult.posts.edges ?? []), ...newEdges],
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

const sentinel = ref<HTMLElement | null>(null);

useIntersectionObserver(
  sentinel,
  ([entry]) => {
    if (entry?.isIntersecting && result.value?.posts.pageInfo.hasNextPage) {
      loadMore();
    }
  },
  {
    // The element to test for intersection. Using null means use viewport.
    root: null,
    // Trigger when sentinel is halfway to becoming visible
    threshold: 0.5
  }
);
</script>

<template>
  <div v-if="result?.posts">
    <ul class="space-y-4 w-140">
      <li v-for="edge in result.posts.edges" :key="edge?.node?.id">
        <FeedPost
          v-if="edge?.node?.user && edge?.node?.body"
          :id="edge.node.id"
          :author="getFullNameAndCredentials(edge.node.user)"
          :body="edge.node.body"
          :author-slug="edge.node.user.slug"
        />
      </li>
      <li ref="sentinel" />
    </ul>
  </div>
</template>
