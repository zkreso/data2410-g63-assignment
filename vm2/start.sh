#! /bin/bash

service mariadb start
service zabbix-proxy start
service nginx start

exec "$@"
