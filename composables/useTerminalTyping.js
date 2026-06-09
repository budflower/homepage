// Terminal typing animation composable
export function useTerminalTyping() {
  const typingText = ref('')
  const commands = [
    'npx create-ai-app --template reviewer',
    'trae generate --type docs --lang zh,en',
    'qoder deploy --env production',
    'git push origin main',
  ]
  
  let cmdIndex = 0
  let charIndex = 0
  let deleting = false
  let pauseTimer = null
  let isRunning = false
  
  const typeLoop = () => {
    if (!isRunning) return
    
    const cmd = commands[cmdIndex]
    if (!deleting) {
      typingText.value = cmd.slice(0, charIndex + 1)
      charIndex++
      if (charIndex >= cmd.length) {
        pauseTimer = setTimeout(() => { 
          deleting = true
          typeLoop() 
        }, 2200)
        return
      }
      setTimeout(typeLoop, 45 + Math.random() * 40)
    } else {
      typingText.value = cmd.slice(0, charIndex)
      charIndex--
      if (charIndex < 0) {
        deleting = false
        charIndex = 0
        cmdIndex = (cmdIndex + 1) % commands.length
        setTimeout(typeLoop, 400)
        return
      }
      setTimeout(typeLoop, 22)
    }
  }
  
  const startTyping = (delay = 1200) => {
    if (process.client && !isRunning) {
      isRunning = true
      setTimeout(typeLoop, delay)
    }
  }
  
  const stopTyping = () => {
    isRunning = false
    if (pauseTimer) {
      clearTimeout(pauseTimer)
      pauseTimer = null
    }
  }
  
  return {
    typingText,
    startTyping,
    stopTyping
  }
}
