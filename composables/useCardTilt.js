// Card tilt effect composable
export function useCardTilt() {
  const initCardTilt = () => {
    if (process.client) {
      document.querySelectorAll('.bento-card-tilt').forEach((card) => {
        const parent = card.closest('.bento-card')
        if (parent) {
          parent.addEventListener('mousemove', (e) => {
            const rect = parent.getBoundingClientRect()
            const x = (e.clientX - rect.left) / rect.width - 0.5
            const y = (e.clientY - rect.top) / rect.height - 0.5
            card.style.transform = `perspective(800px) rotateY(${x * 2}deg) rotateX(${-y * 2}deg)`
          })
          parent.addEventListener('mouseleave', () => {
            card.style.transform = 'perspective(800px) rotateY(0deg) rotateX(0deg)'
          })
        }
      })
    }
  }
  
  return { initCardTilt }
}
