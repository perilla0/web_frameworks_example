# https://github.com/docker/awesome-compose/tree/master/official-documentation-samples/django/
# https://gunicorn.org/
# https://docs.djangoproject.com/en/5.0/howto/deployment/wsgi/gunicorn/
FROM python:3.12

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# ビルド用ディレクトリを作成し、requirements.txtを配置
RUN mkdir -p /build && chmod -R 0777 /build
WORKDIR /build
COPY ./docker/django.app.backend/requirements.txt /build

# WORKDIR作成
RUN mkdir -p /app/src && chmod -R 0777 /app/src
WORKDIR /app/src

RUN chmod -R 0777 . \
    && mkdir -p public && chmod -R 0777 public

# プロジェクトフォルダのbind
ADD ./src/django.app.backend .

# プロジェクトフォルダ内にrequirements.txtが存在しない場合のみコピー
RUN if [ ! -f requirements.txt ]; then \
        cp /build/requirements.txt . ; \
    fi;

RUN pip install -r requirements.txt