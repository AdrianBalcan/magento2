echo "Cleaning Magento2 Project ..."
docker rm -f $(docker ps -qa)
docker rmi magento2_php
docker volume rm -f magento2_magento2
docker volume rm -f magento2_magento2-mysql
docker volume rm -f magento2_magento2-redis
rm ./install/is_installed
echo "Magento2 project is clean and fresh now. Enjoy it"
