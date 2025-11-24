<template>
  <input :id="id" :type="type" :placeholder="ph" :value="modelValue"
    @input="(e: Event) => $emit('update:modelValue', (e.target as HTMLInputElement).value)"
    class="border border-[#D9D9D9] rounded-lg p-2 outline-[#207BCE] placeholder:text-[#00000040]" />
</template>

<script setup lang="ts">
defineProps<{ id: string, type: string, ph: string, modelValue?: string }>();
defineEmits<{
  (e: 'update:modelValue', value: string): void
}>()
</script>

<style scoped></style>
