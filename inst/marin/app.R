

library(dplyr)
library(magrittr)
library(ggplot2)
library(plotly)
library(crosstalk)



lapply(list.files(".", "m_"), source)

ui <- shinydashboard::dashboardPage(
  # skin = "green",
  sw_dashboardHeader("Documentar y Analizar Misiones de Colectas",
                     logo = "inia.jpg"),

  sidebar,
  body = shinydashboard::dashboardBody(
    shinyjs::useShinyjs(),
    shinydashboard::tabItems(
      ui_about,
      # importar (y anotar con ecoclim)
      ui_marinmap # cuadro vinculado: mapa, tabla, eco, timeline

      # diversidad
      # rarefaction
      # PCA
      # taxones comunes y raros
      # BANOVA
      # bioclim
      # Maxent
      # brechas de colleción
      # crear reporte
    )
  ),
  skin = "green"
)

server <- function(input, output, session) {
  fp <- system.file("db/2- BASE DE DATOS MUESTREO ROYA EN CAMPO-3.xlsx",
                    package = "marin")


  tbl <- marin:::import_tbl(fp) %>% as.data.frame()
  #names(tbl)[10] <- "collecta"
  tbl_sh <- SharedData$new(tbl)

  notifications <<-  reactiveValues(
    note01 = list(id = "welcome", icon = "info", status = "success",
                  text = "Bienvenido!", href = NULL)
  )

  sv_std(input, output, session, tbl_sh = tbl_sh)
  # sv_marinmap(input, output, session, tbl_sh = tbl_sh)
  # sv_marindiary(input, output, session, tbl_sh = tbl_sh)
  output$marinmap <- leaflet::renderLeaflet({
    marin:::plot_map(tbl_sh$data(withSelection = TRUE))
  })

  output$marindiary <- plotly::renderPlotly({

    # dbdays <- tbl_sh %>% group_by(date(collecta)) %>% summarize(collectado = n())
    # names(tbl_sh)[1] <- "fecha_collecta"

    p <- ggplot2::ggplot(data = tbl_sh$data(withSelection = TRUE), aes(x = FechaColecta, y = TubosColectados)) +
      geom_col()
    p
  })
}


shiny::shinyApp(ui, server, options = list(
  launch.browser = TRUE
))
