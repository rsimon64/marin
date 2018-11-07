plot_map <- function(tbl) {
  library(magrittr)
  library(leaflet)
  m <- tbl %>% leaflet() %>%
    addTiles() %>%
    addMarkers(lng = tbl$Lond, lat = tbl$Latd,
               popup =
                 paste(tbl$Codigo,
                        tbl$Altitud,
                        tbl$Localidad,
                        tbl$FechaColecta,
                        tbl$ariedad,
                        sep = "<br/>"))
  return(m)
}

