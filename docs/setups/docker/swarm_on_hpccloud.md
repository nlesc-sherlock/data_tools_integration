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
