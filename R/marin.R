#' marin
#'
#' Levantar applicativo.
#'
#' @importFrom magrittr '%>%'
#' @import shinydashboard
#' @export
marin <- function() {
  shiny::runApp(system.file("marin", package = "marin"))
}
