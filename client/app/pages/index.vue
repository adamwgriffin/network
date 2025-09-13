<script lang="ts" setup>
const queryVariables: GetPostsQueryVariables = { first: 4 };
const { result } = useGetPostsQuery(queryVariables);
</script>

<template>
  <div v-if="result?.posts">
    <ul class="space-y-4 w-140">
      <li v-for="edge in result.posts.edges" :key="edge?.node?.id">
        <FeedPost
          v-if="edge?.node?.user && edge?.node?.body"
          :id="edge?.node.id"
          :author="getFullNameAndCredentials(edge.node.user)"
          :body="edge.node.body"
          :author-slug="edge.node.user.slug"
        />
      </li>
    </ul>
  </div>
</template>
