FROM ubuntu:focal
RUN apt-get update -y
ENV TZ=Europe/Oslo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get install wget software-properties-common curl -y
RUN sed -i '8 s/^/#/' /etc/dpkg/dpkg.cfg.d/excludes
RUN wget https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.0-1+ubuntu20.04_all.deb
RUN dpkg -i zabbix-release_6.0-1+ubuntu20.04_all.deb
RUN apt-get update -y && apt-get install -y \
    zabbix-proxy-mysql \
    zabbix-sql-scripts
RUN curl -LsS -O https://downloads.mariadb.com/MariaDB/mariadb_repo_setup && bash mariadb_repo_setup --mariadb-server-version=10.6
RUN apt-get update -y && apt -y install mariadb-common mariadb-server-10.6 mariadb-client-10.6
RUN service mariadb start && \
    mysql -u root -e "UPDATE mysql.global_priv SET priv=json_set(priv, '$.plugin', 'mysql_native_password', '$.authentication_string', PASSWORD('rootDBpass')) WHERE User='root';" && \
    mysql -u root -p'rootDBpass' -e "DELETE FROM mysql.global_priv WHERE User='';" && \
    mysql -u root -p'rootDBpass' -e "DELETE FROM mysql.global_priv WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');" && \
    mysql -u root -p'rootDBpass' -e "DROP DATABASE IF EXISTS test;" && \
    mysql -u root -p'rootDBpass' -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%'" && \
    mysql -u root -p'rootDBpass' -e "FLUSH PRIVILEGES;" && \
    mysql -u root -p'rootDBpass' -e "create database zabbix_proxy character set utf8mb4 collate utf8mb4_bin;" && \
    mysql -u root -p'rootDBpass' -e "grant all privileges on zabbix_proxy.* to zabbix@localhost identified by 'zabbixDBpass';"
RUN service mariadb start && \
    cat /usr/share/doc/zabbix-sql-scripts/mysql/proxy.sql | mysql -uzabbix -p'zabbixDBpass' zabbix_proxy
COPY start.sh /
COPY zabbix_proxy.conf /etc/zabbix
RUN chmod +x /start.sh
ENTRYPOINT [ "/start.sh" ]
CMD tail -f /dev/null
