# Kuhan krompir v oblicah
r <- rep("Kuhan krompir v oblicah", 3)
s <- c("Krompir", "Olje", "sol")
kolicina <- c("1 kg", "20 g", "3 ščepce")

#Stročji fižol s paradižniki
r <- append(r, rep("Stročji fižol s paradižniki", 9))
s <- append(s, c("Fižol, sveži", "Paradižnik", "Čebula, bela", "Česen", "Peteršilj", "Olje", "Kis, balzamični", "Sol", "Poper"))
kolicina <- append(kolicina, c("300 g", "150 g", "1", "2 stroka", "4 vejice", "3 žlice", "2 žlici", "2 ščepca", "1 ščepec"))

# Piščančji casserole
r <- append(r, rep("Piščančji casserole", 10))
s <- append(s, c("Piščanec, belo meso", "Makaroni", "Brokoli", "Olje", "Grah, zrnje", "Čebula, bela", "Origano", "Sol", "Poper", "Sir, edamec"))
kolicina <- append(kolicina, c("4 večji fileji", "250 g", "1 glavica", "5 žlic", "50 g", "1", "1 žlica", "2 ščepca", "1 ščepec", "200 g"))

# Pečene sardele
r <- append(r, rep("Pečene sardele", 5))
s <- append(s, c("Sardela", "Sol", "Pšenična m., bela", "Olje", "Limona"))
kolicina <- append(kolicina, c("1 kg", "1 žlička", "150g", "0,5dl", "1"))

# Losos s porovim pirejem
r <- append(r, rep("Losos s porovim pirejem", 11))
s <- append(s, c("Por", "Maslo", "Krompir", "Mleko", "Sladka smetana", "Losos", "Olje", "Česen", "Rožmarin", "Limona", "Sol"))
kolicina <- append(kolicina, c("1", "kos", "700g", "NA", "NA", "600g", "1,5 žličke","1 strok", "NA", "1", "NA")
                   
# Testo za palačinke
r <- append(r, rep("Testo za palačinke", 5))
s <- append(s, c("Pšenična m., bela", "Sol", "Jajce", "Mleko", "Olje"))
kolicina <- append(kolicina, c("100g", "1 ščepec", "2", "300ml", "1 žlička"))


potrebujemo <- data.frame(r, s, kolicina)
colnames(potrebujemo) <- c("Ime recepta", "Sestavine", "Količina")


