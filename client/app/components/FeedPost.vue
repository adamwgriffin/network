<script lang="ts" setup>
import type { DropdownMenuItem } from "@nuxt/ui";

const props = defineProps<{
  id: string;
  body: string;
  author: string;
  authorSlug: string;
}>();

const toast = useToast();
const reqUrl = useRequestURL();
const postUri = `${reqUrl.origin}/posts/${props.id}`;

const clamped = ref(props.body.length > 60);
const emit = defineEmits(["edit"]);
const items = ref<DropdownMenuItem[]>([
  {
    label: "Copy link to post",
    icon: "lucide:link",
    async onSelect() {
      await navigator.clipboard.writeText(postUri);
      toast.add({
        title: "Link copied 👍",
        color: "success",
        progress: false
      });
    }
  },
  {
    label: "Open in new window",
    icon: "lucide:app-window-mac",
    href: postUri,
    target: "_blank"
  },
  {
    label: "Edit post",
    icon: "lucide:pencil",
    onSelect() {
      emit("edit", props.id);
    }
  }
]);
</script>

<template>
  <article class="flex flex-col gap-y-4 rounded-lg p-4 border border-blue-300">
    <header class="flex items-center justify-end pb-4 border-b border-blue-300">
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
    </header>
    <NuxtLink :to="`/users/${authorSlug}`" class="flex items-center gap-2">
      <UAvatar :alt="author" />
      <h3 class="text-secondary text-sm font-semibold">
        {{ author }}
      </h3>
    </NuxtLink>
    <div>
      <p :class="{ 'line-clamp-3': clamped }">
        {{ body }}
      </p>
      <button
        v-if="clamped"
        class="cursor-pointer px-0 text-sm hover:underline text-blue-400"
        @click="clamped = false"
      >
        more
      </button>
    </div>
    <footer class="flex items-center gap-6 pt-4 border-t border-blue-300">
      <FeedPostButton icon-name="lucide:thumbs-up">Like</FeedPostButton>
      <FeedPostButton icon-name="lucide:message-square-text">
        Comment
      </FeedPostButton>
      <FeedPostButton icon-name="lucide:repeat-2">Repost</FeedPostButton>
      <FeedPostButton icon-name="lucide:send">Send</FeedPostButton>
    </footer>
    <slot name="comments" />
  </article>
</template>
