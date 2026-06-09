<template>
  <section id="about" class="relative flex items-center min-h-screen px-6 md:px-12 lg:px-20 overflow-hidden">
    <div class="hero-grid absolute inset-0 pointer-events-none" aria-hidden="true" />
    
    <div class="relative z-10 max-w-[1200px] mx-auto w-full grid grid-cols-1 lg:grid-cols-[1fr,420px] gap-12 lg:gap-16 items-center">
      <!-- Left: Content -->
      <div class="pt-20 lg:pt-0">
        <!-- Status badge -->
        <div class="reveal mb-8">
          <span class="inline-flex items-center gap-2 px-3 py-1 border border-fg-8 bg-surface text-[11px] font-mono uppercase tracking-[0.08em] text-muted" style="border-radius: var(--r-sm);">
            <span class="w-1.5 h-1.5 bg-accent" style="border-radius: 1px;" />
            Available for work
          </span>
        </div>

        <!-- Title with decode effect -->
        <h1 ref="heroTitleRef" class="reveal reveal-delay-1 hero-title text-fg mb-6" data-text="AI-Powered Developer">
          AI-Powered Developer
        </h1>

        <!-- Subtitle -->
        <p class="reveal reveal-delay-2 text-[16px] text-muted leading-relaxed max-w-[460px] mb-10">
          Building the future with
          <span class="text-fg font-medium">Qoder</span> &amp;
          <span class="text-fg font-medium">Trae</span>
        </p>

        <!-- CTAs -->
        <div class="reveal reveal-delay-3 flex items-center gap-3 flex-wrap">
          <a 
            href="#works"
            class="magnetic-btn carbon-btn-primary inline-flex items-center gap-2.5 px-6 py-3 bg-accent text-white text-[14px] font-normal transition-all duration-150"
            style="border-radius: var(--r-sm);"
            data-magnetic
          >
            浏览作品
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="square" stroke-linejoin="miter">
              <path d="M7 17l10-10M7 7h10v10"/>
            </svg>
          </a>
          <a 
            href="#contact"
            class="magnetic-btn carbon-btn-secondary inline-flex items-center gap-2 px-6 py-3 border border-fg-14 bg-transparent text-fg text-[14px] font-normal transition-all duration-150"
            style="border-radius: var(--r-sm);"
          >
            联系我
          </a>
        </div>
      </div>

      <!-- Right: Terminal Widget -->
      <div class="reveal reveal-delay-2 hidden lg:block">
        <div class="terminal-widget p-0">
          <!-- Title bar -->
          <div class="terminal-header flex items-center gap-2 px-4 py-2.5">
            <span class="terminal-label">
              <span class="terminal-dot" style="background:var(--dot-red)" />
              <span class="terminal-dot" style="background:var(--dot-yellow)" />
              <span class="terminal-dot" style="background:var(--dot-green)" />
            </span>
            <span class="ml-3 text-[11px] tracking-wide font-mono" style="color:var(--term-dim)">codewithai.dev</span>
          </div>
          <!-- Terminal body -->
          <div class="px-4 py-4 text-[13px] leading-[1.7] space-y-1 font-mono">
            <div style="color:var(--term-dim)"><span style="color:var(--term-accent)">$</span> <span style="color:var(--term-text)">whoami</span></div>
            <div style="color:var(--term-bright)">AI-Powered Developer</div>
            <div class="mt-2" style="color:var(--term-dim)"><span style="color:var(--term-accent)">$</span> <span style="color:var(--term-text)">cat stack.json</span></div>
            <div style="color:var(--term-text)">{</div>
            <div class="pl-4" style="color:var(--term-text)">"frontend": <span style="color:var(--term-accent)">"Vue 3 + TypeScript"</span>,</div>
            <div class="pl-4" style="color:var(--term-text)">"ai": <span style="color:var(--term-accent)">"Qoder, Trae"</span>,</div>
            <div class="pl-4" style="color:var(--term-text)">"focus": <span style="color:var(--term-accent)">"Developer Tools"</span></div>
            <div style="color:var(--term-text)">}</div>
            <div class="mt-2" style="color:var(--term-dim)"><span style="color:var(--term-accent)">$</span> <span style="color:var(--term-text)">{{ typingText }}</span><span class="terminal-cursor" /></div>
          </div>
        </div>
      </div>
    </div>

    <!-- Scroll hint -->
    <div class="absolute bottom-8 left-1/2 -translate-x-1/2 flex flex-col items-center gap-2 text-dim/50">
      <span class="text-[10px] font-mono uppercase tracking-[0.12em]">Scroll</span>
      <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="square" class="animate-bounce">
        <path d="M12 5v14M19 12l-7 7-7-7"/>
      </svg>
    </div>
  </section>
</template>

<script setup>
const heroTitleRef = ref(null)
const { animateTextDecode } = useTextDecode()
const { typingText, startTyping, stopTyping } = useTerminalTyping()

onMounted(() => {
  // Text decode animation
  if (heroTitleRef.value) {
    animateTextDecode(heroTitleRef.value, 600)
  }
  
  // Terminal typing animation
  startTyping(1200)
})

onUnmounted(() => {
  stopTyping()
})
</script>
