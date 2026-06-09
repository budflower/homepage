<template>
  <header class="fixed top-0 left-0 right-0 z-50">
    <nav class="carbon-nav flex items-center gap-1 px-6 md:px-12 lg:px-20 h-12">
      <!-- Logo mark -->
      <NuxtLink to="/" class="flex items-center gap-2.5 mr-auto text-[14px] font-semibold tracking-[-0.01em] text-fg hover:text-accent transition-colors">
        <svg width="18" height="18" viewBox="0 0 18 18" fill="none" class="text-accent">
          <rect x="1" y="1" width="16" height="16" rx="2" stroke="currentColor" stroke-width="1.5" fill="none"/>
          <path d="M5 7l4 4 4-4" stroke="currentColor" stroke-width="1.5" stroke-linecap="square" stroke-linejoin="miter"/>
        </svg>
        CodeWithAI
      </NuxtLink>
      
      <!-- Nav links -->
      <div class="hidden md:flex items-center gap-0">
        <a href="#about" class="px-4 py-1.5 text-[13px] font-normal text-muted hover:text-fg transition-colors border-b-2 border-transparent hover:border-accent h-12 flex items-center">关于</a>
        <a href="#works" class="px-4 py-1.5 text-[13px] font-normal text-muted hover:text-fg transition-colors border-b-2 border-transparent hover:border-accent h-12 flex items-center">作品</a>
        <a href="#contact" class="px-4 py-1.5 text-[13px] font-normal text-muted hover:text-fg transition-colors border-b-2 border-transparent hover:border-accent h-12 flex items-center">联系我</a>
      </div>
      
      <!-- Mobile toggle -->
      <button 
        class="md:hidden ml-2 p-2 text-muted hover:text-fg transition-colors" 
        aria-label="Toggle menu" 
        :aria-expanded="isMenuOpen"
        @click="toggleMenu"
      >
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="square">
          <path d="M3 8h18M3 16h18"/>
        </svg>
      </button>
    </nav>
    
    <!-- Mobile dropdown -->
    <div 
      class="mobile-menu mx-6 md:mx-12 mt-0 bg-base border border-fg-8 px-4 py-3 md:hidden"
      :class="{ open: isMenuOpen, hidden: !isMenuOpen }"
    >
      <a href="#about" class="mobile-nav-link block py-2.5 text-[13px] text-muted hover:text-fg transition-colors border-b border-fg-5 last:border-0" @click="closeMenu">关于</a>
      <a href="#works" class="mobile-nav-link block py-2.5 text-[13px] text-muted hover:text-fg transition-colors border-b border-fg-5 last:border-0" @click="closeMenu">作品</a>
      <a href="#contact" class="mobile-nav-link block py-2.5 text-[13px] text-muted hover:text-fg transition-colors" @click="closeMenu">联系我</a>
    </div>
  </header>
</template>

<script setup>
const isMenuOpen = ref(false)

const toggleMenu = () => {
  isMenuOpen.value = !isMenuOpen.value
}

const closeMenu = () => {
  isMenuOpen.value = false
}
</script>
