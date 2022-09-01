service {
  name = "frontend-randomer"

  # frontend runs on port 6060.
  port = 7060

  # The "connect" stanza configures service mesh
  # features.
  connect {
    sidecar_service {
      # frontend's proxy will listen on port 21001.
      port = 21001

      proxy {
        # The "upstreams" stanza configures
        # which ports the sidecar proxy will expose
        # and what services they'll route to.
        upstreams = [
          {
            # Here you're configuring the sidecar proxy to
            # proxy port 6001 to the backend service.
            destination_name = "backend-randomer"
            local_bind_port  = 7061
          }
        ]
      }
    }
  }
}
