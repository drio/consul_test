service {
  name = "backend-randomer"
  # backend runs on port 7050.
  port = 7050

  meta {
    version = "v1"
  }

  # The backend service doesn't call
  # any other services so it doesn't
  # need an "upstreams" stanza.
  #
  # The connect stanza is still required to
  # indicate that it needs a sidecar proxy.
  connect {
    sidecar_service {
      # backend's proxy will listen on port 22001.
      port = 22001
    }
  }
}
