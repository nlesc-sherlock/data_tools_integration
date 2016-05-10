# Ambari cluster

On the HPC cloud of SurfSARA create the following Virtual machines:

* Ambari master node, web UI used to install hdp stack on worker nodes
* Ambari worker nodes

# Ambari template in Open Nebula

1. Created a pub/private key pair
2. Created vm based on Ubuntu 14 template

    * Used generated pub key in context for root auth
    * Configured with internet and internal networks
    * 8 Gb RAM
    * 2 cpus
    * 50 Gb OS disk
    * ACPI = Yes

3. Instantiate

    * VM Name = shelly%i
    * Number of instances = 7

# Provision

Used https://github.com/nlesc-sherlock/shelly to provision cluster.

# Blueprint

The cluster configuration was saved in a blueprint called [shelly-blueprint.json](shelly-blueprint.json).
