# Load the required packages
library(leaflet)
library(htmlwidgets)
library(htmltools)

myIcon <- makeIcon(
  iconUrl = "https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-red.png",
  iconWidth = 25, iconHeight = 41
)

# Define a custom control for the title
tag.map.title <- tags$style(HTML("
  .leaflet-control.map-title { 
    transform: translate(-50%,20%);
    position: fixed !important;
    left: 50%;
    text-align: center;
    padding-left: 10px; 
    padding-right: 10px; 
    background: rgba(255,255,255,0.75);
    font-weight: bold;
    font-size: 28px;
  }
"))
title <- tags$div(
  tag.map.title, HTML("Study Area Map")
) 

# Create a location map
m <- leaflet() %>% 
  addTiles() %>%  # addTiles: Add a tile layer to the map
  setView(lat = 37.28177090601573, lng = 32.71772009737225, zoom = 13)%>% # Set the view of the map (center and zoom level)
  addMarkers(lat = 37.28177090601573, lng = 32.71772009737225, popup = "Güneysınır", label = "Güneysınır", icon = myIcon) %>% # Add a marker with a popup and label
  addPopups(lat = 37.28177090601573, lng = 32.71772009737225, popup = "Study Area!") %>% # Add a popup to the marker
  addScaleBar(position = "bottomleft")%>% # Add a scale bar to the map in the bottom left corner
  addLegend(position = "topright", colors = "red", labels = "Study Location") %>% # Add a legend to the map
  addControl(title, position = "topleft", className="map-title")

m


