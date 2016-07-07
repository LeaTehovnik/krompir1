library(shiny)

shinyUI(fluidPage(
  
  titlePanel("HRANA"),
  
  tabsetPanel(
    
#################################
  tabPanel("max",
  sidebarLayout(
    sidebarPanel(
      sliderInput("max_kcal",
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
tabPanel("Maksimalen cas priprave",
         sidebarLayout(
           sidebarPanel(
             sliderInput("max_cas",
                         "Čas priprave",
                         min = 0,
                         max = 200,
                         value = 5)
           ),
           
           mainPanel(
             tableOutput("recept_cas") #tuki recept_cas
           )
         )
),
####################
tabPanel("Maximalno stevilo kalorij v receptu",
         sidebarLayout(
           sidebarPanel(
             sliderInput("maks",
                         "Max stevilo kalorij v receptu:",
                         min = 0,
                         max = 3000,
                         value = 100)
           ),
           
           mainPanel(
             tableOutput("recept_kalorije")
           )
         )
)
# ,
# ####################
# tabPanel("Prikaz recepta",
#          selectInput("select", label = h3("Izberi recept"), 
#                      choices = recept$ime, 
#                      selected = 1),
#          
#          hr() ,
#          fluidRow(column(3, verbatimTextOutput("value")))
#          
# )

  ))
)