library(shinyware)
library(shiny)
library(shinydashboard)

library(future)
plan(multiprocess)

library(promises)




sv_std <- function(input, output, session, tbl_sh) {

  session$onSessionEnded(function() {
    shiny::stopApp()
  })


  output$notificationMenu <- renderMenu({
    items <- lapply(reactiveValuesToList(notifications), function(el) {
      notificationItem(status = el$status, icon = icon(el$icon), text = el$text,
                       href = el$href)
    })
    dropdownMenu(
      type = "notifications", badgeStatus = "info",
      .list = items
    )
  })






}





