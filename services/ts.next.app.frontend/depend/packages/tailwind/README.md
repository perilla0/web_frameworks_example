- [1. インストール手順](#1-インストール手順)
  - [1.1. 依存パッケージインストール](#11-依存パッケージインストール)
  - [1.2. ソースファイル編集](#12-ソースファイル編集)


# 1. インストール手順

以下のページを参照してください。  
https://tailwindcss.com/docs/guides/vite

## 1.1. 依存パッケージインストール

```sh
cd services/ts.next.app.frontend/depend/packages/tailwind
./add.sh
```

## 1.2. ソースファイル編集

`tailwind.config.js`

```javascript
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./app/**/*.{js,ts,jsx,tsx,mdx}",
    "./pages/**/*.{js,ts,jsx,tsx,mdx}",
    "./components/**/*.{js,ts,jsx,tsx,mdx}",
 
    // Or if using `src` directory:
    "./src/**/*.{js,ts,jsx,tsx,mdx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
```

`global.css`

```css
@tailwind base;
@tailwind components;
@tailwind utilities;
```
