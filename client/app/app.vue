<template>
  <div>
    <NuxtRouteAnnouncer />
    <hi>User:</hi>
    <p>{{ (data as any)?.user.firstName }}</p>
  </div>
</template>

<script lang="ts" setup>
const query = gql`
  query User {
    user(id: 6) {
      id
      firstName
      lastName
      credentials
      company {
        id
        name
      }
    }
  }
`;

const { data } = await useAsyncQuery(query);
</script>
