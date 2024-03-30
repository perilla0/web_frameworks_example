- [1. インストール手順](#1-インストール手順)
  - [1.1. 依存パッケージ追加](#11-依存パッケージ追加)
  - [1.2. goget.sh実行](#12-gogetsh実行)
  - [1.3. gqlgenのスケルトン生成](#13-gqlgenのスケルトン生成)
  - [1.4. ソースファイル編集](#14-ソースファイル編集)
  - [1.5. gotidy.sh実行](#15-gotidysh実行)


# 1. インストール手順

以下のページを参照してください。  
https://gqlgen.com/

## 1.1. 依存パッケージ追加

`depend/common/goget.sh`に、以下の行を追記します。

```sh
docker compose run -u $(id -u):$(id -g) --rm ${DC_SERRVICE_NAME} bash -c "
...
go get github.com/99designs/gqlgen
...
"
```

## 1.2. goget.sh実行

依存パッケージをインストールします。

```sh
cd services/rails.app.backend/depend/common
./goget.sh
```

## 1.3. gqlgenのスケルトン生成

gqlgenのスケルトンを生成します。

```sh
cd services/rails.app.backend/depend/packages/gqlgen
./generate_skeleton.sh
```

## 1.4. ソースファイル編集

インストールドキュメントに従い、生成したスケルトンをプロジェクトに配置します。

`server.go`に以下の記述を追加。

```golang
import (
    ...
	"github.com/99designs/gqlgen/graphql/handler"
	"github.com/99designs/gqlgen/graphql/playground"
    ...
)

func main() {
    ...
	// GraphQLエンドポイント
	graphqlHandler := handler.NewDefaultServer(graph.NewExecutableSchema(graph.Config{Resolvers: &graph.Resolver{}}))
	e.POST("/graphql", func(c echo.Context) error {
		graphqlHandler.ServeHTTP(c.Response(), c.Request())
		return nil
	})
	// playground
	playgroundHandler := playground.Handler("GraphQL", "/graphql")
	e.GET("/graphiql", func(c echo.Context) error {
		playgroundHandler.ServeHTTP(c.Response(), c.Request())
		return nil
	})
    ...
}
```

`tools.go`を作成
```golang
// +build tools

package tools

import (
	"github.com/99designs/gqlgen"
	"github.com/99designs/gqlgen/graphql/introspection"
)

```

## 1.5. gotidy.sh実行

```sh
cd services/rails.app.backend/depend/common
./gotidy.sh
```