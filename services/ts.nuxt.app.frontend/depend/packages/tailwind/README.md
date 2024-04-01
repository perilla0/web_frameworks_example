- [1. インストール手順](#1-インストール手順)
  - [1.1. 依存パッケージインストール](#11-依存パッケージインストール)
  - [1.2. ソースファイル編集](#12-ソースファイル編集)


# 1. インストール手順

以下のページを参照してください。  
https://tailwindcss.com/docs/guides/vite

## 1.1. 依存パッケージインストール

```sh
cd services/ts.nuxt.app.frontend/depend/packages/bootstrap
./add.sh
```

## 1.2. ソースファイル編集

`nuxt.config.js`

```javascript
// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: true },
  postcss: {
    plugins: {
      tailwindcss: {},
      autoprefixer: {},
    },
  },
})
```

`tailwind.config.js`

```javascript
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./components/**/*.{js,vue,ts}",
    "./layouts/**/*.vue",
    "./pages/**/*.vue",
    "./plugins/**/*.{js,ts}",
    "./app.vue",
    "./error.vue",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
```

`main.css`

```css
@tailwind base;
@tailwind components;
@tailwind utilities;
```

`nuxt.config.js`

```javascript
// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: true },
  css: ['~/assets/css/main.css'],
  postcss: {
    plugins: {
      tailwindcss: {},
      autoprefixer: {},
    },
  },
})
```