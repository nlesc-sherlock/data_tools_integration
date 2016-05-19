We now have Spark running in Virtual Machines. This requires a lot of work on the VMs. 
We should be able to use docker to run a Spark cluster.

# Containers

* Spark master 
* Spark worker
* Spark client
* HDFS name node
* HDFS data node
* HDFS client, could be same as Spark client

A docker-compose file should be used to start the cluster.
The Spark worker and HDFS data node should be scalable (aka number of workers increased or decreased).
The workers and data nodes should be spread over the docker swarm evenly.

# Links

See http://www.big-data-europe.eu/scalable-sparkhdfs-workbench-using-docker/ howto create a spark cluster.

See https://github.com/amplab/docker-scripts for way to test Spark (2014).

See https://medium.com/on-docker/docker-overlay-networks-that-was-easy-8f24baebb698 howto create cluster with own network.

See http://sequenceiq.com/cloudbreak-docs/latest/ howto deploy Spark using Ambari.

See http://www.47deg.com/blog/tags/sparkonletscode for a streaming Spark/Akka/Cassandra setup.

