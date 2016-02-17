DataIn
======
Created Tuesday 16 February 2016

Here we will shortly discuss how to get data into HDFS.
To get the most out of HDFS, you need to store your data in a format that is a 'Resilient Distributed Dataset' or RDD: This will allow you to use all features like data locality, job scheduling etc. An RDD consists of a set of records with, depending on the format, extensible metadata. A RDD is split or joined along the records for processing on the hadoop cluster. This means that when storing your data in hadoop, you should be careful with the file format.

Text Data
---------
For text data, JSON and XML like formats cannot be split at arbitrary places (ie. you need the pair of opening and closing tags for XML to stay valid).
CSV or record JSON, where each line of the file is an independent record, is highly recommended. 

General text data can also be converted to a number of binary formats:

* AVRO
* ORC
* Parquet
* Sequence files

A binary file can hold multiple records, which facilitates dealing with large datasets, and some formats allow you to apply compression.
Other considerations are:

* amount of metadata
* extensability of the the metadata schema: can you add extra fields without having to reimport all data?
* Optimizations on searching on columns
* Support for the format: Hive only, hadoop native, ...
* Availability of supporting tools


AVRO and sequence files are easiest to work with, have native Hadoop support, and usable command line tools exist. The are not a column store, so performance is slightly lower than the other formats.
ORC seems to become the default format, but support and tooling is still immature.

See also the discussion on the following pages: 
<http://www.inquidia.com/news-and-info/hadoop-file-formats-its-not-just-csv-anymore>
<http://www.slideshare.net/StampedeCon/choosing-an-hdfs-data-storage-format-avro-vs-parquet-and-more-stampedecon-2015>

This link provides an indepth discussion on data practices, considering other aspects than performance and filesize
<http://www.confluent.io/blog/stream-data-platform-2/>

and some more blogposts
<http://grepalex.com/2014/05/13/parquet-file-format-and-object-model/>
<http://blog.cloudera.com/blog/2015/03/converting-apache-avro-data-to-parquet-format-in-apache-hadoop/>
<http://ms-olap.blogspot.nl/2015/02/hive-file-format-comparison.html>
<https://www.mapr.com/blog/what-kind-hive-table-best-your-data#.VefqGWxSukq>


Binary data
-----------
Support for binary data is very limited, only sequence files are a robust solution at the moment.
AVRO supports fixed-length binary blobs, and the other formats can be used for small binary files with some tricks (like converting binary to base64 text, expanding the data with a factor of 2. Compression could reduce some of this overhead.)




Import from
-----------

### Database

#### Apache Sqoop
<https://sqoop.apache.org/>
License: Apache v2.0

Apache Sqoop is a tool designed for efficiently transferring bulk data between Apache Hadoop and structured datastores such as relational databases. You can use Sqoop to import data from external structured datastores into Hadoop Distributed File System or related systems like Hive and HBase. Conversely, Sqoop can be used to extract data from Hadoop and export it to external structured datastores such as relational databases and enterprise data warehouses.

RDMS ↔ Sequence files / AVRO files


### Binary Files

#### forqlift
<http://www.exmachinatech.net/projects/forqlift/>
License: Apache v2.0

Commandline tool to work with sequence files
File types: text, compressed text, BytesWritable ie. any binary file format

normal files ↔ Sequence file

### Text (JSON, CSV)

#### Avro
<http://avro.apache.org/>
Hadoop native support: java and python bindings

* Row based, not optimized for statistics / aggregates over the metadata
* Only fixed-size binary blobs


Avro files are quickly becoming the best multi-purpose storage format within Hadoop. Avro files store metadata with the data but also allow specification of an independent schema for reading the file. This makes Avro the epitome of schema evolution support since you can rename, add, delete and change the data types of fields by defining new independent schema. Additionally, Avro files are splittable, support block compression and enjoy broad, relatively mature, tool support within the Hadoop ecosystem.

Apache Avro™ is a data serialization system, providing:

* Rich data structures.
* A compact, fast, binary data format.
* A container file, to store persistent data.
* Remote procedure call (RPC).
* Simple integration with dynamic languages. Code generation is not required to read or write data files nor to use or implement RPC protocols. Code generation as an optional optimization, only worth implementing for statically typed languages.
* From Python: avro, avroknife (pip)


A short example of using AVRO in spark:
<http://stackoverflow.com/questions/23944615/how-can-i-load-avros-in-spark-using-the-schema-on-board-the-avro-files>


#### Apache orc

<http://orc.apache.org/>
License: Apache v2.0

ORC: optimized row columnar
can add user metadata per file

ORC is a self-describing type-aware columnar file format designed for Hadoop workloads. It is optimized for large streaming reads, but with integrated support for finding required rows quickly. Storing data in a columnar format lets the reader read, decompress, and process only the values that are required for the current query. Because ORC files are type-aware, the writer chooses the most appropriate encoding for the type and builds an internal index as the file is written. Predicate pushdown uses those indexes to determine which stripes in a file need to be read for a particular query and the row indexes can narrow the search to a particular set of 10,000 rows. ORC supports the complete set of types in Hive, including the complex types: structs, 


### Apache Parquet

<https://parquet.apache.org/>
License: Apache v2.0

Columnar storage format

Apache Parquet is a columnar storage format available to any project in the Hadoop ecosystem, regardless of the choice of data processing framework, data model or programming language.


