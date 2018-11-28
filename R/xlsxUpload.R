#' Title
#'
#' @param id
#' @param label
#'
#' @return
#' @export
#'
#' @examples
xlsxUploadUI <- function(id, label = "Upload .xlsx file") {
  ns <- NS(id)

  # downloadButton(ns("download"), label)

  fileInput(ns("upload"), label)

}




#' Title
#'
#' @param input
#' @param output
#' @param session
#' @param data
#'
#' @return
#' @export
#'
#' @examples
xlsxUpload <- function(input, output, session, data) {
  output$dt <- DT::renderDataTable({
    DT::datatable(data(), filter = "top")
  })

  ## create a reactive containing the rows remaining after filters are applied
  filtered <- reactive({
    data()[input$dt_rows_all, ]
  })

  return(filtered)
}
