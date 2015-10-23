Ambari
================

From the [Apache Ambari website](https://ambari.apache.org/): "Apache Ambari project is aimed at making Hadoop management
simpler by developing software for provisioning, managing, and monitoring Apache Hadoop clusters. Ambari provides an
intuitive, easy-to-use Hadoop management web UI backed by its RESTful APIs.".


Cloud install
-------------

Instructions for installing Ambari cluster on cloud see [INSTALL.md](INSTALL.md)

Quickstart install
------------------

Follow https://cwiki.apache.org/confluence/display/AMBARI/Quick+Start+Guide to create a ambari cluster on your PC.

Using ubuntu 14 in quick start fails. Resolve by editing Vagrantfile:
1. Set `config.vm.box` to `ubuntu/trusty64`
2. Replace `192.168.76.<ip>` by `192.168.14.<ip>`
3. Add `config.ssh.insert_key = false`

After restart of vm the vms cant be reached. Resolve by
1. Shutdown vms with `vagrant halt <hostname>`
2. Remove host-only adaptor network from Oracle VM Virtualbox Manager > Preferences > Network > Host-Only Ethernet Adapter
3. Start vms again with `vagrant up <hostname>`
