<template>
  <div>
    <!-- ═══ Hero — Asymmetric Split ═══ -->
    <HeroSection />
    
    <!-- ═══ Section Divider ═══ -->
    <div class="accent-line max-w-[600px] mx-auto" aria-hidden="true" />
    
    <!-- ═══ Works — Grid ═══ -->
    <WorksSection />
  </div>
</template>

<script setup>
// SEO Configuration
useSeoMeta({
  title: 'CodeWithAI — AI-Powered Developer',
  description: 'Building the future with Qoder & Trae. AI-Powered Developer specializing in Vue 3, TypeScript, and Developer Tools.',
  keywords: 'AI Developer, Vue 3, TypeScript, Qoder, Trae, Developer Tools',
  author: 'CodeWithAI',
  ogTitle: 'CodeWithAI — AI-Powered Developer',
  ogDescription: 'Building the future with Qoder & Trae',
  ogType: 'website',
  twitterCard: 'summary_large_image',
  twitterTitle: 'CodeWithAI — AI-Powered Developer',
  twitterDescription: 'Building the future with Qoder & Trae'
})

useHead({
  htmlAttrs: {
    lang: 'zh-CN'
  },
  meta: [
    { name: 'canvas:aspect-ratio', content: '16:9' }
  ]
})

const { initScrollReveal } = useScrollReveal()
const { initMagneticButtons } = useMagneticButton()

onMounted(() => {
  initScrollReveal()
  initMagneticButtons()
})
</script>
