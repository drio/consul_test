# This we want in the consule image:

The user_data script from terraform will:
  - packages: net-tools git
  - consul binary
  - envoy binary
  - docker (just in case)

Files:

  - consul (server)
    DONE - server.hcl
    DONE - client.hcl
    DONE -> enable/start consul

    DONE - fe-service.hcl
    DONE - be-service.hcl
    -> reload consul config

  - systemd (node1)
    DONE - fe.service
    DONE - fe-sidecar-proxy.service
    -> enable/start

  - systemd (node2)
    DONE - be.service
    DONE - be-sidecar-proxy.service
    -> enable/start
