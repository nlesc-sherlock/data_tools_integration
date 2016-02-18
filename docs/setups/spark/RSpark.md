R-dataconnector from Vertica allows us to read ORCfiles from HDFS. To do that follow the instructions at:

https://github.com/vertica/r-dataconnector

1) To make a connection with HDFS at the Yarn cluster, first get the HDFS binary and add the HDFS configurations.

2) Add hdfs.json to where the R package was installed or just give the path, examples following:

library(dataconnector)

df <- orc2dataframe(url='hdfs:///user/shelly/labels.orc', hdfsConfigurationFile = paste(system.file(package = "dataconnector"), "/conf/hdfs.json", sep = ""))

df <- orc2dataframe(url='hdfs:///user/shelly/labels.orc', hdfsConfigurationFile = '/home/romulo/sandbox/r-dataconnector/conf/hdfs.json')

df <- orc2dataframe(url='hdfs:///user/shelly/labels.orc')

json file is in gitHub.

NOTE: It is only able to read pure ORCFiles, not the directory where they are saved. Such directory is only possible with HiveSql context in Spark. For that we should get the spark-binary, copy the configs for spark to the conf directory (note: do not forget to comment out the JAVA_HOME path).

Then follow the following steps to get the SparkR working on your Rstudio:
http://www.r-bloggers.com/sparkr-with-rstudio-in-ubuntu-12-04/

To get HiveSQL context you need to:
library("rJava")
library(SparkR, lib.loc="/home/romulo/sandbox/spark-1.6.0-bin-hadoop2.6/R/lib")
sc <- sparkR.init(sparkHome = "/home/romulo/sandbox/spark-1.6.0-bin-hadoop2.6")

hiveContext <- sparkRHive.init(jsc = NULL)
people <- read.df(hiveContext, "/user/shelly/persons.orc", "orc")

Before you plot you need to do a collect, otherwise, it complains is not able to process 

To plot the dataframe then do:
ggplot(p, aes(name)) + geom_bar(aes(weight=age))

sqlContext <- sparkRSQL.init(sc)
people <- read.df(sqlContext, "/home/shelly/people.orc", "orc")



