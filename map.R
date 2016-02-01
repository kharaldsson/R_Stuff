#load packages
library(RODBC)
library(ggmap)
library(ggplot2)
library(dplyr)
library(rgdal)
library(scales)
library(Cairo)
library(maptools)

#establish odbc connection to SQL server if necessary
channel <- odbcConnect("RODBC_Name", uid="User ID", pwd="password")
abm <- sqlQuery(channel, "SELECT * FROM databasename")
odbcClose(channel)

#load state map shapefile & convert into data frame
state <- readOGR(dsn = "C:/Users/kharaldsson/Downloads/US State Map", layer = "cb_2014_us_state_20m")
state2 <- fortify(state, region="NAME")

#left join map file with shapefile
plotData <- left_join(state2, abm)

#create map
p <- geom_polygon(data = plotData, aes(x = long, y = lat, group = group, fill = percent), color = "black", size = 0.25)

ggsave(p, file = "map1.png", width = 6, height = 4.5, type = "cairo-png")
