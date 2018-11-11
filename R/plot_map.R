

plot_map <- function(tbl) {
  library(magrittr)
  library(leaflet)
  m <- tbl %>% leaflet() %>%
    addTiles() %>%
    addCircleMarkers(
      lng = tbl$Lond, lat = tbl$Latd,
      radius = ~TubosColectados
      ,
      # # color = "red",
      # stroke = FALSE, fillOpacity = 0.5,
                   popup =
                     paste(tbl$Codigo,
                            tbl$Altitud,
                            tbl$Localidad,
                            tbl$FechaColecta,
                            tbl$Variedad,
                            sep = "<br/>")
    )
  # %>%
  #
  #   addMarkers(lng = tbl$Lond, lat = tbl$Latd,
  #              popup =
  #                paste(tbl$Codigo,
  #                       tbl$Altitud,
  #                       tbl$Localidad,
  #                       tbl$FechaColecta,
  #                       tbl$ariedad,
  #                       sep = "<br/>"))
  return(m)
}

