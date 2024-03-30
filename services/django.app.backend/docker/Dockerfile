# https://github.com/docker/awesome-compose/tree/master/official-documentation-samples/django/
# https://gunicorn.org/
# https://docs.djangoproject.com/en/5.0/howto/deployment/wsgi/gunicorn/
FROM python:3.12

ARG EX_ENV=""
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# 依存パッケージ作業ディレクトリ
RUN mkdir -p /depend && chmod -R 0777 /depend

# requirements.txt
WORKDIR /depend_def
RUN chmod -R 0777 /depend_def
ADD ./env/${EX_ENV}/requirements.txt /depend_def
RUN pip install -r requirements.txt

# プロジェクトディレクトリ
WORKDIR /app/src
RUN chmod -R 0777 . \
    && mkdir -p public && chmod -R 0777 public
