- [1. インストール手順](#1-インストール手順)
  - [1.1. 依存パッケージインストール](#11-依存パッケージインストール)
  - [1.2. ソースファイル編集](#12-ソースファイル編集)


# 1. インストール手順

以下のページを参照してください。  
https://flowbite.com/docs/getting-started/next-js/

## 1.1. 依存パッケージインストール

```sh
cd services/ts.next.app.frontend/depend/packages/flowbite
./add.sh
```

## 1.2. ソースファイル編集

`tailwind.config.js`

```javascript
/**
 * @type {import('@types/tailwindcss/tailwind-config').TailwindConfig}
 */
module.exports = {
  content: [
    "./node_modules/flowbite-react/lib/**/*.js",
    "./pages/**/*.{ts,tsx}",
    "./public/**/*.html",
  ],
  plugins: [
    require("flowbite/plugin")
  ],
  theme: {},
};
```
