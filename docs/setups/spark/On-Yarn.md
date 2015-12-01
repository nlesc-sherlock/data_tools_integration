Steps to get Spark running on a yarn cluster.

1. Login on yarn node
2. Download spark with pre-build hadoop 2.6 and later support, `wget http://d3kbcqa49mib13.cloudfront.net/spark-1.5.2-bin-hadoop2.6.tgz`
3. Unzip, `tar -zxf spark-1.5.2-bin-hadoop2.6.tgz`
4. cd to it, ` cd spark-1.5.2-bin-hadoop2.6/`
5. Set JAVA_HOME, `export JAVA_HOME=/usr/jdk64/jdk1.8.0_40`
6. Make spark hadoop aware `export HADOOP_CONF_DIR=/usr/hdp/current/hadoop-client/conf`
7. Run an example
```
. /usr/hdp/current/hadoop-client/conf/yarn-env.sh
spark-submit --master yarn-cluster --class com.apache.spark.examples.SparkPi lib/spark-examples-1.4.1.2.3.2.0-2950-hadoop2.7.1.2.3.2.0-2950.jar
```

Using spark installed with ambari:
```
spark-submit --master yarn-cluster --class com.apache.spark.examples.SparkPi /usr/hdp/current/spark-client/lib/spark-examples-1.4.1.2.3.2.0-2950-hadoop2.7.1.2.3.2.0-2950.jar
```
