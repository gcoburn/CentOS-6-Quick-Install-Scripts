#!/bin/bash
# $1 is the password you set in the command line argument

clear

echo 'Going to install the LAMP stack on your machine, here we go...'
echo '------------------------'

yum install -y httpd php mysql mysql-server

chkconfig mysql-server on
chkconfig httpd on

echo restart MySQL
/etc/init.d/mysqld restart

echo Setting password from passed Argument
/usr/bin/mysqladmin -u root password $1

echo 'Starting Apache'
service httpd start

echo 'Stopping iptables'
service iptables stop

clear
echo 'Okay.... apache, php and mysql is installed, running and set to your desired password'

