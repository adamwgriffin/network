<script lang="ts" setup>
const route = useRoute();
const { data, error } = await useAsyncQuery<GetUserQuery>(GetUserDocument, {
  slug: getRouteParam(route.params.slug)
} satisfies GetUserQueryVariables);

const user = computed(() => data.value?.user);
</script>

<template>
  <div>
    <div>
      <div v-if="user">
        <h1 class="text-2xl font-bold pb-6">
          {{ getFullNameAndCredentials(user) }}
        </h1>
        <p>
          <NuxtLink :to="`/companies/${user.company.slug}`">
            {{ user.company.name }}
          </NuxtLink>
        </p>
      </div>
      <p v-else-if="error">{{ error }}</p>
      <p v-else>No user data</p>
    </div>
  </div>
</template>
