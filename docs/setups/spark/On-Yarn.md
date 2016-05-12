# Steps to get Spark running on a yarn cluster

1. Login on yarn node
2. Download spark with pre-build hadoop 2.6 and later support, `wget http://d3kbcqa49mib13.cloudfront.net/spark-1.5.2-bin-hadoop2.6.tgz`
3. Unzip, `tar -zxf spark-1.5.2-bin-hadoop2.6.tgz`
4. cd to it, ` cd spark-1.5.2-bin-hadoop2.6/`
5. Set `JAVA_HOME`, `export JAVA_HOME=/usr/jdk64/jdk1.8.0_40`
6. Make spark yarn aware by setting `YARN_CONF_DIR`

## Option 1:

```
cp -rH /etc/hadoop/conf hadoop-conf
perl -pi -e 's/\${hdp.version}/2.3.2.0-2950/g' hadoop-conf/*
export YARN_CONF_DIR=$PWD/hadoop-conf
```


## Option 2:

Only available on som OSes, see <https://ambari.apache.org/>).

a. Use Ambari to download `YARN-CONFIG.tar` and `HDFS-CONFIG.tar`.
b. Copy the content of both into ```<app_dir_path>/yarn-conf```
c. Comment out `JAVA_HOME` from `hdfs-env.sh` and `yarn-env.sh`.

```
export YARN_CONF_DIR=<path>/spark-lda/yarn-conf
```


7. It is required to add the following to `spark-defaults.conf` which is under `spark-1.5.2-bin-hadoop2.6/config`.

```
spark.driver.extraJavaOptions -Dhdp.version=2.3.2.0-2950
spark.yarn.am.extraJavaOptions -Dhdp.version=2.3.2.0-2950
spark.eventLog.enabled           true
spark.eventLog.dir hdfs:///user/spark/applicationHistory
```

## Option 3: Use Ambari cluster remote

1. Download hdfs/yarn/spark config tarballs from Ambari Admin Dashboard.
2. In config files comment out JAVA_HOME
3. To spark-defaults.conf add (Check Ambari dashboard for correct hdp version)

```
spark.driver.extraJavaOptions -Dhdp.version=2.4.2.0-258
spark.yarn.am.extraJavaOptions -Dhdp.version=2.4.2.0-258
```
4. Remove *topo* section from core-site.xml.
5. Make spark-submit use config files by following enviroment keys (assumes /app/conf contains all config files)

```
export HADOOP_CONF_DIR=/app/conf
export YARN_CONF_DIR=/app/conf
export SPARK_CONF_DIR=/app/conf
```
6. Download + untar spark with hadoop tarballs
7. Use the `spark-submit`from the spark tarball to submit jobs.

# Access the HDFS cluster
download hadoop bin tar file version [2.7.1](http://apache.cs.uu.nl/hadoop/common/hadoop-2.7.1/)

To test it you should do:
```
./bin/hdfs --config $YARN_CONF_DIR dfs -ls /user/sherlock/
```

## Run an example (1)
Since `YARN_CONF_DIR` is set spark shell will interact with YARN cluster directly.

```
MASTER=yarn-cluster bin/run-example SparkPi
```
or
```
bin/spark-submit --master yarn-cluster --class org.apache.spark.examples.SparkPi lib/spark-examples-1.5.2-hadoop2.6.0.jar
```
Goto application url -> logs -> stdout for result

## Run an example (2)
```
MASTER=yarn-cluster bin/run-example mllib.LDAExample gutenberg/pg4300.txt
```

# Using spark installed with ambari
```
spark-submit --master yarn-cluster --class org.apache.spark.examples.SparkPi /usr/hdp/current/spark-client/lib/spark-examples-1.4.1.2.3.2.0-2950-hadoop2.7.1.2.3.2.0-2950.jar
```

# Show results in history server

1. Create place to put application history
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
