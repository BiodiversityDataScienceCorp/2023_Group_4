# H1 Rhyacotriton cascadae SSA 
Sydney C, Aubrey W, Finn W, Olivia GH repo for ADS 2023

# H2 Overview
* Creating Species Occurence Maps and Species Distribution Models for Species Status Assessment of Rhyacotriton cascadae
* Sydney C, Aubrey W, Finn W, Olivia GH repo for ADS 2023
* Completed March, 2023
# H3 Dependencies
The following R packages are required (these will be installed in each file where necessary):
* raster
* dismo
* spocc
* rJava
* tidyverse
* maps
* maptools
# H4 Structure

# H5  Data

# H6 Outputs
output (contents are not under version control)
* occurancemap.jpeg
* currentsdm.jpeg
* futuresdm.jpeg
* maxent_outputs

# H7 Scripts
scripts (directory containing R scripts for gathering occurrence data, running forecast models, and creating map outputs)
* dataaquisitioncleaning.R for obtaining the GBIF data
* occurancemap.R to create the occurance map of the GBIF data
* currentsdm.R to run a maxent model and generate a current sdm
* futuresdm.R to generate a future sdm, in 70 years under IP model
# H8 Homework

# H9 Running the code
Run the scripts in the following order
1. dataaquisitioncleaning.R
2. occurancemap.R
3. currentsdm.R
4. futuresdm.R
