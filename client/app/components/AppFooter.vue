<script setup>
const currentYear = new Date().getFullYear();
</script>

<template>
  <footer class="p-6">
    <small>
      &copy; <time dateTime="YYYY">{{ currentYear }}</time> Griffin Enterprises,
      LLC
    </small>
  </footer>
</template>
