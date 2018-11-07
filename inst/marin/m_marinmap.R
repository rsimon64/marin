
ui_marinmap <- shinydashboard::tabItem(
  tabName = "tabMap",
  shiny::fluidRow(
    shinycards::card(width = 6,
      title = "Mapa de Colecta",
      leaflet::leafletOutput("marinmap")
    ),

    shinycards::card(width = 6,
                     title = "Diario de Colecta",
                     plotly::plotlyOutput("marindiary")
    )
  )
)
#
# sv_marinmap <- function(input, output, session, tbl_sh) {
#   output$marinmap <- leaflet::renderLeaflet({
#     marin:::plot_map(tbl_sh)
#   })
#   # output$marinmap
# }
#
# sv_marindiary <- function(input, output, session, tbl_sh) {
#   output$marindiary <- plotly::renderPlotly({
#
#     # dbdays <- tbl_sh %>% group_by(date(collecta)) %>% summarize(collectado = n())
#     # names(tbl_sh)[1] <- "fecha_collecta"
#
#     p <- ggplot2::ggplot(data = tbl_sh, aes(x = FechaColecta, y = NumeroTubos)) +
#       geom_col()
#     p
#   })
#   # output$marindiary
# }
