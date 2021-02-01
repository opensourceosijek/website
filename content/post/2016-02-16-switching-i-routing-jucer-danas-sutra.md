---
title: 'Switching i routing: jučer, danas, sutra'
authors: hhorvat
type: post
date: 2016-02-16T19:42:11+00:00
url: /2016/02/16/switching-i-routing-jucer-danas-sutra/
featured_image: /wp-content/uploads/2014/08/predavanja-e1415789258731.jpg
categories:
  - Članci
  - Hardware
  - Linux
  - Open Source projekti
tags:
  - mreže

---
<sup>( <strong><span style="color: #ff0000;">Zadnja promjena: 03.mj. 2017.</span></strong> )</sup>

&nbsp;

U toku prošle godine (2015) imali smo predavanje  “**[Kako odabrati ”pravi” mrežni uređaj i u čemu su razlike][1]**” a ovom prilikom ću se nadovezati na to predavanje te pokušati objasniti problematiku s kojom se susreću proizvođači mrežne opreme a koja se prenosi do samih korisnika (vas). Dalje u tekstu većim djelom ćemo govoriti o preklopnicima ( switching-u ) a manjim djelom o usmjerivačima ( routing-u )

&nbsp;

&nbsp;

# **U čemu je problem ?.**

Sjetimo se da su i preklopnici (switchevi) i usmjerivači (routeri) uređaji koji se sastoje od sličnih dijelova kao i svako računalo. Dakle imaju matičnu ploču, CPU, RAM, neku vrstu diska (uglavnom flash memoriju), operacijski sustav, upravljačke programe (drivere) i određeni softver.

Doduše njihov operacijski sustav je malo drugačiji od onoga na koji smo naviknuli ali ne toliko koliko se čini.

Trebamo biti svjesni činjenice da i obični “glupi” switch  u pozadini odrađuje nekoliko funkcionalnosti ili “vrti“ nekoliko mrežnih protokola od kojih neke i primjenjuje na svaki paket na mreži. Već na gigabitnim mrežama to znači milijune paketa u sekundi.

Zapravo si možemo i trebamo postaviti sljedeća pitanja a koja su si postavili i proizvođači kod razvoja mrežnih uređaja .

&nbsp;

**Što  je važno:**

  * Odabir operacijskog sustava uređaja &#8211; koji je sigurniji, stabilniji i/ili brži, koji ima bolju podršku, što je sa upravljačkim programima za sav hardver &#8211; za koji OS proizvođači hardvera češće izdaje optimizacije i ispravke grešaka,&#8230;
  * Dobar odabir programskog jezika u kojemu će se razvijati novi uređaj te njegove mogućnosti
  * Kako razvijati softver ( i tko ga razvija )

  * Testiranje &#8211; dali je uređaj stvarno (i kako) testiran
  * Optimizacija &#8211; koliko znanja treba imati da bi se radile optimizacije i da li su moguće (i u kojoj mjeri)
  * Podrška &#8211; što je s podrškom, koliko su ažurni
  * Dokumentacija samog softvera i konačnog programskog rješenja (uređaja) kolika je zajednica ljudi koja koristi uređaje određenog proizvođača, da li postoje predavanja, knjige, i drugi materijali na internetu i koliko su dobro napisani i sl.

Vratimo se switchevima &#8211; switch je zapravo malo računalo kojemu je svaki port zapravo jedna mrežna kartica.

A mrežnih kartica imamo svakakvih :

Od običnih “desktop” (poput ove na slici):

![Slika](https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2016/02/Lan-desktop.jpg)

Do posebnih kategorija mrežnih kartica koje možemo nazvati “Serverskim” poput ove na slici dolje.

<img class="alignnone size-full wp-image-2094" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Lan-server.jpg?resize=589%2C422&#038;ssl=1" alt="Lan-server" width="589" height="422" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Lan-server.jpg?w=589&ssl=1 589w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Lan-server.jpg?resize=150%2C107&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Lan-server.jpg?resize=300%2C215&ssl=1 300w" sizes="(max-width: 589px) 100vw, 589px" data-recalc-dims="1" />

Osim toga i “serverske” nisu sve iste, kao niti njihovi upravljački programi, pa i neke od njih možda nisu loše ali imaju dosta loše upravljačke programe. Neke odrađuju samo standardne stvari dok neke od jačih podržavaju cijeli niz dodatnih funkcionalnosti, kojima rasterećuju centralni procesor (CPU).

Neke od jačih “serverskih”, danas standardno same odrađuju neke od sljedećih funkcionalnosti:

  * TCP Offload (Checksum/Large send), UDP
  * 802.1Q
  * 802.1p (QoS)
  * 802.3ad, Fast Ether Channel i Gigabit EC
  * 802.3* (z, ab, u ,x) -flow controll
  * Kriptiranje/Dekriptiranje
  * I/O Virtualizaciju (u kombinaciji sa SR-IOV), …

&nbsp;

U čemu su sve razlike :

  * U cijeni
  * Brzini
  * Podržanim funkcionalnostima
  * Upravljačkim programima (driverima) i njihovoj stabilnosti i brzini (loš driver = loša mreža)
  * Podršci
  * Dokumentaciji

Sada nam postaje jasno da uopće nije nevažno koju mrežnu karticu treba odabrati ako želimo siguran, pouzdan i brz rad računala ili poslužitelja na mreži. Razlike u praksi znaju biti drastične. Počevši od razlika u cijeni od nekoliko desetaka ili stotina kuna (a nekada i tisuća KN) sve do nestabilnosti (ili stabilnosti) pa do brzine rada. Vrlo je često da ste kupili sve mrežne komponente,  kao i pasivni dio mreže (kablovi, utičnice, patch paneli ), koje prema standardima podržavaju brzinu deklariranu kao  “1Gbps” ali u praksi vam je brzina nešto malo veća od “100Mbps”.  Pitam se zbog čega  ?!.

&nbsp;

## **OS i softver odnosno “firmware” switcha**

Softver kao i sam operacijski sustav te svi upravljački programi (za hardverske komponente switcha), odnosno njegov odabir i sam razvoj drastično utičnu na pouzdanost, izdržljivost i stabilnost jednog uređaja kao što je switch.

Zapravo ovaj utjecaj je drastično veći nego li je to slučaj kod našeg osobnog računala ili nekog poslužitelja.

Ovdje se radi o uređajima koji moraju raditi besprijekorno, bez obzira koliko ih puta palili ili gasili (zbog nestanaka struje, uslijed nadogradnje ili sl.), bez obzira koliko milijuna mrežnih paketa u sekundi morali obraditi te bez obzira koliko se zapravo desetaka mrežnih protokola u svim mogućim ili nemogućim kombinacijama “vrtili” na vašem switchu.

Dakle nije isto da li je u određenoj konfiguraciji switcha konfiguriran protokol A, B i C  ili neki četvrti. Ili su u upotrebi samo protokoli A, C, i D.

&nbsp;

Da ne ostane sve samo na teoriji, pogledajmo službene &#8220;**Release Note**&#8221;  dokumente za OS (Firmware) switcheva tri poznatija proizvođaća. Izdvojiti ću samo po nekoliko bisernih grešaka.

&nbsp;

Uglavnom ih proizvođači otklone &#8211; samo je pitanje vremena : kod nekih je to pitanje tjedana, kod drugih mjeseci a kod trećih se na otklanjanje nekih grešaka za koje prouzvođači znaju i priznaju ih, čeka i godinama (stvarno godinama).

&nbsp;

&#8220;Pa da ne bude nisam rekao &#8211; a neke greške se pojavljuju u novijim verzijama, nakon ispravljenih nekih starih grešaka&#8221;

&nbsp;

Malo smijeha:

&nbsp;

&nbsp;

Proizvođač **A:**

<img class="alignnone size-full wp-image-2284" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Switch-Errors-example-03.jpg?resize=815%2C268&#038;ssl=1" alt="switch-errors-example-03" width="815" height="268" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Switch-Errors-example-03.jpg?w=815&ssl=1 815w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Switch-Errors-example-03.jpg?resize=150%2C49&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Switch-Errors-example-03.jpg?resize=300%2C99&ssl=1 300w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Switch-Errors-example-03.jpg?resize=768%2C253&ssl=1 768w" sizes="(max-width: 815px) 100vw, 815px" data-recalc-dims="1" />

Greška **Br.10** je primjerice super : nakon 30 do 200 restartanja uređaja, počinju se gubiti (ping)  paketi.

Ili **Br. 12**  kada se uključi DHCP Relay i Spanning Tree Protokol (STP) u isto vrijeme,  switch &#8220;Food&#8221;-a mrežu uzrokujući &#8220;Broadcast&#8221; storm i to na swim portovima na switchu  (šalje DHCP ACK ili DHCP NAK).

&nbsp;

Proizvođač **B**:

<img class="alignnone size-full wp-image-2285" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Switch-Errors-example-02.jpg?resize=839%2C374&#038;ssl=1" alt="switch-errors-example-02" width="839" height="374" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Switch-Errors-example-02.jpg?w=839&ssl=1 839w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Switch-Errors-example-02.jpg?resize=150%2C67&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Switch-Errors-example-02.jpg?resize=300%2C134&ssl=1 300w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Switch-Errors-example-02.jpg?resize=768%2C342&ssl=1 768w" sizes="(max-width: 839px) 100vw, 839px" data-recalc-dims="1" />

