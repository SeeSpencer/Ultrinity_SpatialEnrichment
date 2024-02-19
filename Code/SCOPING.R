install.packages("tidygeocoder")
library(tidygeocoder)
library(dplyr)
library(tidyr)

####################
# Batch Geocoding
###################


ProgramOutput<-read.csv("FILEPATH")

rowC<-nrow(ProgramOutput)
batch<-4000

r <- rep(1:ceiling(rowC/batch), each=batch)[1:rowC]
d<-split(ProgramOutput,r)


for (i in seq_along(d)){
  d[[i]] <- geocode(d[[i]], FULL.ADDRESS, method='census', lat = 'Latitude', long = 'longitude')
}

##################################
# Reassembly, Cleaning and Spatializing
#################################


install
library(sf)

output<-Reduce(full_join,d)

nrow(ProgramOutput) == nrow(output)
#Check Retention

GC_NA <-output[is.na(output$longitude),]
GC_VALID <- output %>% drop_na(longitude)

mapable <- GC_VALID %>% 
  st_as_sf(coords = c("longitude", "Latitude"), crs = 4326, remove = FALSE)


########################
# Map Scoping
#######################

install.packages("mapview")
library(mapview)

install.packages("leafsync")
library(leafsync)
install.packages("crsuggest")
library(crsuggest)

install.packages("tmap")
library(tmap)

install.packages("htmlwidgets")
library(htmlwidgets)

install.packages("shinyjs")
library(shinyjs)
tmaptools::palette_explorer()

install.packages("htmlwidgets")


####


mapable <- GC_VALID %>% 
  st_as_sf(coords = c("longitude", "Latitude"), crs = 4326, remove = FALSE)

mapview(mapable)
