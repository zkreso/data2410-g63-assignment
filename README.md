# Group Portfolio assignment DATA2410

This repository contains the Docker build and compose file(s) required to launch our implementation of the Docker and Zabbix use-case as outlined by the assignment.

This implementation requires the open source Sysbox runtime for Docker. It is available here on Github: [Sysbox](https://github.com/nestybox/sysbox). The Sysbox runtime is only available for Linux (WSL is not supported).

The services running on containers VM2 and VM3 are installed from scratch on an empty Ubuntu container on first execution (via the supplied Dockerfiles). Preconfigured settings are copied to the containers when built first time. The configuration of the Zabbix Server running on an inner container in VM1 must be done via the web interface after the firrst execution (meaning hosts, templates and proxies have to be added manually).