Greška pod &#8220;**Forwarding Traffic**&#8221;  nakon nekog vremena switch na neke portove jednostavno više ne šalje nikakav mrežni promet (pakete).

&nbsp;

Proizvođač **C** :

<img class="alignnone size-full wp-image-2286" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Switch-Errors-example-01.jpg?resize=834%2C373&#038;ssl=1" alt="switch-errors-example-01" width="834" height="373" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Switch-Errors-example-01.jpg?w=834&ssl=1 834w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Switch-Errors-example-01.jpg?resize=150%2C67&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Switch-Errors-example-01.jpg?resize=300%2C134&ssl=1 300w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Switch-Errors-example-01.jpg?resize=768%2C343&ssl=1 768w" sizes="(max-width: 834px) 100vw, 834px" data-recalc-dims="1" />

Najbolja mi je greška **CR_0000128904** :  nasumično pojedini portovi na switchu ostanu u zablokiranom stanju te ne mogu niti primati niti slati pakete. Riješenje resetiranje switcha.

&nbsp;

&nbsp;

&nbsp;

## **Testiranje, testiranje i testiranje i još malo testiranja i na kraju još pokoje testiranje**

Samo testiranje uređaja &#8211; koje bi trebala odraditi tvrtka koja ga je i proizvela nije uopće trivijalno te  podiže cijenu finalnog proizvoda  &#8211; ako je za sve faze razvoja bilo potrebno 1000 vremenskih jedinica, sigurno je da će faza testiranja zahtijevati minimalno još toliko (ovo je moj osobni stav).

Pošteno testiranje se svodi na testiranje svih mogućih kombinacija protokola ili funkcionalnosti koje određeni uređaj podržava i to u kombinacijama svih mogućih i nemogućih mrežnih protokola koji moraju biti u upotrebi i koji moraju prolaziti kroz mrežni uređaj koji se testira.

&nbsp;

