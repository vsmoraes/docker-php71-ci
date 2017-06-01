FROM php:7.1-cli

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get -y install git rsync zlib1g zlib1g-dev autoconf build-essential gcc python

RUN docker-php-ext-install pdo pdo_mysql opcache zip iconv
RUN yes | pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
