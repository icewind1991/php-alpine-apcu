FROM php:7.4-fpm-alpine

RUN apk add --no-cache postgresql-dev wget autoconf g++ libc-dev make pcre-dev \
    && mkdir -p /app/src \
    && docker-php-ext-install pdo_pgsql \
    && pecl install apcu \
    && docker-php-ext-enable apcu \
    && apk del autoconf g++ libc-dev make pcre-dev \
    && sed -i -- 's/www-data/nobody/g' /usr/local/etc/php-fpm.d/www.conf
