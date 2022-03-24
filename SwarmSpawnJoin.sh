#!/bin/sh

# Get the node id of this machine from the local IP address
## ip addr | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'
## hostname -I | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'
## hostname -I | cut -d' ' -f1



if [ "$1" -gt "-1" ]
  then echo hi
fi

privateNetworkIP=`hostname -I | cut -d' ' -f1`
nodeId=`(echo $privateNetworkIP | tail -c 2)`

if [ $nodeId -eq 1 ]; then

    sudo docker swarm init
    MANAGER_KEY_IN=`sudo docker swarm join-token manager -q`
    curl --request PUT --data $MANAGER_KEY_IN http://10.0.0.51:8500/v1/kv/docker-manager-key

else 

    MANAGER_KEY_OUT=`curl -s http://10.0.0.51:8500/v1/kv/docker-manager-key?raw`
    sudo docker swarm join --token $MANAGER_KEY_OUT 10.0.0.51:2377

fi