<template>
  <div class="bg-[#f5f5f5] h-full flex items-center justify-center">
    <div :class="['p-12 rounded-2xl bg-white flex gap-[75px] transition-all duration-300', parentHeight]">
      <div class="flex flex-col items-center gap-8 w-[calc(404/1920*100vw)]">
        <div class="flex gap-8 justify-center text-lg">
          <RouterLink to="login" active-class="text-[#1890FF]">Вход</RouterLink>
          <RouterLink to="register" active-class="text-[#1890FF]">Регистрация</RouterLink>
        </div>

        <RouterView v-slot="{ Component }">
          <Transition mode="out-in">
            <component :is="Component" />
          </Transition>
        </RouterView>

      </div>
      <div class="w-1 bg-black rounded-full transition-all duration-300"></div>
      <h1 class="text-6xl my-auto">
        Open<br>
        Schools<br>
        Platform
      </h1>
    </div>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue';
import { useRoute } from 'vue-router';

const route = useRoute()

const parentHeight = computed(() => route.name === 'login'
  ? 'h-[403px]'
  : route.name === 'register'
    ? 'h-[538px]'
    : 'h-auto'
)

</script>

<style scoped>
.v-enter-active,
.v-leave-active {
  transition: opacity 0.15s ease;
}

.v-enter-from,
.v-leave-to {
  opacity: 0;
}
</style>
