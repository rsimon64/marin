library(shiny)
library(ggplot2)
library(marin)
library(crosstalk)
library(leaflet)


ui <- fixedPage(
  h2("Module example"),

  leaflet::leafletOutput("map"),
  linkedScatterUI("scatters"),
  textOutput("summary")
)

server <- function(input, output, session) {

  db <- SharedData$new(quakes[sample(nrow(quakes), 100),])

  df <- callModule(linkedScatter, "scatters", db, left = c("mag", "lat"), right = c("depth", "lat"))

#
#   output$map <- leaflet(db) %>% addTiles() %>% addMarkers()

  # output$summary <- renderText({
  #   sprintf("%d observation(s) selected", nrow(df))
  # })
}

shinyApp(ui, server)
