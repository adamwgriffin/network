<script lang="ts" setup>
import type { DropdownMenuItem } from "@nuxt/ui";

const props = defineProps<{
  id: string;
  body: string;
  author: string;
  authorSlug: string;
}>();

const reqUrl = useRequestURL();
const postUri = `${reqUrl.origin}/posts/${props.id}`;

const items = ref<DropdownMenuItem[]>([
  {
    label: "Copy link to post",
    icon: "lucide:link",
    async onSelect() {
      await navigator.clipboard.writeText(postUri);
    }
  },
  {
    label: "Open in new window",
    icon: "lucide:app-window-mac",
    href: postUri,
    target: "_blank"
  }
]);
</script>

<template>
  <div class="flex flex-col gap-y-4 rounded-lg p-4 border border-blue-300">
    <div
      class="flex items-center justify-between pb-4 border-b border-blue-300"
    >
      <div class="text-sm">Suggested</div>
      <UDropdownMenu
        :items="items"
        :content="{
          align: 'end',
          side: 'bottom'
        }"
      >
        <UButton
          icon="lucide:ellipsis"
          color="neutral"
          variant="ghost"
          class="cursor-pointer rounded-full"
        />
      </UDropdownMenu>
    </div>
    <div>
      <h3 class="font-semibold">
        <NuxtLink :to="`/users/${authorSlug}`" class="text-secondary text-sm">
          {{ author }}
        </NuxtLink>
      </h3>
    </div>
    <p>
      {{ body }}
    </p>
    <div class="flex items-center gap-6 pt-4 border-t border-blue-300">
      <FeedPostButton icon-name="lucide:thumbs-up">Like</FeedPostButton>
      <FeedPostButton icon-name="lucide:message-square-text">
        Comment
      </FeedPostButton>
      <FeedPostButton icon-name="lucide:repeat-2">Repost</FeedPostButton>
      <FeedPostButton icon-name="lucide:send">Send</FeedPostButton>
    </div>
  </div>
</template>
