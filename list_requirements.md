#Requirements to deploy your library/system on a single platform using SURFSara's HPC cloud. 

##Workflows
1. You should define your workflow using CWL.
2. All libraries, external or developed by your team, should be ready to be deployed in a virtual environment (see Virtualization).
3. If any stage of your workflow requires Spark jobs for data processing your must provide the required files and deployment information (see Spark).
4. The workflow definition should be made available on your GitHub under the directory data_tools_integration/CWL.

##Interaction or Visualization
1. Provide a web-interface to visualize the results of your work.
2. In case of an interactive interface using Jupyter notebook identify which environment (Python, Scala or R).
3. Share your notebooks example or template under your GitHub on your GitHub under the directory data_tools_integration/NoteBooks.
4. In case you need/use a web-service make sure it can be deployed in a virtual environment (see Virtualization).

#Virtualization
1. Each component of your architecture should be dockerised.
2. All docker containers should be uploaded to the NLeSC docker containers hub.
3. The definition of each docker container should be made available on your GitHub under the directory data_tools_integration/Dockers.
4. For each dockerFile make also available a README.md which explains its input arguments, what it does, output arguments and command line to call it.

#Spark
1. All the necessary jars should be made available on your GitHub under the directory data_tools_integration/Spark.
2. The job submission should be done through a command line call so we can automatize it.
3. Also provide a description of the input data and its location, and the expected output. Please try to follow our recommendations on how to load data into the Spark cluster and store results from Spark jobs.

#Assistance
. In case you have any question about the above requirements please submit an issue on our GitHub page.
. We will do our best to have one member of our team available during your sprint session.

#Support to our team
. During our sprint, to be scheduled after all other teams sprints, we might require some support from you in case things do not run as expected. Please make sure a member of your team, with necessary knowledge to deploy your systems, is present at NLeSC. At most, it will be like 1 to 2 hours of support.
