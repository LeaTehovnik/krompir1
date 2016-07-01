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
),
####################
tabPanel("Prikaz recepta",
         selectInput("select", label = h3("Izberi recept"), 
                     choices = recept$ime, 
                     selected = 1),
         
         hr() ,
         fluidRow(column(3, verbatimTextOutput("value")))
         
)
##########################################
# Define UI for dataset viewer application
# 
#   
#   # Sidebar with controls to select a dataset and specify the
#   # number of observations to view. The helpText function is
#   # also used to include clarifying text. Most notably, the
#   # inclusion of a submitButton defers the rendering of output
#   # until the user explicitly clicks the button (rather than
#   # doing it immediately when inputs change). This is useful if
#   # the computations required to render output are inordinately
#   # time-consuming.
# tabPanel("Recepti brez",
#          sidebarLayout(
#     sidebarPanel(
#       selectInput("kategorija", "Recepti brez:", 
#                   choices = c("zelenjava", "sadje", "meso", "mlecni izdelki", "pijaca", "ostalo", "ribe", "zita")),
#       
#       
#       helpText("Note: while the data view will show only the specified",
#                "number of observations, the summary will still be based",
#                "on the full dataset."),
#       
#       submitButton("Pokaži recepte")
#     ),
#     
#     # Show a summary of the dataset and an HTML table with the
#     # requested number of observations. Note the use of the h4
#     # function to provide an additional header above each output
#     # section.
#     mainPanel(
#       h4("Summary"),
#       verbatimTextOutput("summary"),
#       
#       h4("Observations"),
#       tableOutput("view")
#     )
#   )
# )
  ))
)