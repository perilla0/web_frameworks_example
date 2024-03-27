FROM nginx:latest

RUN rm -f /etc/nginx/conf.d/*

RUN mkdir -p /etc/nginx/ssl && chmod -R 0777 /etc/nginx/ssl

COPY ./docker/nginx.web.frontend/csr.conf /etc/nginx/ssl/

RUN openssl genrsa -out /etc/nginx/ssl/server.key 2048
RUN openssl req -new -config /etc/nginx/ssl/csr.conf -key /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.csr
RUN openssl x509 -days 7300 -req -signkey /etc/nginx/ssl/server.key -in /etc/nginx/ssl/server.csr -out /etc/nginx/ssl/server.crt

CMD /usr/sbin/nginx -g "daemon off;"

WORKDIR /var/www
RUN chmod -R 0777 . \
    && mkdir -p public && chmod -R 0777 public