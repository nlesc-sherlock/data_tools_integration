# Swarm cluster on HPC cloud

On the HPC cloud of SurfSARA create the following Virtual machines:

* Swarm manager + consul
* Swarm node(s)

# Docker swarm template in Open Nebula

1. Created a pub/private key pair
2. Created vm based on Ubuntu 14 template

    * Used generated pub key in context for root auth
    * Configured with internet
    * 4 Gb RAM
    * 1 cpus
    * 8 Gb OS disk
    * ACPI = Yes

3. Instantiate

    * VM Name = emma%1
    * Number of instances = 2

# Provision

Used https://github.com/nlesc-sherlock/shelly to provision cluster.

# Deploy registry server

See https://docs.docker.com/registry/deploying/

Start it
```
docker -H <swarm-mananger>:4000 run -d -p 5000:5000 --restart=always --name registry registry:2
```

Push to it
```
docker tag spark-flask <swarm-node>:5000/spark-flask
docker push <swarm-node>:5000/spark-flask
```

Does not work, tls errors
