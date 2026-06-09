// Text decode animation composable
export function useTextDecode() {
  const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789@#$%'
  
  const animateTextDecode = (element, delay = 600) => {
    if (process.client && element) {
      const finalText = element.dataset.text || element.textContent.trim()
      element.innerHTML = ''
      
      finalText.split('').forEach((ch, i) => {
        const span = document.createElement('span')
        span.className = 'char'
        span.textContent = ch === ' ' ? '\u00A0' : ch
        span.dataset.final = ch
        span.dataset.index = i
        element.appendChild(span)
      })
      
      setTimeout(() => {
        const spans = element.querySelectorAll('.char')
        spans.forEach((span, i) => {
          if (span.dataset.final === ' ') return
          let iterations = 0
          const maxIterations = 6 + Math.floor(i * 0.8)
          span.classList.add('scrambling')
          const interval = setInterval(() => {
            span.textContent = chars[Math.floor(Math.random() * chars.length)]
            iterations++
            if (iterations >= maxIterations) {
              clearInterval(interval)
              span.textContent = span.dataset.final
              span.classList.remove('scrambling')
            }
          }, 40 + i * 2)
        })
      }, delay)
    }
  }
  
  return { animateTextDecode }
}
