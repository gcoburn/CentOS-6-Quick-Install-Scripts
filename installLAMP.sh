#!/bin/bash
# $1 is the password you set in the command line argument
# execute this script by curl -s https://raw.githubusercontent.com/gcoburn/CentOS-6-Quick-Install-Scripts/gcoburn-mySQLpass-input/installLAMP.sh | bash /dev/stdin CHANGEPASSWORD

clear

echo 'Going to install the LAMP stack on your machine, here we go...'
echo '------------------------'

yum install -y httpd php mysql mysql-server

chkconfig mysql-server on
chkconfig httpd on
chkconfig iptables off

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

