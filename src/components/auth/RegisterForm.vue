<template>
  <div class="flex flex-col gap-6 w-full">
    <div class="flex flex-col gap-2">
      <label for="fullname">ФИО</label>
      <AuthInput id="fullname" type="text" ph="Иванов Иван Иванович" />
      <label for="email">Email</label>
      <AuthInput id="email" type="email" ph="example@mail.com" />
      <label for="password">Придумайте пароль</label>
      <AuthInput id="password" type="password" ph="Пароль" />
      <label for="cpassword">Повторите пароль</label>
      <AuthInput id="cpassword" type="password" ph="Пароль" />
    </div>

    <button class="bg-[#2698FF] rounded-lg text-white p-2">Зарегистрироваться</button>
  </div>
</template>

<script setup lang="ts">
import AuthInput from './AuthInput.vue';


</script>

<style scoped></style>
