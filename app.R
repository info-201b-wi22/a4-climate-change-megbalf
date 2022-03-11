library(rsconnect)

library(shiny)
library(dplyr)
library(ggplot2)
source("my_ui.R")
source("my_server.R")


shinyApp(ui = my_ui, server = my_server)
rsconnect::setAccountInfo(name = 'megbalf', 
                          token = '6989011D62F8BF60F9CF51842269A1AD',
                          secret = 'YCWNxS6ikubedwq2CZ2AXQwsUVio68BB7rETNSfW')



