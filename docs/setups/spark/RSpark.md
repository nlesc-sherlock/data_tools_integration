#RSpark

## R-dataconnector from Vertica allows us to read ORCfiles from HDFS.

1. Follow the instructions to install and configure Spark (standalone or cluster mode).

2. Follow the instructions at [R-Dataconnector GitHub](https://github.com/vertica/r-dataconnector) to install R-dataconnector.

3. To stabilish the connection with the Spark running at the Yarn cluster use [hdfs.json]. 

```
library(dataconnector)
df <- orc2dataframe(url='hdfs:///user/shelly/labels.orc', hdfsConfigurationFile = '/home/romulo/sandbox/r-dataconnector/conf/hdfs.json')

#NOTE: It is only able to read pure ORCFiles. To read it as DataFrame HiveSQL from Spark is required.
```

##SparkR working on your Rstudio

1. The instructions to downaload and install Spark, for standalone and cluster mode, are (here):

##Stabilish connection with Spark
```
library("rJava")
library(SparkR, lib.loc="/home/romulo/sandbox/spark-1.6.0-bin-hadoop2.6/R/lib")
sc <- sparkR.init(sparkHome = "/home/romulo/sandbox/spark-1.6.0-bin-hadoop2.6")

hiveContext <- sparkRHive.init(jsc = NULL)
people <- read.df(hiveContext, "/user/shelly/persons.orc", "orc")

#Before you plot you need to do a collect, otherwise, it complains is not able to process 
p = collect(people)

#To plot the dataframe then do:
ggplot(p, aes(name)) + geom_bar(aes(weight=age))
```

The information above was extracted from the following [post](http://www.r-bloggers.com/sparkr-with-rstudio-in-ubuntu-12-04/), and tested by the TDI team.

