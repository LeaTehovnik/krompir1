library(XML)
library(gsubfn)
library(dplyr)
theurl <- "http://www.zdravobitje.si/hranilne-kaloricne-vrednosti-zivil/"

#skupna tabela
tables <- readHTMLTable(theurl)

#locene tabele

mlecni_izdelki <- tables[[1]]
mlecni_izdelki <- mlecni_izdelki[-1,]
write.table(mlecni_izdelki,file="mlecni_izdelki.csv",sep=";")


meso <- tables[[2]]
meso <- meso[-1,]
write.table(meso,file="meso.csv",sep=";")


ribe <- tables[[3]]
ribe <- ribe[-1,]
write.table(ribe,file="ribe.csv",sep=";")


zita <- tables[[4]]
zita <- zita[-1,]
write.table(zita,file="zita.csv",sep=";")


zelenjava <- tables[[5]]
zelenjava <- zelenjava[-1,]
write.table(zelenjava,file="zelenjava.csv",sep=";")


sadje <- tables[[6]]
sadje <- sadje[-1,]
write.table(sadje,file="sadje.csv",sep=";")


pijaca <- tables[[7]]
pijaca <- pijaca[-1,]
write.table(pijaca,file="pijaca.csv",sep=";")


ime<-c("Jajce", "Voda", "Olje", "Kvas", "Sol", "Kis, balzamicni", 
       "Poper", "Origano", "Rozmarin", "Maslo", "Rumenjak", "Beljak", 
       "Pecilni prasek", "Vanilin sladkor")
kalorije<-c(143, 0, 884, 0, 0, 88, 255, 306, 131, 717, 322, 52, 97, 396)
voda<-c(0, 100, 0, 0, 0, 76.45, 10.51, 7.16, 0, 17.94, 52.31, 87.57, 6.2, 0)
beljakovine<-c(12.58, 0, 0, 0, 0, 0.49, 10.95, 11, 3.3, 3.6, 15.86, 10.9, 0.1, 0)
mascobe<-c(9.94, 0, 0, 0, 0, 0, 3.26, 10.25, 6, 713, 26.54, 0.17, 0.4, 0)
holesterol<-c(423, 0, 0, 0, 0, 0, 0, 0, 0, 215, 1234, 0, 0, 0)
ogljikovi<-c(0.77, 0, 0, 38.2, 0, 17.03, 64.81, 64.43, 33, 0.2, 3.59, 0.73, 46.9, 99)

ostalo<-data.frame(ime, kalorije, voda, beljakovine, mascobe, holesterol, ogljikovi)
colnames(ostalo) <- c("V1", "V2", "V3", "V4", "V5", "V6", "V7")


hrana <- rbind(mlecni_izdelki, meso, ribe, zita, zelenjava, sadje, pijaca)
hrana <- data.frame(hrana$V1,
                    sapply(2:7, . %>% {hrana[[.]]} %>% as.character() %>% strapplyc("([0-9,]+)") %>%
                             sapply(paste, collapse = "") %>% {gsub(",", ".", .)}  %>% {gsub("^[.]$", "", .)} %>%
                             as.numeric()))
names(hrana) <- paste0("V", 1:7)
hrana <- rbind(hrana, ostalo)
#hrana$Enota <- c(rep("100g", 177))
hrana$Kategorija <- c(rep("mlecni izdelki", 20), rep("meso", 24), rep("ribe", 16),rep("zita", 28),rep("zelenjava", 39),rep("sadje", 39),rep("pijaca", 11), rep("ostalo",14))
write.table(hrana,file="hrana.csv",sep=";")
rownames(hrana)<-c(1:191)
colnames(hrana) <- c("Ime", "E(kCal)", "Voda(g)", "Belj. (g)", "Mas. (g)", "Hole. (mg)", "Og.H. (g)", "Kategorija")

kategorije_hrane <- c("mlecni izdelki", "meso", "ribe", "zita", "zelenjava", "sadje", "pijaca", "ostalo")
id <- c(1:length(kategorije_hrane))
kategorija <- data.frame(id,kategorije_hrane)
write.table(kategorija,file="kategorija.csv",sep=";")

