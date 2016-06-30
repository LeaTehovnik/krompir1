library(shiny)

shinyUI(fluidPage(
  
  titlePanel("HRANA"),
  
  tabsetPanel(
    
#################################
  tabPanel("max",
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
  ),
#############  
# tabPanel("max",
#          sidebarLayout(
#            sidebarPanel(
#              sliderInput("max",
#                          "Čas priprave",
#                          min = 0,
#                          max = 200,
#                          value = 5)
#            ),
#            
#            mainPanel(
#              tableOutput("hrana_kalorije") #tuki recepti_cas
#            )
#          )
# ),
#############  

  )
))