# Userful cmds

```sh
consul members list
sudo systemctl restart consul
sudo systemctl daemon-reload

consule reload

systemctl --type service --all | grep -P "consul|frontend|backend|ingress" | grep failed

sudo systemctl restart frontend.service
sudo systemctl restart frontend-sidecar-proxy.service
sudo systemctl restart frontend-randomer.service
sudo systemctl restart frontend-randomer-sidecar-proxy.service

journalctl -f -u frontend-randomer-sidecar-proxy.service

sudo systemctl restart ingress-gateway.service

sudo systemctl restart backend.service
sudo systemctl restart backend-sidecar-proxy.service
sudo systemctl restart backend-randomer.service
sudo systemctl restart backend-randomer-sidecar-proxy.service

consul config write proxy-defaults-entry.hcl
consul config write ingress-gateway-entry.hcl

consul config list -kind ingress-gateway

cat /etc/systemd/system/frontend

```
