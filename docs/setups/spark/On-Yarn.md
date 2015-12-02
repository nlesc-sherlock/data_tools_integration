# Steps to get Spark running on a yarn cluster

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

Option 2:
Use Ambari to:
Download YARN-CONFIG.tar
Download HDFS-CONFIG.tar

Copy the content of both into <app_dir_path>/yarn-conf
Then you should comment out JAVA_HOME from hdfs-env.sh and yarn-env.sh.

export YARN_CONF_DIR=<path>/spark-lda/yarn-conf
```
7. It is required to add the following to spark-defaults.conf which is under spark-1.5.2-bin-hadoop2.6/config

```
spark.driver.extraJavaOptions -Dhdp.version=2.3.2.0-2950
spark.yarn.am.extraJavaOptions -Dhdp.version=2.3.2.0-2950
spark.eventLog.enabled           true
spark.eventLog.dir hdfs:///user/spark/applicationHistory
```
## Access the HDFS cluster
download hadoop bin tar file version [2.7.1](http://apache.cs.uu.nl/hadoop/common/hadoop-2.7.1/)

To test it you should do:
```
./bin/hdfs --config $YARN_CONF_DIR dfs -ls /user/sherlock/
```

## Run an example
Since YARN_CONF_DIR is set spark shell will interact with YARN cluster directly.

```
MASTER=yarn-cluster bin/run-example SparkPi
```
or
```
bin/spark-submit --master yarn-cluster --class com.apache.spark.examples.SparkPi lib/spark-examples-1.5.2-hadoop2.6.0.jar
```
Goto application url -> logs -> stdout for result

## Another example
```
MASTER=yarn-cluster bin/run-example mllib.LDAExample gutenberg/pg4300.txt
```

# Using spark installed with ambari
```
spark-submit --master yarn-cluster --class com.apache.spark.examples.SparkPi /usr/hdp/current/spark-client/lib/spark-examples-1.4.1.2.3.2.0-2950-hadoop2.7.1.2.3.2.0-2950.jar
```

# Show results in history server

1. Create place to put applicatoin history
```
hdfs dfs -mkdir /user/spark/applicationHistory
hdfs dfs -chown spark /user/spark/applicationHistory
```
2. Make a Spark conf file
```
cp conf/spark-defaults.conf.template conf/spark-defaults.conf
```
3. Fill Spark conf file with
```
spark.eventLog.enabled           true
spark.eventLog.dir hdfs:///user/spark/applicationHistory
```
4. Run a spark job
5. Start history server to look at it
```
export SPARK_HISTORY_OPTS='-Dspark.history.fs.logDirectory=hdfs:///user/spark/applicationHistory'
sbin/start-history-server.sh
```

