<template>
  <input :id="id" :type="type" :placeholder="ph"
    class="border border-[#D9D9D9] rounded-lg p-2 outline-[#207BCE] placeholder:text-[#00000040]" />
</template>

<script setup lang="ts">
defineProps<{ id: string, type: string, ph: string }>();
</script>

<style scoped></style>
