install.packages("dismo")
install.packages("maptools")
install.packages("tidyverse")
install.packages("rJava")
install.packages("maps")

library(dismo)
library(maptools)
library(tidyverse)
library(rJava)
library(maps)

salamanderCSV<-read_csv("data/salamanderData.csv")
salamanderDataNotCoords<-salamanderCS%>%dplyr::select(longitude,latitude)
salamanderDataSpatialPts <- SpatialPoints(salamanderDataNotCoords, proj4string = CRS("+proj=longlat"))

currentEnv <- getData("worldclim", var="bio", res=2.5, path="data/")
climList <- list.files(path = "data/wc2-5/", pattern = ".bil$",full.names = T)
clim <- raster::stack(climList)

mask <- raster(clim[[1]]) 
geographicExtent <- extent(x = salamanderDataSpatialPts)

set.seed(45) # seed set so we get the same background points each time we run this code 
backgroundPoints <- randomPoints(mask = mask, n = nrow(salamanderDataNotCoords),
                                 ext = geographicExtent, 
                                 extf = 1.25, # draw a slightly larger area than where our sp was found (ask katy what is appropriate here)
                                 warn = 0)
colnames(backgroundPoints) <- c("longitude", "latitude")


occEnv <- na.omit(raster::extract(x = clim, y = salamanderDataNotCoords))
absenceEnv<- na.omit(raster::extract(x = clim, y = backgroundPoints))


presenceAbsenceV <- c(rep(1, nrow(occEnv)), rep(0, nrow(absenceEnv)))
presenceAbsenceEnvDf <- as.data.frame(rbind(occEnv, absenceEnv)) 

salamanderSDM <- dismo::maxent(x = presenceAbsenceEnvDf, ## env conditions
                         p = presenceAbsenceV,   ## 1:presence or 0:absence
                         path=paste("output/maxent_outputs"))


predictExtent <- 2 * geographicExtent # choose here what is reasonable for your pts (where you got background pts from)
geographicArea <- crop(clim, predictExtent, snap = "in") # 


salamanderPredictPlot <- raster::predict(salamanderSDM, geographicArea)
raster.spdf <- as(salamanderPredictPlot, "SpatialPixelsDataFrame")
salamanderPredictDf <- as.data.frame(raster.spdf)

wrld <- ggplot2::map_data("world")

xmax <- max(salamanderPredictDf$x)
xmin <- min(salamanderPredictDf$x)
ymax <- max(salamanderPredictDf$y)
ymin <- min(salamanderPredictDf$y)

dev.off()
ggplot() +
  geom_polygon(data = wrld, mapping = aes(x = long, y = lat, group = group),
               fill = "grey75") +
  geom_raster(data = salamanderPredictDf, aes(x = x, y = y, fill = layer)) + 
  scale_fill_gradientn(colors = terrain.colors(10, rev = T)) +
  coord_fixed(xlim = c(xmin, xmax), ylim = c(ymin, ymax), expand = F) + # expand = F fixes weird margin
  scale_size_area() +
  borders("state") +
  borders("world")+
  labs(title = "SDM of R.cascadae Under Current Climate Conditions",
       x = "longitude",
       y = "latitude",
       fill = "Environmental \nSuitability") + # \n is a line break
  theme(legend.box.background=element_rect(),legend.box.margin=margin(5,5,5,5)) 

ggsave(filename="salamanderSDMCurrent.jpg", scale=2, path="output")