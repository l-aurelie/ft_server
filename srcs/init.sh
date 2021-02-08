#!/bin/bash

service mysql start
mysql -u root < /srcs/mysql_init

ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost
rm -rf /etc/nginx/sites-enabled/default

chown -R www-data:www-data /var/www/
find /var/www// -type d -exec chmod 750 {} \;
find /var/www// -type f -exec chmod 640 {} \;

if [[ "$AUTOINDEX" == "off" ]]
then
   sed -i 's/autoindex on/autoindex off/g' /etc/nginx/sites-available/localhost;
cp /srcs/index.php /var/www/html/index.php;
fi

service nginx start
service php7.3-fpm start
