<script lang="ts" setup>
defineProps<{ body: string; author: string; authorSlug: string }>();
</script>

<template>
  <UCard>
    <template #header>
      <h3>
        <NuxtLink :to="`/users/${authorSlug}`">
          {{ author }}
        </NuxtLink>
      </h3>
    </template>
    <p>
      {{ body }}
    </p>
    <template #footer>
      <div class="flex items-center gap-6">
        <FeedPostButton icon-name="lucide:thumbs-up">Like</FeedPostButton>
        <FeedPostButton icon-name="lucide:message-square-text">
          Comment
        </FeedPostButton>
        <FeedPostButton icon-name="lucide:repeat-2">Repost</FeedPostButton>
        <FeedPostButton icon-name="lucide:send">Send</FeedPostButton>
      </div>
    </template>
  </UCard>
</template>
