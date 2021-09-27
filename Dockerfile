FROM openwrtorg/rootfs:x86-64
COPY pkg/*.ipk /
COPY config/* /
USER root

RUN 	mkdir /var/lock && \
	mkdir -p /etc/salt/pki/master && \
	opkg update && \
	opkg install /*.ipk && \
	cp /master /etc/salt/ && \
	cp /minion /etc/salt/

CMD ["/sbin/init"]
