import type { Config } from 'tailwindcss';

const config: Config = {
  content: ['./src/**/*.{ts,tsx}'],
  theme: {
    extend: {
      colors: {
        panel: 'rgba(14, 20, 40, 0.78)',
        panelStrong: 'rgba(8, 12, 25, 0.92)',
        accentCyan: '#46e6ff',
        accentGreen: '#5dff8f',
        accentOrange: '#ffae42',
        accentRed: '#ff5a74',
        accentPurple: '#a56dff',
      },
      boxShadow: {
        neon: '0 0 24px rgba(70, 230, 255, 0.12), inset 0 0 0 1px rgba(255,255,255,0.06)',
      },
      backgroundImage: {
        'office-grid':
          'radial-gradient(circle at top, rgba(70,230,255,0.18), transparent 35%), linear-gradient(180deg, rgba(8,10,20,0.85), rgba(5,7,14,0.98))',
      },
      fontFamily: {
        display: ['var(--font-display)', 'Segoe UI', 'sans-serif'],
        mono: ['var(--font-mono)', 'Consolas', 'monospace'],
      },
    },
  },
  plugins: [],
};

export default config;
