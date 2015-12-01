# Ambari cluster

On the HPC cloud of SurfSARA create the following Virtual machines:

* Ambari master node, web UI used to install hdp stack on worker nodes
* Ambari worker nodes


## Ambari master node

1. Created vm based on Ubuntu 14 template
    * Configured with internet and internal networks
2. Created a user with sudo rights
3. Enabled firewall to only allow connections from internal and office ip range
4. Installed ambari server using instructions from https://cwiki.apache.org/confluence/display/AMBARI/Install+Ambari+2.1.2+from+Public+Repositories
5. Login to Web UI
6. Change password of admin account

## Ambari worker node

1. Created a pub/private key pair
2. Created vm based on Ubuntu 14 template
    * Used generated pub key in context for root auth
    * Configured with internet and internal networks
3. Enabled firewall to only allow connections from internal and office ip range
4. Installed docker using instructions from https://docs.docker.com/installation/ubuntulinux/
5. Install ambari dependencies
    * `apt-get install ntp`
6. Configure hostname
    1. Add `search <domain>` to /etc/resolv.conf
    2. Set hostname by `hostname <hostname>`
    3. Add `<hostname>` to /etc/hostname
    4. Remove `127.0.1.1` line from /etc/hosts (otherwise daemons bind to wrong network)

## Setup hostnames

Route traffic between nodes via internal network by adding `<internal ip> <fqdn> <hostname>` entries for each node in /etc/hosts at each node.

## Create hdp cluster

1. Login to ambari web ui
2. Fill fqdn of all worknodes
3. Fill private key with key generated at first step of worker node installation.
4. Choose stack items: yarn, mapreduce, zookeeper, ambari metrics, spark.

## Add user

1. On each node create a posix user called `sherlock`.
2. Create hdfs homedir
    * `sudo -u hdfs hdfs dfs -mkdir /user/sherlock`
    * `sudo -u hdfs hdfs dfs -chown sherlock /user/sherlock`
3. User can perform hdfs/mapred/spark on any node with the clients installed.

## Allow yarn to run docker containers

On all workers do
```
adduser yarn docker
```
Restart yarn/mapred2/hdfs so the shell scripts executed by a user is a member of the docker group.
