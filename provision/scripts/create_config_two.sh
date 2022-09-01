#!/bin/bash

source $(dirname $0)/common.sh

cat <<EOF
---
server_private_ip: $ip_server_private
EOF
