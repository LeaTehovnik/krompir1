# Neposredno klicanje SQL ukazov v R
library(dplyr)
library(RPostgreSQL)
#source("2.Uvoz/Uvoz.R")
source("1-uvoz/uvoz_tabel.R")
#source("2-podatki/hrana.R")
source("3-baza/auth.R")

# Povežemo se z gonilnikom za PostgreSQL
drv <- dbDriver("PostgreSQL")  

#Funkcija, ki nam zbriše tabele, če jih že imamo
delete_table <- function(){
  tryCatch({
    conn <- dbConnect(drv, dbname = db, host = host,
                      user = user, password = password)
    
    #Če tabela obstaja jo zbrišemo, ter najprej zbrišemo tiste, 
    #ki se navezujejo na druge
    dbSendQuery(conn,build_sql("DROP TABLE IF EXISTS hrana"))
    dbSendQuery(conn,build_sql("DROP TABLE IF EXISTS kategorija"))
    dbSendQuery(conn,build_sql("DROP TABLE IF EXISTS recept"))

    
    
  }, finally = {
    dbDisconnect(conn)
    
  })
}


#Funkcija, ki ustvari tabele
create_table <- function(){
  # Uporabimo tryCatch,(da se povežemo in bazo in odvežemo)
  # da prisilimo prekinitev povezave v primeru napake
  tryCatch({
    # Vzpostavimo povezavo
    conn <- dbConnect(drv, dbname = db, host = host,#drv=s čim se povezujemo
                      user = user, password = password)
    
    #Glavne tabele
    hrana <- dbSendQuery(conn,build_sql("CREATE TABLE hrana (
                                         id SERIAL PRIMARY KEY,
                                         ime TEXT UNIQUE,
                                         kcal INTEGER,
                                         voda INTEGER,
                                         beljakovine INTEGER,
                                         mascobe INTEGER,
                                         holesterol INTEGER,
                                         ogljikovi_hidrati INTEGER,
                                         enota INTEGER NOT NULL)"))
    
    kategorija <- dbSendQuery(conn,build_sql("CREATE TABLE kategorija (
                                          id TEXT PRIMARY KEY NOT NULL,
                                          kategorija_hrane TEXT NOT NULL,
                                          )"))
    
    recept <- dbSendQuery(conn,build_sql("CREATE TABLE recept (
                                            id SERIAL PRIMARY KEY,
                                            ime TEXT UNIQUE,
                                            sestavine TEXT NOT NULL,
                                            postopek)"))  #NI PRAV
    
   
    
  }, finally = {
    # Na koncu nujno prekinemo povezavo z bazo,
    # saj preveč odprtih povezav ne smemo imeti
    dbDisconnect(conn) #PREKINEMO POVEZAVO
    # Koda v finally bloku se izvede, preden program konča z napako
  })
}

#Uvoz podatkov
#1. hrana
hrana<-read.csv2("2-Podatki/hrana.csv",fileEncoding = "Windows-1250", na.strings = c("sl,","–"))

#2. vsi kontinenti
kategorija <- read.csv2("2-Podatki/kategorija.csv",fileEncoding = "Windows-1250")

#3. recept
recept<-read.csv2("2-Podatki/recept.csv",fileEncoding = "Windows-1250",stringsAsFactors=FALSE)

hrana <- hrana %>% inner_join(kategorija, by = c("Kategorija" = "kategorije_hrane")) %>%
  mutate(kategorija = id) %>% select(-Kategorija, -id)


#Funcija, ki vstavi podatke
insert_data <- function(){
  tryCatch({
    conn <- dbConnect(drv, dbname = db, host = host,
                      user = user, password = password)
    
    dbWriteTable(conn, name="hrana", hrana, append=T, row.names=FALSE)
    dbWriteTable(conn, name="kategorija",kategorija,append=T, row.names=FALSE)
    dbWriteTable(conn, name="recept", recept, append=T, row.names=FALSE) 
    
  }, finally = {
    dbDisconnect(conn) 
    
  })
}

delete_table()
create_table()
insert_data()

con <- src_postgres(dbname = db, host = host, user = user, password = password)

#relacija kam spada


#relacija potrebujemo