To znači da ako recimo switch podržava ARP protokol (koji i mora podržavati), a koji je samo jedan on niza protokola, testiranje mora uključiti ponašanje u radu u kojemu su na točno određenoj hardverskoj verziji switcha na točno određenoj verziji softvera (operacijski sustav, upravljački programi i sve ostalo) spojena računala koja generiraju promet (i to u varijantama : na svim portovima, samo na nekim portovima, neka se moraju uključivati i isključivati ,&#8230;. dakle i ovdje postoji gomila scenarija koji se moraju proći).

Promet koji se generira mora biti točno definiran te je potrebno testirati razne mrežne protokole u raznim kombinacijama. Prema TCP/IP setu protokola definirano je 65536 mogućih mrežnih protokola od kojih je važno testirati njih možda samo maksimalno tisuću (1000).

U praksi pitanje je da li se testira možda nekoliko desetaka protokola maksimalno (a pitanje je da li i toliko, kod &#8220;entry level&#8221; proizvođača (u pravilu najjeftiniji uređaji) koje neću imenovati.

<p style="padding-left: 30px;">
  Osim toga pošto se u ovom slučaju testira ARP protokol, potrebno je testirati sve scenarije ponašanja ARP protokola &#8211; i one dozvoljene (definirane standardima) kao i one nedozvoljene koji bi mogli utjecati na sigurnost i/ili stabilnost ili pojedinog porta na switchu ili cijelog uređaja. Naime nije dovoljno testirati standardne ARP pakete već i one za koje je potrebno “ručno” kreirati ARP pakete koji namjerno sadrže vrijednosti ili parametre koje ne bi smjeli sadržavati.
</p>

Stoga samo za testiranje ARP protokola, potrebne su stotine scenarija za testiranje.

Sljedeći test bi bilo uključivanje drugog protokola ili funkcionalnosti &#8211; primjerice logiranje poruka na vanjski syslog poslužitelj. Zvuči banalno ali sada je potrebno ponoviti sve prethodne scenarije testiranja uz dodatne scenarije testiranje specifične za syslog protokol. Također s dozvoljenim i “nedozvoljenim” opcijama ili parametrima ili oblicima mrežnih paketa za protokole koje testiramo.

Ako uključimo još jednu funkcionalnost &#8211; recimo često korišten **Spanning Tree** protokol, sada ponovno moramo sve testirati s dodatnim stvarima vezanim za Spanning Tree , ali i u varijantama sa ARP protokolom i sa ili bez syslog funkcionalnosti , sada smo došli do sigurno tisuća scenarija za testiranje.

Sjetimo se da i “najslabiji” switchevi podržavaju desetak protokola ili funkcionalnosti te činjenice da samo za isti hardverski model uređaja proizvođači imaju nekoliko verzija Operacijskog sustava (nazovimo ga “Firmware”). Potrebno je sve testirati pojedinačno. I naravno za sve modele uređaja koji se prodaju.

Mislim da smo došli, možda i do milijuna scenarija koje je potrebno testirati.

I sada se možemo pitati tko od proizvođača to sve radi ?

<p style="padding-left: 30px;">
  Možete se pitati da li je to sve potrebno &#8211; moj odgovor je <b>DA</b>.
</p>

U praksi sam susreo nebrojeno puta da već samo određene kombinacije uključenih funkcionalnosti i mrežnih protokola nekada uzrokuju neke treće probleme a u nekim kombinacijama sve radi.

Ili u jednoj verziji “Firmware”-a radi nešto što u drugoj (čak i novijoj) više ne radi ili pravi probleme, na čije otklanjanje nekada možete potrošiti dane i dane, da bi na kraju shvatili da nije problem u ničemu drugom nego u switchu (ili routeru) odnosno problematičnom FIrmware-u (OS-u).

&nbsp;

<p style="padding-left: 30px;">
  &#8211;> Potrošeni dani <strong>x</strong> sati <strong>x</strong> broj ljudi = bolje/jeftinije kupiti pošteni (provjereni) uređaj <&#8211;
</p>

<p style="padding-left: 30px;">
            -Kada kažem provjereni, mislim na konkretnog proizvođača, točan model i verziju softvera (Firmware/OS) provjeren u okruženju u kojemu se koriste svi mrežni protokoli i postavke koje i vi želite koristiti.
</p>

&nbsp;

U konačnici previše je mogućih kombinacija koje ne želite sami testirati na svojoj mreži za koju želite da radi kako treba, pa je uglavnom jeftinije uložiti nešto malo više u opremu pouzdanijih proizvođača, i to po mogućnosti točnog modela i verzije Firmware-a za koji znate da radi kako treba (sa svim onim funkcionalnostima i protokolima koji vam stvarno trebaju).

Ne treba se 100% pouzdati niti u najveće “Brand Name” proizvođače &#8211; i njima se događaju greške &#8211; itekako, ali za red veličine manje od nekih koje ću nazvati “Bezimeni”.

&nbsp;

&nbsp;

# **Vratimo se switchevima (detaljnije)**

Za razliku od računala, switchevi nemaju “klasične” mrežne kartice nego tkzv. “Switching chip”-ove koji zapravo na jednom “chip-u” imaju integrirano nekoliko mrežnih kartica, od 4, 8 ,12 , 24, 48 ili više portova.

Ovdje je stanje još drastičnije nego kod “običnih mrežnih kartica i to za iste stvari. Naime postoji cijela gama switching chipova od raznih proizvođača s ogromnim razlikama:

  * Različitih su performansi,
  * Različitih funkcionalnosti koje podržavaju
  * Njihovi upravljački programi se razvijaju samo  za određeni OS ili za više njih, (pitanje je  i stabilnosti i dr.)

Što se samih switcheva ili routera tiče (kao gotovih proizvoda):

Neki proizvođači koriste Linux a drugi određene specijalizirane varijante UNIX operacijskih sustava. I odabir operacijskog sustava kao i pripadajućih upravljačkih programa utiče na pouzdanost, sigurnost i performanse konačnog rješenja.

Tako primjerice “Cisco” koristi BSD UNIX za Cisco IOS\* , dok “Juniper” koristi FreeBSD UNIX za njihov JunOS\*.

&nbsp;

  * *IOS i JunOS su operacijski sustavi proizvođača Cisco i Juniper, namijenjeni Switchevima ( i Routerima).

&nbsp;

Osim toga switchevi imaju i CPU i RAM memoriju poput “običnih” računala, koji također utječu na performanse.

Osim toga razlikujemo:

  * Standardne “Layer 2” switcheve koji rade na OSI sloju 2 te prema tome odluku o preklapanju (za svaki mrežni paket) donose na osnovi MAC adresa
  * I tkzv “Multilayer“ switcheve odnosno switcheve koji odluke o preklapanju svakog paketa donose na osnovi analize OSI slojeva 2,3 i 4.

&nbsp;

&nbsp;

## **Layer 2 switching &#8211; klasična upotreba switcheva (preklopnika).**

U današnjim mrežama za međusobno umrežavanja/spajanje računala, poslužitelja i ostale mrežne opreme koriste se switchevi koji standardno rade na OSII sloju 2 ( Layer 2) &#8211; barataju sa MAC adresama.

Spajanjem bilo kojeg računala ili uređaja na neki port na switchu, sam switch prvo mora saznati njegovu MAC adresu te ju spremiti u svoju internu tablicu koja sadrži par :

**<span style="color: #ff0000;">Source MAC adresa <-> port (interface) na switchu</span>**

To je i sva logika koja je potrebna za uspješno preklapanje, Naime kada spojimo računala A i B na switch,  i to primjerice:

**<span style="color: #ff0000;">Računalo A (MAC 00:01:02:A1:11:11) <-> port (interface) 1</span>**

**<span style="color: #ff0000;">Računalo B (MAC 00:01:02:B2:22:22) <-> port (interface)</span> <span style="color: #ff0000;">2</span>**

&nbsp;

Switch si nakon nekoliko trenutaka izgradi gore navedenu tablicu koju primjenjuje na svaki paket koji mu dođe.

&nbsp;

## **Layer 3 (Routing)**

U slučaju routinga (usmjeravanja) koji se događa na OSI sloju 3 (IP adrese) uređaji odluku za usmjeravanje paketa donose na osnovu IP adresa &#8211; zapravo para : IP adresa i njena pripadajuća maska mreže (netmask).

Tablica na osnovu koje se odrađuje usmjeravanje (praktično isti postupak kao i preklapanje [switching] ali na OSI sloju 3) se zove “Routing tablica” koju uređaj također mora imati. Dakle slična priča ali na drugom OSI sloju, i još malo kompleksnija zbog routing protokola i mogućnosti dinamičkih promjena routing tablica pomoću routing protokola (RIP, OSPF, BGP, &#8230;).

Uređaji koji se bave usmjeravanjem u načelu zovemo usmjerivači (Routeri) ali postoje i preklopnici (switchevi) koji mogu odrađivati i taj dio posla. Ovakve switcheve zovemo “Multilayer switchevi” odnosno switchevi koji rade na više OSI slojeva (2,3 i 4). Ovakvi switchevi vrlo su važni u današnjim mrežama, jer nam daju mogućnost da uredno segmentiramo lokalnu mrežu a da to ne unese velika usporavanja, koja bi uveli klasični routeri.

&nbsp;

&nbsp;

## **Prisjetimo se TCP/IP komunikacije :**

Svaki paket mora imati (uz ostale podatke) : Source i Destination MAC adrese i Source i Destination IP adrese. Pošto je ovo Layer 2 switch on gleda svaki paket i to samo dio sa Source MAC adresom i destination MAC adresom

(Layer 2 po OSI tj Layer 1 po TCP/IP modelu ):

Dakle računalo A šalje paket na računalo B :

_Pojednostavljeno to radi ovako_:

  1. Switch pogleda Source MAC (to je MAC od Računala A) i vidi da ga već ima u tablici (ako nema zapamti ga sada, na portu na koji je spojen) te pogleda i destination MAC adresu (to je MAC od Računala B)
  2. Switch provjerava svoju tablicu i gleda da li ima MAC adresu od računala B, ako ima gleda na kojem je portu (interface-u) i paket šalje na taj port (interface)

Ako nema MAC adresu od računala B, pokuša ju saznati slanjem pripadajuće ARP poruke te ju (MAC adresu) zapamti i izgradi si novu tablicu.

Ova MAC tablica na switchu se zove i CAM tablica (Content addressable memory) tablica.

  1. Sada kada switch ima u CAM tablici i Source i Destination MAC adrese od ovog (i svakog) paketa od Računala A. Tada on paket (jedan po jedan) prebaci/preklopi na interface na kojem se nalazi spojeno računalo B. **Ovo (korak 3.) se ponavlja za svaki paket na mreži.**

&nbsp;

&nbsp;

&nbsp;

&nbsp;

# **Dizajn (još detaljnije)**

U konačnom dizajnu switcheva u pravilu postoje dva pristupa:

  * ****1. CPU+Switching chip ili****

  * **2. CPU+Switching chip+ ASIC**

&nbsp;

Već kod standardnih switcheva (koji odluke o preklapanju donose na OSI sloju 2), funkcionalnosti koje su implementirane u “Switching chip”-ove nisu dostatne za sve operacije koje jedan switch treba podržavati, već su uglavnom implementirane najrudimentarnije stvari pa čak i ovdje, kontrolu za dobar dio  mrežnih protokola mora odraditi CPU samog switcha.

Ovdje je važnost u odabiru dobrog “Switching chip”-a krucijalna jer dobar dio njih već u nižoj srednjoj klasi nudi dobar dio funkcionalnosti implementiran u sam “Chip” te se samim time rasterećuje CPU koji ionako nije sposoban za obavljanje tih zadataka na gigabitnim brzinama.

&nbsp;

## **        I ovdje imamo varijacije na temu** 

Prva varijanta : više manjih i slabijih “Switching” chipova, povezanih preko zajedničke sabirnice

<img class="alignnone size-full wp-image-2095" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Switch-1.jpg?resize=698%2C344&#038;ssl=1" alt="Switch-1" width="698" height="344" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Switch-1.jpg?w=698&ssl=1 698w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Switch-1.jpg?resize=150%2C74&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Switch-1.jpg?resize=300%2C148&ssl=1 300w" sizes="(max-width: 698px) 100vw, 698px" data-recalc-dims="1" />

Ovakav dizajn koriste mnogi jer drastično snižava cijenu.

Problemi su uglavnom sporost sabirnice te samim time komunikacija između switching chipova &#8211; u ovom slučaju sve ide donekle brzo u komunikaciji između portova 1- 4 te u komunikaciji između portova 5-8 te između portova 9 -12. U slučaju da komunikacija treba ići između portova koji su na različitim switching chipovima &#8211; nastupa problem odnosno usporavanja.

Dodatna mana je u tome što se u ovoj (najgoroj varijanti) ugrađuju Switching chipovi koji nemaju gotovo nikakve funkcionalnosti osim onih najosnovnijih. Ispravno bi bilo da ih proizvođači niti ne omogućavaju ali u praksi nailazimo na uređaje koji podržavaju cijelu gomilu funkcionalnosti i protokola ali koriste ovakav dizajn u kojemu na kraju većinu toga mora odraditi CPU pa se uređaj počinje ponašati užasno usporeno.

Druga varijanta je upotreba naprednijih switching chipova, koji podržavaju više funkcionalnosti te i neke mrežne protokole i uz to pokrivaju veći broj portova, pa komunikacija ne mora ići preko još uvijek spore sabirnice.

Ovo je model vidljiv na slici:

<img class="alignnone size-full wp-image-2096" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Switch-2.jpg?resize=698%2C339&#038;ssl=1" alt="Switch-2" width="698" height="339" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Switch-2.jpg?w=698&ssl=1 698w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Switch-2.jpg?resize=150%2C73&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Switch-2.jpg?resize=300%2C146&ssl=1 300w" sizes="(max-width: 698px) 100vw, 698px" data-recalc-dims="1" />

Problem oba ova modela je još uvijek odabir prilično slabih switching chipova te prebacivanje previše toga na CPU (naravno preko iste sabirnice).

Najčešće je odabir CPU-a za switcheve iz područja ARM ili MIPS arhitekture procesora, koji za vrlo nisku cijenu i potrošnju energije nude solidne karakteristike.

Nažalost u ovom svijetu u kojemu su potrebne analize i obrade svakog pojedinog mrežnog paketa &#8211; dakle switching-a (Layer 2) ili routing-a (Layer 3 i 4) , pogotovo na gigabitnim brzina, ovi procesori ne nude zadovoljavajuće brzine obrade paketa. Stoga mnogi odabiru procesore sa sve više i više jezgri.

Dodatni problem je i u tome što recimo specifikacija koja govori da se koristi ARM procesor na 1GHz ne znači zapravo ništa.

Da malo razjasnim &#8211; ARM nije model ili tvrtka koja u  konačnici proizvodi procesore. Tvrtka ARM zapravo dizajnira procesore. Dakle bilo koji proizvođač može kupiti licencu za ARM dizajn i arhitekturu procesora te ga i izraditi.

I tih ARM licenci (dizajna) ima cijelo čudo:

  * Cortex-A (A72, A57, A17, A15, A53,A35 A7, &#8230;, pa postoje arhitekture ARM v7, ARM v8, ..)
  * Cortex-R (R4,R5,R7,..)
  * Cortex-M (&#8230;)

Zapravo samo nekoliko je velikih proizvođača koji izrađuju (ARM) procesore a postoji na desetke onih za koje ih izrađuju, prema ARM licenci i prema željama onih koji ih naručuju (uključite ovo , isključite ono, dodajte ovu funkcionalnost, izbacite onu, &#8230;.).

U tome zapravo leži dio problema. Ima ih svakakvih odnosno neki imaju mnoge dobre funkcionalnosti ali su malo skuplji neki imaju samo najosnovnije ali su jeftiniji… ne moram dalje pričati.

Pogledajte &#8220;proizvođače&#8221; ili  proizvođače ARM procesora za pametne telefone &#8211;  lista je dugačka.

&nbsp;

**Gruba računica govori da je prosječan ARM Cortex-A procesor takta 1GHz po moći obrade mrežnih paketa jednak Pentium 3 procesoru radnog takta 300MHz.**

&nbsp;

**Preporuka za routing** 

Ako pogledamo Multilayer funkcionalnosti (što vrijedi za Routere ali i Multilayer Switcheve ), neke generalne preporuke za CPU snagu su (na osnovi samo dva interface-a : WAN i LAN) :

&nbsp;

&nbsp;

CPU : Pentum 4 klasa, 2GHz : 100-500Mbps (ovisno što se sve treba procesirati), dobivamo sljedeći zaključak:

<sup>6 x ARM CPU na 1 GHz = 1 x Pentium 3 CPU na 2 GHz (budimo jako optimistični pa recimo da je Pentium 3 = Pentium 4).</sup>

<sup>Dakle 6 x ARM 1Ghz je dovoljno za max 2 mrežna interface-a za brzine procesiranja između 100Mbps i 500Mbps.</sup>

<sup>Za 1Gbps u najboljem slučaju to značu 12 x ARM 1GHz CPU za 1Gbps propusnosti između dva mrežna interface-a.</sup>

Pošto 1Gbps omogucava “Full duplex” rad, to znači da nam je za popunjavanje pune propusnosti 2 mrežna interface-a koja oba rade u “Full duplex” načinu rada , potrebna propusnost od 4Gbps.

To tada znači 12 x ARM 1GHz x 4 =  **48 Core ARM CPU na 1GHz**

Ako uzmemo u obzir da su switchevi koji se najčešće koriste, minimalno sa 24 x 1Gbps porta, to bi značilo da bi morali imati **576 Core ARM CPU na 1GHz.** 

To je računica u slučaju da “Switching chip” ne odrađuje veći dio funkcionalnosti &#8211; što je i slučaj kod niže do niže srednje  kategorije ovih chipova. Ako i ovdje budemo optimistični pa kažemo da Switching chip odrađuje 50% potrebnih funkcionalnosti tada nam je za sve navedeno potrebno “samo”  **288 Core ARM CPU na 1GHz.**

&nbsp;

**Olakotne okolnosti**

Ako uzmemo u razmatranje i razvoj ARM procesora po pitanju obrade mrežnih paketa te kažemo da se stanje poboljšalo za 50%  došli bi do broja od **144  ARM CPU jezgri na 1GHz.**

Dodatno je čak moguće da se određenim optimizacijama moglo povećati obradu paketa za još pokoji postotak

&nbsp;

**Ovakav pristup zapravo i imaju neki od proizvođača Switcheva odnosno Multilayer Switcheva ali pri tome nisu došli niti blizu broja CPU jezgri koje bi bile potrebne za brzine o kojima smo govorili.**

&nbsp;

&nbsp;

**Upravljački programi i drugi softver**

Još jedan element u ovoj prići su upravljački programi kao i druge softverske komponente niže razine. One su u pravilu proporcionalno loše ili dobre ovisno o proizvođaču, namjeni i na kraju krajeva modelu komponente (ili samog chipa). Iz mog iskustva pouzdaniji igrači imaju bolje upravljačke programe (drivere) koje redovito održavaju i optimiziraju, dok oni s manje &#8220;resursa&#8221; ili naglaska na kvalitetu uporno ostaju loši.

Ova komponenta odnosno upravljački i drugi programi niže ili čak više razine, mogu također znatno utjecati na performanse cijelog sustava.

&nbsp;

### **  Sabirnica** 

Pri svemu ovome nisam niti spominjao brzinu sabirnice između “Switching chipa” i CPU-a , koja bi morala moći podnjeti sve ove brzine, kao i brzine memorijske sabirnice i u konačnici RAM memorije koja bi to morala također moći podnjeti.

Probajmo kratko analizirati i to.

Dakle switch sa 24 x 1Gbps portova mora imati minimalnu unutarnju propusnost od 48Gbps (zbog full duplexa).

Brzina od 1Gbps = znači maksimalno 125MB/s

Full duplex 1Gbps je maksimalno 250 MB/s

U ovom slučaju 48Gbps = 125 MB/s * 48 = 6.000 MB/s = 5.8 GB/s

Sjetimo se samo da recimo **Intel Skylake** arhitektura sa pripadajućim **Z170** chipsetom ima maksimalnu propusnost sabirnice između CPU-a i “Southbridge” chipseta (DMI v.3.0) od nekih 4 GB/s.

Dakle u ovom slučaju niti Intelova 6 generacija Pentium 4 procesora (i5-6xxx ili i7-6xxx) nema dovoljnu propusnost za tako nešto. Memorisjka sabirnica u ovom slučaju ima propusnost od 34 GB/s pa bi ona zadovoljila ali nedostaje brzine prema “Southbridge” dijelu na koji je spojena mreža.

Za više informacija o arhitekturi računala [pogledajte*][2]

&nbsp;

Probajmo sada “odokativno” izračunati koji Intel Pentium 4 CPU bi bio potreban za to :

Ako je 2GHz jedan CPU core dovoljan za 500Mbps obrade, trebaju nam 2 CPU core za 1Gbps odnosno 4 CPU core za 1Gbps full duplex.

Dakle trebalo bi nam samo 96 CPU core Intel Pentium 4 na 2GHz, ako imamo CPU na 4GHz tada bi nam trebalo samo 48 CPU core Intel Pentium 4 i još 1.8GB/s brža sabirnica prema “Southbridge” chipsetu i mrežnim karticama..

Mislim da je sada sve jasno.

Osim toga koliko god procesor bio brz, baratanje s mrežnim paketima će se i dalje događati unutar granica milisekundi.

Pozitivno je da ipak određeni postotak obrade paketa uspije odraditi Switching chip ali na kraju sve ovisi o proizvođaču &#8211; koji je točno model switching chipa odabrao (odnosno koliko je bio spreman platiti &#8211; mada su često razlike u cijeni smiješne &#8211; ali razlika od 1U$ na milijun primjeraka je milijun U$ ). Reći ću samo postoje proizvođači i “proizvođači”. Pa čak ovisi i o seriji odnosno modelu uređaja gdje proizvođač za relativno malu razliku od nekoliko stotina KN ili malo vise od toga, u KN, nudi poprilično više (ili manje).

&nbsp;

&nbsp;

&nbsp;

# **Postoji  li rješenje ?**

Zbog ovih ograničenja većina “jačih” proizvođača počela je tražiti rješenje koje stvarno može riješiti ovaj problem vrlo loše propusnosti switcheva (i jačih verzija Routera).

Rješenje je implementacija Tzv. ASIC chipova.

Ovo rješenje zapravo nije ništa toliko novo &#8211; u širokoj upotrebi je sigurno već desetak i više godina, samo što je u današnje vrijeme postalo široko dostupno (i relativno jeftino).

&nbsp;

&nbsp;

## **ASIC (Application Specific Integrated Circuit)**

ASIC chipovi su specijalizirani chipovi koji imaju hardverski implementirane sve potrebne funkcionalnosti koje bi inače morao obrađivati CPU.

U praksi se pokazalo da se upotrebom ASIC chipova u odnosu na klasični CPU, dobivaju poboljšanja performansi minimalno **500x** a vrlo često čak i do **1000x**.

Možemo povući paralelu s hardverskim dekodiranjem video sadržaja koji danas s lakoćom obavlja bilo koja grafička kartica a prije nekoliko godina je to sve (trzavo) morao odrađivati CPU.

Dakle ASIC chipovi rade kompletan switching ili routing:

  * na osnovi MAC adresa (Layer 2)
  * na osnovi IP adresa (Layer 3)
  * na osnovi portova (Layer 4)
  * Traffic forwarding (obrada i prosljeđivanje paketa)
  * QoS (Quality of Service)
  * ACL lookup  (Access Liste)
  * Route Processing (Obrada Routing funkcionalnosti)
  * STP (Spanning Tree protokol)
  * &#8230;

Osim toga jače verzije ASIC chipova imaju implementirane gotovo sve mrežne protokole koje susrećemo u Switchevima, kao i većinu mrežnih protokola koje susrećemo u klasičnim Routerima. U slučaju upotrebe kod “Multilayer” switcheva radi se o implementiranim gotovo svim protokolima koje uređaj podržava.

Pogledajmo fotografiju Cisco 3750G switcha (24 x 1Gbps + 4 x 1Gbps SFP)

<img class="alignnone size-full wp-image-2116" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Cisco-3750G.jpg?resize=1119%2C791&#038;ssl=1" alt="Cisco-3750G" width="1119" height="791" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Cisco-3750G.jpg?w=1119&ssl=1 1119w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Cisco-3750G.jpg?resize=150%2C106&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Cisco-3750G.jpg?resize=300%2C212&ssl=1 300w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Cisco-3750G.jpg?resize=768%2C543&ssl=1 768w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Cisco-3750G.jpg?resize=1024%2C724&ssl=1 1024w" sizes="(max-width: 1000px) 100vw, 1000px" data-recalc-dims="1" />

Na slici gore je Cisco 3750G (switch sa 24 x 1Gbps + 4 x 1Gbps SFP) &#8211; vidljivo je da jedan ASIC+SRAM ( <span style="color: #ff0000;">set od tri chipa</span> ) odrađuje samo 4 x 1Gbps te je na njega spojen jedan PHY (<span style="color: #3366ff;">pripadajući chip gore</span>) koji je zadužen za ta četiri 1Gbps porta, koja završavaju na RJ-45 konektoru &#8211; pogledajte desnu stranu &#8211; i sve tako do 6-tog ASIC,SRAM i PHY.

Sedmi ASIC+SRAM nema svoj PHY (krajnje lijeva strana) jer sve završava na SFP portovima u koje se uključuju SFP moduli koji imaju svoj PHY (jer mogu biti optički ili električni sa RJ-45 konektorom).

SFP moduli se često nazivaju i &#8220;Transceiver&#8221;-i.

Slika prikazuje optički SFP+modul (sa LC optičkim konektorom) tvtke &#8220;HP&#8221; (J9150A) i jedan SFP+ (isto optički 10Gbps, sa LC konektorom) , tvrtke Cisco (SFP-10G-SR):

 <img class="alignnone wp-image-2119" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Cisco-SFP-10G-SR.jpg?resize=184%2C176&#038;ssl=1" alt="Cisco-SFP-10G-SR" width="184" height="176" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Cisco-SFP-10G-SR.jpg?w=200&ssl=1 200w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Cisco-SFP-10G-SR.jpg?resize=150%2C143&ssl=1 150w" sizes="(max-width: 184px) 100vw, 184px" data-recalc-dims="1" /><img class="alignnone wp-image-2120" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/HP-J9150A.jpg?resize=253%2C133&#038;ssl=1" alt="HP-J9150A" width="253" height="133" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/HP-J9150A.jpg?w=397&ssl=1 397w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/HP-J9150A.jpg?resize=150%2C79&ssl=1 150w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/HP-J9150A.jpg?resize=300%2C158&ssl=1 300w" sizes="(max-width: 253px) 100vw, 253px" data-recalc-dims="1" />

Donja slika prikazuje Cisco 1000Base-T (1Gbps sa RJ-45):

<img class="alignnone wp-image-2122" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Cisco-SFP-1000Base-T.jpg?resize=206%2C202&#038;ssl=1" alt="Cisco-SFP-1000Base-T" width="206" height="202" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Cisco-SFP-1000Base-T.jpg?w=467&ssl=1 467w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Cisco-SFP-1000Base-T.jpg?resize=150%2C147&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Cisco-SFP-1000Base-T.jpg?resize=300%2C295&ssl=1 300w" sizes="(max-width: 206px) 100vw, 206px" data-recalc-dims="1" />

&nbsp;

**Malo zanimljivosti**

Molim vas pogledajte malo bolje gornji desni dio gornje velike slike Cisco switcha Catalyst 3750 (zumirana slika &#8211; dolje).

<img class="alignnone size-full wp-image-2114" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Cisco-3750-lord-of-the-rings-1.jpg?resize=576%2C525&#038;ssl=1" alt="Cisco-3750-lord-of-the-rings" width="576" height="525" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Cisco-3750-lord-of-the-rings-1.jpg?w=576&ssl=1 576w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Cisco-3750-lord-of-the-rings-1.jpg?resize=150%2C137&ssl=1 150w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Cisco-3750-lord-of-the-rings-1.jpg?resize=300%2C273&ssl=1 300w" sizes="(max-width: 576px) 100vw, 576px" data-recalc-dims="1" />

Radi se o tome da Cisco za svaku generaciju uređaja ima kodno ime a pošto je ovo bio prvi model koji je koristio &#8220;Stackwise&#8221; tehnologiju koja omogućava povezivanje do osam switcheva u prsten &#8211; prsten koji ih povezuje&#8230; kodno ime mu je bilo &#8220;_Lord of the Rings_&#8221;

&nbsp;

_ &#8220;&#8230; One Ring to rule them all, One Ring to find them,_
  
 _One Ring to bring them all &#8230;&#8221;_

&nbsp;

Kada već govorimo o ovoj mogućnosti povezivanja do osam Switcheva serije 3750 u prsten &#8211; to logički izgleda ovako:

<img class="alignnone wp-image-2274" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Cisco3750-Stack.jpg?resize=503%2C340&#038;ssl=1" alt="cisco3750-stack" width="503" height="340" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Cisco3750-Stack.jpg?w=555&ssl=1 555w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Cisco3750-Stack.jpg?resize=150%2C101&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Cisco3750-Stack.jpg?resize=300%2C203&ssl=1 300w" sizes="(max-width: 503px) 100vw, 503px" data-recalc-dims="1" />

Kod ovakvog načina spajanja, preko posebnih &#8220;Stack&#8221; konekcija visoke propusnosti (32Gbps ili 64Gbps &#8211; ovisno o modelu) switchevi spojeni u prsten se počinju &#8220;ponašati&#8221; kao da se radi o jednom velikom switchu &#8211; sa strane konfiguracije i svih funkcionalnosti.

Dakle odjednom imamo &#8220;veliki&#8221; switch sa puno dostupnih portova. Ova veza je direktna poveznica između &#8220;Switch Fabric&#8221;-a odnosno praktično &#8220;Matičnih ploča&#8221; switcheva međusobno spojenih u prsten. Stoga i dalje rade svi protokoli koji inače ne bi mogli raditi da se radi o nekom kvazi riješenju spajanja switcheva u prsten u kojemu je svaki switch na najnižoj razini vidljiv kao zaseban switch.

<span style="color: #ff0000;">Jedan od takvih protokola je i protokol za Agregaciju portova odnosno EtherChannel, koji u svojoj komunikaciji dijeli i podatak o fizičkom uređaju na koji je spojen. </span>

&nbsp;

&nbsp;

A sada pogledajmo i referentnu arhitekturu jedne novije generacije Cisco 3750G Multilayer switcha:

<img class="alignnone size-full wp-image-2098" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Switch-ASIC-1.jpg?resize=698%2C392&#038;ssl=1" alt="Switch-ASIC-1" width="698" height="392" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Switch-ASIC-1.jpg?w=698&ssl=1 698w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Switch-ASIC-1.jpg?resize=150%2C84&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Switch-ASIC-1.jpg?resize=300%2C168&ssl=1 300w" sizes="(max-width: 698px) 100vw, 698px" data-recalc-dims="1" />

Vidljivo je da ASIC ima **CAM** i **TCAM** dio kao i vrlo brzu **SRAM** memoriju za širu upotrebu unutar chipa te da je povezan sa “Switching chip”-om. Jedan ovakav **ASIC** podržava spajanje do 24x1Gbps **PHY** (Physical Layer) chipova koji su zaduženi za sam mrežni medij (interface).

**PHY** mogu biti za bakar (RJ-45 konektor), optiku (bilo koji tip konektora za optiku) ili SFP port u koji se uključuje SFP adapter koji može biti ili za &#8220;bakar&#8221; ili optika.

Dakle PHY chip je u konačnici taj koji sve pretvara u električne signale ili optičke impulse za slanje na mrežu .

&nbsp;

&nbsp;

**CAM** dio (Content Addressable Memory)  je zapravo tablica u kojoj se zapisuju i pretražuju mapiranjia  MAC adresa &#8211; port na switchu, na osnovu koje se radi switching na OSI sloju 2.

**TCAM** dio (Ternary Content Addressable Memory) je zapravo tablica sa mapiranjima na višim OSI slojevima (OSI 3) dakle ovdje se spremaju routing tablice i sl.

CAM i TCAM se nalaze u posebnoj superbrzoj memoriji ASIC chip-a ili u starijoj generaciji kao zaseban chip, koja omogućava nevjerojatno brzi pristup i pretraživanje navedenih tablica.

&nbsp;

Vidljivo je da starija generacija Cisco 3750G ima ASIC i ASIC RAM (CAM i vjerojatno TCAM) uz pripadajući PHY i Switching chip  &#8211; samo za 4 x 1Gbps, dok novija generacija koristi mnogo snažnije ASIC chipove koji su u stanju “odraditi” do 24 x 1Gbps na chipu (nažalost nemam fotku nove generacije Cisco 3750) ali je sve jasno iz priložene logičke sheme.

Jedina slaba točka ovog dizajna je međuveza između ASIC chipova odnosno propusnost sabirnice koja ih povezuje.

&nbsp;

Nagađa se da Cisco i (drugi) veliki igraći zapravo koriste “Mesh” topologiju između ASIC chipova, preko koje su ASIC chipovi povezani sabirnicom velike propusnosti, te se s time ubrzala komunikacija između njih i komunikacija prema centralnoj sabirnici. Mana ovog dizajna je u tome što se sada za recimo ovakav switch u primjeru koristi 10 portni (zamišljeni) ASIC koji koristi 6 portova za međusobno spajanje a samo 4 porta za spajanje prema PHY i na kraju fizičkim interfaceima (portovima). Dakle u konačnici u dizajnu na slici imamo 4 ASIC chipa sa 10 x 1Gbps portova (svaki) što je ukupno 40 x 1Gbps od kojih je upotrebljivo za spajanje (na vanjske portove) samo 16 x 1Gbps. Prema svemu sudeći međuveze između svakog ASIC-a bi u ovoj konfiguraciji trebale biti još veće (u ovom slučaju  dvostruko ili još više ).

Za ono što bi bio “Non blocking” dizajn minimalno isto toliko portova koliko ih svaki ASIC propušta van (na mrežne portove) bi morala biti i veza prema svakom susjednom ASIC-u.

&nbsp;

Pogledajmo i ovakav dizajn (slika dolje).

<img class="alignnone size-full wp-image-2099" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Switch-ASIC-MESH.jpg?resize=698%2C547&#038;ssl=1" alt="Switch-ASIC-MESH" width="698" height="547" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Switch-ASIC-MESH.jpg?w=698&ssl=1 698w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Switch-ASIC-MESH.jpg?resize=150%2C118&ssl=1 150w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Switch-ASIC-MESH.jpg?resize=300%2C235&ssl=1 300w" sizes="(max-width: 698px) 100vw, 698px" data-recalc-dims="1" />

U svakom slučaju bilo koji dizajn koji uključuje ASIC chipove, omogućava postizanje vrlo velikih brzina procesiranja mrežnih paketa i to brzinama koje su neizvedive za standardne centralne procesore (CPU).

Dakle switchevi koji imaju implementirane ASIC chipove, sve operacije i protokole (koje ASIC podržava) odrađuju 1000 puta brže od bilo kojeg CPU-a.

U praksi to znači da će sve operacije koje ASIC obradi &#8211; poput Switching-a ili Routinga biti obrađene unutar granica nekoliko mikrosekundi za razliku od Routinga koji se inače na “običnim uređajima” u najboljem slučaju uspije obraditi unutar nekoliko milisekundi -dakle **točno tisuću (1000) puta sporije**.

&nbsp;

<p style="padding-left: 30px;">
  <b>Ponoviti ću  &#8211; Ovo je dokazano u praksi &#8211; !!!! </b><span style="color: #ff0000;"><b>Razlika je tisuću puta brža obrada paketa</b></span><b> !!!!</b>
</p>

&nbsp;

&nbsp;

**Pogledajmo i što nam kaže Cisco IOS (Cisco operacijski sustav), na nekoliko Catalyst serija switcheva**

Sada ćemo ono što možda izgleda kao teorija, pogledati na stvarnim Cisco switchevima i to na :

  * Catalyst 2960 \[Layer 2, 10/100\] (“najslabija” serija)
  * Catalyst 3560G \[Multilayer, 10/100/1000\] (Layer2,3,4) &#8211; prvi Multilayer switch
  * Catalyst 3750G \[Multilayer, 10/100/1000\] (Layer2,3,4) &#8211; sličan kao 3560 samo što ima mogućnost “stackiranja” do 8 switcheva preko specijalne međuveze vrlo visoke brzine (32+Gbps)
  * Catalyst 3850 \[Multilayer 10G\] (Layer2,3,4) &#8211; s novim cisco ASIC-om

Koristiti ćemo naredbu koja će prikazati vezu između ASIC chipa i interface-a na switchu odnosno koji interface je spojen na koji ASIC chip.

Naredba je “**sh platform pm interface-numbers**”  ili “**sh platform pm if-numbers**” ovisno o platformi. Izlistanje je malo duže tako da ću izvući samo važne detalje.

&nbsp;

**WS-C2960-24TC-L** 

<pre style="padding-left: 30px;">Fa 0/1 - 24     ASIC 0     (portovi 10/100 Mbps)</pre>

<pre style="padding-left: 30px;" class="">Gi 0/1 - 2      ASIC  0    (portovi 10/100/1000 Mbps)</pre>

&nbsp;

**WS-C3560G-24TS** 

<pre style="padding-left: 30px;">Gi 0/1 - 4      ASIC 1</pre>

<pre style="padding-left: 30px;">Gi 0/5 - 8      ASIC 0</pre>

<pre style="padding-left: 30px;">Gi 0/9 - 12     ASIC 3</pre>

<pre style="padding-left: 30px;">Gi 0/13 - 16     ASIC 2</pre>

<pre style="padding-left: 30px;">Gi 0/17 - 20     ASIC 6</pre>

<pre style="padding-left: 30px;">Gi 0/21 - 24     ASIC 5</pre>

<pre style="padding-left: 30px;">Gi 0/25 - 28     ASIC 4</pre>

&nbsp;

**WS-C3750G-48TS **

<pre style="padding-left: 30px;">Gi1/0/1 - 4          ASIC 6</pre>

<pre style="padding-left: 30px;">Gi1/0/5 - 8          ASIC 5</pre>

<pre style="padding-left: 30px;">Gi1/0/9 - 12         ASIC 8</pre>

<pre style="padding-left: 30px;">Gi1/0/13 - 16        ASIC 7</pre>

<pre style="padding-left: 30px;">Gi1/0/17 - 20        ASIC 4</pre>

<pre style="padding-left: 30px;">Gi1/0/21 - 24        ASIC 3</pre>

<pre style="padding-left: 30px;">Gi1/0/25 - 28        ASIC 10</pre>

<pre style="padding-left: 30px;">Gi1/0/29 - 32        ASIC 9</pre>

<pre style="padding-left: 30px;">Gi1/0/33 - 36        ASIC 2</pre>

<pre style="padding-left: 30px;">Gi1/0/37 - 40        ASIC 1</pre>

<pre style="padding-left: 30px;">Gi1/0/41 - 44        ASIC 12</pre>

<pre style="padding-left: 30px;">Gi1/0/45 - 48        ASIC 11</pre>

<pre style="padding-left: 30px;">Gi1/0/49 - 52 (SFP portovi)        ASIC 0</pre>

&nbsp;

**WS-C3850-12S-S  (**ovdje je bilo malo teže povezati ASIC -> port**)**

<p style="padding-left: 30px;">
  <b>    </b>(10Gbps portovi)         ASIC
</p>

<pre class="" style="padding-left: 30px;">Te1/0/1  -  12                1</pre>

&nbsp;

### **Rezimirajmo** 

**Što se događa na kojem sloju i kojom brzinom &#8211; za switcheve koji koriste ASIC**

  * Layer 2 Switch : sve se odrađuje na osnovi MAC adresa. Svi Layer 2 protokoli koji su podržani u ASIC-u odrađuju se  brzinom hardvera (tkzv. “Wire Speed”) &#8211; dakle 1000 puta brže nego na “običnim” switchevima
  * Layer 3 Switch : sve operacije preklapanja tj, ovdje govorimo o routing-u (usmjeravanju) se odrađuju na osnovi IP adresa., sve se odrađuje brzinom hardvera , kao i svi mrežni protokoli koji su podržani od strane ASIC-a. 
      * Layer 4 : Dodaje se mogućnost rada na Transportnom sloju (TCP/UDP portovi) &#8211; možemo reći da je ovaj sloj “Application aware” &#8211; svjestan aplikacija.

&nbsp;

&nbsp;

&nbsp;

# **Stvarna mjerenja**

Zbog potrebe da se uvede red u stvarne pokazatelje odnosno stvarnu propusnost switcheva, postoji nekoliko pokazatelja na koje treba obratiti pažnju.

&nbsp;

## **Ali prvo, što je što (Gbps i Mpps)**

Oznaka **Gbps**  (Gigabita u sekundi) označava ukupnu propusnost Switcha koju dijele SVI portovi. Ovo je tkzv “Fabric” ili “Bus” brzina. Minimalna brzina koju uređaj mora imati je jednaka zbroju brzina svih interface-a uređaja.

Dakle ako imamo switch sa 24 x 1Gbps, pošto uređaj na gigabitnoj brzini mora moći raditi u “Full Duplex” načinu rada to znači da 24 x 1Gbps mora moći podnijeti 24 x 2Gbps = 48Gbps. To znači da uređaj mora moći obrađivati pakete propusnošću od 48Gbps.

**Napomena : mnogi proizvođači samo pozbrajaju i pomnože sve navedeno bez stvarnih mjerenja &#8211; da bi rezultati bili bolji.**

Pogledajmo usporednu tablicu nekoliko modela i proizvođača switcheva, za 24 x 1Gbps switcheve, kako za Layer2 , tako i za Layer2/3/4 switcheve (donja granica bi morala biti 48Gbps):

<img class="alignnone size-full wp-image-2100" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/SW-tablica-1.jpg?resize=703%2C528&#038;ssl=1" alt="SW-tablica-1" width="703" height="528" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/SW-tablica-1.jpg?w=703&ssl=1 703w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/SW-tablica-1.jpg?resize=150%2C113&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/SW-tablica-1.jpg?resize=300%2C225&ssl=1 300w" sizes="(max-width: 703px) 100vw, 703px" data-recalc-dims="1" />

Oznaka Mpps = (Milijuna paketa u sekundi) označava broj paketa koji se mogu obraditi u jednoj sekundi a ovise o veličini paketa. Većina **ozbiljnih** proizvođača navodi najmanjepakete (64 byte-a), koji su i najzahtjevniji za obradu.

&nbsp;

Događa se i to da proizvođač u raznim dokumentima za isti model switcha navodi totalno različite podatke, pa je najbolje provjeriti isti podatak u barem dva do tri službena dokumenta i/ili dodatno kontaktirati proizvođaća (ovo nažalost nije rijetka pojava)

&nbsp;

**Oni manje “ozbiljni” navode puno veće pakete da bi im rezultati izgledali drastično bolji.**

&nbsp;

Dakle kada gledamo rezultate mjerenja, trebamo tražiti broj **Mpps** za 64 byte-ne pakete **!**.

&nbsp;

&nbsp;

### **Što još gledati ?**

Za brzinu 1 Gbps uz 64 byte pakete znači da je potrebno 1.488 Mpps (1.488 Milijuna paketa u sekundi).

&nbsp;

&nbsp;

<p style="padding-left: 30px;">
  <strong>Za 1Gbps brzinu, kako smo došli do 1.488 Mpps ?</strong>
</p>

<p style="padding-left: 30px;">
  1Gbps = 1,000,000,000 bps
</p>

<p style="padding-left: 60px;">
  8 bitova = 1 Byte, a mi moramo sve pretvoriti u Bps = 1,000,000,000 / 8 = 125,000,000 Bps
</p>

<p style="padding-left: 90px;">
  Zanimaju nas 64 byte-ni paketi
</p>

<p style="padding-left: 90px;">
  Za  Ethernet  :
</p>

<p style="padding-left: 120px;">
  8 byte je &#8220;Frame Header&#8221;
</p>

<p style="padding-left: 120px;">
  12 byte je standardni minimalni razmak između mrežnih paketa tj. okvira (Engl. Interframe Gap)
</p>

<p style="padding-left: 120px;">
  Dakle za najmanji paket od <strong>64 byte</strong>-a, uz njega ide i <strong>8 byte</strong> &#8220;Frame Header&#8221; te slijedi <strong>12 byte</strong> razmak koji mora ići između svakog paketa na mreži (za 1Gbps &#8211; prema osnovnom standardu je to 12 byte-a)
</p>

<p style="padding-left: 60px;">
  <strong>I sada dobivamo :  125,000,000 Bps / (64+8+12) = 1,488,095 pps </strong>(paketa u sekundi )<strong> = 1.488 Mpps </strong>(Milijuna paketa u sekundi)
</p>

&nbsp;

&nbsp;

Prema tome : 24 portni Gigabitni switch mora imati minimalnu propusnost :

24 x 1Gbps (1.488 Mpps) (duplex) = **36Mpps**

Pogledajmo sada karakteristike nekoliko switcheva i modela raznih proizvođača, dostupnih kod nas , koje sam uzeo u razmatranje.

Napomene : ovdje je donja granica <strong style="color: #ff0000;">&#8220;ozbiljnosti&#8221; </strong><span style="color: #000000;">odnosno</span> <strong style="color: #ff0000;">&#8220;upotrebe&#8221; </strong><span style="color: #000000;">koja se očekuje od 24 x 1Gbps switcha <span style="color: #ff0000;"><strong>minimalno</strong></span></span> **<span style="color: #ff0000;">36Mpps</span>** .

&nbsp;

S<span style="color: #000000;">ve preko toga je nepotrebno osim:</span>

  *  <span style="color: #000000;">ako uređaj ima dodatnih SFP ili sličnih portova: svaki dodatni 1Gbps SFP  dodaje potrebu za povećanjem propusnosti od  1.488 Mpps  ili</span>
  * <span style="color: #000000;">ako se koristi i kao platforma za jače modele switcheva ,koji recimo ima dvostruko veći broj portova ili dodatne SFP ili SFP+ portove.</span>

<img class="alignnone size-full wp-image-2270" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Propusnost-Switcheva.jpg?resize=694%2C548&#038;ssl=1" alt="propusnost-switcheva" width="694" height="548" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Propusnost-Switcheva.jpg?w=694&ssl=1 694w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Propusnost-Switcheva.jpg?resize=150%2C118&ssl=1 150w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Propusnost-Switcheva.jpg?resize=300%2C237&ssl=1 300w" sizes="(max-width: 694px) 100vw, 694px" data-recalc-dims="1" />

Što to znači za switcheve iz ove kategorije koji nisu u stanju isporučiti minimalno  **36Mpps** ?.

Switch koji je primjerice u mogućnosti isporučiti samo do 10Mpps, punom brzinom može &#8220;opskrbiti&#8221; maksimalno  do 7 x 1Gbps. Dakle ako imamo do maksimalno sedam (7) mrežnih uređaja (računala/poslužitelja i sl.) spojenih na switch sve će raditi dovoljno brzo, ali već spajanjem osmog (8) uređaja dolazi do usporavanja. Naime platili smo switch sa 24 x 1Gbps a dobili smo sedam (7) portni switch s dodatnih 17 portova. Ovo nekada nije loše &#8211; ako je on cijenom vrlo prihvatljiv kao Router i Switch, na kojemu neće ukupno biti puno mrežnog prometa (u ovom slučaju ne više od ukupno 10Mpps) ali u većini primjena je to pristup/uređaj koji treba izbjegavati, što zbog buduće potrebe porasta brzine ili broja spojenih novih (dodatnih) uređaja.

&nbsp;

I na kraju pogledajmo i cijene svih navedenih uređaja:

<img class="alignnone size-full wp-image-2102" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/SW-tablica-3.jpg?resize=702%2C542&#038;ssl=1" alt="SW-tablica-3" width="702" height="542" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/SW-tablica-3.jpg?w=702&ssl=1 702w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/SW-tablica-3.jpg?resize=150%2C116&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/SW-tablica-3.jpg?resize=300%2C232&ssl=1 300w" sizes="(max-width: 702px) 100vw, 702px" data-recalc-dims="1" />

Svi odabrani uređaji su odabrani na osnovi dostupnosti (u našim trgovinama) i stanja koje sam često zatekao u upotrebi. Točan odabir proizvođača i modela ne želim komentirati u ovom članku. Konačna preporuka i odabir bi bili ovisni o svim parametrima koje sam do sada naveo te o praktičnom iskustvu za točno određenog proizvođača, za točno određenu seriju i model (po nekada i za točno određenu verziju firmware-a).

&nbsp;

Ovo možda zvuči smiješno ali doživio sam slučajeve u kojima određene novije verzije firmware-a ispravljaju stare greške i otvaraju nove koje nikako da se zatvore. Bilo je i slučajeva gdje proizvođači navode listu grešaka za koje znaju ali ih godinama (ili nikad) ne isprave.  Do te je dokumentacije malo teže doći jer se baš ne reklamira. Bilo je i slučajeva u kojima ne radi određena kombinacija protokola ili postavki koja bi po svakoj logici morala raditi a i radi inače (ali baš na određenom modelu ne radi &#8211; što shvatite nakon pola dana surfanja i pretraživanja interneta). Postojali su i slučajevi u kojima sam proizvođač nudi kao rješenje da se u slučaju upotrebe protokola A,B i C zajedno u određenoj konfiguraciji ne koriste određeni portovi na switchu…

&nbsp;

&nbsp;

# **Na granici 1Gbps i više (10/40/100Gbps)** 

Prednost ali i mana ASIC (Application-specific integrated circuits) je u njihovom dizajnu. Implementira se hardverska podrška (zapravo hardverska akceleracija) za svaki pojedini mrežni protokol ili funkcionalnost.

Ovo osnovno obilježje ASIC-a daje mu iznimnu brzinu, koja je nedostižna klasičnim procesorima (CPU) ali je i mana jer dodavanje novog mrežnog protokola ili nove funkcionalnosti znači potrebu da se projektira i proizvede posve novi ASIC chip. Ovo u praksi znaci potrebu za kupnjom novog uređaja.

Nove generacije ASIC-a su programabilne verzije ASIC chipova koje rješavaju ovaj problem. Odnosno oni su neovisni o mrežnom protokolu ili funkcionalnosti ali zadržavaju ekstremne brzine obrade mrežnih paketa. Pojam &#8220;Programabilni ASIC &#8221; često možemo vidjeti pod nazivom &#8220;Software Defined Networking&#8221; (SDN) &#8211; ako govorimo o ASIC chipovima.

S obzirom na to da je važnost ASIC-a jasna, mnogi veliki proizvođači poput tvrtki “Cisco” i “Juniper” ulagali su i ulažu u razvoj svojih ASIC rješenja. U toku 2009 godine tvrtka “Juniper” obavila je da će u periodu od tri godine uložiti nekoliko stotina milijuna dolara u razvoj ASIC chipova nove generacije a slično je i s tvrtkom “Cisco”.

Juniper je nakon toga 2013 godine izbacio na tržište prvi switch s njihovim novim programabilnim ASIC-om. Radi se o modelu EX9200 (nazivi su im  “I-Chip” i “Trio chipset”). Cisco je početkom iste godine također krenuo s upotrebom svog ASIC riješenja pod  nazivom UADP  “Unified Access Data Plane” koji je prvo ugrađen u Cisco Catalyst 3850 seriju 10Gbps switcheva.

Cisco 3850 koristi UADP ASIC koji podržava do 24 x 10Gbps portova. Dakle modeli sa do 24 porta imaju jedan UADP ASIC dok modeli sa 48 portova imaju 2 UADP ASIC-a.

Kasnije je izašla nova serija 3650 (10/100/1000 Mbps) koja također koristi UADP ASIC.

Zbog vrlo skupog razvoja svojih rješenja i “Cisco” i “Juniper” u određenim (“slabijim”) modelima uređaja koriste ASIC chipove specijaliziranih proizvođača ASIC-a poput tvrtki “Broadcom” ,  “Marwell” i “Fulcrum microsystems&#8221; (2011 ih je kupio Intel) a koje nude svoja ASIC rješenja i drugim proizvođačima mrežne opreme  (poput tvrtki Brocade, HP , DELL i drugih).

Na zahtjevnijim platformama oba proizvođača (Cisco i Juniper) uz upotrebu “univerzalnih” ASIC-a poput gore navedenih, koriste i svoja rješenja ili ih kombiniraju sa svojima da bi dobili sve potrebne funkcionalnosti i brzinu u odnosu na konačnu cijenu proizvoda. Proizvođači poput tvrtki “Cisco” i “Juniper” na svojim najzahtjevnijim platformama najčešće koriste svoja rješenja koja prema njima nude najveće performanse (u ovoj kategoriji se baš i ne pita previše za cijenu ).

&nbsp;

&nbsp;

S obzirom na činjenicu da tvrtka “Broadcom” drži 65% tržišta ASIC-a, pogledajmo i što oni nude.

Pogledajmo proizvode koji pokrivaju gornji segment tržišta (10Gbps  i 40Gbps).

&nbsp;

Trenutno su najviše u upotrebi:

  * **Trident \[BCM56840\] (**pojavio se u 2010.g.**)** 

<p style="padding-left: 30px;">
  Podržava do 48 x 10Gbps na jedom ASIC chipu
</p>

  * Koriste ga : 
      * Juniper (QFX3500)
      * Cisco (Nexus 3064)
      * Dell Networks (bivši Force 10) &#8211; S4810
      * HP (5900 AF 48XG)
      * IBM (BNT RackSwitch G8264)
      * &#8230; i još nekoliko manjih proizvođača

  * **Trident+ [BCM56840 (+)]**

<p style="padding-left: 30px;">
  Podržava do 64 x 10Gbps na jednom ASIC chipu,
</p>

<p style="padding-left: 30px;">
  Koriste ga:
</p>

  * Cisco (Nexus serija switcheva)
  * Juniper (QFX3500 serija switcheva)
  * Dell (kupnjom tvrtke “Force 10” u toku 2011. godine )

  * **Trident II XGS \[BCM56850\] (**2012.g.**)**  (za 10Gbps i 40 Gbps) &#8211; Novija verzija ASIC-a koja podržava 32 x 40G porta ili 104 x 10G sve na jednom ASIC chipu. Switching propusnost ovog ASIC-a je 1280 Gbps. Koriste ga : 
      * Cisco (Nexus 9000)
      * Dell Networking S6000
      * i nekoliko manjih proizvođaća

  * **Tomahawk (**2014.g**)** 
      * Ima switching propusnost od 3200 Gbps (3.2Tbps)
      * Jedan chip podržava do 128 x 25Gbps portova
      * Ovo je prvi programabilni ASIC tvrtke Broadcom (ovu tehnologiju Broadcom zove &#8220;**_BroadView_**&#8220;).

&nbsp;

  * **Tomahawk II (2016.g.)** &#8211; Najnoviji član obitelji 
      * Ima propusnost od 6400 Gbps (6.4 Tbps) i to  Multilayer L2/L3/MPLS
      * Jedan chip podržava 64 x 100Gbps  portova ili 128 x 40Gbps/50Gbps
      * Hardverski podržava mnoge protokole za tuneliranje
      * Podržava OpenFlow
      * Podrđava do 256 x 25Gbps SERDES (Serijalizaciju/Deserijalizaciju podataka)
      * &#8230;

&nbsp;

Definitivno možemo reći da se sve više ide prema modelu u kojemu jedan ASIC i Switching chip podržavaju dovoljan broj portova za cijeli switch. Ovim dizajnom se rješava problem sporosti sabirnice između više ASIC chipova, koja postaje sve veći problem na sve većim brzinama (10G/40G/100G).

Prema ovom modelu referentni dizajn bi izgledao ovako (slika).

<img class="alignnone size-full wp-image-2103" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Switch-ASIC-10Gplus.jpg?resize=698%2C385&#038;ssl=1" alt="Switch-ASIC-10Gplus" width="698" height="385" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Switch-ASIC-10Gplus.jpg?w=698&ssl=1 698w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Switch-ASIC-10Gplus.jpg?resize=150%2C83&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/Switch-ASIC-10Gplus.jpg?resize=300%2C165&ssl=1 300w" sizes="(max-width: 698px) 100vw, 698px" data-recalc-dims="1" />

&nbsp;

&nbsp;

&nbsp;

# **Što je tu “Open Source” ?**

Kao što smo spomenuli i svaki router i switch se sastoje od gotovo istih komponenti kao i računala.

Najveća razlika je u Switching chipu i ASIC-u. Nakon što je Broadcom ponudio ASIC (+ Switching chip) generacije Trident II, stvari su se drastično promijenile. Upravljački programi za ovaj ASIC &#8211; i za Linux postali su dostupni. Bilo je samo pitanje vremena kada će se netko sjetiti napraviti svoj switch (praktično računalo) sa spojenim ovim ASIC-om i dobili ste nevjerojatno snažnu platformu. Ostaje napraviti svoju distribuciju linuxa i optimizirati postojeće mrežne servise da znaju iskoristiti snagu ovog novog hardvera.

&nbsp;

Došli smo do &#8220;OpenSource Switch&#8221;-a koji se, barem u teoriji, može natjecati sa proizvođačima poput “Cisco” i “Juniper” (i ostalih) &#8211; zanimljivo.

Sredinom 2014 se pojavila tvrtka &#8220;Pica8&#8221; koja je napravila upravo to &#8211; uzeli su bootloader od  “Open Network Install Environment” (koji razvija tvrtka Cumulus Networks) a koji je dio “Open Compute Project” te dodali i druge komponente Linuxa, kao i potrebne mrežne servise i nastala je njihova distribucija Linuxa koja se zove PicOS.

Vrlo brzo nakon toga uslijedila je dobra podrška i za &#8220;Trident&#8221;, &#8220;Trident+&#8221; i za najnoviji &#8220;Tomahawk&#8221;.

⇒ Ali na koji hardver (ipak neće svatko kod kuće sastavljati svoj 10Gbps switch).

&nbsp;

Bez brige oni nude i upravo ovakve “prazne”switcheve :

<http://www.pica8.com/products/pre-loaded-switches>

&nbsp;

Ubrzo su se pojavili i drugi &#8211; čije distribucije Linuxa se isto mogu instalirati na ove switcheve :

  * Cumulus Networks (Open Network Install Environment ),
  * Vyatta (kupila ih je tvrtka “Brocade”),
  * On.Lab ONOS.

A nakon toga pojavili su se i ostali proizvođači mrežne opreme koji nude svoj hardver za switcheve na koji možete sami instalirati svoj OS.

Od tog trenutka se otvorilo novo područje u kojemu će vjerojatno sve veći broj proizvođača nuditi svoj i nadam se OpenSource softver za switcheve. Poslovni model davanja svega u Open Source, nije stran mnogima. U tom svijetu se živi od podrške &#8211; primjerice tvrtka “RedHat” godišnje od podrške zarađuje preko dvije milijarde dolara.

Pogledajte trenutnu listu kompatibilnog hardvera za PicOS :

<http://www.pica8.com/products/hardware-compatibility-list>

&nbsp;

Jedino što je ostalo upitno je &#8220;masivno&#8221; testiranje, ali s obzirom na tendenciju da sve završi u potpunosti kao open source projekt koji će s vremenom sigurno prihvaćati sve veća zajednica ljudi (a siguran sam i raznih tvrtki) kvaliteta će se vrlo lako moći uzdići iznad bilo kojeg &#8220;close source&#8221; rješenja.

&nbsp;

&nbsp;

Još jedna je vrlo važna zajednička stvar kod svih ovih rješenja a to je podrška za &#8220;[OpenFlow][3]&#8221; protokol. On je dostupan za sve važnije operacijske sustave a dolazi uz &#8220;[Open vSwitch][4]&#8221;  koji je i integriran (instaliran) u sva gore navedena rješenja.

&nbsp;

&#8220;[OpenFlow][3]&#8221; je vrlo važan protokol za široku upotrebu i primjenu SDN rješenja (kako open source tako i proprietary rješenja). Njega su do danas prihvatili svi važniji proizvođači mrežne opreme, poput:

  * Alcatel-Lucent
  * Big Switch Networks
  * Brocade Communications
  * Radisys
  * Arista Networks
  * Pica8
  * NoviFlow
  * Huawei
  * Cisco
  * Dell (Force10)
  * Extreme Networks
  * IBM
  * Juniper Networks
  * Digisol
  * Larch Networks
  * Hewlett-Packard
  * NEC
  * MikroTik
  
    &#8230;

&nbsp;

&nbsp;

&nbsp;

O [SDN-u][5] ćemo pričati u sljedećem postu/članku.

&nbsp;

 [1]: https://www.opensource-osijek.org/wordpress/2015/06/01/codecamp-osnove-mreza-kako-odabrati-pravi-mrezni-uredaj-i-u-cemu-su-razlike/
 [2]: https://www.opensource-osijek.org/dokuwiki/wiki:knjige:uvod_u_linux#maticna_ploca_cpu_chipset_i_sabirnica_e
 [3]: https://www.opennetworking.org/sdn-resources/openflow
 [4]: http://openvswitch.org/
 [5]: https://en.wikipedia.org/wiki/Software-defined_networking