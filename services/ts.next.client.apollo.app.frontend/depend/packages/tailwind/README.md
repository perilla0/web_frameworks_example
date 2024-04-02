- [1. インストール手順](#1-インストール手順)
  - [1.1. 依存パッケージインストール](#11-依存パッケージインストール)
  - [1.2. ソースファイル編集](#12-ソースファイル編集)


# 1. インストール手順

以下のページを参照してください。  
https://tailwindcss.com/docs/guides/vite

## 1.1. 依存パッケージインストール

```sh
cd services/ts.next.client.apollo.app.frontend/depend/packages/bootstrap
./add.sh
```

## 1.2. ソースファイル編集

`tailwind.config.js`

```javascript
/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
```

`index.css`

```css
@tailwind base;
@tailwind components;
@tailwind utilities;
```
