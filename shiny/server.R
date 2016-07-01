library(shiny)
library(dplyr)
library(RPostgreSQL)
library(datasets)


source("../auth_public.R")

shinyServer(function(input, output) {
  # Vzpostavimo povezavo
  conn <- src_postgres(dbname = db, host = host,
                       user = user, password = password)
  # Pripravimo tabelo
  tbl.hrana <- tbl(conn, "hrana")
  tbl.recept <- tbl(conn, "recept")
  tbl.potrebujemo <- tbl(conn, "potrebujemo")
  
  output$hrana_kalorije <- renderTable({
    # Naredimo poizvedbo
    # x %>% f(y, ...) je ekvivalentno f(x, y, ...)
    t <- tbl.hrana %>% filter(kcal < input$max_kcal) %>%  
      arrange(kcal) %>% data.frame()
    validate(need(nrow(t) > 0, "Noben recept ne ustreza pogojem!"))
    Encoding(t$ime) <- "UTF-8"
    # Vrnemo dobljeno razpredelnico
    t
  })
  ##############################################
  output$recept_cas<- renderTable({
    # Naredimo poizvedbo
    # x %>% f(y, ...) je ekvivalentno f(x, y, ...)
    t <- tbl.recept %>% filter(cas < input$max_cas) %>%  
      arrange(cas) %>% data.frame()
    # Vrnemo dobljeno razpredelnico
    validate(need(nrow(t) > 0, "Noben recept ne ustreza pogojem!"))
    Encoding(t$ime) <- "UTF-8"
    Encoding(t$postopek) <- "UTF-8"
    t
  })
################################################################  

  output$recept_kalorije <- renderTable({
    t <- inner_join(tbl.potrebujemo, tbl.hrana, by = c("sestavina" = "id")) %>%
      group_by(recept) %>% summarise(kcal = sum(kolicina*kcal/100)) %>% filter(kcal < input$maks) %>%
      inner_join(tbl.recept, by = c("recept" = "id")) %>% select(-recept) %>% data.frame()
    validate(need(nrow(t) > 0, "Noben recept ne ustreza pogojem!"))
    Encoding(t$ime) <- "UTF-8"
    Encoding(t$postopek) <- "UTF-8"
    t
  })
  

  
############################################################
  
  #### recept brez ene kategorije -> izbor med temi recpeti -> prikaz recepta:
  
  # Define server logic required to summarize and view the 
  # selected dataset
#   shinyServer(function(input, output) {
#     
#     # Return the requested dataset
#     datasetInput <- reactive({
#       switch(input$kategorija,
#              "zelenjava" = zelenjava,
#              "pressure" = pressure,
#              "cars" = cars)
#     })
#     
#     # Generate a summary of the dataset
#     output$summary <- renderPrint({
#       dataset <- datasetInput()
#       summary(dataset)
#     })
#     
#     # Show the first "n" observations
#     output$view <- renderTable({
#       head(datasetInput(), n = input$obs)
#     })
#   })
  
})