<script lang="ts" setup>
const route = useRoute();
const { data } = await useAsyncQuery<GetUserQuery>(GetUserDocument, {
  slug: getRouteParam(route.params.slug)
} satisfies GetUserQueryVariables);

const user = computed(() => data.value?.user);
</script>

<template>
  <div v-if="user" class="max-w-2xl">
    <h1 class="text-2xl font-bold pb-6">
      {{ getFullNameAndCredentials(user) }}
    </h1>
    <p>
      <NuxtLink :to="`/companies/${user.company.slug}`">
        {{ user.company.name }}
      </NuxtLink>
    </p>
    <div v-if="user.about" class="pt-4">
      <h2 class="text-1xl font-bold pb-2">About</h2>
      <p>{{ user.about }}</p>
    </div>
  </div>
</template>
