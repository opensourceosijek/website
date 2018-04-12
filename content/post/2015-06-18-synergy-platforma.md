---
title: Synergy platforma
author: Hrvoje Horvat
type: post
date: 2015-06-18T09:58:06+00:00
url: /2015/06/18/synergy-platforma/
featured_image: /wp-content/uploads/2014/02/Clouds1.jpg
categories:
  - Članci
  - Programiranje
  - Projekti i ideje
  - Vijesti
  - Zanimljivosti
tags:
  - Synergy platforma

---
[toc]

&nbsp;

# Što je to Synergy platforma i koja su njezina svojstva ?

Synergy platforma je tehničko riješenje koje omogućava razvoj i rad <a title="Mikroservis" href="https://en.wikipedia.org/wiki/Microservices" target="_blank">mikroservisa (aplikacija) </a>u redundantnom i distribuiranom okolišu prema principima  &#8220;<a href="http://www.reactivemanifesto.org/" target="_blank">The Reactive Manifesto&#8221;</a>.

&nbsp;

Možemo reći da je Synergy platforma zapravo mali i brzi klasterski [aplikacijski poslužitelj][1] koji dolazi u paketu (engl. Bundle) s instaliranim i konfiguriranim klasterskim servisima poput:

  * &#8220;Messaging&#8221; poslužitelja,
  * Multi master SQL baze,
  * Multi master noSQL baze,
  *  i drugih.

Želja nam je bila omogućiti brzi razvoj aplikacija unutar platforme, s već dostupnim najčešće korištenim servisima od kojih se novi mogu dodavati prema potrebi,a koji su u startu konfigurirani i funkcionalni te spremni za rad.

Razvoj aplikacija u ovom aplikacijskom poslužitelju, koji je zapravo jezgra Synergy sustava,  baziran je na razvoju <a href="https://en.wikipedia.org/wiki/Microservices" target="_blank">mikroservisa</a>. Više detalja o samom razvoju aplikacija kao i o tome što mislimo pod pojmom &#8220;mali i brzi klasterski [Aplikacijski poslužitelj][1]&#8221; i mikroservisi biti će objašnjen malo kasnije.

Cilj platforme je da pruži siguran i provjeren okoliš u kojem aplikacije moraju neometano funkcionirati jedna od druge.

&nbsp;

## Zašto uopće razvijati ovakvu platformu ?

Odlučili smo razviti platformu s drugim prioritetima u razvoju, u odnosu na druge platforme ili aplikacijske poslužitelje dostupne na tržištu.

Također smo željeli podiči ljestvicu razvoja na višu razinu. Također željeli smo dovesti usluge, koje su do nedavno bile dostupne samo telekomima i velikim sustavima, do svih, pa i &#8220;malih&#8221; korisnika. Naše pitanje je bilo: zbog čega i mala tvrtka ne bi mogla razvijati svoje aplikacije, koje će biti skalabilne, redundantne i samim time pouzdane, bez onih neprofesionalnih poruka :  &#8220;Naš sustav se nadograđuje&#8221; ili &#8220;Stranica nije dostupna&#8221; i sl.

Mislimo da su ta vremena prošla, te da dolazi novo vrijeme, vrijeme mikroservisa i usluga dostupnih za sve.

U bližoj budućnisti niti telekomi neće moći živjeti od pristupa internetu i umrežavanja, morati će nuditi sve više i više:  mikroservise i razne dodatne usluge te u konačnici razne aplikacije koje će pokretati nove (ili stare) sadržaje. Idemo u smjeru razvoja visoko dostupnih,  redundantnih i skalabilnih aplikacija, koje će koristiti istovremeno stotine, tisuće ili stotine tisuća i više korisnika.

Do sada je za tako nešto bio potreban veliki, tromi, komplicirani aplikacijski poslužitelj ili usluga &#8220;Cloud&#8221; pružatelja usluga, unutar svog privatnog i/ili javnog &#8220;oblaka&#8221;, kod kojega ste morali izgraditi cijeli redundantan sustav, dobrim dijelom sami a jednim dijelom se osloniti na &#8220;njihove&#8221; servise i usluge.

Sve skupa vrlo komplicirano, dugotrajno i skupo.

&nbsp;

Zbog toga smo htjeli razviti platformu ili aplikacijski poslužitelj, koji mora biti :

  * skalabilan i
  * redundantan (zalihost).

Ovo su dvije stvari koje većina drugih nije u stanju odraditi kako treba (ili kako smo mi očekivali). Oni rijetki koji su i uspjeli u tome, nude vrlo komplicirano riješenje, na kojemu se gubi previše vremena za podešavanje i optimizacije ili kasnije u radu. Razvijamo platformu odnosno aplikacijski poslužitelj koji je automatski skalabilan tj. da se može proširivati i vertikalno i horizontalno, bez ikakve posebne konfiguracije &#8211; ovo mora raditi prema principu &#8220;out of the box&#8221;.

Druga stvar je redundancija, koja također mora raditi automatski, bez nekog dodatnog konfiguriranja. O ovim problemima i riješenjima koja nudimo, pričati ćemo kasnije u tekstu.

Slijedeće bitne stvari su:

  * brzina,
  * jednostavnost i
  * pouzdanost.

Želimo najbržu moguću platformu ili aplikacijski poslužitelj koji je jednostavan za konfiguriranje i održavanje.

Brzina znači manje potrebne resurse za hardverom i u konačnici manje troškove. Istovremeno takav sustav mora biti vrlo pouzdan.

Nadalje, naglasak je bio na jednostavnosti razvoja i broju podržanih funkcionalnosti. Naime za razliku od drugih, koji razvijaju i održavaju na stotine ili tisuće funkcionalnosti i čiji izvorni kôd broji na stotine tisuća ili milijune linija koda, mi smo željeli razvijati samo one stvarno potrebne funkcionalnosti, koje smatramo važnima. S ovim pristupom svaka nova funkcionalnost se može i mora temeljito razvijati i testirati prema pravilima struke (što uglavnom kod drugih nije slučaj). Samim time se vrijeme razvoja u konačnici smanjuje.

