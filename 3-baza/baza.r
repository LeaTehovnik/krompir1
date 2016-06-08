# Neposredno klicanje SQL ukazov v R
library(dplyr)
library(RPostgreSQL)

source("1-uvoz/uvoz_tabel.R")
#source("2-podatki/hrana.R")
source("auth.R")

# Povežemo se z gonilnikom za PostgreSQL
drv <- dbDriver("PostgreSQL")  

#Funkcija, ki nam zbriše tabele, če jih že imamo
delete_table <- function(){
  tryCatch({
    conn <- dbConnect(drv, dbname = db, host = host,
                      user = user, password = password)
    
    #Če tabela obstaja jo zbrišemo, ter najprej zbrišemo tiste, 
    #ki se navezujejo na druge
    dbSendQuery(conn,build_sql("DROP TABLE IF EXISTS potrebujemo"))
    dbSendQuery(conn,build_sql("DROP TABLE IF EXISTS recept"))
    dbSendQuery(conn,build_sql("DROP TABLE IF EXISTS hrana"))
    dbSendQuery(conn,build_sql("DROP TABLE IF EXISTS kategorija"))
    
    
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
    
    dbSendQuery(conn, paste("GRANT CONNECT ON DATABASE", db,
                            "TO javnost"))
    
    #Glavne tabele
    kategorija <- dbSendQuery(conn,build_sql("CREATE TABLE kategorija (
                                             id SERIAL PRIMARY KEY,
                                             ime TEXT UNIQUE NOT NULL
    )"))
    dbSendQuery(conn, build_sql("GRANT SELECT ON kategorija TO javnost"))
    
    
    hrana <- dbSendQuery(conn,build_sql("CREATE TABLE hrana (
                                        id SERIAL PRIMARY KEY,
                                        ime TEXT UNIQUE NOT NULL,
                                        kcal REAL,
                                        voda REAL,
                                        beljakovine REAL,
                                        mascobe REAL,
                                        holesterol REAL,
                                        ogljikovi_hidrati REAL,
                                        kategorija INTEGER NOT NULL
                                          REFERENCES kategorija(id))"))
    dbSendQuery(conn, build_sql("GRANT SELECT ON hrana TO javnost"))
    
    recept <- dbSendQuery(conn,build_sql("CREATE TABLE recept (
                                         id SERIAL PRIMARY KEY,
                                         ime TEXT UNIQUE NOT NULL,
                                         postopek TEXT NOT NULL)"))
    dbSendQuery(conn, build_sql("GRANT SELECT ON recept TO javnost"))
    
    
    potrebujemo <- dbSendQuery(conn,build_sql("CREATE TABLE potrebujemo (
                                              recept INTEGER REFERENCES recept(id),
                                              sestavina INTEGER REFERENCES hrana(id),
                                              kolicina REAL NOT NULL,
                                              PRIMARY KEY(recept, sestavina))"))
    dbSendQuery(conn, build_sql("GRANT SELECT ON recept TO javnost"))
    
    ##dodati moramo še foreign key
    
    
    
  }, finally = {
    # Na koncu nujno prekinemo povezavo z bazo,
    # saj preveč odprtih povezav ne smemo imeti
    dbDisconnect(conn) #PREKINEMO POVEZAVO
    # Koda v finally bloku se izvede, preden program konča z napako
  })
}

#Uvoz podatkov
#1. hrana
hrana<-read.csv2("2-podatki/hrana.csv",fileEncoding = "Windows-1250")

#2. kategorija
kategorija <- read.csv2("2-podatki/kategorija.csv",fileEncoding = "Windows-1250")

#3. recept
recept<-read.csv2("2-podatki/recept.csv",fileEncoding = "Windows-1250",stringsAsFactors=FALSE)

names(hrana) <- c("ime", "kcal", "voda", "beljakovine", "mascobe",
                  "holesterol", "ogljikovi_hidrati", "kategorija")
names(recept) <- c("ime", "postopek")
hrana <- inner_join(hrana, kategorija,
                    by = c("kategorija" = "kategorije_hrane")) %>%
  select(-kategorija) %>% rename(kategorija = id)

#Funcija, ki vstavi podatke
insert_data <- function(){
  tryCatch({
    conn <- dbConnect(drv, dbname = db, host = host,
                      user = user, password = password)
    
    dbWriteTable(conn, name="kategorija",kategorija,append=T, row.names=FALSE)
    dbWriteTable(conn, name="hrana", hrana, append=T)
    dbWriteTable(conn, name="recept", recept, append=T)
    
    con <- src_postgres(dbname = db, host = host,
                        user = user, password = password)
    tbl.hrana <- tbl(con, "hrana")
    tbl.recept <- tbl(con, "recept")
    potrebujemo$`Ime recepta` <- as.character(potrebujemo$`Ime recepta`)
    potrebujemo$`Sestavine` <- as.character(potrebujemo$`Sestavine`)
    data.potrebujemo <- potrebujemo %>%
      inner_join(tbl.hrana %>% select(id, ime) %>% rename(recept = id),
                 by = c("Sestavine" = "ime"), copy = TRUE) %>%
      inner_join(tbl.recept %>% select(id, ime) %>% rename(sestavina = id),
                 by = c("Ime recepta" = "ime"), copy = TRUE) %>%
      select(recept, sestavina, kolicina = Kolicina)
    #dbWriteTable(conn, name="potrebujemo", potrebujemo, append=T)
    
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