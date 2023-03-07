futureClim<-raster::getData(name="CMIP5", var = 'bio', res = 2.5,
                            rcp = 45, model = 'IP', year = 70, path="data")
names(futureClim) = names(clim)
#got future climate data

geographicAreaFuture<-crop(futureClim, predictExtent*1.5)

salamanderFuturePrediction<-raster::predict(salamanderSDM, geographicAreaFuture)
salamanderSPDF<-as(salamanderFuturePrediction, "SpatialPixelsDataFrame")
salamanderPredictionDataFrame<-as.data.frame(salamanderSPDF)
#cropped climate data to area where salamanders live


xmax <- max(salamanderPredictionDataFrame$x)
xmin <- min(salamanderPredictionDataFrame$x)
ymax <- max(salamanderPredictionDataFrame$y)
ymin <- min(salamanderPredictionDataFrame$y)

ggplot() +
  geom_polygon(data = wrld, mapping = aes(x = long, y = lat, group = group),
               fill = "grey75") +
  geom_raster(data = salamanderPredictionDataFrame, aes(x = x, y = y, fill = layer)) + 
  scale_fill_gradientn(colors = terrain.colors(10, rev = T)) +
  coord_fixed(xlim = c(xmin, xmax), ylim = c(ymin, ymax), expand = F) +
  scale_size_area() +
  borders("world") +
  borders("state") +
  labs(title = "SDM of R. cascadae Under CMIP 5 Climate Conditions",
       x = "longitude",
       y = "latitude",
       fill = "Env Suitability") +
  theme(legend.box.background=element_rect(),legend.box.margin=margin(5,5,5,5)) 

ggsave(filename="salamanderSDMFuture.jpg", path="output", scale=3)
