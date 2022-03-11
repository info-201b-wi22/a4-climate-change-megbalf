library(shiny)
library(dplyr)
library(ggplot2)

source("my_ui.R")

climate_data <- read.csv("https://nyc3.digitaloceanspaces.com/owid-public/data/co2/owid-co2-data.csv")

avg_co2 <- (avg_co2 = mean(climate_data$co2, na.rm=TRUE))

highest_co2 <- climate_data %>% 
  filter(co2 == max(co2, na.rm=TRUE)) %>% pull(country)

highest_co2_per_capita <- climate_data %>% 
  filter(co2_per_capita == max(co2_per_capita, na.rm=TRUE)) %>% pull(country)

avg_co2_per_capita <- (avg_co2_per_capita = mean(climate_data$co2_per_capita, na.rm=TRUE))

median_co2 <- (median_co2 = median(climate_data$co2, na.rm=TRUE))

unique_countries <- unique(climate_data$country)

server <- function(input, output) {

output$climatePlot <- renderPlot({
  climate_data <- data %>% 
    filter(Country %in% input$user_category) %>% 
    select(year, co2_per_capita, country)
  
  p <- ggplot(data = co2_per_capita_plot,
              aes(x = year, y = co2_per_capita, fill = country)) 
  geom_bar(stat = "identity") + 
    xlab("Year") + 
    ylab("Co2 Per Capita") + 
    ggtitle("Co2 Per Capita Per Year")
  p 
} )


output$coalPlot <- renderPlot({
  climate_data <- data %>% 
    filter(Country %in% input$user_category) %>% 
    select(year, coal_co2_per_capita, country)
  
  p <- ggplot(data = co2_per_capita_plot,
              aes(x = year, y = coal_co2_per_capita, fill = country)) 
  geom_bar(stat = "identity") + 
    xlab("Year") + 
    ylab("Coal Per Capita") + 
    ggtitle("Coal Per Capita Per Year")
  p 
} )
}


  