&nbsp;

&nbsp;

## Koja su svojstva Synergy platforme ?

  * **Skalabilna je (eng. Elastic)**: Aplikacije unutar platforme kao i sama platforma mogu dinamički uzimati računalne resurse. Npr. ako se platforma sastoji od 3 poslužitelja (fizička ili virtualna) i zbog povećanja obima posla ju je potrebno proširiti na 5 poslužitelja to je lako moguće bez neke posebne nadogradnje vaše aplikacije. Dakle vaša buduća aplikacija se sama širi i uzima si resursa (CPU, RAM  i sl.) koliko joj je potrebno.

&nbsp;

  * **Otporna je na ispade (engl. Resilient)**: platforma se sama “popravlja” i radi sigurnosne kopije u svakom trenutku. U bilo kojem trenutku moguće je ugasiti bilo koji od poslužitelja unutar platforme i uključiti ga u bilo kojem drugom trenutku, kao i dodati novi poslužitelj zbog proširenja. Platforma je svjesna svih promjena, te zna kada je jedan poslužitelj ili jedna njegova komponenta ispala iz sustava te automatski koristi preostale resurse koji su joj dostupni. Također dodavanjem novog poslužitelja proširuje svoje kapacitete za obradu podataka kao i novi CPU, RAM, DISK i sl. Osim toga svaka pojedina komponenta sustava je u clusteru tako da su svi bitni podaci istovremeno na svim poslužiteljima sigurni od ispada.

&nbsp;

  * **Uvijek dostupna da odgovori na upit (engl. Responsive)**: bez ispada i brza za korisnika čak niti u slučaju da je jedan poslužitelj unutar platforme isključen ili neispravan. U ovakvim slučajevima ispadi pojedinog poslužitelja ili nekog od servisa (aplikacije) na pojedinom poslužitelju, korisnik ne gubi vezu prema vašoj aplikaciji jer se naš visokodostupni klasterizirani sustav uvijek brine o tome da neki drugi poslužitelji u sustavu odrade zadatak koji neispravan poslužitelj nije odradio, ali bez potrebe za kontaktiranjem korisnika na bilo koji način i bez prekidanja veze prema korisniku ili bilo kakve smješne poruke “Sustav je nedostupan, u izradi je, probajte kasnije ili sl.”.

&nbsp;

  * **Razmjenjuje poruke (eng. Message driven by [Scala][2] + [Akka][3])**: razvijana je tehnologijama koje asinkrono obrađuju podatke, što osigurava višestruko veću brzinu obrade o odnosu na sve druge tradicionalne sustave i aplikacije (u nekim slučajevima i do **20 puta** veće brzine). Ovo praktično znači da će “glad” za resursima vaše aplikacije u konačnici biti puno manja nego kod većine standardnih aplikacija.  Akka je testirana na 2.400 poslužitelja u paralelnom klasterskom radu ([Test by Google][4]).  U drugom testu  je Akka obrađivala oko 50.000.000 poruka u sekundi, samo na jednom poslužitelju ([Test][5]).

&nbsp;

  * **Distribuirano obrađuje podatke (eng. Distributed)**: distribuirane komponente sustava (i aplikacije) na svakom poslužitelju unutar platforme. Time se iskorištava snaga više poslužitelja istovremeno. Dakle što je više poslužitelja unutar platforme, veća im je i snaga (i brzina) obrade podataka.

&nbsp;

  * **Poslužitelji unutar platforme prate potrošnju resursa** **(eng. Resource consumption monitoring)**: oni poslužitelji koji su u određenoj jedinici vremena manje opterećeni uzimaju više poslova na sebe a oni koji su više opterećeni uzimanju manje poslova na obradu.

