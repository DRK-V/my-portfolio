// tailwind.config.mjs
import { defineConfig } from 'tailwindcss/helpers';

// tailwind.config.mjs
export default {
  content: ['./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}'],
  theme: {
    extend: {
      colors: {
        primary: '#2563eb',
        secondary: '#1e40af',
      },
    },
  },
  plugins: [],
};

