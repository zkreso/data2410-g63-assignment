# Group Portfolio assignment DATA2410

This repository contains the Docker build and compose file(s) required to launch our implementation of the Docker and Zabbix use-case as outlined by the assignment.

This implementation requires the open source Sysbox runtime for Docker. It is available here on Github: [Sysbox](https://github.com/nestybox/sysbox). The Sysbox runtime is only available for Linux (WSL is not supported).

There are two alternatives to deploying the containers:
- Build VM2 and VM3 from scratch (use docker-compose-build-from-scratch.yaml)
- Pull VM2 and VM3 from snapshots hosted on dockerhub (use docker-compose-from-images.yaml)

As for VM1, both methods will pull a container preloaded with inner containers from dockerhub and load the docker-compose file for the inner container into it.

In both methods the services running inside the containers representing VM1 and VM2 are configured automatically. However neither of the methods currently set up the configuration of the Zabbix Server running in VM1. In other words, the hosts, proxies and other items needing monitoring must be set up manually via the Zabbix Web interface upon first launch. However, once set up the configuration is remembered in future sessions.
