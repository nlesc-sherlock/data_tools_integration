We want to run a web application which can perform SparkSQL queries on a remote yarn cluster.

To run the web application flask python library is required. We don't want to install it on the yarn cluster.
The web application is submitted to Spark with master=yarn and deploy-mode=client so the web application is run locally.

We solved this by running the web application inside a docker container which has its ports (web application, Spark driver, Spark UI) on the host machine. The host machine is accessible from the yarn cluster so Spark executors (running on the yarn cluster) can connect to the Spark driver (running in the web application docker container). 

See https://github.com/nlesc-sherlock/spark-flask for a simple web application.
