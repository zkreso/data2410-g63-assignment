#! /bin/bash

service mariadb start
service zabbix-proxy start

exec "$@"
