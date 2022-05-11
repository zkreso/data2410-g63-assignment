#! /bin/bash

service zabbix-agent start

exec "$@"
