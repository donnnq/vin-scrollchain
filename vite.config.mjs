import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

export default defineConfig({
  plugins: [vue()],
  build: {
    sourcemap: false
  },
  server: {
    host: true,
    cors: {
      origin: 'http://localhost:5173',
      methods: ['GET']
    }
  },
  resolve: {
    alias: {
      '@': '/frontend/src'
    }
  }
})
