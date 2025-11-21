<template>
  <form @submit.prevent="submit" class="flex flex-col gap-6 w-full">
    <div class="flex flex-col gap-2">
      <label for="login">Логин</label>
      <AuthInput v-model="loginValue" id="login" type="text" ph="UsernameExmaple" />
      <label for="password">Пароль</label>
      <AuthInput v-model="passwordValue" id="password" type="password" ph="Пароль" />
      <RouterLink to=" register" class="text-sm">Забыли пароль?</RouterLink>
    </div>

    <button type="submit" class="bg-[#2698FF] rounded-lg text-white p-2">Войти</button>
  </form>

</template>

<script setup lang="ts">
import { ref } from 'vue';
import { useRouter } from 'vue-router';
import AuthInput from './AuthInput.vue';

const router = useRouter()

const loginValue = ref()
const passwordValue = ref()

function submit() {
  console.log('Логин:', loginValue.value)
  console.log('passwd:', passwordValue.value)
  router.push('/profile')
}

</script>

<style scoped></style>
