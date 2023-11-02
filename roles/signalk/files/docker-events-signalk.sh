#!/bin/bash
set -e

function configure_vxcan() {
    ip link add vxcan$(($1*2)) type vxcan peer name vxcan$(($1*2+1))
    ip link set vxcan$(($1*2+1)) netns $2
    ip link set vxcan$(($1*2)) up
    nsenter -t $2 -n ip link set vxcan$(($1*2+1)) up
    cangw -A -s can$1 -d vxcan$(($1*2)) -e
    cangw -A -s vxcan$(($1*2)) -d can$1 -e
}

docker events --filter container=signalk-server --filter event=start --format {{.ID}} | (
    while read line; do
        container_pid=$(docker inspect -f '{{.State.Pid}}' $line)
        configure_vxcan 0 $container_pid
        configure_vxcan 1 $container_pid
    done
)
