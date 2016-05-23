library(XML)
theurl <- "http://www.zdravobitje.si/hranilne-kaloricne-vrednosti-zivil/"

#skupna tabela
tables <- readHTMLTable(theurl)

#locene tabele

mlecni_izdelki <- tables[[1]]
mlecni_izdelki <- mlecni_izdelki[-1,]
write.table(mlecni_izdelki,file="mlecni_izdelki.csv",sep=";")
#colnames(mlecni_izdelki) <- c("Mleko in izdelki", "E(kCal)", "Voda(g)", "Belj. (g)", "Mas. (g)", "Hole. (g)", "Og.H. (g)")


meso <- tables[[2]]
meso <- meso[-1,]
write.table(meso,file="meso.csv",sep=";")
#colnames(meso) <- c("Meso", "E(kCal)", "Voda(g)", "Belj. (g)", "Mas. (g)", "Hole. (g)", "Og.H. (g)")

ribe <- tables[[3]]
ribe <- ribe[-1,]
write.table(ribe,file="ribe.csv",sep=";")
#colnames(ribe) <- c("Ribe", "E(kCal)", "Voda(g)", "Belj. (g)", "Mas. (g)", "Hole. (g)", "Og.H. (g)")

zita <- tables[[4]]
zita <- zita[-1,]
write.table(zita,file="zita.csv",sep=";")
#colnames(zita) <- c("Zita", "E(kCal)", "Voda(g)", "Belj. (g)", "Mas. (g)", "Hole. (g)", "Og.H. (g)")

zelenjava <- tables[[5]]
zelenjava <- zelenjava[-1,]
write.table(zelenjava,file="zelenjava.csv",sep=";")
#colnames(zelenjava) <- c("Zelenjava", "E(kCal)", "Voda(g)", "Belj. (g)", "Mas. (g)", "Hole. (g)", "Og.H. (g)")

sadje <- tables[[6]]
sadje <- sadje[-1,]
write.table(sadje,file="sadje.csv",sep=";")
#colnames(sadje) <- c("Sadje", "E(kCal)", "Voda(g)", "Belj. (g)", "Mas. (g)", "Hole. (g)", "Og.H. (g)")

pijaca <- tables[[7]]
pijaca <- pijaca[-1,]
write.table(pijaca,file="pijaca.csv",sep=";")
#colnames(pijaca) <- c("Pijaca", "E(kCal)", "Voda(g)", "Belj. (g)", "Mas. (g)", "Hole. (g)", "Og.H. (g)")

hrana <- rbind(mlecni_izdelki, meso, ribe, zita, zelenjava, sadje, pijaca)
hrana$Enota <- c(rep("100g", 177))
write.table(hrana,file="hrana.csv",sep=";")
colnames(hrana) <- c("Ime", "E(kCal)", "Voda(g)", "Belj. (g)", "Mas. (g)", "Hole. (g)", "Og.H. (g)", "Enota")
