- [1. インストール手順](#1-インストール手順)
  - [1.1. 依存パッケージインストール](#11-依存パッケージインストール)
  - [1.2. ソースファイル編集](#12-ソースファイル編集)


# 1. インストール手順

以下のページを参照してください。  
https://tailwindcss.com/docs/guides/sveltekit

## 1.1. 依存パッケージインストール

```sh
cd services/kit.svelte.app.frontend/depend/packages/tailwind
./add.sh
```

## 1.2. ソースファイル編集

`svelte.config.js`

```javascript
import adapter from '@sveltejs/adapter-auto';
import { vitePreprocess } from '@sveltejs/vite-plugin-svelte';
/** @type {import('@sveltejs/kit').Config} */
const config = {
  kit: {
    adapter: adapter()
  },
  preprocess: vitePreprocess()
};
export default config;
```

`tailwind.config.js`

```javascript
/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{html,js,svelte,ts}'],
  theme: {
    extend: {}
  },
  plugins: []
};
```

`app.css`

```css
@tailwind base;
@tailwind components;
@tailwind utilities;
```

`+layout.svelte`

```javascript
<script>
  import "../app.css";
</script>

<slot />
```