# https://hub.docker.com/_/golang
FROM golang:1.22
RUN apt-get update && apt-get install -y git
RUN mkdir -p /.cache && chmod -R 0777 /.cache
WORKDIR /app/src
RUN chmod -R 0777 . \
    && mkdir -p public && chmod -R 0777 public