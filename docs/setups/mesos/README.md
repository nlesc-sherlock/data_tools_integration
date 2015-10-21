Mesos
================

From the [mesos web-site]() "Apache Mesos abstracts CPU, memory, storage, and other compute resources away from
machines (physical or virtual), enabling fault-tolerant and elastic distributed systems to easily be built and
run effectively. Mesos is built using the same principles as the Linux kernel, only at a different level of
abstraction. The Mesos kernel runs on every machine and provides applications (e.g., Hadoop, Spark, Kafka, Elastic
Search) with API’s for resource management and scheduling across entire datacenter and cloud environments.".

The [mesos architecture](http://mesos.apache.org/documentation/latest/architecture/) shows the main components
of Mesos. Mesos consists of a master daemon that manages slave daemons running on each cluster node, and mesos
applications (also called frameworks) that run tasks on these slaves. More information can be found in their
[technical paper](http://mesos.berkeley.edu/mesos_tech_report.pdf).

