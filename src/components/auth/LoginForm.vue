<template>
  <div class="flex flex-col gap-6 w-full">
    <div class="flex flex-col gap-2">
      <label for="login">Логин</label>
      <AuthInput id="login" type="text" ph="UsernameExmaple" />
      <label for="password">Пароль</label>
      <AuthInput id="password" type="password" ph="Пароль" />
      <RouterLink to=" register" class="text-sm">Забыли пароль?</RouterLink>
    </div>

    <button class="bg-[#2698FF] rounded-lg text-white p-2">Войти</button>
  </div>

</template>

<script setup lang="ts">
import AuthInput from './AuthInput.vue';


</script>

<style scoped></style>
