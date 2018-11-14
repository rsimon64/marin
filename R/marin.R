#' marin
#'
#' Levantar applicativo.
#'
#' @importFrom magrittr '%>%'
#' @import shinydashboard
#' @export
marin <- function() {

  fp <- system.file("fdb/flex1.Rmd", package = "marin")

  # shiny::runApp()

  rmarkdown::run(fp)
}
