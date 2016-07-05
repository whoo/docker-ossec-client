FROM debian:jessie
RUN apt-key adv --fetch-keys http://ossec.wazuh.com/repos/apt/conf/ossec-key.gpg.key
RUN echo "deb http://ossec.wazuh.com/repos/apt/debian jessie main" >> /etc/apt/sources.list
RUN apt-get -y update && apt-get -y upgrade && apt-get -y install ossec-hids-agent && rm -rf /var/lib/apt/lists/*

COPY ossec.conf	/var/ossec/etc/
COPY run.sh	/
CMD chown root:ossec /var/ossec/etc/ossec.conf

ENTRYPOINT /run.sh
