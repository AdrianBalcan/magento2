#!/bin/sh
if [ ! -f /install/is_installed ]; then
    echo "Magento is not installed! Installing ..."
    cp -rTpf /var/local/magento2/ /var/www/html/
    cd /var/www/html
    php bin/magento setup:install -n \
        --db-host=$DB_HOST \
        --db-name=$MYSQL_DATABASE \
        --db-user=$MYSQL_USER \
        --db-password=$MYSQL_PASSWORD \
        --admin-user=$ADMIN_USER \
        --admin-email=$ADMIN_EMAIL \
        --admin-password=$ADMIN_PASSWORD \
        --admin-firstname=$ADMIN_FIRSTNAME \
        --admin-lastname=$ADMIN_LASTNAME \
        --base-url=$BASE_URL \
        --backend-frontname=$ADMIN_PATH \
        --amqp-host=$AMQP_HOST \
        --amqp-port=$AMQP_PORT \
        --amqp-user=$RABBITMQ_DEFAULT_USER \
        --amqp-password=$RABBITMQ_DEFAULT_PASS

    php bin/magento setup:config:set -n \
        --cache-backend=redis \
        --cache-backend-redis-server=magento-redis \
        --cache-backend-redis-db=0
    php bin/magento setup:config:set -n \
        --page-cache=redis \
        --page-cache-redis-server=magento-redis \
        --page-cache-redis-db=1
    php bin/magento setup:config:set -n \
        --session-save=redis \
        --session-save-redis-host=magento-redis \
        --session-save-redis-log-level=3 \
        --session-save-redis-db=2

    if [[ "$?" -gt 0 ]] ; then echo Build failed ; exit 127 ; fi

    echo Build successful
    php bin/magento deploy:mode:set developer
    php bin/magento index:reindex
    php bin/magento setup:upgrade
    php bin/magento setup:di:compile    
    php bin/magento setup:static-content:deploy -f en_GB en_US
    php bin/magento maintenance:disable  
    
    #php /var/local/integrations_oauth.php

    echo 1 > /install/is_installed

    chmod -R 777 /var/www/html/var
    chmod -R 777 /var/www/html/generated
else
    echo "Magento is already installed!"
fi

#if ! cmp /var/local/magento/composer.json /var/www/html/composer.json >/dev/null 2>&1
#then
#  cp -rpf /var/local/magento/composer.json /var/www/html/composer.json
#  composer update
#  php bin/magento setup:upgrade
#  php bin/magento setup:di:compile
#fi
#chown -R www-data:www-data /var/www/html
#php bin/magento setup:upgrade
php-fpm --allow-to-run-as-root
