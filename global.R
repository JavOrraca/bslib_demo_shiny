library(rlang)          # back-end toolbox for R
library(dplyr)          # data manipulation
library(purrr)          # functional programming and iteration
library(ggplot2)        # static graphics engine
library(showtext)       # using fonts more easily in R graphs
library(scales)         # scaling ggplot2 axes
library(shiny)          # core shiny package
library(shinyWidgets)   # widget extension for shiny
library(bslib)          # shiny layout and theme styling
library(thematic)       # styling R base and ggplot2 graphics
library(DT)             # R interface to the JavaScript library DataTables
library(leaflet)        # R interface to the JavaScript library Leaflet
library(rsconnect)      # easy deployment of apps to shinyapps.io and more

file_paths <- fs::dir_ls(c("modules", "helpers"))
map(file_paths, function(x){source(x)})