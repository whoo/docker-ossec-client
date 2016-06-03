#!/bin/bash


/var/ossec/bin/agent-auth -m OssecServ
/etc/init.d/ossec start


function ossec_shutdown(){
/var/ossec/bin/ossec-control stop;
}

trap "ossec_shutdown; exit" SIGINT SIGTERM

while true
do

	sleep 5 
done
