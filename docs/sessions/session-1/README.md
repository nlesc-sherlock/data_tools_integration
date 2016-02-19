Session 1:
==========

* Day 1: Define our strategy and work plan for our 3 days session. As first step our group did an installation
of Docker and Hadoop single node cluster on different operating systems such as Ubuntu and Fedora. Information
about Docker and Hadoop as well as installation instruction can be found at:....

With everything up and running we created a docker image and deploy it on each machine. Examples on how to run
a docker image can be found:.

The second step consisted in making all the files stored in HDFS accessible as POSIX. For that we considered
two options, FUSE and NFS, where the HDFS will be mounted as a directory to be provided as input to the Docker instance.
Fuse does not seem to be the way to go. NFS seems to be easy to setup and use most of the time. Niels succeeded
in getting is up and running.

* Day 2: Now that each Docker instance as a view on all the HDFS data, it is necessary to exploit data locality.
Since the tools to be developed during Sherlock project are to be used at the end of the Hansken pipeline, the
input is a set of files. Hence, a possible solution would be to define a list of files, which are local, to be
consumed by the Docker instance. Such list of files could be extracted from the Traces created in Hansken on
each iteration. 
With further analyzes of the Hansken pipeline it was concluded such approach requires a specialized scheduler.
A scheduler which interprets the traces, identifies the blockIDs for which the Trace belongs to advise Hadoop where
to execute the Docker Instance.
Hence, it was decided to move up for a more generic solution which would exploit Hadoop internals, its balance
scheduling and fault-tolerance, to execute Docker instances over data stored in HDFS. As first step towards that
goal we decided to implement a Map-Docker function. Such function will run a simple Docker instance using a Java
"System call".

* Day 3: With a docker instance running inside a Mapper, the next step is to define different strategies to
provide input data and collect the output data. The first option is to use the stdin and stdout using the Hadoop
streaming API as in this example to run [Python code](http://www.michael-noll.com/tutorials/writing-an-hadoop-mapreduce-program-in-python/).
Hence, the first step is to execute Python code to test the Hadoop streaming while the second one is to execute
the python code inside a Docker container. The docker will be instantiated using a shell script.
The second option is to explore the Docker Java API to implement more advanced options to load input data and
output the results, but also to start and stop a docker instance. The [docker-java wiki](https://github.com/docker-java/docker-java/wiki)
contains several examples, for example how to
[create new docker container and start it with mount binded volumes](https://github.com/docker-java/docker-java/wiki#create-new-docker-container-and-start-it-with-mount-binded-volumes).
To cope with the different challenges of each group we created a set of templates: [hadoop-streaming-docker](https://github.com/nlesc-sherlock/hadoop-streaming-docker).

All the points discussed above are covered in the ![Sherlock architecture](https://github.com/nlesc-sherlock/data_tools_integration/blob/master/docs/diagrams/architecture/architecture.pdf).
