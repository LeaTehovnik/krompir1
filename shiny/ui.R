library(shiny)

shinyUI(fluidPage(
  
  titlePanel("HRANA"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("max",
                  "Max stevilo kalorij:",
                  min = 0,
                  max = 900,
                  value = 10)
    ),
    
    mainPanel(
      tableOutput("hrana_kalorije")
    )
  )
))