#!/bin/bash

clear

echo 'Going to install the LAMP stack on your machine, here we go...'
echo '------------------------'
# $1 is the password you set in the command line argument

#read -p "MySQL Password: " mysqlPassword
#read -p "Retype password: " mysqlPasswordRetype

yum install -y httpd php mysql mysql-server

chkconfig mysql-server on
chkconfig httpd on

echo restart MySQL
/etc/init.d/mysqld restart

echo Setting password from passed Argument
/usr/bin/mysqladmin -u root password $1

clear
echo 'Okay.... apache, php and mysql is installed, running and set to your desired password'

service httpd start
service iptables stop
