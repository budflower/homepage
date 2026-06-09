<template>
  <div class="min-h-screen bg-base text-fg font-sans antialiased relative z-10">
    <!-- Subtle hover glow (Carbon-compatible, no decorative effect) -->
    <div 
      class="cursor-spotlight" 
      :class="{ active: spotlightActive }"
      aria-hidden="true"
    />
    
    <AppHeader />
    
    <main>
      <slot />
    </main>
    
    <AppFooter />
  </div>
</template>

<script setup>
// Spotlight effect
const spotlightActive = ref(false)

onMounted(() => {
  const handleMouseMove = (e) => {
    document.documentElement.style.setProperty('--mouse-x', e.clientX + 'px')
    document.documentElement.style.setProperty('--mouse-y', e.clientY + 'px')
    spotlightActive.value = true
  }
  
  const handleMouseLeave = () => {
    spotlightActive.value = false
  }
  
  document.addEventListener('mousemove', handleMouseMove)
  document.addEventListener('mouseleave', handleMouseLeave)
  
  onUnmounted(() => {
    document.removeEventListener('mousemove', handleMouseMove)
    document.removeEventListener('mouseleave', handleMouseLeave)
  })
})
</script>
