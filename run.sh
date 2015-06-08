#!/bin/sh

HOST_IP=$(echo $HOST_IP | sed 's|\[||g')
HOST_IP=$(echo $HOST_IP | sed 's|\]||g')
HOST_IP=$(echo $HOST_IP | sed -r "s|(')||g")

export HOST_IP=$HOST_IP

LOCAL_IP=$(ifconfig eth0 2>/dev/null|awk '/inet addr:/ {print $2}'|sed 's/addr://')

export LOCAL_IP=$LOCAL_IP

/bin/etcd  -name $ETCD_NODE_NAME -data-dir=/data -initial-advertise-peer-urls http://$HOST_IP:2380 -listen-peer-urls http://$LOCAL_IP:2380   -listen-client-urls http://$LOCAL_IP:4001,http://$LOCAL_IP:2379 -advertise-client-urls http://$LOCAL_IP:4001,http://$LOCAL_IP:2379 -discovery $DISCOVERY_URL -initial-cluster-state new
