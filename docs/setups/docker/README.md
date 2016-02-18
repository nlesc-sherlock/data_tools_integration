Docker
================

Docker  combines an easy-to-use interface to Linux containers with easy-to-construct image files for those containers.
In short, Docker launches very light weight virtual machines.

According to the Docker website, “Docker is an open platform for developers and sysadmins to
build, ship, and run distributed applications. Consisting of Docker Engine, a portable, lightweight
runtime and packaging tool, and Docker Hub, a cloud service for sharing applications and
automating workflows, Docker enables apps to be quickly assembled from components and
eliminates the friction between development, QA, and production environments.”, [www.docker.com](www.docker.com/]https://www.docker.com/).
For more information how how virtualization works and how docker differs from virtual machines check
[link](http://cloudanddevopswf.com/files/9851-Managing_Applications_in_Docker_Containers.pdf) and its [user guide](https://docs.docker.com/userguide/).
More info is available at the [Docker workshop gitHub](https://github.com/mkuzak/shipcamel).

Docker and Yarn
---------------

Yarn executes its Mapper, Reducer, and ApplicationMaster in its own container environment.
The [Docker Container Executor (DCE)](https://hadoop.apache.org/docs/current/hadoop-yarn/hadoop-yarn-site/DockerContainerExecutor.html) allows the YARN NodeManager to launch YARN containers into Docker containers.
Users can specify the Docker images they want for their YARN containers.
These containers provide a custom software environment in which the user’s code runs, isolated from the software environment of the NodeManager.
These containers can include special libraries needed by the application, and they can have different versions of Perl, Python, and even Java than what is installed on the NodeManager.
Indeed, these containers can run a different flavor of Linux than what is running on the NodeManager – although the YARN container must define all the environments and libraries needed to run the job, nothing will be shared with the NodeManager.

In this blog post you can find an example on how to [build an Yarn cluster using Docker.io containers](http://lresende.blogspot.nl/2015/01/building-yarn-cluster-using-dockerio.html).

To run an arbitrary docker container as part of a Spark job see [this project](https://github.com/nlesc-sherlock/spark-docker).
