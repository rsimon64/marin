sm <- sidebarMenu(
  menuItem(
    text="Acerca de",
    tabName="tabAbout",
    icon=icon("info")
  ),

  shinydashboard::menuItem("Mapa", tabName = "tabMap")
)


sidebar <- shinydashboard::dashboardSidebar(
  br(),
  div(
    # img(src="logo_app.png", width = "150px"),
    style="text-align: center;"),
  sm
  ,
  br(),
  div(
    tags$button(
      id = 'close',
      type = "button",
      class = "btn action-button btn-warning",
      #class = "btn-warning",
      onclick = "setTimeout(function(){window.close();}, 10);",  # close browser
      "Cerrar programa"
    ),
  style="text-align: center;")

)
