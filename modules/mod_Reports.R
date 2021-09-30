ui_Reports <- function(id){
  ns <- NS(id)
  
  tabPanel(
    "Reports",
    fluidRow(
      column(4,
             selectInput(ns("man"),
                         label = tags$b("Manufacturer:"),
                         c("All", unique(mpg$manufacturer)))
      ),
      column(4,
             selectInput(ns("trans"),
                         label = tags$b("Transmission:"),
                         c("All", unique(mpg$trans)))
      ),
      column(4,
             selectInput(ns("cyl"),
                         label = tags$b("Cylinders:"),
                         c("All", unique(mpg$cyl)))
      )
    ),
    DT::dataTableOutput(ns("table"))
  )
}

server_Reports <- function(id){
  moduleServer(
    id, 
    function(input, output, session){
      ns <- session$ns
      
      output$table <- DT::renderDataTable(DT::datatable({
        data <- mpg
        
        if (input$man != "All") {
          data <- data[data$manufacturer == input$man,]
        }
        if (input$cyl != "All") {
          data <- data[data$cyl == input$cyl,]
        }
        if (input$trans != "All") {
          data <- data[data$trans == input$trans,]
        }
        data
      }))
    }
  )
}