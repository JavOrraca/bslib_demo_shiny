ui_Mapping <- function(id){
  ns <- NS(id)
  
  tabPanel(
    "Mapping",
    fluidRow(
      column(12,
             p(),
             actionButton(ns("recalc"), "Simulate Customer Locations"),
             p(),
             leafletOutput(ns("mymap"),
                           height = "calc(100vh - 220px)")
      )
    )
  )
}

server_Mapping <- function(id){
  moduleServer(
    id, 
    function(input, output, session){
      ns <- session$ns
      
      points <- eventReactive(input$recalc, {
        cbind(rnorm(40) * 2.5 - 114, 
              rnorm(40) + 36)
      }, ignoreNULL = FALSE)
      
      output$mymap <- renderLeaflet({
        req(points)
        leaflet() %>%
          addProviderTiles(
            "CartoDB.Positron",
            options = providerTileOptions(noWrap = TRUE)) %>%
          addMarkers(data = points())
      })
    }
  )
}