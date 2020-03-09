#Uses latest from magento-base repository
FROM php:7.2.16-fpm-alpine3.9

WORKDIR /var/www/html
ENV COMPOSER_ALLOW_SUPERUSER=1
RUN apk --update add wget \
        curl \
        freetype-dev \
        libpng-dev \
        libjpeg-turbo-dev \
        icu-dev \
        libxml2-dev \
        libsodium-dev \
        libxslt-dev \
        git
RUN rm /var/cache/apk/*
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install \
        bcmath \
        gd \
        intl \
        mbstring \
        pdo_mysql \
        soap \
        sodium \
        xsl \
        zip
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer 

COPY ./config/auth.json /root/.composer/auth.json
#COPY ./auth.json .
#COPY ./composer.json .
#COPY ./magento2/ .
COPY ./config/php-fpm/www.conf /usr/local/etc/php-fpm.d/www.conf
RUN echo "memory_limit = -1" > /usr/local/etc/php/conf.d/memory_limit.ini
RUN composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition:2.3.4 /var/local/magento2 ;
#RUN echo "extension=sodium.so" > /usr/local/etc/php/conf.d/libsodium.ini
#RUN composer config repositories.divante vcs https://github.com/DivanteLtd/magento2-vsbridge-indexer
#RUN composer require divante/magento2-vsbridge-indexer:dev-master
#RUN composer install
#RUN rm auth.json
#CMD tail -f /dev/null
CMD /run.sh
#WORKDIR /var/www/html
##FROM 682547640436.dkr.ecr.eu-west-1.amazonaws.com/zento/magento-base:20
#
### Ensure working directory
#WORKDIR /var/www/html

#COPY ./configs/docker-php.ini /usr/local/etc/php/conf.d/docker-php.ini
#RUN cp -rfp /var/local/magento /var/www/html
#COPY ./magento/app/code /var/www/html/app/code
#COPY ./config/bin/run.sh /run.sh
#COPY ./config/bin/run-dev.sh /run-dev.sh
#COPY ./config/bin/run-install.sh /run-install.sh
#
#RUN chown -R www-data:www-data /var/www/html
#
#RUN if [ -d "/var/www/html/var" ]; then \
#  chmod -R 777 /var/www/html/var/; \
#fi
#
#RUN if [ -d "/var/www/html/generated" ]; then \
#  chmod -R 777 /var/www/html/generated/; \
#fi
#
#RUN if [ -d "/var/www/html/pub/media" ]; then \
#  chmod -R 777 /var/www/html/pub/media; \
#fi
#
#RUN if [ -d "/var/www/html/pub/static" ]; then \
#  chmod -R 777 /var/www/html/pub/static; \
#fi
