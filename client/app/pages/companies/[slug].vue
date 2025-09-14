<script lang="ts" setup>
const route = useRoute();
const { result } = useGetCompanyQuery({
  slug: getRouteParam(route.params.slug)
});

const company = computed(() => result.value?.company);

// TODO: This is insanity! There's got to be a better way to add this typeguard
type CompanyUserEdge = NonNullable<
  NonNullable<NonNullable<GetCompanyQuery["company"]>["users"]>["edges"]
>[number];

type CompanyUserNode = NonNullable<NonNullable<CompanyUserEdge>["node"]>;
const edges = computed(
  () =>
    result.value?.company?.users.edges?.filter(
      (e): e is CompanyUserEdge & { node: CompanyUserNode } => !!e && !!e.node
    ) ?? []
);
</script>

<template>
  <div v-if="company" class="max-w-2/3 mx-auto">
    <h1 class="text-2xl font-bold pb-2">
      {{ company.name }}
    </h1>
    <address>{{ company.headquarters }}</address>
    <p class="py-6 max-w-2xl">{{ company.description }}</p>
    <h2 class="text-1xl font-bold pb-6">Doctors</h2>
    <ul class="space-y-4">
      <li v-for="{ node } in edges" :key="node.slug">
        <NuxtLink :to="`/users/${node.slug}`">
          {{ node.nameWithCredentials }}
        </NuxtLink>
      </li>
    </ul>
  </div>
</template>
