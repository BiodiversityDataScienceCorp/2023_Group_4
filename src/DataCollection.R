install.packages("spocc")
install.packages("tidyverse") 
library(spocc)
library(tidyverse)

rawData<-occ(query="Rhyacotriton cascadae", from="gbif", limit=4000)
salamanderData<-rawData$gbif$data$Rhyacotriton_cascadae

noDoopSal <- salamanderData %>% mutate(location = paste(latitude, longitude, dateIdentified, sep = "/")) %>% 
  distinct(location, .keep_all = TRUE)
noNASal <- noDoopSal %>% filter(latitude != "NA", longitude != "NA")


write_csv(noNASal, path="data/salamanderData.csv")

