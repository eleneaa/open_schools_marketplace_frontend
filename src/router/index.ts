import LoginForm from '@/components/auth/LoginForm.vue'
import RegisterForm from '@/components/auth/RegisterForm.vue'
import AuthView from '@/views/AuthView.vue'
import { createRouter, createWebHistory } from 'vue-router'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/auth', component: AuthView, redirect: '/auth/login', children: [
        { path: 'login', name: 'login', component: LoginForm },
        { path: 'register', name: 'register', component: RegisterForm },
      ]
    }
  ],
})

export default router
