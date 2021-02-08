FROM debian:buster

MAINTAINER aleconte <aleconte@student.42.fr>

COPY srcs /srcs/

RUN apt update
RUN apt upgrade -y
RUN apt install -y vim mariadb-server mariadb-client php-fpm php-mysql nginx 
EXPOSE 80
