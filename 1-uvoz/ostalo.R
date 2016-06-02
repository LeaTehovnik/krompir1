#nova table


ime<-c("jajca", "voda","olje","kvas",0,0,0)
kalorije<-c(143,0,884, 0,0,0,0 )
voda<-c(0,100,0, 0,0,0,0)
beljakovine<-c(12.58,0,0,0,0,0,0)
mascobe<-c(9.94,0,0,0,0,0,0)
holesterol<-c(423,0,0,0,0,0,0)
ogljikovi<-c(0.77,0,0,0,0,0,0)

ostalo<-data.frame(ime,kalorije, voda, beljakovine, mascobe, holesterol, ogljikovi)
colnames(ostalo) <- c("Ostalo","E(kCal)", "Voda(g)", "Belj. (g)", "Mas. (g)", "Hole. (g)", "Og.H. (g)")


