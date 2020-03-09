echo "Running magento Init Container ..."
cp -frp /var/local/magento/* /var/www/html
cat /var/local/env/env.php > /var/www/html/app/etc/env.php
cd /var/www/html

php bin/magento setup:install -s
php bin/magento deploy:mode:set production
php bin/magento setup:di:compile    
php bin/magento setup:upgrade --keep-generated
php bin/magento setup:static-content:deploy -t adminhtml -f
php bin/magento maintenance:disable
chown -R 82:82 /var/www/html
