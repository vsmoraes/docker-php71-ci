FROM php:7.1-alpine

RUN apk update && \
    apk add zlib zlib-dev

RUN docker-php-ext-install pdo pdo_mysql opcache zip iconv mcrypt
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
