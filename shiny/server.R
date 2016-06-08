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
  
  output$transakcije <- renderTable({
    # Naredimo poizvedbo
    # x %>% f(y, ...) je ekvivalentno f(x, y, ...)
    t <- tbl.hrana %>% filter(kcal > input$min) %>%  ##če so vsebovana jajca..???
      arrange(voda) %>% data.frame()
    # Vrnemo dobljeno razpredelnico
    t
  })
  
})