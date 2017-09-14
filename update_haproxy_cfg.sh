#!/bin/bash

docker service update --secret-rm haproxy.cfg ci_proxy &&\
 docker secret rm haproxy.cfg &&\
 cat conf/haproxy.cfg | docker secret create haproxy.cfg - &&\
 docker service update --secret-add source=haproxy.cfg,target=/usr/local/etc/haproxy/haproxy.cfg ci_proxy
