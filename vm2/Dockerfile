FROM ubuntu:focal
RUN apt-get update -y
ENV TZ=Europe/Oslo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get install wget -y
RUN wget https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.0-1+ubuntu20.04_all.deb
RUN dpkg -i --path-include=/usr/share/doc/zabbix* zabbix-release_6.0-1+ubuntu20.04_all.deb
RUN apt-get update -y && apt-get install -y \
    zabbix-proxy-mysql \
    zabbix-sql-scripts
CMD [ "bash" ] 
