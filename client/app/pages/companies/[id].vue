<script lang="ts" setup>
import { useRoute } from "vue-router";

const route = useRoute();
const { data, error } = await useAsyncQuery<GetCompanyQuery>(
  GetCompanyDocument,
  {
    id: route.params.id
  }
);
const company = data.value?.company;
const edges =
  data.value?.company?.users.edges?.filter(
    (e): e is UserEdge & { node: User } => !!e && !!e.node
  ) ?? [];
</script>

<template>
  <div>
    <div>
      <div v-if="company">
        <h1 class="text-2xl font-bold pb-2">
          {{ company.name }}
        </h1>
        <address>{{ company.headquarters }}</address>
        <p class="py-6 max-w-2xl">{{ company.description }}</p>
        <h2 class="text-1xl font-bold pb-6">Doctors</h2>
        <ul class="space-y-4">
          <li v-for="{ node } in edges" :key="node.id">
            <NuxtLink :to="`/users/${node.id}`">
              {{ getFullNameAndCredentials(node) }}
            </NuxtLink>
          </li>
        </ul>
      </div>
      <p v-else-if="error">{{ error }}</p>
      <p v-else>No company data</p>
    </div>
  </div>
</template>