&nbsp;

  * **Olakšana integracija između različitih sustava (eng. System integration)**: sustavi napisani u različitim programskim jezicima vrlo lako se mogu integrirati (“mogu pričati međusobno”) korištenjem protokola <a title="AMQP protocol" href="https://www.amqp.org/" target="_blank">AMQP </a>([reference][6]). Dakle ako imate potrebu integrirati vašu aplikaciju  koju ste već godinama razvijali u bilo kojem programskom jeziku (C, C++, Java, Scala, C#, Ruby, Javascript/Node.js, Python i drugi) sa aplikacijom (mikroservisom) unutar naše platforme to je sada moguće. Potrebna vam je samo zaštićena veza prema našoj platformi (SSL/TLS) i jednostavna nadogradnja vaše aplikacije da se može spojiti na našu platformu i od nje dobiti ili joj poslati što joj je potrebno. Isto tako moguća je i komunikacija između aplikacija više tvrtki i korištenjem naše platforme kao posrednika. Naša platforma se brine o tome da ako je jedna tvrtka u nekom trenutku nedostupna (nestanak el. energije, nedostupan internet ili sl.) da se sva komunikacija nastavlja bez gubitka podataka. Dakle ako je naša platforma posrednik, ona osigurava da je svaka poruka uredno primljena na odredištu. Za ovu uslugu se brine [**RabbitMQ**][7]. RabbitMQ je testiran sa 1.000.000 poruka u sekundi ([Test by Google)][8].

<p style="padding-left: 30px;">
  Ovo funkcionira slično poput SMS poruka &#8211; bez obzira što je vaš mobilni telefon (ekvivalent aplikaciji unutar neke treće tvrtke) trenutno nedostupan SMS poruku ćete dobiti kada ponovo postanete dostupni.
</p>

&nbsp;

  * **Automatizirana instalacija softverskih paketa (eng. IT automatization)**: platformu je potrebno i održavati (nadograđivati) sa novijim verzijama aplikacija na svim poslužiteljima. Da se to ne bi ručno radilo (jer poslužitelja (servera) može biti na desetke) to bi zahtjevalo previše vremena i mogućnost za pogrešku je povećana. Da bi se taj proces olakšao koristi se alat [Chef][9]. Npr. ako je potrebno instalirati bazu podataka na više poslužitelja to se može naložiti Chefu da to odradi za Vas i podesi konfiguraciju po svakom poslužitelju posebno.

&nbsp;

&nbsp;

# **Upotreba Synergy platforme kao platforme za razvoj visoko skalabilnih i redundantnih aplikacija
  
** 

Synergy platforma odnosno aplikacijski poslužitelj se može instalirati unutar bilo kojeg telekoma,ili tvrtke, točnije kao virtualni poslužitelji unutar bilo koje virtualizacijske platforme ili na fizičkom računalu/poslužitelju, samostalno. Također se mogu koristiti njene &#8220;usluge&#8221; kao platforme za razvoj visoko skalabilnih, redundantnih (otpornih na kvarove poslužitelja) i distribuiranih (iskorištavaju snagu više poslužitelja istovremeno) aplikacija .

<a href="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/06/Synergy-telekom.jpg?ssl=1" data-rel="lightbox-0" title=""><img class="alignnone size-full wp-image-1882" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/06/Synergy-telekom.jpg?resize=946%2C925&#038;ssl=1" alt="Synergy-telekom" width="946" height="925" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/06/Synergy-telekom.jpg?w=946&ssl=1 946w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/06/Synergy-telekom.jpg?resize=150%2C146&ssl=1 150w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/06/Synergy-telekom.jpg?resize=300%2C293&ssl=1 300w" sizes="(max-width: 946px) 100vw, 946px" data-recalc-dims="1" /></a>

## **Prednosti upotrebe Synergy platforme su za**:

  * Telekome koji žele razvijati ili nuditi aplikacije ili servise trećim tvrtkama,
  * (Veće) Tvrtke,koje žele razvijati aplikacije za svoje potrebe ili ih nuditi trećim tvrtkama,
  * Tvrtke koje žele koristiti postojeću platformu (instaliranu kod nekog trećeg ili kod nas ) za razvoj svojih aplikacija ili upotrebu servisa.

&nbsp;

Prednosti su :

  * Razvoj aplikacija odnosno servisa ili usluga  je jednostavniji, čitljiviji i razumljiviji te na kraju krajeva brži,
  * Naše aplikacije su vertikalno i horizontalno skalabilne jer im to omogućava Synergy platforma:

>   * To znači da svaki poslužitelj Synergy platforme možete vertikalno proširivati odnosno može mu se dodavati još više RAM Memorije, Procesora (CPU) ili diskovnog prostora.

>   * Istovremeno, na još jednostavniji način možete dodavati nove poslužitelje u Synergy klaster platformu (horizontalna skalabilnost), a sve prema stvarnom opterečenju platforme ili planiranom opterečenju. Primjerice izračunali ste da vam u startu treba 25 poslužitelja platforme umjesto osnovnih 3 &#8211; nije uopće problem &#8211; sve će biti potpuno automatizirano i jednostavno (klik &#8211; 25.komada &#8211; klik &#8211; OK).

** **

## **Što to znači u praksi ?.**

Vertikalno skaliranje Synergy platforme i u konačnici vaše aplikacije unutar platforme, praktično nema ograničenja:

  * Za današnje uvijete, s dostupnim brojem jezgri procesora (CPU) nećete naići na limite

  * Za bilo koju količinu RAM memorije, nema problema

Horizontalno skaliranje Synergy platforme je moguće na stotine ili tisuće poslužitelja platforme.

Maksimalan broj poslužitelja Synergy platforme nismo bili u mogućnosti testirati ali su nam poznati maksimalni testirani brojevi poslužitelja svake od komponenti platforme, u produkcijskoj upotrebi. U prvoj većoj implementaciji i testu ćemo imati i neke veće brojke od 3 poslužitelja, koliko ih sada imamo u platformi.

&nbsp;

&nbsp;

## Što je zanimljivo u razvoju aplikacija koje se pokreću unutar platforme?

&nbsp;

Platforma omogućava brz razvoj aplikacija jer se brine o upravljanju resursima i omogućava developer-u da se usredotoči na ono što je stvarno bitno, a to je aplikacija. Za sve ostalo se brine platforma koje zna pametno upravljati resursima i osigurati će nesmetan rad aplikacije neovisno o opterećenju pod kojim se nalazi. Nude se razni servisi koji će pokriti potrebe većine korisnika, a ako neki servisi još nisu podržani sigurno će biti u jednoj u budućih verzija jer je platforma konstantno u razvoju. Razvoj aplikacije pojednostavljuje i činjenica da aplikaciju možete razbiti na module koji se mogu instalirati u OSGi container i onda iskoristiti platformu da se pobrine za instalaciju tih modula i njihovo raspoređivanje da bi se osigurala visoka dostupnost aplikacije.

&nbsp;

** **

## **U čemu je problem s drugim platformama ili programskim jezicima ?**

Nije problem samo s drugim platformama već i s mnogim programskim jezicima koji se ili uopće ne mogu vertikalno skalirati (najgori primjer je programski jezik  Python) ili imaju prilična ograničenja na maksimalan broj procesora (CPU) na koje se mogu skalirati (večina programskih jezika). Naime dodavanjem sve više procesora (CPU) ne znači da programski jezik u kojem razvijate svoje aplikacije može iskoristiti njihov broj i ukupnu snagu. U praksi (dokazano), programski jezici koji i znaju iskoristiti snagu novih procesora (CPU) , to mogu do neke granice. Preciznije rečeno do točno određenog broja CPU jezgri. Preko toga ne ide.

Drugi problem je u programerima koji iako im programski jezik omogućava vertikalno skaliranje, zapravo nisu u stanju napisati aplikacje koje to mogu i znaju iskorititi.

Dodatni problem je vertikalno skaliranje RAM memorije, koje se u testovima i praksi pokazalo kao problem večine programskih jezika. Aplikacije pisane u mnogim jezicima imaju problema s iskorištavanje veće količine RAM memorije. Odnosno ako recimo vašoj aplikaciji dodjelite 4GB RAM a pogotovo više, vrlo često sva memorija zapravo neče bit iskorištena koliko god ju povečavali. Događa se slična stvar kao i sa dodavanjem više procesora (CPU), sve funkcionira do neke granice.

Slijedeći problem su same platforme, framework-ci i Aplikacijski poslužitelji te njihova mogućnost vertikalnog skaliranja zbog gore navedenih razloga (što je i dokazano u praksi).

&nbsp;

I konačno dolazimo do horizontalnog skaliranja odnosno mogućnosti:

  * Aplikacija,
  * Aplikacijskih poslužitelja (pr. JBoss, Glassfish, WebSphere, WebLogic, &#8230;) ,
  * Raznih framework-a

Da mogu iskorištavati resurse raspodjeljene na više poslužitelja.

Dakle ovdje govorimo o klasterskom radu aplikacije u konačnici.

U ovom dijelu priče, problemi u praksi su dokazani u svim točkama, te gotovo sva dostupna riješenja na tržištu boluju od tih nedostataka.

Počevši od nestabilnosti i nepouzdanog ili nepredviđenog rada, lošeg skaliranja, nedostatka automatizama ili uopće nemogućnosti skaliranja bez podešavanja po principu “ručnog rada”.

Dodatan problem je i razvoj s tehnologijama i jezicim koji ne omogućavaju asinkrono izvršavanje o kojem smo pričali, a koje donosi znatno veće performanse i to u dobrom dijelu sustava u primjeni i do **_20 puta._**

Na samom kraju recimo i to da su gotovo sve platforme na tržištu razvijane iz vremena kada današnje napredne tehnologije i alati nisu niti postojali a prelazak na ove tehnologije bi značio praktično razvoj cijele platforme od početka, što se uglavnom nitko nije usudio. Jer uvijek je jeftinije samo dodavati nove funkcionalnosti i malo popravljati i zakrpavati probleme, a prelazak na ovoliko drastičnije tehnologije zahtjeva zasigurno izradu po principu : sve iz početka.

&nbsp;

Synergy platforma je razvijana sa svješću o ovim ograničenjima, stoga smo i odabrali programski jezik, biblioteke te framework-e i tehnologije koje uspješno nadilaze **SVE** ove probleme ili nedostatke.

&nbsp;

&nbsp;

# Primjer upotrebe platforme kada se koristi kao PaaS (Platform as a Service)

&nbsp;

Slika: Pogled na komponente Synergy platforme kada se platforma koristi kao PaaS (Platform as a Service)

<a href="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/06/Synergy-1.jpg?ssl=1" data-rel="lightbox-1" title=""><img class="alignnone size-full wp-image-1887" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/06/Synergy-1.jpg?resize=1009%2C951&#038;ssl=1" alt="Synergy-1" width="1009" height="951" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/06/Synergy-1.jpg?w=1009&ssl=1 1009w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/06/Synergy-1.jpg?resize=150%2C141&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/06/Synergy-1.jpg?resize=300%2C282&ssl=1 300w" sizes="(max-width: 1000px) 100vw, 1000px" data-recalc-dims="1" /></a>

&nbsp;

U ovom načinu upotrebe platforme (PaaS), platforma nudi nekoliko servisa ili usluga, koji su dostupni na korištenje, a koji su :

  * Performantni,
  * Potpuno redundantni i otporni na ispade

Također je moguća vrlo jednostavna integracija vaše  tvrtke odnosno aplikacija koje vaša tvrtka koristi, s našom platformom i njenim servisima. Istovremeno, moguće je povezivanje više tvrtki kroz samu platformu, korištenjem njenih servisa ili bez potrebe za korištenjem servisa i to na:

  * Siguran način  (kriptirana zaštičena veza)
  * Pouzdan način (zbog našeg messaging odnosno sustava sigurnog i provjerenog dostavljanja poruka)

Dakle ako imate potrebu komunicirati s drugom tvrtkom tj. ako vaša poslovna aplikacija ima potrebu na pouzdan i siguran način komunicirati s aplikacijom bilo koje druge tvrtke, to je sada vrlo jednostavno.

&nbsp;

Servisi koje nudimo unutar platforme, prema modelu PaaS, su :

&nbsp;

  * <a href="https://mariadb.org/" target="_blank">MariaDB </a>Cluster &#8211; multi-master relaciona baza podataka (fork MySQL baze) koja radi u klaster modu rada (multi-master). Trenutno na našoj platformi rade 3 poslužitelja na kojima je instalirana MariaDB. Testovi su pokazali da je baza bila sposobna podnjeti ~2.000 database klijenata po svakom poslužitelju. To znači da je MariDB Cluster podnijela ~6.000 klijenata paralelno. Sve je testirano na vrlo ograničenom hardveru tako da se u praksi mogu očekivati puno bolji rezultati.  Za test je korištena SQL &#8220;SELECT&#8221; komanda koja je radila INNER JOIN na 3 tablice. Svaka tablica je imala na tisuće redova. Prosječno vrijeme izvršenja SQL SELECT komande po jednom klijentu je bila ~1 ms.

&nbsp;

  * <a href="http://www.couchbase.com/" target="_blank">Couchbase </a>Cluster &#8211; distribuirana memorijska noSQL baza podataka koja spada u kategoriju document baza (slično kao i <a href="https://www.mongodb.org/" target="_blank">MongoDB</a>). Ima sposobnost geo-distribucije podataka između različitih lokacija (npr. država, gradova,&#8230;). Jedan od vrlo popularnih korisnika ove baze je <a title="Couchbase & Viber" href="https://www.youtube.com/watch?v=R5JpRrMJVIA" data-rel="lightbox-video-0" target="_blank">Viber</a>.

&nbsp;

  * [OpenLdap][10] &#8211; (Multi-master) sadrži popis svih korisnika sustava i njihovih prava na vrlo logičan i jednostavan način. Većina velika organizacija koristi ovakav sustav.

&nbsp;

  * <a title="RabbitMQ" href="https://www.rabbitmq.com/" target="_blank">RabbitMQ </a>&#8211; sustav za razmjenu poruka između bilo koje računalne lokacije i programskog jezika. Vrlo je popularan kao message broker da ga čak i Google koristi. Test rezultate možete pronaći <a title="RabbitMQ test rezultati kod Google-a" href="http://googlecloudplatform.blogspot.com/2014/06/rabbitmq-on-google-compute-engine.html" target="_blank">ovdje</a>.

&nbsp;

&nbsp;

Slika: Logička shema Synergy platforme s drugim primjerima uporabe

<a href="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/06/Logička-shema.jpg?ssl=1" data-rel="lightbox-2" title=""><img class="alignnone size-full wp-image-1863" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/06/Logička-shema.jpg?resize=908%2C849&#038;ssl=1" alt="Logička shema" width="908" height="849" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/06/Logička-shema.jpg?w=908&ssl=1 908w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/06/Logička-shema.jpg?resize=150%2C140&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/06/Logička-shema.jpg?resize=300%2C280&ssl=1 300w" sizes="(max-width: 908px) 100vw, 908px" data-recalc-dims="1" /></a>

Platforma je predviđena za rad na:

  * Fizičkim poslužiteljima,
  * Virtualiziranom ili kontejneriziranom okruženju (za sada su podržani OpenVZ Linux kontejneri),
  * Unutar bilo kojeg “Virtual Private Cloud-a” kao IaaS (kao “Virtualka”), poput AMazon AWS-a, Microsoft Azure-a i sl.

Minimalna konfiguracija platforme zahtjeva 3 (tri) poslužitelja platforme, što je moguće skalirati (proširivati) u koracima od po dva poslužitelja. Neparan broj poslužitelja mora biti zadržan zbog &#8220;split-brain&#8221; problema (ovo je pravilo za bilo koji klasterski sustav) .

Zbog povećanja performansi moguće je platformu proširiti na 5,7,9,11,13,15, … i više poslužitelja.

&nbsp;

Prepouručeni Hardverski zahtjevi ( i konfiguracija na kojoj smo testirali ) za svaki poslužitelj unutar platforme su :

  * 2 x CPU na 2.1GHz
  * 8 GB RAM
  * 40 GB diska
  * 1Gbps LAN

(Ovisno o opterečenju, veličini aplikacija, broju korisnika, veličini potrebnih baza podataka, imeničnih i DNS servisa i sl.)

&nbsp;

&nbsp;

**<a title="OSGI" href="http://www.osgi.org/Specifications/HomePage" target="_blank">OSGI</a> kontejner**

Na slici možete vidjeti nekoliko mogućih scenarija upotrebe platforme:

<img class="alignnone size-full wp-image-1864" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/06/OSGI-pogled1.jpg?resize=506%2C546&#038;ssl=1" alt="OSGI-pogled1" width="506" height="546" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/06/OSGI-pogled1.jpg?w=506&ssl=1 506w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/06/OSGI-pogled1.jpg?resize=139%2C150&ssl=1 139w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/06/OSGI-pogled1.jpg?resize=278%2C300&ssl=1 278w" sizes="(max-width: 506px) 100vw, 506px" data-recalc-dims="1" />

&nbsp;

  * Pri vrhu možete vidjeti korisnika koji preko load balancera može pristupiti aplikacijama (mikroservisima) koje se nalaze u OSGi kontejnerima ili ako želi može pristupati i direktno različitim servisima koji se nude unutar platforme kao što su DNS cluster, NoSQL Database Cluster itd., i iskoristiti ih u radu svoje aplikacije. Aplikacije koje se nalaze u OSGi kontejnerima također imaju pristup svim servisima koje automatski nudi platforma.

&nbsp;

  * U donjem dijelu slike vidite 3 tvrtke koje imaju svoje sustave koje koriste već duži period vremena i žele u potpunosti nadzirati svoj sustav, ali mogu iskoristiti Messaging servis koji radi na RabbitMQ serverima da bi se na siguran i pouzdan način mogli povezati sa drugim tvrtkama. RabbitMQ cluster će se pobrinuti da sve poruke koje se razmjenjuju između tih tvrtki budu dostavljene čak i ako nisu sve tvrtke trenutno povezane na RabbitMQ server (pr. ne radi im pristup na internet).

&nbsp;

&nbsp;

&nbsp;

&nbsp;

# Primjer softverskog sustava (SaaS) na Synergy platformi

&nbsp;

Na slici ispod možete vidjeti primjer aplikacije koja koristi servise Synergy platforme.

<a href="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/06/OSGI-pogled2.jpg?ssl=1" data-rel="lightbox-3" title=""><img class="alignnone size-full wp-image-1865" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/06/OSGI-pogled2.jpg?resize=363%2C469&#038;ssl=1" alt="OSGI-pogled2" width="363" height="469" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/06/OSGI-pogled2.jpg?w=363&ssl=1 363w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/06/OSGI-pogled2.jpg?resize=116%2C150&ssl=1 116w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/06/OSGI-pogled2.jpg?resize=232%2C300&ssl=1 232w" sizes="(max-width: 363px) 100vw, 363px" data-recalc-dims="1" /></a>

Aplikacija se sastoji od nekoliko dijelova:

  * Load balancer 
      * Za load balancer se koristi servis koji je upravljan od strane platforme tako da se kreator aplikacije može usredotočiti na pisanje same aplikacije
  * OSGi container-i 
      * OSGi je standardizirana tehnologija koja omogućava modularan pristup izradi aplikacija. Aplikacija se sastoji od jednog ili više modula koji mogu međusobno komunicirati putem servisa koje objave unutar OSGi container-a tako da budu vidljivi i drugim modulima. Zbog toga je moguće aplikaciju sastaviti od mikroservisa koji se mogu zasebno instalirati, nadograditi ili obrisati, a da pritom nije potrebno zaustavljati cijelu aplikaciju. Synergy platforma će se pobrinuti da moduli koji se instaliraju imaju više instanci na različitim node-ovima da bi se osigurala visoka dostupnost.
  * MariaDB Multi Master Cluster servis 
      * MariaDB je SQL baza koju nudi visoku dostupnost i mogućnost horizontalnog skaliranja zato što podržava master-master način rada u cluster-u, i dostupna je na Synergy platformi kao servis. Ako koristite MariaDB bazu preko servisa, Synergy platforma će se pobrinuti da baza bude uvijek dostupna i da prati potrebe vaše aplikacije.

&nbsp;

Kao što je i prikazano na slici aplikacija se nalazi unutar OSGi container-a i mora znati kako pristupiti SQL servisu, za sve ostalo će se pobrinuti Synergy platforma.

U ovakvoj aplikaciji bi se zahtjev korisnika prvo zaprimio na Load balancer-u koji bi proslijeđivao te zahtjeve na OSGi container-e pazeći pritom da ravnomjerno raspodjeli teret. U OSGi container-ima se nalaze moduli od kojih je izgrađena aplikacija u kojima je implementirana business logika i koji znaju kako obraditi zahtjev korisnika. Za dugotrajnije zapisivanje podataka se u ovom slučaju koristi MariaDB servis iza kojeg se krije cluster MariaDB SQL server kojeg nadzire Synergy platforma.

&nbsp;

Ovo je samo jedan primjer aplikacije koja koristi mogućnosti Synergy platforme ali nije jedini način na koji se može pristupiti razvoju aplikacija. Ukoliko vam ne odgovara određeni dio platforme (npr. OSGi jer koristite PHP ili .Net) uvijek si možete aktivirati one servise koje možete koristiti i osloniti se na platformu da preuzme teret upravljanja resursima na sebe, a vama da omogući brz razvoj aplikacija koje mogu pratiti potrebe vašeg posla.

&nbsp;

&nbsp;

# IT automatizacija sa Chefom

&nbsp;

Svi poslužitelji na kojima su komponente ove platforme će se, od inicijalne konfiguracije sustava pa do svih drugih stanja, upravljati [Chef-om][11]. Rizik od pogreške u nekom od mnogih koraka pri postavljanju sustava bez alata za automatizaciju procesa se izbjegava, a promjena u konfiguraciji većeg broja poslužitelja se može primjeniti u kraćem vremenu. Serverska komponenta Chef-a pohranjuje konfiguracije (&#8220;recepte&#8221;) i brine se o tome da budu dostavljene i primjenjene na klijentima kojima su namjenjene.

Procesi kojima se mijenjaju stanja klijenata mogu biti definirani i testirani za različite operacijske sustave i njihove inačice. U slučaju nedostupnosti ili pada poslužitelja na kojemu je serverska komponenta Chef-a nije moguće mijenjati konfiguracije poslužitelja kojima se ranije moglo upravljati no nema utjecaja na njihovo funkcioniranje tako da u prvoj verziji platforme planiramo koristiti jednu instancu serverske komponente. Chef u komercijalnom modelu nudi mogućnosti replikacije i redundancije serverske komponente što, uz mogućnost upravljanja većim brojem klijenata, također smatramo dobrim razlogom za prelazak na komercijalni model.

Ovaj alat nam omogućava testiranje različitih modela infrastrukture Synergy platforme (npr. korištenje drugih programskih paketa, operativnih sustava ili drugačijeg broja instanci poslužitelja neke namjene) i verzioniranje tih modela. Proces proširenja naše platforme novim poslužiteljima kao što je npr. dodavanje novog poslužitelja baze podataka može biti u potpunosti automatiziran tako da se dodavanjem &#8220;role&#8221; nekom poslužitelju može ,uz automatiziranu instalaciju svog potrebnog software-a, dinamički prilagoditi i konfiguracija drugih komponenti platforme za rad s tim poslužiteljem.

&nbsp;

&nbsp;

# Povijest razvoja &#8211; kako se sve razvijalo i koliko je vremena bilo potrebno ?

&nbsp;

Prvo smo krenuli od ideje za razvoj okruženja koje može zadovoljiti potrebe razvoja bilo kojeg softvera.

Želja je bila u potpunosti automatizirati i centralizirati cijeli proces razvoja programa i sustava, počevši od:

  * projektne dokumentacije,
  * verzioniranja izvornog koda,
  * prijava novih funkcionalnosti  i grešaka te praćenje istih,
  * funkcionalnog i nefunkcionalnog testiranja,
  * pregled i recenzija izvornog koda,
  * sve do kontinuirane integracije.

&nbsp;

Pošto nismo željeli koristiti nikakve vanjske servise (pr. GitHub i sl.) a zbog potrebe za vrlo visokom automatizacijom i customizacijom, morali smo sve alate instalirati i konfigurirati sami. Ovdje je također bilo potrebno neko vrijeme za proučavanje i testiranje alata te odabir najboljih za naše potrebe. Bilo je i nekih promjena alata tokom rada.  Na kraju je za ovu fazu bilo potrebno nekoliko mjeseci rada.

&nbsp;

Nakon toga uslijedile su pripreme poslužitelja (zapravo 3 virtualke), osmišljavanje mrežnog modela i rekonfiguracija platforme za Linux kontejnere (<a href="https://openvz.org/Main_Page" target="_blank">OpenVZ</a>). Kada vratimo film unatrag to je sve zajedno trajalo dobrih nekoliko tjedana (a ostalo je još nekoliko stvari za testiranje i isprobavanje). Krenuli smo sa testiranjem relacijskih baza podataka (SQL) koje su morale biti redundantne sa obaveznim radom u “<a href="https://en.wikipedia.org/wiki/Multi-master_replication" target="_blank">Multi-Master</a>” klasteru. Dakle bitno je da se na sve poslužitelje baze može paralelno i istovremeno zapisivati i čitati. Pokušaji i pogreške. Dani i dani testiranja stabilnosti i otpornosti baze na ispad pojedinih poslužitelja, pogotovo “<a href="http://linux-ha.org/wiki/Split_Brain" target="_blank">Split-brain</a>” testiranje. Činjenica koja nam je bila poznata od prije je da kod klasterskih komponenti “<a href="http://linux-ha.org/wiki/Split_Brain" target="_blank">Split-brain</a>” probleme mnogi nisu riješili kako treba. Dakle ovo je nešto što definitivno treba testirati u praksi. Slijede optimizacije i sl. (u pitanju su tjedni i tjedni).

&nbsp;

Prelazi se na drugu komponentu tj. “noSQL”  baze. Usporedbe prednosti i mana njih nekoliko. Polako su otpadale jedna po jedna. Naravno nakon tjedana proučavanja i isprobavanja.

Zahtjevi koje smo postavili prema noSQL bazi su bili :

  * klasterski “Multi-Master” ,
  * riješen “Split-brain” problem,
  * obavezan način rada u ”In memory” sa mogućnošću sinkronizacije na disk
  * mogućnost Geo-redundancije cijelog klastera na drugu lokaciju (sinkronizacija između gradova)

&nbsp;

Krećemo sa setovima drugih komponenti koje su morale zadovoljiti naše (visoke) standarde i funkcionalnosti.

S vremenom su otpadali jedan po jedan, neki su se hrabro držali do kraja, pa sve iz početka. Zbog toga je bilo i nekoliko promjena tehnologija i zaokreta u dizajnu.

Ponovno neke od komponenti nisu ispale onakvima kako su dokumentirani (i prema iskustvima i komentarima drugih ) jer mi očito radimo nešto drugo ili drugačije, valjda naši zahtjevi ne upadaju u “standardnu upotrebu”.

Prošlo je još nekoliko mjeseci.

&nbsp;

Cijelo vrijeme se “ljepilo” koje povezuje sve komponente, testira i razvija u programskom jeziku “Scala”.

Testiraju se i razni “framework”-ci (kako ovo prevesti a da ne zvuči “Split-brain”)  i na kraju se dolazi do zaključka da je ipak bolje, vratiti se na Akka framework, koji je i u početku bio jedan od kandidata (a koje smo do sada već dobro testirali). Dakle konačan odabir &#8211; Akka &#8211;  zbog njegovih prednosti na području skalabilnosti i otpornosti na greške (zapravo jedne od naših najbitnijih funkcionalnosti). Sada je prošlo još nekoliko mjeseci. Akka je testirana u distribuiranom klasterskom radu na 2.400 poslužitelja paralelno ([test by Google][4]). Također je Akka testirana na poslužitelju sa 48 CPU jezgri na 2.1 GHz, sa 128 GB RAM, te je obrađivala oko 50.000.000 poruka u sekundi ([Test][5]).

&nbsp;

Razmišlja se o tome kako pojednostaviti proces izrade aplikacija unutar naše platforme. Traži se neki model koji bi bio prema nekom industrijskom standardu i dokazan u produkciji.

Odluka je pala : [OSGI kontejner][12] u koji će se “ubacivati” aplikacije koje će se razvijati prema principu [mikroservisa][13]. Pojednostavljeno: razbijete svoju aplikaciju do nivoa logičkih ili funkcionalnih dijelova, razvijate ih  jedan po jedan i povezujete ih unutar OSGI kontejnera. Dalje se sve automatski distribuira (ovo odrađuje naše “ljepilo” odnosno “Core” ili jezgra naše platforme ) na dostupne poslužitelje zbog distribuiranog i redundantnog rada. Još nekoliko tjedana posla.

Želimo i funkcionalnost da je integracija drugih aplikacija (od trećih tvrtki), s našom platformom jednostavna i pouzdana. Dodatno želimo da platforma može biti medijator između više trvtki i više aplikacija koje su pisane u različitim jezicima. Nakon nekog vremena odabir pada na AMQP protokol i RabbitMQ. Sada smo dobili i pouzdani sustav za izmjenu poruka koji je u stanju pouzdano proslijeđivati poruke između naše platforme i drugih vanjskih aplikacija koje su uglavnom pisane u različitim programskim jezicima.  Želja je da se svatko osjeća ugodno u svom programskom jeziku i da ne mora učiti “našu” arhitekturu i programski jezik i alate koje mi koristimo.

Bitan detalj je i taj što u slučaju nedostupnosti druge aplikacije (od druge tvrtke) “messaging” sustav brine o tome da kada vanjska aplikacija postane dostupna , da joj se poruka odnosno podatak i sigurno prenese.

Prolazi još nekoliko tjedana.

&nbsp;

Od početka smo razmišljali o frontend dijelu razvoja Web aplikacija, prelazilo se također preko raznih komponenti ali smo se na kraju odlučili za &#8220;<a title="Spray - HTTP server" href="http://spray.io/" target="_blank">Spray</a>&#8221; biblioteku u kombinaciju s HTML5 i JavaScript bibliotekama   : brz, “lagan” i na kraju se najbolje slaže sa svim tehnologijama za koje smo se odlučili.

&nbsp;

Ostalo je instalirati i konfigurirati sve dodatne specifične alate za automatizirano  testiranje,  kontinuiranu integraciju i druge “detalje”. Kao i prije : proučavanje raznih alata i njihovih mogućnosti. Doduše većim dijelom koristimo alate za razvoj koje smo već instalirati ali treba ih nadodati još nekoliko te povezati s postojećim alatima. Za postavljenje na noge ovog dijela, prolazi još nekoliko tjedana

&nbsp;

Moramo imati i dobar alat za automatizirane instalacije i deinstalacije svih softverskih paketa na sve poslužitelje (koliko god ih trenutni sustav ima &#8211; od 3 do 111), uz potrebu da se mogu kreirati tkzv. “role” : prema poslužitelju, namjeni , servisu i sl.

Dakle možda želimo samo upgrade svih klasterskih SQL  i noSQL baza, s time da konfiguracijske datoteke nisu iste na svakom poslužitelju tj. da recimo svaki ima drugačiju IP adresu ili slično. Isto tako želimo automatizirati postupak instalacije cijelog novog poslužitelja.

Pr. Automatski se mora kreirati još 5 novih poslužitelja i na njih instalirati i SQL i noSQL bazu i sve komponente i svu gomilu softvera, koji se mora konfigurirati sa svim specifičnostima svakog poslužitelja.

Sve mora biti potpuno automatizirano. Ovaj dio još uvijek testiramo ali smo sigurni u alat. Alat se zove “Chef”.

Podržava do 25 poslužitelja u “Free” modelu, što nam je za sada dovoljno a ako sustav naraste preko 25 poslužitelja u klasteru, tada prelazimo na komercijalni model 🙂 .

Bilo je tu još na stotine malih promjena ali sve u svemu cilj nam je blizu.

&nbsp;

# **Koliko je bilo ukupno vrijeme razvoja i testiranja do sada ?**

Sve u svemu prošlo je malo više od godinu i pola.

Još okvirno pola godine do prve beta verzije Synergy platforme i prve aplikacije za nju, potom idemo na RC1.

I još jedan detalj : ovo smo svi radili u svoje slobodno vrijeme, nakon posla, vikendima, praznicima, rođendanima, blagdanima i sl.

Stalna misao vodilja nam je između ostalog i bila krilatica u razvoju programskog jezika Erlang: “Let it crash”.

Dakle dizajnirajmo sustav koji stalno očekuje neku grešku ili kvar, da li softverski ili hardverski a mi moramo predvidjeti što više mogućih scenarija ispada i napraviti sustav takvim da mu to uopće ne smeta te da krajnji korisnik ne smije biti svjestan činjenice da se od nekih 3 ili 111 poslužitelja upravo jedan pokvario i da se popravlja.

&nbsp;

# Dokle smo došli ?

&nbsp;

Trenutno su testirane sve komponente od kojih se platforma sastoji.

Osnovni preduvjeti za odabir svake od komponenti unutar Synergy platforme su bili:

  * Horizontalna i vertikalna skalabilnost

(mogućnost automatskog proširenja kapaciteta i brzine obrade/procesiranja)

  * Otpornost na ispade osigurana klasterskim radom
  * Svaka komponenta unutra klastera mora raditi u tkzv ”Multi-Master” načinu rada što osigurava veću brzinu rada i skalabilnost.
  * Svaka komponenta mora imati iza sebe tvrtku kojoj se može platiti službena podrška

(99% komponenti koje koristimo su OpenSource komponente)

  * Svaka komponenta mora biti u produkcijskoj upotrebi barem pola godine i to kod nekih od najvećih sustava : 
      * Banaka ili telekoma, osiguravajućih tvrtki i sl.
      * Online servisa ili pružatelja usluga (Facebook, Twitter, Google, Web trgovine ili servisi koji opslužuju na desetke tisuća kupaca ili korisnika paralelno odnosno istovremeno )

Odabrane su najnovije tehnologije koje su dokazane u radu te smo ih testirali. Naime nismo vjerovali specifikacijama već smo se sami željeli uvjeriti da sve radi kako je napisano &#8211; što je odnijelo sigurno pola godine rada ali je i izbacilo tehnologije koje se nisu pokazale onakvima kakve su se činila na početku. Zahvaljujući ovom paranoičnom (inžinjerskom) pristupu, došli smo do stabilnih i STVARNO provjerenih tehnologija koje zapravo i rade u ovakvom okruženju a pred koje smo postavili najviše ciljeve.

Osim toga tokom ovog istraživanja i testiranja, naučili smo neke stvari kojih nismo niti bili svjesni te smo uključili neke nove tehnolgije o kojima nismo niti razmišljali.

Paralelno s razvojem Synergy platforme, razvijamo i prvu aplikaciju unutar same platform koja će biti dokaz snage i mogućnosti platforme, kao i dokaz koncepta ovakvog načina razvoja aplikacija.

&nbsp;

&nbsp;

&nbsp;

**<span style="color: #ff0000;">Okvirni plan nam je do kraja godine imati prvu radnu verziju platforme a do početka slijedeće godine funkcionalnu prvu aplikaciju s drugom (ispeglanom) RC1 verzijom platforme.</span>** 

&nbsp;

&nbsp;

# Licenca i autorska prava

Ovaj dokument koristi Open Source licencu : [Apache License 2.0.][14] , sva autorska prava su pokrivena unutar navedene licence.

Za samu platformu i kompletan source kod, licencni model će biti objavljen naknadno.

&nbsp;

&nbsp;

&nbsp;

 [1]: https://en.wikipedia.org/wiki/Comparison_of_application_servers
 [2]: http://www.scala-lang.org/
 [3]: http://akka.io/
 [4]: http://googlecloudplatform.blogspot.com/2014/01/large-akka-cluster-on-google-compute.html
 [5]: http://letitcrash.com/post/20397701710/50-million-messages-per-second-on-a-single
 [6]: https://www.amqp.org/about/examples
 [7]: https://www.rabbitmq.com/ "Sustav za razmjenu poruka"
 [8]: http://googlecloudplatform.blogspot.com/2014/06/rabbitmq-on-google-compute-engine.html
 [9]: https://www.chef.io/chef/ "Chef- alat za automatizaciju instalacija i nadogradnji"
 [10]: http://www.openldap.org/ "Korisnički imenik (Lightweight Directory Access Protocol)"
 [11]: https://learn.chef.io/
 [12]: http://www.osgi.org/Main/HomePage
 [13]: https://en.wikipedia.org/wiki/Microservices
 [14]: https://www.apache.org/licenses/LICENSE-2.0