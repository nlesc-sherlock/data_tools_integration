Tools and Data Integration (TDI)
================

One of the challenges we face at the NLeSC is the large and heterogeneous collection of libraries, tools,
and data available to us. Integrating many existing components into a single system is a important topic
in many of our projects. Sherlock offers us the perfect setting to improve our skills in this area. How
do we combine the solutions developed by the different Sherlock groups? How do we efficiently access data
stored in different formats (possibly in a distributed setting)? How do we combine this data into a single
result? How do we integrate everything into the existing NFI workflow? How do we execute this workflow
efficiently?

Within Sherlock project we want to develop knowledge and techniques on assembling heterogeneous components
into a large and effective system. For this task we will mainly focus on applications containers (such as
[Docker](https://www.docker.com/whatisdocker), few [NLeSC examples](https://hub.docker.com/u/nlesc/) and
[docker tooling](https://github.com/NLeSC/Sherlock/blob/master/topics/data_tools_integration/option_2/docker-tooling.md)),
etc. 

Note:
-----
Any documentation which cannot be made public available on github it will be placed at the
[Sherlock one drive's tool and data integration directory](https://nlesc.sharepoint.com/sites/sherlock/Shared%20Documents/papers/tool%20and%20data%20integration).

Related Repositories
---------------------
[shelly](https://github.com/nlesc-sherlock/shelly) : Create hadoop/spark cluster using Ambari and Docker swarm with Ansible

[uplift](https://github.com/nlesc-sherlock/uplift) : Web Application to upload/ingest files into hdfs

[hdfs-dfs-client-docker](https://github.com/nlesc-sherlock/hdfs-dfs-client-docker) :  Docker-based tool capable of interacting with a remote hdfs filesystem

[hadoop-streaming-docker](https://github.com/nlesc-sherlock/hadoop-streaming-docker) : Hadoop streaming python inside docker

[yarn-docker](https://github.com/nlesc-sherlock/yarn-docker) : Yarn applications running docker containers

[spark-docker](https://github.com/nlesc-sherlock/spark-docker) : Running docker containers inside Spark.

[spark-flask](https://github.com/nlesc-sherlock/spark-flask) : Webservice which runs sparksql queries in a docker container.

