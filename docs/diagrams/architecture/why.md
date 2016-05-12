#Why

To scale up and out docker containers we decided to adopt docker swarm.
Compared to Mesos or Kubernetes, Docke Swarm a lightweight scheduler provided by Docker.inc, therefore, it reduces compability issues.

Docker Swarm:
-------------
To easly deploy docker instances which contains all dependencies for data ingestion, data export such as a web-server, or a service which interacts with any Hadoop framework.

Accessibility of HDFS is one of the challenges, this is, interoperability with HDFS from outside YARN.

> File browser to upload / download / create and drop directories.
>> HUE and HDFS builtin read-onlyh browser. HUE was not select because its from Cloudera, it uses Django and it is big ecosystem with many dependencies.
>> The solution was to install Ambari Files view

> Batch upload
>> Upload the files in a zip archive using the Ambari File browser and then through PySPark notebook process it further. However, the idea as abandoned because we need to read large blogs end decompress for the pre-processing phase. The right way should be a Haddop friendly file-format with compression enabled.

> Data Conversion
>> From a directory or archive to a sequence file. 
>>> With forqlift an archive is concerted to a sequence file. The sequence files are then loaded using HDFS put, NFS mount on HDFS or Ambari File Browser. We are still working on ingest web-site with multiple options.
>> From CSV files to Spark Data Frames
>>> First approach treating CSV as textFile and then have our own parser. It is not advised to do it because data and metadata are mixed and it will not handle all the corner cases.
>>> The final decision was to use Spark csv package.

> Data processing
>> Batch mode
>>> Submit jobs
>> Interactive mode
>>> Notebook using Jupyter for PySpark, Scala and R were lightly tested for Interactive processing.
>> Web-Application
>>> Flask which uses PySpark to access data and submit processing tasks.
>> It is part of the tools used for data upload.






