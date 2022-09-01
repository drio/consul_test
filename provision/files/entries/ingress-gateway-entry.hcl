# type of the config entry, in this case ingress-gateway.
Kind = "ingress-gateway"
# The name of the service that will be doing the ingress.
# There should be another hcl entry for that service.
Name = "ingress-gateway"
Listeners = [
  {
    Port = 8080
    Protocol = "http"
    Services = [
      {
        Name = "frontend"
        Hosts = ["localhost", "birds.local", "birds.tufts-dev.edu"]
      }
    ]
  },
  {
    Port = 8081
    Protocol = "http"
    Services = [
      {
        Name = "frontend-randomer"
        Hosts = ["localhost", "randomer.local", "randomer.tufts-dev.edu"]
      }
    ]
  }

]
