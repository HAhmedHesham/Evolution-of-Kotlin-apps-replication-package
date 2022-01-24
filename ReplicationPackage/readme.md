# Replication package

### About
The purpose is to test the impact of Critical CSS on android browsing performance and energy consumption. 

### Requirements
Experiments were performed using a RasberryPi and Nexus6P device running on Android 6.0.1. Software requirements are listed in the designated subfolders. Besides the requirements for Android-Runner, some python packages should be installed list in requirements.txt. 

### Reproduction
This repository consists of subfolders that allow the replication of the project. Each subfolder (except 00 Data) contains its own readme file that provides a detailed description on the requirements and usage. **If only interested in replicating the data analysis the subfolder 00 Data and 05 Analysis are sufficient.**
###### 00 Data 
Includes the Tranco top 1000 list that was samples to generate the subjects for this project. All files that are required to serve the subjects locally are present in the websites folder.
###### 01 Preperation
This contains a script to sample the tranco top 1000 and a script that is able to apply the Critical CSS technique to webpages. 

###### 02 Flask
Contains the flask app script that is used to serve the webpages locally.

###### 03 Experiment
Contains the adjusted python experiment scripts for android-runner and the required android-runner config file. 

###### 04 Data processing
Contains python scripts to process that raw output data of the experiment. 

###### 05 Analysis
Contains R scripts to perform statistical tests




