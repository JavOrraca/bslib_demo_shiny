ui_Overview <- function(id){
  ns <- NS(id)
  
  tabPanel(
    "Overview",
    fluidRow(
      column(3,
             wellPanel(
               selectInput(inputId = ns("region_select"),
                           label = tags$b("Select Region:"),
                           choices = c("All Regions", "Australia", "APAC", "Europe", 
                                       "North America", "South America"),
                           selected = "All Regions"
               ),
               uiOutput(ns("industry_selector"))
             )
      ),
      column(9,
             plotOutput(ns("plot"),
                        height = "600px")
      )
    )
  )
}

server_Overview <- function(id){
  moduleServer(
    id, 
    function(input, output, session){
      ns <- session$ns
      
      diamonds_alt <- diamonds %>% 
        rename("Revenue" = price,
               "Year" = carat,
               "Industry" = color) %>% 
        mutate(cut = case_when(cut == "Fair" ~ "APAC",
                               cut == "Good" ~ "Europe",
                               cut == "Very Good" ~ "South America",
                               cut == "Premium" ~ "North America",
                               cut == "Ideal" ~ "Australia"),
               cut = factor(cut, levels = c("APAC", "Europe", "South America", 
                                            "North America", "Australia")),
               Industry = case_when(Industry == "D" ~ "Healthcare",
                                    Industry == "E" ~ "Telecom",
                                    Industry == "F" ~ "Distributors",
                                    Industry == "G" ~ "Brands",
                                    Industry == "H" ~ "Retail",
                                    Industry == "I" ~ "Manufacturers",
                                    Industry == "J" ~ "Other")
        ) %>% 
        filter(Year <= 2.5)
      
      set.seed(123)
      diamonds_alt_sampled <- diamonds_alt[sample(nrow(diamonds_alt), 5000), ]
      
      custom_plot_theme <- thematic_theme(
        bg = "#ffffff",
        fg = "#1d2d42",
        accent = "#f3d436",
        font = font_spec(font_google("Open Sans"), scale = 1.75)
      )
      
      industry_options <- reactive({
        req(diamonds_alt, diamonds_alt_sampled, input$region_select)
        if(input$region_select == "All Regions"){
          diamonds_alt_sampled %>% 
            distinct(Industry) %>% 
            arrange(Industry) %>% 
            pull()
        }else{
          diamonds_alt %>% 
            filter(cut == input$region_select) %>% 
            distinct(Industry) %>% 
            arrange(Industry) %>% 
            pull()
        }
      })
      
      output$industry_selector <- renderUI({
        req(industry_options())
        
        awesomeCheckboxGroup(
          inputId = ns("industry_line"),
          label = tags$b("Industry Subset:"), 
          choices = industry_options(),
          selected = industry_options(),
          inline = FALSE, 
          status = "success"
        )
      })
      
      output$plot <- renderPlot({
        req(diamonds_alt, input$region_select, 
            industry_options(), input$industry_line)
        
        if(input$region_select == "All Regions"){
          thematic_with_theme(
            custom_plot_theme,
            
            diamonds_alt_sampled %>% 
              filter(Industry %in% input$industry_line) %>% 
              ggplot(aes(Year, Revenue)) +
              geom_point(alpha = 0.2) +
              geom_smooth() +
              facet_wrap(~ cut) +
              scale_x_continuous(breaks = c(0, 0.5, 1, 1.5, 2, 2.5),
                                 labels = c(2017, 2018, 2019, 2020, 2021, 2022)) +
              scale_y_continuous(labels = scales::dollar_format()) +
              ylab(NULL) +
              ggtitle("Revenue by Global Region")
          )
        }else{
          thematic_with_theme(
            custom_plot_theme,
            
            diamonds_alt %>% 
              filter(cut == input$region_select,
                     Industry %in% input$industry_line) %>% 
              ggplot(aes(Year, Revenue, color = Industry)) +
              geom_point(alpha = 0.2) +
              geom_smooth(se = FALSE) +
              scale_x_continuous(breaks = c(0, 0.5, 1, 1.5, 2, 2.5),
                                 labels = c(2017, 2018, 2019, 2020, 2021, 2022)) +
              scale_y_continuous(labels = scales::dollar_format()) +
              ylab(NULL) +
              ggtitle(paste0("Revenue for ", input$region_select))
          )
        }
      })
    }
  )
}