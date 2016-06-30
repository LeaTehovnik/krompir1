library(shiny)
library(dplyr)
library(RPostgreSQL)

source("../auth_public.R")

shinyServer(function(input, output) {
  # Vzpostavimo povezavo
  conn <- src_postgres(dbname = db, host = host,
                       user = user, password = password)
  # Pripravimo tabelo
  tbl.hrana <- tbl(conn, "hrana")
  
  output$hrana_kalorije <- renderTable({
    # Naredimo poizvedbo
    # x %>% f(y, ...) je ekvivalentno f(x, y, ...)
    t <- tbl.hrana %>% filter(kcal < input$max) %>%  
      arrange(kcal) %>% data.frame()
    # Vrnemo dobljeno razpredelnico
    t
  })
  ##############################################
#   output$recepti_cas<- renderTable({
#     # Naredimo poizvedbo
#     # x %>% f(y, ...) je ekvivalentno f(x, y, ...)
#     t <- tbl.recepti %>% filter(cas < input$max) %>%  
#       arrange(cas) %>% data.frame()
#     # Vrnemo dobljeno razpredelnico
#     t
#   })
  
})