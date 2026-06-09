<template>
  <section id="works" class="relative py-24 md:py-32 px-6 md:px-12 lg:px-20">
    <div class="max-w-[1200px] mx-auto">
      <!-- Section header -->
      <div class="reveal mb-16 flex items-end justify-between">
        <div>
          <p class="font-mono text-[11px] uppercase tracking-[0.08em] text-muted mb-4">
            Selected Works
          </p>
          <h2 class="font-display text-[clamp(28px,4vw,40px)] leading-[1.15] tracking-[-0.02em] text-fg font-300">
            Featured Projects
          </h2>
        </div>
        <span class="hidden md:block text-[12px] font-mono text-dim tracking-wide">03 projects</span>
      </div>

      <!-- Grid: Card 1 large, Cards 2+3 smaller -->
      <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
        <!-- Card 1: AI Code Reviewer — spans full width on desktop -->
        <article class="bento-card group overflow-hidden reveal reveal-delay-1 md:col-span-2">
          <div class="bento-card-tilt grid grid-cols-1 md:grid-cols-[1fr,1fr]">
            <!-- Thumbnail -->
            <div class="aspect-[16/9] md:aspect-auto relative overflow-hidden">
              <div class="absolute inset-0 flex items-center justify-center p-8">
                <svg viewBox="0 0 320 180" fill="none" class="w-full max-w-[280px] text-accent/30 transition-transform duration-500 ease-out group-hover:scale-105">
                  <!-- Code editor frame -->
                  <rect x="8" y="4" width="304" height="172" rx="2" stroke="currentColor" stroke-width="1" fill="none" opacity="0.2"/>
                  <rect x="16" y="12" width="4" height="4" fill="currentColor" opacity="0.2"/>
                  <rect x="24" y="12" width="4" height="4" fill="currentColor" opacity="0.2"/>
                  <rect x="32" y="12" width="4" height="4" fill="currentColor" opacity="0.2"/>
                  <line x1="8" y1="24" x2="312" y2="24" stroke="currentColor" stroke-width="0.5" opacity="0.15"/>
                  <!-- Line numbers -->
                  <text x="20" y="44" font-family="monospace" font-size="8" fill="currentColor" opacity="0.2">01</text>
                  <text x="20" y="60" font-family="monospace" font-size="8" fill="currentColor" opacity="0.2">02</text>
                  <text x="20" y="76" font-family="monospace" font-size="8" fill="currentColor" opacity="0.2">03</text>
                  <text x="20" y="92" font-family="monospace" font-size="8" fill="currentColor" opacity="0.2">04</text>
                  <text x="20" y="108" font-family="monospace" font-size="8" fill="currentColor" opacity="0.2">05</text>
                  <text x="20" y="124" font-family="monospace" font-size="8" fill="currentColor" opacity="0.2">06</text>
                  <text x="20" y="140" font-family="monospace" font-size="8" fill="currentColor" opacity="0.2">07</text>
                  <!-- Code lines -->
                  <rect x="40" y="36" width="180" height="3" fill="currentColor" opacity="0.2"/>
                  <rect x="40" y="52" width="130" height="3" fill="currentColor" opacity="0.35"/>
                  <rect x="40" y="68" width="160" height="3" fill="currentColor" opacity="0.2"/>
                  <rect x="40" y="84" width="110" height="3" fill="currentColor" opacity="0.35"/>
                  <rect x="40" y="100" width="150" height="3" fill="currentColor" opacity="0.2"/>
                  <rect x="40" y="116" width="90" height="3" fill="currentColor" opacity="0.35"/>
                  <rect x="40" y="132" width="180" height="3" fill="currentColor" opacity="0.2"/>
                  <!-- Review annotations -->
                  <rect x="240" y="48" width="60" height="22" rx="2" stroke="currentColor" stroke-width="1" fill="none" opacity="0.3"/>
                  <path d="M248 59l4 4 8-8" stroke="currentColor" stroke-width="1.2" stroke-linecap="square" stroke-linejoin="miter" opacity="0.4"/>
                  <rect x="240" y="96" width="60" height="22" rx="2" stroke="currentColor" stroke-width="1" fill="none" opacity="0.3"/>
                  <path d="M248 107l4 4 8-8" stroke="currentColor" stroke-width="1.2" stroke-linecap="square" stroke-linejoin="miter" opacity="0.4"/>
                </svg>
              </div>
            </div>
            <!-- Content -->
            <div class="p-8 md:p-10 flex flex-col justify-center">
              <span class="font-mono text-[11px] uppercase tracking-[0.08em] text-dim mb-3">01 / Review</span>
              <h3 class="text-[20px] font-semibold text-fg tracking-[-0.01em] mb-3">AI Code Reviewer</h3>
              <p class="text-[14px] text-muted leading-relaxed mb-6 max-w-[380px]">基于大语言模型的智能代码审查工具，自动分析代码质量、检测潜在问题并生成优化建议</p>
              <div class="flex flex-wrap gap-2">
                <span class="tag-chip">Vue 3</span>
                <span class="tag-chip">TypeScript</span>
                <span class="tag-chip">OpenAI</span>
              </div>
            </div>
          </div>
        </article>

        <!-- Card 2: Terminal Copilot -->
        <article class="bento-card group overflow-hidden reveal reveal-delay-2">
          <div class="bento-card-tilt">
            <div class="aspect-[16/10] relative overflow-hidden">
              <div class="absolute inset-0 flex items-center justify-center">
                <svg width="160" height="100" viewBox="0 0 160 100" fill="none" class="text-accent/30 transition-transform duration-500 ease-out group-hover:scale-105">
                  <rect x="8" y="4" width="144" height="92" rx="2" stroke="currentColor" stroke-width="1" fill="none" opacity="0.2"/>
                  <rect x="16" y="12" width="3" height="3" fill="currentColor" opacity="0.2"/>
                  <rect x="22" y="12" width="3" height="3" fill="currentColor" opacity="0.2"/>
                  <rect x="28" y="12" width="3" height="3" fill="currentColor" opacity="0.2"/>
                  <line x1="8" y1="20" x2="152" y2="20" stroke="currentColor" stroke-width="0.5" opacity="0.12"/>
                  <text x="18" y="38" font-family="monospace" font-size="9" fill="currentColor" opacity="0.4">$</text>
                  <rect x="30" y="32" width="64" height="3" fill="currentColor" opacity="0.3"/>
                  <rect x="18" y="48" width="90" height="3" fill="currentColor" opacity="0.15"/>
                  <rect x="18" y="58" width="60" height="3" fill="currentColor" opacity="0.15"/>
                  <text x="18" y="74" font-family="monospace" font-size="9" fill="currentColor" opacity="0.4">$</text>
                  <rect x="30" y="68" width="48" height="3" fill="currentColor" opacity="0.3">
                    <animate attributeName="width" values="0;48" dur="1s" fill="freeze"/>
                  </rect>
                </svg>
              </div>
            </div>
            <div class="p-6 md:p-8">
              <span class="font-mono text-[11px] uppercase tracking-[0.08em] text-dim mb-2 block">02 / Terminal</span>
              <h3 class="text-[18px] font-semibold text-fg tracking-[-0.01em] mb-2">Terminal Copilot</h3>
              <p class="text-[13px] text-muted leading-relaxed mb-5">智能终端助手，通过自然语言快速生成和执行 Shell 命令</p>
              <div class="flex flex-wrap gap-2">
                <span class="tag-chip">Nuxt 3</span>
                <span class="tag-chip">Node.js</span>
                <span class="tag-chip">Trae</span>
              </div>
            </div>
          </div>
        </article>

        <!-- Card 3: Auto Docs Generator -->
        <article class="bento-card group overflow-hidden reveal reveal-delay-3">
          <div class="bento-card-tilt">
            <div class="aspect-[16/10] relative overflow-hidden">
              <div class="absolute inset-0 flex items-center justify-center">
                <svg width="160" height="100" viewBox="0 0 160 100" fill="none" class="text-accent/30 transition-transform duration-500 ease-out group-hover:scale-105">
                  <rect x="16" y="8" width="52" height="40" rx="2" stroke="currentColor" stroke-width="1" fill="none" opacity="0.2"/>
                  <rect x="24" y="16" width="36" height="2.5" fill="currentColor" opacity="0.3"/>
                  <rect x="24" y="22" width="26" height="2.5" fill="currentColor" opacity="0.2"/>
                  <rect x="24" y="28" width="32" height="2.5" fill="currentColor" opacity="0.3"/>
                  <rect x="24" y="34" width="20" height="2.5" fill="currentColor" opacity="0.2"/>
                  <rect x="92" y="52" width="52" height="40" rx="2" stroke="currentColor" stroke-width="1" fill="none" opacity="0.2"/>
                  <rect x="100" y="60" width="36" height="2.5" fill="currentColor" opacity="0.3"/>
                  <rect x="100" y="66" width="26" height="2.5" fill="currentColor" opacity="0.2"/>
                  <rect x="100" y="72" width="32" height="2.5" fill="currentColor" opacity="0.3"/>
                  <rect x="100" y="78" width="20" height="2.5" fill="currentColor" opacity="0.2"/>
                  <path d="M56 48 L104 52" stroke="currentColor" stroke-width="0.8" stroke-dasharray="3 3" opacity="0.25"/>
                  <rect x="72" y="42" width="16" height="16" stroke="currentColor" stroke-width="1" fill="none" opacity="0.3"/>
                  <path d="M76 50h8M80 46v8" stroke="currentColor" stroke-width="1" stroke-linecap="square" opacity="0.3"/>
                </svg>
              </div>
            </div>
            <div class="p-6 md:p-8">
              <span class="font-mono text-[11px] uppercase tracking-[0.08em] text-dim mb-2 block">03 / Docs</span>
              <h3 class="text-[18px] font-semibold text-fg tracking-[-0.01em] mb-2">Auto Docs Generator</h3>
              <p class="text-[13px] text-muted leading-relaxed mb-5">从源代码自动生成结构化技术文档，支持多语言输出</p>
              <div class="flex flex-wrap gap-2">
                <span class="tag-chip">Vue 3</span>
                <span class="tag-chip">Python</span>
                <span class="tag-chip">Qoder</span>
              </div>
            </div>
          </div>
        </article>
      </div>
    </div>
  </section>
</template>

<script setup>
const { initCardTilt } = useCardTilt()

onMounted(() => {
  initCardTilt()
})
</script>
