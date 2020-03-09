#!/bin/sh
#if [ ! -f /install/is_installed ]; then
#    echo "Magento is not installed! Installing ..."
    echo "Running magento Install Container ..."
    cd /var/local/magento
    php bin/magento setup:install \
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
        --backend-frontname=$ADMIN_PATH

    php bin/magento setup:config:set \
        --cache-backend=redis \
        --cache-backend-redis-server=redis-magento \
        --cache-backend-redis-db=0
    php bin/magento setup:config:set \
        --page-cache=redis \
        --page-cache-redis-server=redis-magento \
        --page-cache-redis-db=1
    php bin/magento setup:config:set \
        --session-save=redis \
        --session-save-redis-host=redis-magento \
        --session-save-redis-log-level=3 \
        --session-save-redis-db=2

    #if [[ "$?" -gt 0 ]] ; then echo Build failed ; exit 127 ; fi

    echo Build successful
    php bin/magento deploy:mode:set developer
    php bin/magento index:reindex
    php bin/magento setup:upgrade
    php bin/magento setup:di:compile    
    php bin/magento setup:static-content:deploy -f en_GB en_US
    php bin/magento maintenance:disable
    php bin/magento config:set dev/static/sign 0
    
    #php /var/local/integrations_oauth.php

    #echo 1 > /install/is_installed

    #chmod -R 777 /var/www/html/var
    #chmod -R 777 /var/www/html/generated
    sleep 5
    cat /var/local/magento/app/etc/env.php
    exit 0
#else
#    echo "Magento is already installed!"
#fi

#if ! cmp /var/local/magento/composer.json /var/www/html/composer.json >/dev/null 2>&1
#then
#  cp -rpf /var/local/magento/composer.json /var/www/html/composer.json
#  composer update
#  php bin/magento setup:upgrade
#  php bin/magento setup:di:compile
#fi
#chown -R www-data:www-data /var/www/html
#php bin/magento setup:upgrade
#php-fpm --allow-to-run-as-root
