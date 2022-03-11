library("shiny")

intro_tab <- tabPanel(
  "Introduction",
  titlePanel("CO2 Emissions in Different Countries"), 
  p("Climate change is a very pressing global issue. We can see this by 
    looking at the data provided by"), 
  a(href = "https://ourworldindata.org/co2-and-other-greenhouse-gas-emissions", 
    "Our World in Data,"), 
  "which allows us to find and examines patterns of CO2 emissions based on many different factors.
  This dataset is updated regularly as updates are made available regarding CO2 emissions, greenhouse 
  gas emissions, energy, and other variables. Data regarding CO2 emissions, including methane and 
  nitrous oxide, is sourced from the Global Carbon Project. Updates to CO2 emissions are released 
  annually and updated for the public to see. The Global Carbon Project is a research project 
  that was formed to work with the international science community to establish a common and 
  mutually agreed knowledge base to use when developing policy. The importance of anthropogenic 
  climate change has become increasingly obvious to the scientific community, scientists, and 
  policymakers. The goals of this data is to develop a complete picture of the global carbon 
  cycle by looking at patterns and variability, processes and interactions, and carbon management. 
  They are looking for both biophysical and human dimensions together to isolate the interactions and 
  feedback between them. The problem with this data is that it is only released annually so it 
  takes time to draw conclusions about patterns regarding CO2 emission levels. The Global Carbon 
  Project continues to work for recognition of the scientific challenge and the absolute important 
  that the carbon cycle has on Earth’s sustainability. 
  The average CO2 of all of teh data was 267.8619 and the average CO2 per capita 
  was 4.1708. The highest CO2 was in the world and the highest CO2 per capita was in Sint Maarten(Dutch
  part). The last value I looked at teh was media CO2 was 4.857.",
  
            
            p('Click on "CO2 Emissions Table" or the "Coal to CO2 Ratio" to see
              interactive diagrams'),)

plot_page <- tabPanel(
  "CO2 Emissions Per Year",
  titlePanel("CO2 Emissions Per Year"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId = "year",
        label = "Year", 
        min = 1750, 
        max = 2019, 
        value = c(1750, 2019),
        sep = ""
      ),
      selectInput(
        inputId = "country",
        label = "Country",
        choices = unique_countries,
        selected = "Albania"
      ),
      textOutput(outputId = "message")
    ),
    mainPanel(
      plotOutput("plot")
    )
  )
)

table_page <- tabPanel(
  "Coal Emissions Per Year",
  titlePanel("Coal Emissions Per Year"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("year2",
                  label = "Year", 
                  min = 1750, 
                  max = 2019, 
                  value = c(1750, 2019),
                  sep = ""),
      selectInput(
        inputId = "country2",
        label = "Country of Interest:",
        choices = unique_countries,
        selected = "Albania"),
      textOutput(outputId = "message2")
    ),
    mainPanel(
      tableOutput("table")
    )
  )
)


my_ui <- navbarPage(
  "CO2 Emissions Analysis",
  intro_tab,
  plot_page,
  table_page
)