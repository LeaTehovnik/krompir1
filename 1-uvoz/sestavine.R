# Kuhan krompir v oblicah
r <- rep("Kuhan krompir v oblicah", 3)
s <- c("Krompir", "Olje", "sol")
kolicina <- c("1000", "20", "15")

#Stročji fižol s paradižniki
r <- append(r, rep("Stročji fižol s paradižniki", 9))
s <- append(s, c("Fižol, sveži", "Paradižnik", "Čebula, bela", "Česen", "Peteršilj", "Olje", "Kis, balzamični", "Sol", "Poper"))
kolicina <- append(kolicina, c("300", "150", "150", "20", "10", "20", "15", "5", "2"))

# Piščančji casserole
r <- append(r, rep("Piščančji casserole", 10))
s <- append(s, c("Piščanec, belo meso", "Makaroni", "Brokoli", "Olje", "Grah, zrnje", "Čebula, bela", "Origano", "Sol", "Poper", "Sir, edamec"))
kolicina <- append(kolicina, c("800", "250", "250", "40", "50", "150", "15", "5", "2", "200"))

# Pečene sardele
r <- append(r, rep("Pečene sardele", 5))
s <- append(s, c("Sardela", "Sol", "Pšenična m., bela", "Olje", "Limona"))
kolicina <- append(kolicina, c("1000", "2", "150", "500", "100"))

# Losos s porovim pirejem
r <- append(r, rep("Losos s porovim pirejem", 11))
s <- append(s, c("Por", "Maslo", "Krompir", "Mleko", "Sladka smetana", "Losos", "Olje", "Česen", "Rožmarin", "Limona", "Sol"))
kolicina <- append(kolicina, c("200", "50", "700", "200", "150", "600", "20","10", "10", "100", "10"))
                   
# Testo za palačinke
r <- append(r, rep("Testo za palačinke", 5))
s <- append(s, c("Pšenična m., bela", "Sol", "Jajce", "Mleko", "Olje"))
kolicina <- append(kolicina, c("100", "5", "100", "300", "10"))

# Sadni lonček z jogurtom
r <- append(r, rep("Sadni lonček z jogurtom", 6))
s <- append(s, c("Jabolko, celo", "Breskev", "Grozdje, crno", "Borovnice", "Orehi, suhi", "Jogurt, 3,2 % m. m."))
kolicina <- append(kolicina, c("250", "250", "200", "120", "50", "60"))

#Hrenovke s kruhom
r <- append(r, rep("Hrenovke s kruhom", 3))
s <- append(s, c("Kruh, koruzni", "Hrenovke (gov. + svinj.)", "Paradižnik, kecap"))
kolicina <- append(kolicina, c("800", "400", "10"))

#Mešana solata z jajcem
r <- append(r, rep("Mešana solata z jajcem", 6))
s <- append(s, c("Jajce", "Kis, balzamicni", "Olje", "Paradižnik", "Endivija", "Paprika, rumena"))
kolicina <- append(kolicina, c("200", "20", "20", "300", "400", "400"))

#Narastek iz ovsene kaše 
r <- append(r, rep("Narastek iz ovsene kaše", 7))
s <- append(s, c("Jabolko, celo", "Ovseni kosmici", "Mleko, kravje, 3,2 % m. m.", "Maslo", "Sol", "Vanilin sladkor", "Jajce"))
kolicina <- append(kolicina, c("300", "300", "20", "1000", "10", "50", "150"))

#Sendvič
r <- append(r, rep("Sendvič", 5))
s <- append(s, c("Solata, zelena", "Mortadela", "Sir, gauda", "Sirni namaz, 20 % m. m.", "Kruh, graham"))
kolicina <- append(kolicina, c("200", "200", "200", "100", "800"))

potrebujemo <- data.frame(r, s, kolicina)
colnames(potrebujemo) <- c("Ime recepta", "Sestavine", "Količina")
write.table(potrebujemo,file="potrebujemo.csv",sep=";")

