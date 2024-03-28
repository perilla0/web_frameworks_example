# https://github.com/docker/awesome-compose/tree/master/official-documentation-samples/django/
# https://gunicorn.org/
# https://docs.djangoproject.com/en/5.0/howto/deployment/wsgi/gunicorn/
FROM python:3.12

ARG EX_ENV=""
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# ビルド用ディレクトリを作成し、requirements.txtを配置
# RUN mkdir -p /build && chmod -R 0777 /build
# WORKDIR /build
# COPY ./env/${EX_ENV}/requirements.txt /build

# WORKDIR作成
WORKDIR /app/src

RUN chmod -R 0777 . \
    && mkdir -p public && chmod -R 0777 public

# プロジェクトフォルダのbind
ADD ./src .

# プロジェクトフォルダ内にrequirements.txtが存在しない場合のみコピー
# RUN if [ ! -f requirements.txt ]; then \
#         cp /build/requirements.txt . ; \
#     fi;

ADD ./env/${EX_ENV}/requirements.txt .

RUN pip install -r requirements.txt