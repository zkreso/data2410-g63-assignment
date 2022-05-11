FROM ubuntu:focal
RUN apt-get update && apt-get install -y \
	zabbix-agent
COPY start.sh /
RUN chmod +x /start.sh
COPY zabbix_agentd.conf /etc/zabbix
ENTRYPOINT [ "/start.sh" ]
CMD tail -f /dev/null
