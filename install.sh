#!/bin/bash


apt update -y
clear

apt install sudo -y
sudo apt install unzip -y
sudo apt install wget -y
sudo apt install git -y
sudo apt install sed -y
sudo apt install curl -y
sudo apt-get install software-properties-common -y
sudo apt-get install python3-software-properties -y
sudo apt-get install python-software-properties -y
sudo apt install apache2 -y
sudo add-apt-repository ppa:ondrej/php
apt update -y 
apt install php7.1 php7.1-xml php7.1-zip libapache2-mod-php7.1 -y

echo "Installing PHPSysInfo..."
cd /var/www/html
rm -rf *
wget https://github.com/phpsysinfo/phpsysinfo/archive/master.zip
unzip master.zip 
mv phpsysinfo-main/* .
mv phpsysinfo.ini.new phpsysinfo.ini 

echo "Changing Apache Port onto 4210"
sudo sed -i 's/Listen 80/Listen 4210/' /etc/apache2/ports.conf

echo "Restarting Apache2 Server..."
service apache2 restart 


echo "Done! Server has been configured!"
echo "Test port YourIp:4210"