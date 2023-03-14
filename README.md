# Rhyacotriton cascadae SSA

Sydney C, Aubrey W, Finn W, Olivia GH repo for ADS 2023

# Overview

-   Creating Species Occurence Maps and Species Distribution Models for Species Status Assessment of Rhyacotriton cascadae
-   Sydney C, Aubrey W, Finn W, Olivia GH repo for ADS 2023
-   Completed March, 2023 \
#  Dependencies 
The following R packages are required (these will be installed in each file where necessary):
-   raster
-   dismo
-   spocc
-   rJava
-   tidyverse
-   maps
-   maptools \# H4 Structure
# Structure
# Data

# Outputs

output (contents are not under version control) 
* occurancemap.jpeg 
* currentsdm.jpeg 
* futuresdm.jpeg 
* maxent_outputs

# Scripts

scripts (directory containing R scripts for gathering occurrence data, running forecast models, and creating map outputs) \
* [DataCollection.R](https://github.com/BiodiversityDataScienceCorp/2023_Group_4/blob/main/src/DataCollection.R) for obtaining the GBIF data \
* [SpeciesOccurenceMap.R]((https://github.com/BiodiversityDataScienceCorp/2023_Group_4/blob/main/output/salamanderOccurrence.jpg) create the occurrence map of the GBIF data \
* [SDMSalamander.R](https://github.com/BiodiversityDataScienceCorp/2023_Group_4/blob/main/src/SDMSalamander.R) to run a maxent model and generate a current sdm \
* [futureSDM.R](https://github.com/BiodiversityDataScienceCorp/2023_Group_4/blob/main/src/futureSDM.R) to generate a future SDM, in 70 years under IP model

Homework

# Running the code

Run the scripts in the following order

1\. [DataCollection.R](https://github.com/BiodiversityDataScienceCorp/2023_Group_4/blob/main/src/DataCollection.R)

2\. [SpeciesDistributionMap.R](https://github.com/BiodiversityDataScienceCorp/2023_Group_4/blob/main/src/SpeciesDistributionMap.R)

3\. [SDMSalamander.R](https://github.com/BiodiversityDataScienceCorp/2023_Group_4/blob/main/src/SDMSalamander.R)

4\. [futureSDM.R](https://github.com/BiodiversityDataScienceCorp/2023_Group_4/blob/main/src/futureSDM.R)
