library(XML)
theurl <- "http://www.zdravobitje.si/hranilne-kaloricne-vrednosti-zivil/"

#skupna tabela
tables <- readHTMLTable(theurl)

#ločene tabele
mlecni_izdelki <- tables[[1]]
write.table(mlecni_izdelki,file="mlecni_izdelki.csv",sep=";")

meso <- tables[[2]]
write.table(meso,file="meso.csv",sep=";")

ribe <- tables[[3]]
write.table(ribe,file="ribe.csv",sep=";")

zita <- tables[[4]]
write.table(zita,file="zita.csv",sep=";")

zelenjava <- tables[[5]]
write.table(zelenjava,file="zelenjava.csv",sep=";")

sadje <- tables[[6]]
write.table(sadje,file="sadje.csv",sep=";")

pijaca <- tables[[7]]
write.table(pijaca,file="pijaca.csv",sep=";")
