<template>
  <form @submit.prevent="onSubmit" class="flex flex-col gap-6 w-full">
    <div class="flex flex-col gap-2">
      <label for="login">Логин <span v-if="loginMeta.touched" class="text-orange-900 text-xs">{{ loginError
          }}</span></label>
      <AuthInput v-model="login" id="login" type="text" ph="UsernameExmaple" />
      <label for="password">Пароль <span v-if="passwordMeta.touched" class="text-orange-900 text-xs">{{ passwordError
      }}</span></label>
      <AuthInput v-model="password" id="password" type="password" ph="Пароль" />
      <RouterLink to="register" class="text-sm">Забыли пароль?</RouterLink>
    </div>

    <button type="submit" class="bg-[#2698FF] rounded-lg text-white p-2">Войти</button>
  </form>

</template>

<script setup lang="ts">
import { useRouter } from 'vue-router';
import { z } from 'zod';
import { toTypedSchema } from '@vee-validate/zod';
import AuthInput from './AuthInput.vue';
import { useField, useForm } from 'vee-validate';

const router = useRouter()

const schema = toTypedSchema(
  z.object({
    login: z.string().nonempty('Обязательное поле'),
    password: z.string().nonempty('Обязательное поле').min(6, 'Минимум 6 символов')
  })
)

const { handleSubmit } = useForm({
  initialValues: {
    login: "",
    password: "",
  },
  validationSchema: schema,
  validateOnMount: false
})

const { value: login, errorMessage: loginError, meta: loginMeta } = useField<string>('login')
const { value: password, errorMessage: passwordError, meta: passwordMeta } = useField<string>('password')

const onSubmit = handleSubmit((values) => {
  console.log(values)
  router.push('/profile')
})
</script>

<style scoped></style>
