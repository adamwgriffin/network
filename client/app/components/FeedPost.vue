<template>
  <UCard>
    <template #header>
      <h3>Suggested</h3>
    </template>
    <p>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus
      vestibulum egestas metus, vitae faucibus magna dictum elementum. Sed ut
      dolor blandit magna pellentesque ultricies sed sit amet felis. Nullam
      consectetur tincidunt massa, non luctus ligula rutrum sit amet. Sed
      commodo hendrerit lacus, nec luctus enim porta sit amet. Sed id erat
      tincidunt, sodales tortor et, pulvinar felis. Curabitur vel eros mauris.
      Vestibulum pulvinar faucibus dignissim. Ut nec luctus velit. Pellentesque
      ac sem tortor.
    </p>
    <template #footer>
      <div class="flex items-center gap-6">
        <FeedPostButton icon-name="lucide:thumbs-up">Link</FeedPostButton>
        <FeedPostButton icon-name="lucide:message-square-text">
          Comment
        </FeedPostButton>
        <FeedPostButton icon-name="lucide:repeat-2">Repost</FeedPostButton>
        <FeedPostButton icon-name="lucide:send">Send</FeedPostButton>
      </div>
    </template>
  </UCard>
</template>
