FROM ubuntu:focal
RUN apt-get update && apt-get install -y \
	zabbix-agent
COPY start.sh /
RUN chmod +x /start.sh
COPY zabbix_agentd.conf /etc/zabbix
COPY zabbix_agent.psk /etc/zabbix
RUN chown zabbix:zabbix /etc/zabbix/zabbix_agent.psk
RUN chmod 644 /etc/zabbix/zabbix_agent.psk
ENTRYPOINT [ "/start.sh" ]
CMD tail -f /dev/null
