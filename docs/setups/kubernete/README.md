Kubernet
================

From the [kubernet web-site](http://kubernetes.io/) "Kubernetes is an open source orchestration system for Docker
containers. It handles scheduling onto nodes in a compute cluster and actively manages workloads to ensure that
their state matches the users declared intentions. Using the concepts of "labels" and "pods", it groups the
containers which make up an application into logical units for easy management and discovery."

Kubernetes works with the following concepts:
* Cluster : A cluster is a set of physical or virtual machines and other infrastructure resources used by Kubernetes
to run your applications. Kubernetes can run anywhere! See the [Getting Started Guides for instructions for a variety of services](https://github.com/kubernetes/kubernetes/blob/master/docs/admin/README.md).
* [Node](https://github.com/kubernetes/kubernetes/blob/master/docs/admin/node.md) : A node is a physical or virtual
machine running Kubernetes, onto which pods can be scheduled.
* [Pod](https://github.com/kubernetes/kubernetes/blob/master/docs/user-guide/pods.md) : Pods are a colocated group
of application containers with shared volumes. They're the smallest deployable units that can be created, scheduled,
and managed with Kubernetes. Pods can be created individually, but it's recommended that you use a replication controller
even if creating a single podi, [pod definition].
* [Replication controller](https://github.com/kubernetes/kubernetes/blob/master/docs/user-guide/replication-controller.md) :
Replication controllers manage the lifecycle of pods. They ensure that a specified number of pods are running at
any given time, by creating or killing pods as required, replica.
* [Service](https://github.com/kubernetes/kubernetes/blob/master/docs/user-guide/services.md) : Services provide
a single, stable name and address for a set of pods. They act as basic load balancers.
* [Label](https://github.com/kubernetes/kubernetes/blob/master/docs/user-guide/labels.md) : Labels are used to
organize and select groups of objects based on key:value pairs.


Installation
------------

To install and play around with kubernet there are [Getting started guides](https://github.com/kubernetes/kubernetes/tree/master/docs/getting-started-guides)
or simply run it as a [Docker container](http://kubernetes.io/v1.0/docs/getting-started-guides/docker.html).


Kubernet and Mesos
------------------

In the [WHAT’S THE DIFFERENCE BETWEEN APACHE MESOS AND GOOGLE’S KUBERNETES?](https://kismatic.com/community/apaches-mesos-vs-googles-kubernetes/)
post you can read about the difference between kubernet and Mesos, "Kubernetes is a great place to start if you are
new to the world of cluster computing; it's the quickest, easiest and lightest way to kick the tires and start
experimenting with cluster oriented development. It offers a very high level of portability since it's being supported
by a myriad of providers (Microsoft, IBM, Red Hat, CoreOS, Mesosphere, Kismatic, VMware and more).... With Mesos,
there is a fair amount of overlap in terms of the basic vision, but the products are at quite different points in
their lifecycle and have different sweet spots. Mesos is a distributed systems kernel that stitches together a lot
of different machines into a logical computer. It was born for a world where you own a lot of physical resources
that you use to create a large static compute cluster. The great thing about it is that lots of modern scalable
data processing application run well on Mesos (Hadoop, Kafka and Spark) and it's nice because you can run them
all on the same basic resource pool, along with your micro-service age container packaged apps. It is somewhat
more heavyweight than the Kubernetes project, but is getting easier and easier to manage thanks to the work of
the team at Mesosphere."

Now what gets really interesting is that Mesos is currently being adapted to add a lot of the Kubernetes concepts
and to support the Kubernetes API. So it will be a gateway to getting more capabilities for your Kubernetes app
(high availability master, more advanced scheduling semantics, ability to scale to a very large number of nodes)
if you need them, and is well suited to run production workloads (Kubernetes is still in an alpha state).
Info about their integration can be found [here](https://github.com/mesosphere/kubernetes-mesos/blob/master/README.md).
