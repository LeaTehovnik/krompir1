#nova table


ime<-c("Jajca", "Voda","Olje","Kvas","Sol","Kis, balzamični","Poper", "Origano", "Rožmarin")
kalorije<-c(143, 0, 884, 0, 0, 88, 255, 306, 131)
voda<-c(0, 100, 0, 0, 0, 76.45, 10.51, 7.16, NA)
beljakovine<-c(12.58, 0, 0, 0, 0, 0.49, 10.95, 11, 3.3)
mascobe<-c(9.94, 0, 0, 0, 0, 0, 3.26, 10.25, 6)
holesterol<-c(423, 0, 0, 0, 0, 0, 0, 0, 0)
ogljikovi<-c(0.77, 0, 0, 0, 0, 17.03, 64.81, 64, 43, 33)

ostalo<-data.frame(ime,kalorije, voda, beljakovine, mascobe, holesterol, ogljikovi)
colnames(ostalo) <- c("Ostalo","E(kCal)", "Voda(g)", "Belj. (g)", "Mas. (g)", "Hole. (g)", "Og.H. (g)")


