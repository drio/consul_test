function getIP() {
  local s=$1
  cd $(dirname $0)/../../infrastructure
  o=$(terraform output | grep $s | awk '{print $3}' | gsed -s 's/"//g')
  echo $o
}

ip_server=$(getIP server_public_ip)
ip_server_private=$(getIP server_private_ip)

ip_node1=$(getIP node1_public_ip)
ip_node1_private=$(getIP node1_private_ip)

ip_node2=$(getIP node2_public_ip)
ip_node2_private=$(getIP node2_private_ip)
