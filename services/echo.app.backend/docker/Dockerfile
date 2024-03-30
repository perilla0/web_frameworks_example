# https://hub.docker.com/_/golang
FROM golang:1.22
ARG EX_ENV=""
RUN apt-get update && apt-get install -y git

RUN mkdir -p /.cache && chmod -R 0777 /.cache

# 依存パッケージ作業ディレクトリ
RUN mkdir -p /depend && chmod -R 0777 /depend

WORKDIR /app/src
RUN chmod -R 0777 . \
    && mkdir -p public && chmod -R 0777 public