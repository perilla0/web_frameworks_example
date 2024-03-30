- [1. インストール手順](#1-インストール手順)
  - [1.1. requirements.txt編集](#11-requirementstxt編集)
  - [1.2. pip install実行](#12-pip-install実行)
  - [1.3. ソースファイル修正](#13-ソースファイル修正)
  - [1.4. 静的ファイルの設定・出力](#14-静的ファイルの設定出力)


# 1. インストール手順

以下のページを参照してください。  
https://docs.graphene-python.org/projects/django/en/latest/installation/

## 1.1. requirements.txt編集

`env/{環境}/requirements.txt`に以下の行を追加します。
```sh
graphene-django
```

## 1.2. pip install実行

依存パッケージをインストールします。（要コンテナ起動）

```sh
cd services/django.app.backend/depend/common
./pip_install.sh
```

依存パッケージがインストールされたことを確認します。

```sh
docker compose exec django.app.backend pip freeze
# graphene==3.3
# graphene-django==3.2.0
# graphql-core==3.2.3
# graphql-relay==3.2.0
```

## 1.3. ソースファイル修正

`config/settings.py`ファイルを編集します。

```python
INSTALLED_APPS = [
    ...
    "graphene_django"
]


# GraphQL
GRAPHENE = {
    # configという名前のプロジェクト名
    "SCHEMA": "config.schema.schema"
}
```

`config/schema.py`ファイルを作成します。

```python
import graphene

class Query(graphene.ObjectType):
    hello = graphene.String(default_value="Hi!")

schema = graphene.Schema(query=Query)
```

`config/urls.py`ファイルを編集します。

```python
from django.views.decorators.csrf import csrf_exempt
# GraphQL
from graphene_django.views import GraphQLView

urlpatterns = [
    ...
    # path("graphql", GraphQLView.as_view(graphiql=True)),
    path("graphql", csrf_exempt(GraphQLView.as_view(graphiql=True))),
```

## 1.4. 静的ファイルの設定・出力

静的ファイルについては以下を参照。  
https://docs.djangoproject.com/en/5.0/howto/static-files/

`config/settings.py`に以下の行を追加

```python
STATIC_ROOT = "/app/src/public/static/"
```

以下のコマンドを実行し、静的ファイルを`STATIC_ROOT`に指定したディレクトリに出力します。

```sh
docker compose exec -u $(id -u):$(id -g) django.app.backend python manage.py collectstatic
```
