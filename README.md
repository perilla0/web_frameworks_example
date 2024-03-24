- [1. このリポジトリについて](#1-このリポジトリについて)
  - [1.1. 環境ファイル（.env）編集](#11-環境ファイルenv編集)
  - [1.2. Dockerサービス作成](#12-dockerサービス作成)
  - [1.3. コンテナ起動前の設定（初回のみ）](#13-コンテナ起動前の設定初回のみ)
  - [1.4. コンテナ起動](#14-コンテナ起動)
  - [1.5. コンテナ起動後の設定（初回のみ）](#15-コンテナ起動後の設定初回のみ)
  - [1.6. コンテナ削除](#16-コンテナ削除)
  - [1.7. Dockerサービス削除](#17-dockerサービス削除)
- [2. Docker Composeサービス一覧](#2-docker-composeサービス一覧)
  - [2.1. Web/プロキシ](#21-webプロキシ)
  - [2.2. バックエンド](#22-バックエンド)
  - [2.3. フロントエンド](#23-フロントエンド)
  - [2.4. データベース](#24-データベース)
  - [2.5. 他ツール](#25-他ツール)
- [3. Qiita記事](#3-qiita記事)

# 1. このリポジトリについて

開発スタート用にWebフレームワークをまとめたDocker Composeテンプレプロジェクトです。  
ツールをインストールして起動するまでの手順をサポートすることが目的です。

※ このプロジェクトでは、`.gitignore`にて`/src`ディレクトリを捕捉しないよう設定しています。（必要に応じて指定を削除します）

## 1.1. 環境ファイル（.env）編集

プロジェクト直下の.envファイルを確認ください。
任意で環境変数パラメータを変更します。

## 1.2. Dockerサービス作成

プロジェクトファイルの作成が必要なDockerサービスを全てビルドします。  
バックエンド、フロントエンドのプロジェクトファイルをsrc配下に作成します。

```sh
cd script/init/
./create.services.sh
```

`script/init/create.services`フォルダ内のスクリプトは、単体でも動作します。  
Dockerサービス単体でプロジェクトファイルを作成したい場合は、単体で実行します。

## 1.3. コンテナ起動前の設定（初回のみ）

初回のみ、`docker compose up`で各サービスを起動する前に、設定が必要なサービスが存在します。  
詳細は`doc/初回コンテナ起動前の設定.md`を参照ください。


## 1.4. コンテナ起動

```sh
docker compose up
```

## 1.5. コンテナ起動後の設定（初回のみ）

初回のみ、`docker compose up`で各サービスを起動した後に、設定が必要なサービスが存在します。  
詳細は`doc/初回コンテナ起動後の設定.md`を参照ください。

## 1.6. コンテナ削除

```sh
cd script
./down_clear.sh
```

## 1.7. Dockerサービス削除

プロジェクトファイルが存在するDockerサービスのコンテナイメージと、src直下のプロジェクトファイルを削除します。

```sh
cd script/init/
./remove.services.sh
```

`script/init/remove.services`フォルダ内のスクリプトは、単体でも動作します。  
Dockerサービス単体でプロジェクトファイルを削除したい場合は、単体で実行します。

# 2. Docker Composeサービス一覧

## 2.1. Web/プロキシ

| サービス名 | ツール名 | Docker Hub | ポート番号 | 説明  |
| :--- | :--- | :--- | :--- | :--- |
| nginx.web.backend | [nginx](https://nginx.org/en/) | [nginx](https://hub.docker.com/_/nginx) | - | ・バックエンドサービスへの中継<br>・自己署名証明書 |
| nginx.web.frontend | [nginx](https://nginx.org/en/) | [nginx](https://hub.docker.com/_/nginx) | - | ・フロントエンドサービスへの中継<br>・自己署名証明書 |

## 2.2. バックエンド

| サービス名 | ツール名 | Docker Hub | ポート番号 | 説明 |
| :--- | :--- | :--- | :--- | :--- |
| laravel.app.backend | [Laravel](https://readouble.com/laravel/10.x/ja/installation.html) | [php](https://hub.docker.com/_/php) | [58000](https://localhost:58000) | [PHP](https://www.php.net/)<br>cron<br>キュー |
| rails.app.backend | [Ruby on Rails](https://rubyonrails.org/) | [ruby](https://hub.docker.com/_/ruby) | [58010](https://localhost:58010) | [Ruby](https://www.ruby-lang.org/ja/) |
| django.app.backend | [Django](https://www.djangoproject.com/) | [python](https://hub.docker.com/_/python) | [58020](https://localhost:58020) | [Python](https://www.python.org/) |
| echo.app.backend | [Echo](https://echo.labstack.com/) | [golang](https://hub.docker.com/_/golang) | [58030](https://localhost:58030) | [Go](https://go.dev/) |

## 2.3. フロントエンド

| サービス名 | ツール名 | Docker Hub | ポート番号 | 説明  |
| :--- | :--- | :--- | :--- | :--- |
| react-ts.client.apollo.app.frontend | [Apollo Client](https://www.apollographql.com/docs/react/) | [node](https://hub.docker.com/_/node) | [443](https://localhost) | [GraphQL](https://graphql.org/) |
| ts.next.app.frontend | [Next.js](https://nextjs.org/) | [node](https://hub.docker.com/_/node) | [8010](https://localhost:8010) | [React](https://ja.react.dev/blog/2023/03/16/introducing-react-dev) |
| ts.nuxt.app.frontend | [Nuxt.js](https://nuxt.com/) | [node](https://hub.docker.com/_/node) | [8020](https://localhost:8020) | [Vue.js](https://ja.vuejs.org/) |
| kit.svelte.app.frontend | [SvelteKit](https://kit.svelte.jp/) | [node](https://hub.docker.com/_/node) | [8030](https://localhost:8030) | [Svelte](https://svelte.jp/) |

## 2.4. データベース

| サービス名 | ツール名 | Docker Hub | ポート番号 | 説明  |
| :--- | :--- | :--- | :--- | :--- |
| pgsql.db | [MySQL](https://www.mysql.com/jp/) | [postgres](https://hub.docker.com/_/postgres) | 5432 | - |
| mysql.db | [PostgreSQL](https://www.postgresql.jp/) | [mysql](https://hub.docker.com/_/mysql) | 3306 | - |
| redis.db | [Redis](https://redis.io/) | [redis](https://hub.docker.com/_/redis) | 6379 | - |
| memcached.db | [memcached](https://memcached.org/) | [memcached](https://hub.docker.com/_/memcached) | 11211 | - |
| mongo.db | [MongoDB](https://www.mongodb.com/ja-jp) | [mongo](https://hub.docker.com/_/mongo) | 27017 | - |

## 2.5. 他ツール

| サービス名 | ツール名 | Docker Hub | ポート番号 | 説明  |
| :--- | :--- | :--- | :--- | :--- |
| admin.pgsql.db.tool | pgadmin4 | [pgadmin4](https://hub.docker.com/r/dpage/pgadmin4) | 50010 | PostgreSQL管理 |
| admin.mysql.db.tool | phpmyadmin | [phpmyadmin](https://hub.docker.com/_/phpmyadmin) | 50020 | MySQL管理 |
| admin.redis.db.tool | redisinsight | [redisinsight](https://hub.docker.com/r/redislabs/redisinsight) | 50030 | redis管理 |
| admin.mongo.db.tool | mongo-express | [mongo-express](https://hub.docker.com/_/mongo-express) | 50040 | MongoDB管理 |
| mailpit.mail.tool | mailpit | [mailpit](https://hub.docker.com/r/axllent/mailpit) | 1025 (メール待受)<br>50050 (メール一覧画面) | メール送信テスト |

# 3. Qiita記事

未作成。
