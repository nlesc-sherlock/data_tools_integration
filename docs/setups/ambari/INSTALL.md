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

# Ansible

To make changes to all workers use ansible http://www.ansible.com/.

Add private key for root@worker-machine to ~/.ssh/id_rsa.

Install it by
```
sudo apt-get install python-pip python-dev markupsafe
sudo pip install ansible
```
Create `/etc/ansible/hosts` file with
```
[workers]
<hostnames of workers>
```
Run command on all workers with
```
ansible all -u root -a 'docker pull nlesc/imagenet1000'
```

# Upgrade from 2.1.2 to 2.2.0

Follow instructions at http://docs.hortonworks.com/HDPDocuments/Ambari-2.2.0.0/bk_upgrading_Ambari/content/_ambari_upgrade_guide.html

```
mkdir 2.2.1-backup
cp /etc/ambari-server/conf/ambari.properties .
sudo -u postgres pg_dumpall -f /tmp/pg-11022016.dump
mv /tmp/pg-11022016.dump .
# stop metrics
ambari-server stop
ansible all -u root -a 'ambari-agent stop'
wget -nv http://public-repo-1.hortonworks.com/ambari/ubuntu14/2.x/updates/2.2.0.0/ambari.list -O /etc/apt/sources.list.d/ambari.list
apt-get clean all
apt-get update 
apt-cache show ambari-server | grep Version
apt-get install ambari-server
ansible all -u root -a 'wget -nv http://public-repo-1.hortonworks.com/ambari/ubuntu14/2.x/updates/2.2.0.0/ambari.list -O /etc/apt/sources.list.d/ambari.list'
ansible all -u root -a 'apt-get update'
ansible all -u root -a 'apt-get install ambari-agent'
ansible all -u root -a 'apt-cache show ambari-agent'
ambari-server upgrade
ambari-server start
ansible all -u root -a 'ambari-agent start'
ansible all -u root -a 'apt-get install ambari-metrics-assembly'
# start metrics
# restart non metrics
```

## Upgrade HDP from 2.3.2 to 2.3.4

Follow http://docs.hortonworks.com/HDPDocuments/Ambari-2.2.0.0/bk_upgrading_Ambari/content/_upgrading_hdp_stack.html

1. Skip Checkpoint hdfs, we don't have an HA setup
2. Register 2.3.4 urls from http://docs.hortonworks.com/HDPDocuments/Ambari-2.2.0.0/bk_Installing_HDP_AMB/content/_hdp_stack_repositories.html
3. Stop yarn 
4. Perform upgrade

5 of 6 hdfs datanodes did not restart, ignoring.
Completion stuck on datanodes, decommisioned, stopped and if needed deleted them.
After finalize node 2..6 where made hdfs datanodes again.
Deleted hdfs datanode from 4 and 5

# Add Hive

Added Hive service for usage in Spark.


 
