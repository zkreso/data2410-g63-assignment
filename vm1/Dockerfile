FROM zkreso/ubuntu-syscont-zabbix-stack
RUN mkdir /dock
COPY docker-compose.yaml /dock
COPY docker-start.sh /usr/bin
RUN chmod +x /usr/bin/docker-start.sh
ENTRYPOINT [ "/usr/bin/docker-start.sh" ]
CMD tail -f /dev/null
