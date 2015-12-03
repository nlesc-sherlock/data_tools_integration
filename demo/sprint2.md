# Demos for sprint 2

## Hadoop streaming with docker

https://github.com/nlesc-sherlock/hadoop-streaming-docker

http://ambari-worker2.sherlock-nlesc.vm.surfsara.nl:8088/cluster/app/application_1449131871597_0024

Take home message: Make posix yarn user member of docker group to run docker container in 
yarn/mapreduce/spark.

## Submit spark job from laptop to yarn-cluster 

Howto
https://github.com/nlesc-sherlock/data_tools_integration/blob/master/docs/setups/spark/On-Yarn.md

Spark job history
http://ambari-worker1.sherlock-nlesc.vm.surfsara.nl:18080/

## Increased yarn cluster

Added 3 workers.

http://ambari.sherlock-nlesc.vm.surfsara.nl:8080/#/main/dashboard/metrics

## Spark LDA from sequence file with emails

Spark app:
https://github.com/nlesc-sherlock/spark-lda

Forqlift to convert tarball to sequencefile.

http://ambari-worker1.sherlock-nlesc.vm.surfsara.nl:18080/history/application_1449131871597_0026/1/jobs/

Takehome: Executor/memory balance to prevent out of memory

## Run docker from Spark app

https://github.com/nlesc-sherlock/spark-docker

