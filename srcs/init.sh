#shabang

#configure mysql
service mysql start
mysql -u root < /srcs/mysql_init

ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost

rm -rf /etc/nginx/sites-enabled/default

chown -R www-data:www-data /var/www/
chmod -R 644 /var/www/


if [[ "$AUTOINDEX" == "off" ]]
then
   sed -i 's/autoindex on/autoindex off/g' /etc/nginx/sites-available/localhost;
fi

service nginx start
service php7.3-fpm start
