#!/bin/bash -e
mysqld_safe &
sleep 3

mysql -e "GRANT ALL PRIVILEGES *.* TO '$MYSQL_USER' INDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION;"

mysql -e "CREATE DATABASE docker_mysql"

mysql -e "CREATE TABLE docker_mysql.user(id int, name varchar(20))"

mysql -e "insert into docker_mysql.user(id, name),values(1, 'xiaoshao'),values(2, 'xiaoshao1')"