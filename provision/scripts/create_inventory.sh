#!/bin/bash

source $(dirname $0)/common.sh

cat <<EOF
[server]
$ip_server node_alias=server private_ip=$ip_server_private node_type=server ansible_user=ubuntu

[node1]
$ip_node1 node_alias=node1 private_ip=$ip_node1_private node_type=client ansible_user=ubuntu

[node2]
$ip_node2 node_alias=node2 private_ip=$ip_node2_private node_type=client ansible_user=ubuntu
EOF
