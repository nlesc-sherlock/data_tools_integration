Setup
-----

The major goal of this group is to integrate the tools used and created by the other teams into the Hadoop
based system used by the NFI. Hence, we will need a Hadoop cluster. The one selected for this project is the
[DAS-4 Hadoop Cluster](http://www.cs.vu.nl/das4/hadoop.shtml). If needed, [DAS-4 user accounts](http://www.cs.vu.nl/das4/accounts.shtml)
for the team members will requested before the sprint. The cluster is small, but it offers the perfect
environment for our project since it is easy to request access and it is not an overloaded cluster.
For large scale experiments and to run our final outcome we will use the
[Hadoop cluster](https://userinfo.surfsara.nl/systems/hadoop/description) from SURFsara which provides the
following [components](https://userinfo.surfsara.nl/systems/hadoop/software). For that we need to
[setup an account with SURFsara](https://userinfo.surfsara.nl/systems/hadoop/obtaining-account).

Here are the steps to get you up and running:
* DAS-4 Hadoop cluster: before you submit a job read the [DAS-4 Usage Policy](http://www.cs.vu.nl/das4/usage.shtml)
and [Job Execution](http://www.cs.vu.nl/das4/jobs.shtml) to learn how to submit a job. More info is under
[setup directory](https://github.com/NLeSC/Sherlock/blob/master/topics/data_tools_integration/setup). 
* SURFsara Hadoop cluster: once you have an account, get your Linux/Mac machine ready to
[access the cluster and submit jobs](https://userinfo.surfsara.nl/systems/hadoop/usage). Note, if you
only have an windows machine we advise you to install a virtual machine with linux (Ubuntu is recommended).
* To use the Spark cluster it is required to create home directory and Postfix user. The steps to on how to do it are described under [ambari add user](https://github.com/nlesc-sherlock/data_tools_integration/blob/master/docs/setups/ambari/INSTALL.md#add-user).
