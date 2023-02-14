install.packages("spocc")
install.packages("tidyverse") 
library(spocc)
library(tidyverse)

rawData<-occ(query="Rhyacotriton cascadae", from="gbif", limit=4000)
salamnderData<-rawData$gbif$data$Rhyacotriton_cascadae

