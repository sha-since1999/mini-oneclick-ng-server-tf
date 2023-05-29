#!/bin/bash
{
sudo su -  #user-data by default run as root so sudo not required but others it will
apt update 
apt install nginx -y
service nginx start
service nginx status
echo " Hi Rohit " > /var/www/html/index.nginx-debian.html
} 2>&1 | tee /var/log/bootstrap-script.log