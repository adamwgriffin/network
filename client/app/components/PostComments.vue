<script setup lang="ts">
defineProps<{
  comments: PostCommentEdge[];
}>();
</script>

<template>
  <ul class="space-y-4">
    <li v-for="edge in comments" :key="edge?.node?.id">
      <NuxtLink
        v-if="edge?.node?.user"
        :to="`/users/${edge.node.user.slug}`"
        class="flex items-center gap-2"
      >
        <UAvatar :alt="edge.node.user.nameWithCredentials" />
        <div class="text-secondary text-sm font-semibold">
          {{ edge.node.user.nameWithCredentials }}
        </div>
      </NuxtLink>
      <p v-if="edge?.node?.body" class="py-2">
        {{ edge.node.body }}
      </p>
    </li>
  </ul>
</template>
