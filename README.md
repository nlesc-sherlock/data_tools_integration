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


Setup
-----

The major goal of this group is to integrate the tools used and created by the other teams into the Hadoop
based system used by the NFI. Hence, we will need a Hadoop cluster. The one selected for this project is the
[DAS-4 Hadoop Cluster](http://www.cs.vu.nl/das4/hadoop.shtml). If needed, [DAS-4 user accounts](http://www.cs.vu.nl/das4/accounts.shtml)
for the team members will requested before the sprint. The cluster is small, but it offers the perfect
environment for our project since it is easy to request access and it is not an overloaded cluster.
For large scale experiments and to run our final outcome we will use the
[Hadoop cluster](https://userinfo.surfsara.nl/systems/hadoop/description) from SURFSara which provides the
following [components](https://userinfo.surfsara.nl/systems/hadoop/software). For that we need to
[setup an account with SURFsara](https://userinfo.surfsara.nl/systems/hadoop/obtaining-account).

Here are the steps to get you up and running:
* DAS-4 Hadoop cluster: before you submit a job read the [DAS-4 Usage Policy](http://www.cs.vu.nl/das4/usage.shtml)
and [Job Execution](http://www.cs.vu.nl/das4/jobs.shtml) to learn how to submit a job. More info is under
[setup directory](https://github.com/NLeSC/Sherlock/blob/master/topics/data_tools_integration/setup). 
* SURFsara Hadoop cluster: once you have an account, get your Linux/Mac machine ready to
[access the cluster and submit jobs](https://userinfo.surfsara.nl/systems/hadoop/usage). Note, if you
only have an windows machine we advise you to install a virtual machine with linux (Ubuntu is recommended).

* Spark: the [Spark documentation](http://spark.apache.org/documentation.html) contains nice screen cast
tutorial videos for your [first steps with Spark](http://spark.apache.org/screencasts/1-first-steps-with-spark.html)
or how to setup a [stand alone job in Scala](http://spark.apache.org/screencasts/4-a-standalone-job-in-spark.html),
but also [examples](http://spark.apache.org/examples.html). There are third party globs which my also help
you in [creating a simple spark job](https://hadoopi.wordpress.com/2014/09/05/spark-create-a-simple-spark-job/)
or determine [correlation on two vectors](http://blog.sequenceiq.com/blog/2014/09/29/spark-correlation-and-testing/)
or [K-Means](http://blog.sequenceiq.com/blog/2014/07/31/spark-mllib/). Note that Spark is one of
[SURFSara components](https://userinfo.surfsara.nl/systems/hadoop/software/spark).

