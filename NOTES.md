# Ingress Gateways

When setting the ingress gateway I set it up in the server node. We don't 
want to do that because we don't want work load in the server nodes. We 
want all the resources in those boxes to go to keeping the mesh healthy. 

## Pieces to deploy an ingress service

### Part 1

1. The hcl configuration of the new service (ingress_gateway.hcl)
2. The systemd service definition that runs the process that performs the 
routing to the service we want. 

If you run this, we have a new ingress service but we don't have any traffic
going through it yet (0 upstreams).

### Part 2 

Then we need two entries. Entries are dynamic configuration parameters for the
consul mesh. You run then directly against consul and consul acts on them 
immediately. These are different to the regular configuration statements we
have been using. Although, keep in mind they are also defined via hcl.

There are three types of config entries: Ingress gateway, Proxy defaults and
service intentions (auth rules).

3. `ingress-gateway-entry.hcl`: Here we are telling consul we want to use an 
ingress service (the one configured in points 1 and 2) to route traffic on 
an internal service. So we are saying: I want port 8080 on this machine to 
go to service frontend. 

4. `proxy-defaults-entry.hcl`: We need another entry because by default consul
will think the services are all tcp. We tell it to use http. We need to run this
entry first, before the previous (3) one. 

I am currently running (1,2,3,4) from the server. But we don't want to run 1 and 2
from the server, we want them in a worker node. What can we do?

## Moving the ingress gateway process to a worker node

If I am not mistaken, we just need to move 1 and 2 to one of the worker nodes.
Let's try it.

Yes, it works.

# Adding a new service (FE/BE type of service)

Let's add a new service. Same deal, a frontend and a backend. 

First, what are the pieces we need to add a new service:

- FE:

  1. hcl config
  2. systemd service
  3. systemd side car proxy
  4. the binary that implements the service (or something to run)

- BE:
  1. hcl config
  2. systemd service
  3. systemd side car proxy
  4. the binary that implements the service (or something to run)

- Ingress:
  1. Route traffic to new service (new ingress entries)

In terms of the provisioning (ansible) this means:

  1. create all the files (and update copy_files tasks).
  2. add the service (tasks)
  3. add the help commands in the user_data script (infrastructure)

Once you have that in place you can transfer the files via ansible and make sure
that works correctly. Then, you can ssh to the machine and manually:

  0. restart consul (so we add the new service)
  1. start the fe + sidecar services
  2. start the be + sidecar services.






