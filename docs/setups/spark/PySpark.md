Python±
http://ramhiser.com/2015/02/01/configuring-ipython-notebook-support-for-pyspark/

The instructions above can be followed until the execution.
Then to start the ipythonNote the best is to follow the instructions on the following link:
https://spark.apache.org/docs/0.8.1/python-programming-guide.html

It is also possible to launch PySpark in IPython, the enhanced Python interpreter. To do this, set the IPYTHON variable to 1 when running pyspark:

$ IPYTHON=1 ./pyspark

Alternatively, you can customize the ipython command by setting IPYTHON_OPTS. For example, to launch the IPython Notebook with PyLab graphing support:

$ IPYTHON_OPTS="notebook --pylab inline" ./pyspark

IPython also works on a cluster or on multiple cores if you set the MASTER environment variable.

To test you should do:
sc
which should print:
<pyspark.context.SparkContext at 0x7f6101994210>

To load data just do:
sqlContext = HiveContext(sc)
sqlContext.setConf("spark.sql.orc.filterPushdown", "true")
people = sqlContext.read.format("orc").load("/user/shelly/people")
people.collect()

To then save the data into a json file to be stored in SPARK you do the following:
people.write.format('json').save ('/user/romulo/people.json&user=shelly')

Note, your user should have write permissions in the HDFS cluster.



