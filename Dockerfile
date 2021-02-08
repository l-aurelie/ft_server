FROM debian:buster

MAINTAINER aleconte <aleconte@student.42.fr>

COPY srcs /srcs/
ENV AUTOINDEX=on
RUN apt update
RUN apt upgrade -y 
RUN apt install -y vim tar wget 
RUN apt install -y mariadb-server mariadb-client php-fpm php-mysql php-json php-mbstring nginx 

RUN mv /srcs/nginxconfig /etc/nginx/sites-available/localhost
RUN mv /srcs/nginx.key etc/ssl/nginx.key
RUN mv /srcs/nginx.crt /etc/ssl/nginx.crt

#php
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz 
RUN tar -zxvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN mv phpMyAdmin-4.9.0.1-all-languages /var/www/html/phpmyadmin
RUN mv /srcs/config.inc.php /var/www/html/phpmyadmin/config.inc.php

#wordpress
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz
RUN mv wordpress /var/www/html/wordpress 
RUN mv /srcs/wp-config /var/www/html/wp-config.php
EXPOSE 80
EXPOSE 443
CMD bash /srcs/init.sh && bash

