#!/bin/sh

HOST_IP=$(echo $HOST_IP | sed 's|\[||g')
HOST_IP=$(echo $HOST_IP | sed 's|\]||g')
HOST_IP=$(echo $HOST_IP | sed -r "s|(')||g")

/bin/etcd  -name $ETCD_NODE_NAME -data-dir=/data -initial-advertise-peer-urls http://$HOST_IP:2380 -listen-peer-urls http://$HOST_IP:2380 -discovery $DISCOVERY_URL
