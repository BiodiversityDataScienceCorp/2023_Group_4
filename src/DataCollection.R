install.packages("spocc")
install.packages("tidyverse") 
library(spocc)
library(tidyverse)

rawData<-occ(query="Rhyacotriton cascadae", from="gbif", limit=4000)
salamanderData<-rawData$gbif$data$Rhyacotriton_cascadae

noDoopSal <- salamanderData %>% mutate(location = paste(latitude, longitude, dateIdentified, sep = "/")) %>% 
  distinct(location, .keep_all = TRUE)
noNASal <- noDoopSal %>% filter(latitude != "NA", longitude != "NA")

wrld<-ggplot2::map_data("world")
xmax<-max(noNASal$longitude)
xmin<-min(noNASal$longitude)
ymax<-max(noNASal$latitude)
ymin<-min(noNASal$latitude)
ggplot()+
  theme(panel.background = element_rect(fill = "#BFD5E3", colour = "#6D9EC1"))+
  geom_polygon(data=wrld, mapping=aes(x=long, y=lat, group=group), fill="grey75") +
  geom_point(data=noNASal, mapping=aes(x=longitude, y=latitude),show.legend = FALSE, color="darkgreen")+
  labs(title="species occurences of Rhyacotriton cascadae from 1818-2023", x="longitude", y="latitude")+
  coord_fixed(xlim=c(xmin -2,xmax +2), ylim=c (ymin,ymax))+
  scale_size_area()+
  borders("state")
  


#the occurrence points are places where a person saw a salamander. 
#They're verified by several people to be counted as research grade.
write_csv(noNASal, path="data/salamanderData.csv")

