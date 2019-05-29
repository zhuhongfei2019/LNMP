#!/bin/bash
#装脚本之前需搭好yum,包lnmp_soft.tar.gz放在目录/root/下,该脚本可实现一键部署NMLP环境
yum -y install gcc openssl-devel pcre-devel
useradd -s /sbin/nologin nginx
cd /root/
tar -xf lnmp_soft.tar.gz
cd lnmp_soft
tar -xf nginx-1.10.3.tar.gz
cd nginx-1.10.3
./configure --prefix=/usr/local/nginx --user=nginx --group=nginx --with-http_ssl_module
make && make install
/usr/local/nginx/sbin/nginx
ln -s /usr/local/nginx/sbin/nginx /sbin/
netstat -atunlp | grep nginx
yum -y install   mariadb   mariadb-server   mariadb-devel
yum -y  install  php   php-mysql
yum -y  install php-fpm
systemctl stop httpd
/usr/local/nginx/sbin/nginx
netstat -utnlp | grep :80
systemctl start  mariadb
echo "当前mariadb服务状态"
systemctl status mariadb
systemctl enable mariadb
systemctl start php-fpm
echo "当前php-fpm服务状态"
systemctl status php-fpm
systemctl enable php-fpm
