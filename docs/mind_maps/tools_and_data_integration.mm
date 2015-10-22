<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1445254470064" ID="ID_1989979955" MODIFIED="1445254498160" TEXT="Tools and Data Integration">
<node CREATED="1445254499164" ID="ID_60436233" MODIFIED="1445345307234" POSITION="right" TEXT="Docker">
<node CREATED="1445254505090" ID="ID_1278865777" MODIFIED="1445254555580" TEXT="Definition: Docker  combines an easy-to-use interface to Linux containers with easy-to-construct image files for those containers. In short, Docker launches very light weight virtual machines."/>
<node CREATED="1445254632272" ID="ID_1309434873" MODIFIED="1445255503829" TEXT="Docker and Yarn">
<node CREATED="1445254639314" ID="ID_1973213672" MODIFIED="1445254648829" TEXT="Docker Container Executor">
<node CREATED="1445254650311" ID="ID_1305499329" LINK="https://hadoop.apache.org/docs/current/hadoop-yarn/hadoop-yarn-site/DockerContainerExecutor.html" MODIFIED="1445254680586" TEXT="The Docker Container Executor (DCE) allows the YARN NodeManager to launch YARN containers into Docker containers. Users can specify the Docker images they want for their YARN containers. These containers provide a custom software environment in which the user&#x2019;s code runs, isolated from the software environment of the NodeManager. These containers can include special libraries needed by the application, and they can have different versions of Perl, Python, and even Java than what is installed on the NodeManager. Indeed, these containers can run a different flavor of Linux than what is running on the NodeManager &#x2013; although the YARN container must define all the environments and libraries needed to run the job, nothing will be shared with the NodeManager."/>
</node>
<node CREATED="1445255194913" ID="ID_1187118238" LINK="http://lresende.blogspot.nl/2015/01/running-your-applications-in-dockerio.html" MODIFIED="1445255325205" TEXT="Running your applications in a Docker.io Container"/>
<node CREATED="1445255161917" ID="ID_967045563" LINK="http://lresende.blogspot.nl/2015/01/building-yarn-cluster-using-dockerio.html" MODIFIED="1445255352976" TEXT="Building a Yarn cluster using Docker.io containers"/>
</node>
<node CREATED="1445255504537" ID="ID_1653634525" LINK="Docker, and Spark, and Hadoop." MODIFIED="1445255520652" TEXT="Docker, and Spark and Hadoop"/>
<node CREATED="1445261241032" ID="ID_688612032" MODIFIED="1445261243649" TEXT="Mesos">
<node CREATED="1445261330103" ID="ID_603722963" LINK="http://mesos.apache.org/documentation/latest/architecture/" MODIFIED="1445261354474" TEXT="Mesos Architecture"/>
</node>
<node CREATED="1445257775760" ID="ID_1608397403" LINK="http://kubernetes.io/" MODIFIED="1445257807841" TEXT="kubernetes">
<node CREATED="1445257824622" ID="ID_1768410668" MODIFIED="1445257825722" TEXT="Manage a cluster of Linux containers as a single system to accelerate Dev and simplify Ops"/>
<node CREATED="1445257912231" ID="ID_1383871404" MODIFIED="1445257912940" TEXT="Kubernetes is an open source orchestration system for Docker containers. It handles scheduling onto nodes in a compute cluster and actively manages workloads to ensure that their state matches the users declared intentions. Using the concepts of &quot;labels&quot; and &quot;pods&quot;, it groups the containers which make up an application into logical units for easy management and discovery."/>
<node CREATED="1445257990455" ID="ID_516571584" LINK="https://github.com/kubernetes/kubernetes" MODIFIED="1445258005216" TEXT="Github repository"/>
<node CREATED="1445258050494" ID="ID_1196319508" MODIFIED="1445258052869" TEXT="Kubernetes works with the following concepts:">
<node CREATED="1445258053607" ID="ID_1846475465" LINK="https://github.com/kubernetes/kubernetes/blob/master/docs/admin/README.md" MODIFIED="1445258076399" TEXT="Cluster : A cluster is a set of physical or virtual machines and other infrastructure resources used by Kubernetes to run your applications. Kubernetes can run anywhere! See the Getting Started Guides for instructions for a variety of services."/>
<node CREATED="1445258085006" ID="ID_1452685859" LINK="https://github.com/kubernetes/kubernetes/blob/master/docs/admin/node.md" MODIFIED="1445258107682" TEXT="Node : A node is a physical or virtual machine running Kubernetes, onto which pods can be scheduled."/>
<node CREATED="1445258115062" ID="ID_1100450549" LINK="https://github.com/kubernetes/kubernetes/blob/master/docs/user-guide/pods.md" MODIFIED="1445258130297" TEXT="Pod : Pods are a colocated group of application containers with shared volumes. They&apos;re the smallest deployable units that can be created, scheduled, and managed with Kubernetes. Pods can be created individually, but it&apos;s recommended that you use a replication controller even if creating a single pod."/>
<node CREATED="1445258138390" ID="ID_252083694" LINK="https://github.com/kubernetes/kubernetes/blob/master/docs/user-guide/replication-controller.md" MODIFIED="1445258148953" TEXT="Replication controller : Replication controllers manage the lifecycle of pods. They ensure that a specified number of pods are running at any given time, by creating or killing pods as required."/>
<node CREATED="1445258158056" ID="ID_907267492" LINK="https://github.com/kubernetes/kubernetes/blob/master/docs/user-guide/services.md" MODIFIED="1445258168881" TEXT="Service : Services provide a single, stable name and address for a set of pods. They act as basic load balancers."/>
<node CREATED="1445258231460" ID="ID_1494454412" LINK="https://github.com/kubernetes/kubernetes/blob/master/docs/user-guide/labels.md" MODIFIED="1445258242767" TEXT="Label : Labels are used to organize and select groups of objects based on key:value pairs."/>
</node>
<node CREATED="1445260708058" ID="ID_1905728319" LINK="https://kismatic.com/community/apaches-mesos-vs-googles-kubernetes/" MODIFIED="1445432577855" TEXT="Kubernete and Mesos">
<node CREATED="1445260769994" ID="ID_1322365002" LINK="http://stackoverflow.com/questions/26705201/whats-the-difference-between-apaches-mesos-and-googles-kubernetes" MODIFIED="1445260780484" TEXT="With Mesos, there is a fair amount of overlap in terms of the basic vision, but the products are at quite different points in their lifecycle and have different sweet spots. Mesos is a distributed systems kernel that stitches together a lot of different machines into a logical computer. It was born for a world where you own a lot of physical resources to create a big static computing cluster. The great thing about it is that lots of modern scalable data processing application run well on Mesos (Hadoop, Kafka, Spark) and it is nice because you can run them all on the same basic resource pool, along with your new age container packaged apps. It is somewhat more heavy weight than the Kubernetes project, but is getting easier and easier to manage thanks to the work of folks like Mesosphere."/>
<node CREATED="1445260865939" ID="ID_779772753" MODIFIED="1445260867039" TEXT="Now what gets really interesting is that Mesos is currently being adapted to add a lot of the Kubernetes concepts and to support the Kubernetes API. So it will be a gateway to getting more capabilities for your Kubernetes app (high availability master, more advanced scheduling semantics, ability to scale to a very large number of nodes) if you need them, and is well suited to run production workloads (Kubernetes is still in an alpha state)."/>
<node CREATED="1445260881349" ID="ID_999172359" MODIFIED="1445260889743" TEXT="1. Kubernetes is a great place to start if you are new to the clustering world; it is the quickest, easiest and lightest way to kick the tires and start experimenting with cluster oriented development. It offers a very high level of portability since it is being supported by a lot of different providers (Microsoft, IBM, Red Hat, CoreOs, MesoSphere, VMWare, etc)."/>
<node CREATED="1445260897329" ID="ID_449483444" MODIFIED="1445260898909" TEXT="2. If you have existing workloads (Hadoop, Spark, Kafka, etc), Mesos gives you a framework that let&apos;s you interleave those workloads with each other, and mix in a some of the new stuff including Kubernetes apps."/>
<node CREATED="1445260906650" ID="ID_341110586" MODIFIED="1445260908925" TEXT="3. Mesos gives you an escape valve if you need capabilities that are not yet implemented by the community in the Kubernetes framework. "/>
<node CREATED="1445261153601" ID="ID_1497823752" LINK="https://github.com/mesosphere/kubernetes-mesos/blob/master/README.md" MODIFIED="1445261173593" TEXT="kubernetes-mesos"/>
</node>
<node CREATED="1445349958313" ID="ID_1224237355" MODIFIED="1445349964405" TEXT="Installation on Ubuntu">
<node CREATED="1445349965554" ID="ID_512310308" LINK="https://github.com/kubernetes/kubernetes/blob/master/docs/getting-started-guides/ubuntu.md" MODIFIED="1445349985465" TEXT="Manual and pre-requesites in how to install it in Ubuntu"/>
</node>
<node CREATED="1445351884291" ID="ID_1513578041" LINK="http://kubernetes.io/v1.0/docs/getting-started-guides/docker.html" MODIFIED="1445351903849" TEXT="Run it as container"/>
</node>
<node CREATED="1445345296175" ID="ID_1442410240" LINK="https://docs.docker.com/userguide/dockervolumes/" MODIFIED="1445345317760" TEXT="Managing data in containers"/>
<node CREATED="1445348972349" ID="ID_1002359389" MODIFIED="1445348977807" TEXT="Docker on Ubuntu">
<node CREATED="1445348978641" ID="ID_1818028014" LINK="https://docs.docker.com/installation/ubuntulinux/" MODIFIED="1445348989476" TEXT="Installation"/>
</node>
</node>
<node CREATED="1445343902440" ID="ID_1943172861" MODIFIED="1445343911791" POSITION="right" TEXT="Hadoop on Docker">
<node CREATED="1445343912516" ID="ID_1557073974" LINK="http://blog.sequenceiq.com/blog/2014/06/17/ambari-cluster-on-docker/" MODIFIED="1445343970470" TEXT="Create single-node Hadoop cluster"/>
<node CREATED="1445343927801" ID="ID_1299372690" LINK="http://blog.sequenceiq.com/blog/2014/06/19/multinode-hadoop-cluster-on-docker/" MODIFIED="1445343954353" TEXT="Create multi-node Hadoop cluster"/>
</node>
<node CREATED="1445344102215" ID="ID_1069275412" LINK="http://blog.cloudera.com/blog/2014/01/how-to-create-a-simple-hadoop-cluster-with-virtualbox/" MODIFIED="1445344126494" POSITION="right" TEXT="Create an HDFS cluster using virtualbox"/>
<node CREATED="1445421048849" ID="ID_853132950" MODIFIED="1445421064283" POSITION="left" TEXT="Progress">
<node CREATED="1445421065915" ID="ID_591816585" MODIFIED="1445421076114" TEXT="Set up Hadoop cluster on DAS"/>
<node CREATED="1445421076539" ID="ID_1529137533" MODIFIED="1445421084720" TEXT="Use a multi-node hadoop cluster"/>
<node CREATED="1445421086002" ID="ID_616635191" MODIFIED="1445421119240" TEXT="First goal is to run a docker container inside a mapper"/>
<node CREATED="1445421144244" ID="ID_249022473" MODIFIED="1445421180199" TEXT="Like this we will use Hadoop to schedule the Docker container execution "/>
<node CREATED="1445421180915" ID="ID_38055020" MODIFIED="1445421198078" TEXT="It will also re-execute in case the Docker executions fails"/>
<node CREATED="1445421198610" ID="ID_1337304508" MODIFIED="1445421271382" TEXT="The first wave of Mappers will be slow because they will have to download the libraries for each Docker instance. However, such image is then cached. We need to configure dockter to not use too much space and thus clean the cache once new type of instances are run."/>
<node CREATED="1445421272562" ID="ID_11878905" MODIFIED="1445421348902" TEXT="We are assuming that each HDFS blocks contains one or more files. The HDFS block size will be limit by the size of the biggest file. Otherwise, it will be required to have a specialized reader."/>
<node CREATED="1445421356568" ID="ID_199880779" MODIFIED="1445421388117" TEXT="The docker might be able to use Iterator to read each file from the HDFS block."/>
<node CREATED="1445421389057" ID="ID_591558001" MODIFIED="1445421498684" TEXT="It will use the temp directory assigned to the Mapper as output directory. Once the job finishes the result goes to the output of the Mapper which is HDFS.  That defines when the job ends. Once dumped into HDFS, the Mapper is closed and new one scheduled. The Docker container image is cached and re-used by new mappers.">
<node CREATED="1445421501519" ID="ID_1031584977" MODIFIED="1445421524244" TEXT="One challenge is when we have more than one mapper per node and we run concurrently Docker images."/>
</node>
<node CREATED="1445421572647" ID="ID_1526781776" MODIFIED="1445421602100" TEXT="Docker container executor assumes docker base image with Hadoop functionality, therefore, it is not an option."/>
<node CREATED="1445421530455" ID="ID_1096866648" MODIFIED="1445421558156" TEXT="One possible requirement is how to run it for Spark the docker container."/>
<node CREATED="1445421602832" ID="ID_1379124723" MODIFIED="1445421728588" TEXT="NFS to have a clear view of the entire HDFS data. However, you define a list of files which should be used as input by the tool in the case of NFI. However, we are not embarking for that direction because we are in the end of the pipeline, i.e., we exploit the metadata information provided by the traces. The only challenge here is how to have data locality because NFI needs to improve their scheduler to know to which HFS block the trace belongs."/>
<node CREATED="1445421764574" ID="ID_1782337977" MODIFIED="1445421851562" TEXT="We have done a trial where we saw that using Fuse does not seem to be the way to go. NFS seems to be easy to setup and use most of the time. Niels succeded in getting is up and running."/>
<node CREATED="1445421873412" ID="ID_1475667303" MODIFIED="1445421906801" TEXT="The docker inside the Mapper will run through a system call. We will give it the right parameters using the input of the mapper function."/>
<node CREATED="1445421908533" ID="ID_425947420" MODIFIED="1445421923554" TEXT="A second challenge is run a docker in a reducer."/>
<node CREATED="1445421924598" ID="ID_1857626574" MODIFIED="1445421986272" TEXT="Further developement will require us to run a docker using Yarn. the docker will have to be scheduled"/>
</node>
<node CREATED="1445424384363" ID="ID_1878347339" MODIFIED="1445424387967" POSITION="left" TEXT="Ambari">
<node CREATED="1445424419826" ID="ID_1656253933" MODIFIED="1445424421338" TEXT="The Apache Ambari project is aimed at making Hadoop management simpler by developing software for provisioning, managing, and monitoring Apache Hadoop clusters. Ambari provides an intuitive, easy-to-use Hadoop management web UI backed by its RESTful APIs."/>
</node>
</node>
</map>
