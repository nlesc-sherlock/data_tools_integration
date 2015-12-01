Steps to get Spark running on a yarn cluster.

1. Login on yarn node
2. Download spark with pre-build hadoop 2.6 and later support, `wget http://d3kbcqa49mib13.cloudfront.net/spark-1.5.2-bin-hadoop2.6.tgz`
3. Unzip, `tar -zxf spark-1.5.2-bin-hadoop2.6.tgz`
4. cd to it, ` cd spark-1.5.2-bin-hadoop2.6/`
5. Set JAVA_HOME, `export JAVA_HOME=/usr/jdk64/jdk1.8.0_40`
6. Make spark yarn aware 
```
cp -rH /etc/hadoop/conf hadoop-conf
perl -pi -e 's/\${hdp.version}/2.3.2.0-2950/g' hadoop-conf/*
export YARN_CONF_DIR=$PWD/hadoop-conf
```
7. Run an example
```
MASTER=yarn-cluster bin/run-example SparkPi
```
or
```
bin/spark-submit --master yarn-cluster --class com.apache.spark.examples.SparkPi lib/spark-examples-1.5.2-hadoop2.6.0.jar
```
Goto application url -> logs -> stdout for result

8. Another example
```
MASTER=yarn-cluster bin/run-example mllib.LDAExample gutenberg/pg4300.txt
```

Using spark installed with ambari:
```
spark-submit --master yarn-cluster --class com.apache.spark.examples.SparkPi /usr/hdp/current/spark-client/lib/spark-examples-1.4.1.2.3.2.0-2950-hadoop2.7.1.2.3.2.0-2950.jar
```
