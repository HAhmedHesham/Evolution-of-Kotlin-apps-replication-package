# Evolution of Kotlin apps replication package

### About
The purpose is to test how the energy consumption of Kotlin applications changes with time. For each selected application, a different number of releases were chosen to run the tests on. The test are recorded keystrokes and inputs used to run a specific feature of the application. After ruuning the trial, the energy(In Joules) that were consumed was collected. After collecting the data, statistical tests were performed to help interpret the results.

### Requirements
##### Hardware:
• Raspberry Pi 3: Debian 11, ARM Cortex-A53, 1 GB RAM <br>
• Android Device: Nokia 6.2, Android 10, Qualcomm SDM636, 4GB RAM, eMMC 5.1 <br> 
• Personal computer for connecting to Raspberry PI via SSH connection.<br> 
##### Software:
• Android Runner: A tool for launching applications and automating testing on an Android device.<br> 
• Python v.3.9.13: Python development environment and application interpreter, used to run the Android Runner.<br> 
• Android SDK: Set of tools to build, test, and debug apps for Android.<br> 
• Monkeyrunner : A tool provides an API for writing programs that control an Android device or emulator from outside of Android code.<br> 
• RStudio v.2022.07.2-576 4


### Reproduction
This repository consists of subfolders that allow the replication of the project. Each subfolder contains its own readme file that provides a description on the requirements and usage. If only interested in replicating the data analysis the subfolder 01 Data and 05 Analysis are sufficient.
<br> 
### 01 Data
Contains a list of 87 mobile apps that represents the initial pool of apps to choose from. Also, it contains the list after applying the inclusion and exclusion criteria. Finally, it contains the data that were collected after each trial of the experiment.
<br> 
### 02 Tests
Contains the tests(recorded keystrokes) that were used on each release of each application.
<br> 
### 03 Source code
Contains scripts for android-runner and the required android-runner config file.
<br>
### 04 Figures
Contains the plots created after running the statistical tests
<br> 
### 05 Analysis
Contains R scripts to perform statistical tests
