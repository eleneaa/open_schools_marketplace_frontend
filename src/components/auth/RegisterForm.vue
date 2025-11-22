<template>
  <form @submit.prevent="onSubmit" novalidate class="flex flex-col gap-6 w-full">

    <div class="flex flex-col gap-2">
      <label for="fullname">ФИО <span v-if="fullNameMeta.touched" class="text-orange-900 text-xs">{{ fullNameError
          }}</span></label>
      <AuthInput v-model="fullName" id="fullname" type="text" ph="Иванов Иван Иванович"
        @blur="fullNameMeta.touched = true" />

      <label for="email">Email <span v-if="emailMeta.touched" class="text-orange-900 text-xs">{{ emailError
      }}</span></label>
      <AuthInput v-model="email" id="email" type="email" ph="example@mail.com" @blur="emailMeta.touched = true" />

      <label for="password">Придумайте пароль <span v-if="passwordMeta.touched" class="text-orange-900 text-xs">{{
        passwordError
          }}</span></label>
      <AuthInput v-model="password" id="password" type="password" ph="Пароль" @blur="passwordMeta.touched = true" />

      <label for="cpassword">Повторите пароль <span v-if="cPasswordMeta.touched" class="text-orange-900 text-xs">{{
        cPasswordError }}</span></label>
      <AuthInput v-model="cPassword" id="cpassword" type="password" ph="Пароль" @blur="cPasswordMeta.touched = true" />
    </div>

    <button type="submit" class="bg-[#2698FF] rounded-lg text-white p-2 cursor-pointer">Зарегистрироваться</button>

  </form>
</template>

<script setup lang="ts">
import { useForm, useField } from 'vee-validate'
import { z } from 'zod'
import { toTypedSchema } from '@vee-validate/zod'
import AuthInput from './AuthInput.vue'
import { useRouter } from 'vue-router'

const router = useRouter()

const schema = toTypedSchema(
  z.object({
    fullName: z.string().nonempty('Обязательное поле'),
    email: z.string().nonempty('Обязательное поле').email('Неверный email'),
    password: z.string().nonempty('Обязательное поле').min(6, 'Минимум 6 символов'),
    cPassword: z.string().nonempty('Обязательное поле').min(6, 'Минимум 6 символов'),
  }).refine((data) => data.password === data.cPassword, {
    message: 'Пароли не совпадают',
    path: ['cPassword']
  })
)

const { handleSubmit } = useForm({
  initialValues: {
    fullName: "",
    email: "",
    password: "",
    cPassword: ""
  },
  validationSchema: schema,
  validateOnMount: false
})

const { value: fullName, errorMessage: fullNameError, meta: fullNameMeta } = useField<string>('fullName')
const { value: email, errorMessage: emailError, meta: emailMeta } = useField<string>('email')
const { value: password, errorMessage: passwordError, meta: passwordMeta } = useField<string>('password')
const { value: cPassword, errorMessage: cPasswordError, meta: cPasswordMeta } = useField<string>('cPassword')

const onSubmit = handleSubmit((values) => {
  console.log(values)
  router.push('/profile')
})
</script>
