#' linkedScatter
#'
#' @param input shiny input
#' @param output shiny output
#' @param session shiny session
#' @param data data
#' @param left  left
#' @param right  right
#' @export
linkedScatter <- function(input, output, session, data, left, right) {
  # Yields the data frame with an additional column "selected_"
  # that indicates whether that observation is brushed
  # dataWithSelection <- reactive({
  #   brushedPoints(data, input$brush, allRows = TRUE)
  # })

  library(d3scatter)

  output$plot1 <- d3scatter::renderD3scatter({
    #scatterPlot(data, left )
    d3scatter(data, left[1], left[2])
  })

  output$plot2 <- d3scatter::renderD3scatter({
    # scatterPlot(data, right)
    d3scatter(data, right[1], right[2])
  })

  return(data)
}
