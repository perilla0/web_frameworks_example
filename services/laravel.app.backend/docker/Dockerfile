FROM php:8.3-fpm

ARG EX_ENV=""

# 依存パッケージ作業ディレクトリ
RUN mkdir -p /depend && chmod -R 0777 /depend

RUN apt-get update \
    && apt-get install -y \
        libzip-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libpq-dev \
        libmemcached-dev \
        libicu-dev \
        zlib1g-dev \
        zip \
        unzip \
        cron \
        vim \
        iputils-ping \
        net-tools \
        dnsutils \
        wget \
        curl \
        supervisor \
        golang-go \
        git

RUN git clone https://github.com/phpredis/phpredis.git /usr/src/php/ext/redis

RUN pecl install \
        memcached \
        mongodb \
    && docker-php-ext-enable \
        memcached \
        mongodb

RUN docker-php-ext-configure \
        gd --with-freetype --with-jpeg \
    && docker-php-ext-configure \
        pcntl --enable-pcntl \
    && docker-php-ext-install -j$(nproc) \
        gd \
        bcmath \
        zip \
        redis \
        exif \
        pcntl \
        intl \
        pdo_pgsql \
        pdo_mysql

# https://hub.docker.com/_/composer
COPY --from=composer /usr/bin/composer /usr/bin/composer

# https://getcomposer.org/doc/03-cli.md#environment-variables
ENV COMPOSER_HOME /composer
ENV COMPOSER_CACHE_DIR /composer/cache
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV PATH $PATH:/composer/vendor/bin

RUN mkdir -p /composer \
        && mkdir -p /composer/cache \
        && chmod -R 0777 /composer \
        && chmod -R 0777 /composer/cache

COPY --from=node:21 /usr/local/bin/ /usr/local/bin/
COPY --from=node:21 /usr/local/lib/node_modules /usr/local/lib/node_modules

RUN mkdir -p /.npm && chmod -R 0777 /.npm

WORKDIR /var/www/laravel.app.backend