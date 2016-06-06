ime_recepta<-c("Kuhan krompir v oblicah",
               "Stročji fižol s paradižniki",
               "Piščančji casserole",
               "Pečene sardele",
               "Losos s porovim pirejem")




postopek<-c("Krompir zelo dobro operemo. Zložimo ga v večji lonec in zalijemo s toliko vode, da je popolnoma pokrit. 
            Vodo solimo, zavremo, nato pa znižamo temperaturo in krompir v pokritem loncu kuhamo 25 minut.
            Kuhanega odcedimo in pustimo, da se nekoliko ohladi. 
            Nato ga po vrhu prerežemo, da se odpre, in ponudimo z maslom ter soljo.", 
            
            "Stročji fižol očistimo (porežemo nastavke pecljev in morebitne nitke), 
            operemo in odcedimo. Po potrebi ga narežemo na krajše kose. Stresemo ga v lonec in zalijemo s toliko vode, 
            da je povsem pokrit. Vodo solimo s pol žličke soli. Lonec pristavimo na kuhalnik in počakamo, da voda zavre.
            Ko voda zavre, ogenj malo zmanjšamo in fižol kuhamo še približno 10 minut. 
            Fižol mora med kuhanjem neprenehoma rahlo vreti. Med kuhanjem fižola si pripravimo ostale sestavine.
            Čebulo olupimo in narežemo na koščke. Česen olupimo in drobno sesekljamo.
            Vejice peteršilja operemo, osušimo in grobo sesekljamo. 
            Češnjeve paradižnike operemo. Večje paradižnike razpolovimo, manjše pa pustimo cele. 
            Kuhan fižol dobro odcedimo. Na kuhalnik pristavimo ponev, v katero vlijemo olivno olje.
            V ponev stresemo čebulo in jo na nizkem ognju med mešanjem pražimo toliko časa, da se zmehča.
            Dodamo paradižnike, odcejen stročji fižol in česen. 
            Zelenjavo prelijemo z balzamičnim kisom in po okusu začinimo s poprom in soljo. 
            Vse skupaj med mešanjem pražimo še dve minuti.
            Ponev odstavimo in po zelenjavi potresemo nasekljan peteršilj. 
            Še enkrat dobro premešamo, serviramo na večji krožnik in postrežemo.", 
            
            "Pristavimo lonec z vodo, ki jo zavremo in solimo.
            V krop stresemo peresnike, ki jih skuhamo po navodilih iz embalaže. 
            Brokoli operemo in zrežemo na manjše kose ter dodamo k peresnikom.
            Piščančje fileje operemo in osušimo s papirnato brisačo.
            Fileje zrežemo na trakove ali poljubne manjše kose in stresemo v večjo skledo.
            Olupimo in sesekljamo čebulo. Vso zelenjavo stresemo v skledo.
            Dodamo še origano, sol in poper in vse dobro premešamo.
            Na ogenj pristavimo večjo ponev ali vok, v katerem segrejemo dve žlici masla. 
            Dodamo sestavine iz sklede in med nenehnim mešanjem pražimo toliko časa, da čebula postekleni, 
            meso pa rahlo porjavi. Ugasnemo ogenj in prižgemo pečico na 180 stopinj.
            Pripravimo ognjevarno posodo in jo dobro premažemo z maslom.
            Peresnike in brokoli dobro odcedimo in stresemo v vok.
            S kuhalnico vse skupaj še enkrat dobro premešamo, nato pa stresemo v ognjevarno posodo. 
            Po vrhu naribamo sir in pečemo v ogreti pečici 15 minut. Serviramo kar v posodi.",
            
            "Sardele speremo pod vodo in jih dobro osušimo s papirnatimi brisačkami.
            Ribe solimo in jih povaljamo v moki, nato pripravimo ponev z olivnim oljem in ga segrejemo.
            Pazimo, da se iz olja ne začne kaditi!
            Sardele položimo v ponev ter popečemo na obeh straneh, da pozlatijo.
            Pečene ribe odcedimo na papirnati brisači in pokapamo z limoninim sokom.
            Postrežemo z različnimi prilogmami.")


recepti<-data.frame(ime_recepta, postopek)
colnames(recepti) <- c("Ime recepta", "Postopek")
