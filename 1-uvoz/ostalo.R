#nova table


ime<-c("Jajce", "Voda", "Olje", "Kvas", "Sol", "Kis, balzamični", 
       "Poper", "Origano", "Rožmarin", "Maslo", "Rumenjak", "Beljak", 
       "Pecilni prašek", "Vanilin sladkor")
kalorije<-c(143, 0, 884, 0, 0, 88, 255, 306, 131, 717, 322, 52, 97, 396)
voda<-c(0, 100, 0, 0, 0, 76.45, 10.51, 7.16, 0, 17.94, 52.31, 87.57, 6.2, 0)
beljakovine<-c(12.58, 0, 0, 0, 0, 0.49, 10.95, 11, 3.3, 3.6, 15.86, 10.9, 0.1, 0)
mascobe<-c(9.94, 0, 0, 0, 0, 0, 3.26, 10.25, 6, 713, 26.54, 0.17, 0.4, 0)
holesterol<-c(423, 0, 0, 0, 0, 0, 0, 0, 0, 215, 1234, 0, 0, 0)
ogljikovi<-c(0.77, 0, 0, 38.2, 0, 17.03, 64.81, 64.43, 33, 0.2, 3.59, 0.73, 46.9, 99)

ostalo<-data.frame(ime, kalorije, voda, beljakovine, mascobe, holesterol, ogljikovi)
colnames(ostalo) <- c("Ostalo","E(kCal)", "Voda(g)", "Belj. (g)", "Mas. (g)", "Hole. (mg)", "Og.H. (g)")


