/** @type {import('tailwindcss').Config} */
export default {
  content: [
    './components/**/*.{js,vue,ts}',
    './layouts/**/*.vue',
    './pages/**/*.vue',
    './plugins/**/*.{js,ts}',
    './app.vue',
    './error.vue'
  ],
  theme: {
    extend: {
      colors: {
        base: 'var(--c-bg)',
        surface: 'var(--c-surface)',
        elevated: 'var(--c-elevated)',
        fg: 'var(--c-fg)',
        muted: 'var(--c-muted)',
        dim: 'var(--c-dim)',
        accent: 'var(--c-accent)',
        'accent-light': 'var(--c-accent-light)',
      },
      fontFamily: {
        sans: ['"IBM Plex Sans"', 'system-ui', 'sans-serif'],
        display: ['"IBM Plex Sans"', 'system-ui', 'sans-serif'],
        mono: ['"IBM Plex Mono"', 'ui-monospace', 'monospace'],
      },
    }
  },
  plugins: []
}
