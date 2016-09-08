#!/bin/bash

echo "Создаем копии если их нет"

FILE[0]="/etc/mysql/mysql.conf.d/mysqld.cnf"
FILE[1]="/etc/apache2/conf-available/charset.conf"
FILE[2]="/etc/apache2/apache2.conf"
FILE[3]="/etc/php/7.0/apache2/php.ini"

for i in 0 1 2 3
do
	if [ ! -f ${FILE[$i]}".copy" ]
	then
		cp ${FILE[$i]} ${FILE[$i]}".copy"
	fi
done

echo "Копируем mysqld.cnf"
sudo cp mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

echo "Копируем charset.conf"
sudo cp charset.conf /etc/apache2/conf-available/charset.conf

echo "Копируем apache2.conf"
sudo cp apache2.conf /etc/apache2/apache2.conf

echo "Копируем php.ini"
sudo cp php.ini /etc/php/7.0/apache2/php.ini

echo "Делаем anton владельцем /var/www/html"
sudo chown anton /var/www/html

echo "Удаляем /var/www/html/index.html если такой есть"
if [-f "/var/www/html/index.html" ]
then
	sudo rm /var/www/html/index.html
fi

