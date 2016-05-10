# Using docker

See https://github.com/jupyter/docker-stacks/tree/master/pyspark-notebook

  docker run -d -p 8888:8888 jupyter/pyspark-notebook

Goto http://localhost:8888

#Installing Spark
1. The instructions to downaload and install Spark for standalone and cluster mode are [here](https://github.com/nlesc-sherlock/data_tools_integration/blob/master/docs/setups/spark/On-Yarn.md):


#IPython configuration

1. Create PySpark Profile for IPython

```
ipython profile create pyspark
```

2. To avoid port conflicts with other IPython profiles you should update the default port within ~/.ipython/profile_pyspark/ipython_notebook_config.py:

```
# Simply find this line and change the port value (value below is an example)
c = get_config()
c.NotebookApp.port = 42424
```

3. PySpark environment

Create a file named ~/.ipython/profile_pyspark/startup/00-pyspark-setup.py containing the following:
```
# Configure the necessary Spark environment
import os
import sys

spark_home = os.environ.get('SPARK_HOME', None)
sys.path.insert(0, spark_home + "/python")

# Add the py4j to the path.
# You may need to change the version number to match your install
sys.path.insert(0, os.path.join(spark_home, 'python/lib/py4j-0.8.2.1-src.zip'))

# Initialize PySpark to predefine the SparkContext variable 'sc'
execfile(os.path.join(spark_home, 'python/pyspark/shell.py'))
```

The information above was extracted from the following [post](http://ramhiser.com/2015/02/01/configuring-ipython-notebook-support-for-pyspark/), and tested by the TDI team.


#Start iPythonNote

1. It is also possible to launch PySpark in IPython, the enhanced Python interpreter. To do this, set the IPYTHON variable to 1 when running pyspark:
```
cd <spark_home>/bin
IPYTHON=1 ./pyspark
```

2. Alternatively, you can customize the ipython command by setting IPYTHON_OPTS. For example, to launch the IPython Notebook with PyLab graphing support:
```
cd <spark_home>/bin
IPYTHON_OPTS="notebook --pylab inline" ./pyspark
```

The information above was extracted from the following [post](https://spark.apache.org/docs/0.8.1/python-programming-guide.html), and tested by the TDI team.


#From IPython connect to Spark
```
#To verify the spark context:
sc

#which should print:
<pyspark.context.SparkContext at 0x7f6101994210>

#To load ORC files:
sqlContext = HiveContext(sc)
sqlContext.setConf("spark.sql.orc.filterPushdown", "true")
people = sqlContext.read.format("orc").load("/user/shelly/people")
people.collect()

#To then save the data into a json file to be stored in SPARK you do the following:
people.write.format('json').save ('/user/shelly/people.json&user=shelly')

#Note, your user should have write permissions in the HDFS cluster.
```
