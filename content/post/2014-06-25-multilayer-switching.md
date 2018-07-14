---
title: Multilayer Switching
authors: hhorvat
type: post
date: 2014-06-25T16:10:36+00:00
url: /2014/06/25/multilayer-switching/
featured_image: /wp-content/uploads/2014/06/Multilayer-Switch-hierarchy-basic.png
categories:
  - Cisco
  - Članci
tags:
  - cisco
  - Multilayer Switching
  - Osnovni mrežni pojmovi

---
&nbsp;

[toc]

&nbsp;

&nbsp;

Upoznajmo se sa osnovama Multilayer switching-a. Ali da bi razumjeli što je Mulilayer Switching,trebali bi znati što je switching odnosno kako rade switchevi (preklopnici).Vratimo se još jedan korak nazad i podsjetimo se osnova računalnih mreža.

&nbsp;

# **OSI model i TCP/IP model**

OSI model (Open Systems Interconnection model) je konceptualni slojeviti model mrežne komunikacije, koji opisuje funkcije i međusobnu komunikaciju između njegovih slojeva. Održava se od strane ISO organizacije (International Organization for Standardization), pod oznakom : ISO/IEC 7498-1. Na osnovi OSI modela, razvijen je TCP/IP model.

TCP/IP je skup protokola nužan za komunikaciju računala. Današnji internet je baziran na TCP/IP setu protokola. On se sastoji od nekoliko dijelova: TCP/UDP i IP.

<a href="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/OSI-TCP-IP.jpg?ssl=1" data-rel="lightbox-0" title=""><img class="alignnone size-medium wp-image-1588" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/OSI-TCP-IP.jpg?resize=300%2C197&#038;ssl=1" alt="OSI-TCP-IP" width="300" height="197" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/OSI-TCP-IP.jpg?resize=300%2C197&ssl=1 300w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/OSI-TCP-IP.jpg?resize=150%2C98&ssl=1 150w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/OSI-TCP-IP.jpg?w=438&ssl=1 438w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" /></a>

&nbsp;

Na slici je vidljiva usporedba OSI i TCP/IP modela te može poslužiti kao primjer komunikacije TCP/IP protokola.Prema slici će se najbolje shvatiti što se događa kod komunikacije dva računala TCP/IP-om:

&nbsp;

Naime kod komunikacije između dva računala (Source  Destination), dolazi do slijedećeg (u TCP/IP-u):

  * **Aplikacija** (pr. Web browser se spaja na Web Server ) formira podatke koje želi slati na drugo računalo (Layer 4, tj po OSI-ju 7,6 i 5 ). i prosljeđuje ju nižem sloju (Layeru)

  * **Transportni sloj** (TCP) preuzima podatke od gornjeg sloja i dodaje svoj dio

(u ovom slučaju Source i destination portove, CRC check, &#8230; ) i prosljeđuje ju nižem sloju

  * **Internet sloj** (IP) preuzima podatke od gornjeg sloja i dodaje svoj dio (source i

destination IP adrese,..) i prosljeđuje ju nižem sloju

  * **Network Access** sloj preuzima podatke od gornjeg sloja i dodaje svoj dio (MAC adrese, &#8230;) te šalje podatke samoj mrežnoj kartici, koja ih pretvara u električne (ili optičke) signale i šalje ih na medij.

Važno je znati da mrežnim medijem prolaze paketi podataka, dogovorene maksimalne veličine. Ako je na početku procesa enkapsulacije (ugnježđivanja) podataka utvrđeno da treba poslati više podataka nego što je maksimalna veličina paketa (~1500 b = 1.5kB), dolazi do kreiranja više paketa,od kojih svaki sadrži serijski broj, da bi se ispravno posložili na drugoj strani te sastavili u izvorni oblik.

&nbsp;

S druge strane (na drugom računalu, proces je obrnut):

Mrežna kartica prima električne impulse, pretvara ih u slijed digitalnih podataka (0 i 1) , koje preuzima prvi sloj, obrađuje ih, prosljeđuje drugom sloju,&#8230; i tako do aplikacijskog sloja  koji to sve slaže u prvobitni oblik podataka, koji je poslan s prvog računala (Source).

&nbsp;

# **Enkapsulacija**

Slika prikazuje enkapsulaciju (ugnježđivanje) prema TCP/IP, sa Source računala. Ovdje će vam biti malo jasniji tok podataka i veza između TCP/IP slojeva.

<a href="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/TCP-IP-Encapsulation.png?ssl=1" data-rel="lightbox-1" title=""><img class="alignnone size-medium wp-image-1589" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/TCP-IP-Encapsulation-300x225.png?resize=300%2C225&#038;ssl=1" alt="TCP-IP Encapsulation" width="300" height="225" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/TCP-IP-Encapsulation.png?resize=300%2C225&ssl=1 300w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/TCP-IP-Encapsulation.png?resize=150%2C112&ssl=1 150w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/TCP-IP-Encapsulation.png?w=960&ssl=1 960w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" /></a>

**Aplikacijski sloj** uzima podatke (iz same aplikacije) te ih razdvaja na manje dijelove. Svakom tom bloku podataka [DATA]  se dodaje zaglavlje [Transport Header] &#8211; u **transportnom sloju** (3) &#8211; ovdje se dodaju i Source i Destination portovi.

> Source port se nasumično odabire (1024+  Random) a Destination port označava protokol za komunikaciju (pogledajte tablicu dolje).

**Internet sloj** dodaje svoj dio, koji sadrži i Source IP adresu (pošiljatelja) i destination IP adresu (primatelja) te se dalje sve prosljeđuje **Network Access** sloju koji dodaje i Source i Destination MAC adrese. Prema OSI modelu ovo je Layer 2 (u grubo on barata s MAC adresama &#8211; što nas i zanima)

Nadalje se sve pretvara u signale za slanje na mrežni medij (“bakar” ili “optika” tj. električne signale ili svjetlosne impulse). Ovaj proces se na računalu koje prima podatke, odvija u suprotnom smjeru.

&nbsp;

# **TCP/UDP Portovi**

TCP/IP protokol dopušta maksimalno 65535  portova [2<sup>16</sup>] (16 bitni broj). Za svaki TCP/IP protokol je definiran i port preko kojega se koristi. Pomoću portova, svako računalo može (u svakom trenutku) paralelno komunicirati sa više protokola, jer svaki od njih koristi drugačiji port. Neki od osnovnih su nabrojani u tablici.

<a href="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Portovi.jpg?ssl=1" data-rel="lightbox-2" title=""><img class="alignnone size-medium wp-image-1590" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Portovi.jpg?resize=300%2C176&#038;ssl=1" alt="Portovi" width="300" height="176" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Portovi.jpg?resize=300%2C176&ssl=1 300w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Portovi.jpg?resize=150%2C88&ssl=1 150w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Portovi.jpg?w=709&ssl=1 709w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" /></a>

&#8230;

Osim portova bitno je i kojim transportnim protokolom se koristi niži protokol:

  * **TCP** je tkzv. connection-oriented &#8211; što znači da se kod komunikacije dva računala, otvara konekcija (Three-way handshake) i TCP protokol se brine da je svaki segment podataka koji je poslan sa računala A na računalo B primljen u ispravnom obliku (u prijenosu podataka kroz medij može doći do gubitka djela podataka). Za svaki paket koji je s druge strane zaprimljen neispravan (o tome se brine  CRC checksum), zatraži se retransmisija i paket se šalje ponovno, sve dok nije potpuno ispravan.

  * **UDP** protokol se ne brine o tome da li je svaki paket podataka ispravno zaprimljen na drugoj strani ali je njegova prednost puno veća brzina (jer nema dodatne kontrole niti retransmisija).

# **Dodatni pojmovi **

  * **MAC adresa** (Media Access Control) je jedinstvena adresa, ugrađena u svaku mrežnu karticu, od strane proizvođača odnosno u svaki port na switchu (ili bilo kojem mrežnom uređaju). MAC adresa je 48 bitna, označava se sa 12 heksadecimalnih brojeva, grupiranih po 2 i obično odvojenih sa : ili -. Prvih 6. hexa brojeva označava proizvođaća a ostalih 6 su redni brojevi. Dakle ne osnovu MAC adrese možemo raspoznati proizvođaća same kartice (Intel, 3Com,Broadcom,&#8230;)     Pr. Izgled MAC adrese: 00-30-00-3A-FD-6C

<a href="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/MAC-adresa-primjer.jpg?ssl=1" data-rel="lightbox-3" title=""><img class="alignnone size-medium wp-image-1591" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/MAC-adresa-primjer.jpg?resize=300%2C84&#038;ssl=1" alt="MAC-adresa-primjer" width="300" height="84" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/MAC-adresa-primjer.jpg?resize=300%2C84&ssl=1 300w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/MAC-adresa-primjer.jpg?resize=150%2C42&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/MAC-adresa-primjer.jpg?w=701&ssl=1 701w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" /></a>

&nbsp;

  * **IP adresa** je jedinstvena adresa, te ju ne može imati niti jedno drugo računalo na mreži. IP adresa (Ipv4) je 32bitni binarni broj razlomljen u seriju dekadskih brojeva odvojenih točkom (.). Prvo se cijeli binarni broj razdjeli u 4 grupe od 8 binarnih brojeva, tada se svaka grupa od 8 bitova pretvara u decimalni broj. IPv4 može adresirati 4&#215;8 bitova= 32b (bita) = 2<sup>32</sup> IP adresa. Osim IPv4 postoji i IPv6. IPv6 se sastoji od 8 heksteta tj (8 x 4 bajta) tj 8 puta po 4 heksadecimalna broja odvojena točkom (.)  Dakle IPv6 može adresirati: 8 x 16 bitova = 128b (bita)=2<sup>128</sup> IP adresa.

&nbsp;

  * **ARP (**Adress Resolution Protocol). Pošto u TCP/IP mrežama svaki paket mora sadržavati Source i Destination IP i MAC adrese, potrebna je i upotreba ARP protokola.  On je zadužen za pronalaženje MAC adrese od određene IP adrese (pridjeljuje MAC adresu IP adresi). Kada računalo A želi pristupiti računalu B (kojemu još nije pristupalo), ono provjeri da li zna njegovu MAC adresu (pošto mu je poznata IP adresa).  Postoje 2 načina kako računalo može napraviti svoju bazu/tablicu MAC <&#8212;-> IP adrese: 
      * 1. Svako računalo prati mrežne pakete i zapisuje MAC-IP parove u svoju privremenu bazu, koja se briše svakih nekoliko minuta (bazu nazivamo ARP tablica, na PC računalu ju možemo vidjeti sa naredbom: **arp -a**
      * 2. Računalo koje nije dobilo IP-MAC podatak ide u Broadcast: ARP request, sva računala na njegovom segmentu mreže primaju taj broadcast (switchevi propuštaju broadcast zahtjeve a routeri NE). Tada računalo koje ima traženu IP adresu vraća pošiljaocu ARP requesta, ARP response sa ispravnom MAC adresom, koju računalo A sprema u svoju tablicu i drži ju neko vrijeme.Tek tada računalo A može kreirati klasičan TCP/IP paket i ostvariti konekciju na računalo B.

&nbsp;

**Ovo je dovoljno za razumjevanje priče koja slijedi.**

&nbsp;

# **Layer 2 switching &#8211; klasična upotreba switcheva (preklopnika).**

U današnjim mrežam za međusobno umrežavanja/spajanje računala, poslužitelja i ostale mrežne opreme koriste se switchevi koji standardno rade na Layer 2 (dakle barataju sa MAC adresama).

Spajanjem bilo kojeg računala ili uređaja na neki port na switchu, sam switch prvo mora saznati njegovu MAC adresu te ju spremini u svoju internu tablicu koja sadrži par :

&nbsp;

_Source MAC adresa &#8211; port (interface) na switchu_

&nbsp;

To je i sva logika koja je potrebna za uspješno preklapanje, Naime kada spojimo računala **A** i **B** na switch,  i to primjerice:

_Računalo A (MAC 00:01:02:A1:11:11) &#8211; port (interface) 1_

_Računalo B (MAC 00:01:02:B2:22:22) &#8211; port (interface) 2_

&nbsp;

Switch si nakon nekoliko trenutaka izgradi gore navedenu tablicu koju primjenjuje na svaki paket koji mu dođe.

&nbsp;

**Prisjetimo se TCP/IP komunikacije** :

Svaki paket mora imati (uz ostale podatke) : Source i Destination MAC adrese i Source i Destination IP adrese. Pošto je ovo Layer 2 switch on gleda svaki paket i to samo dio sa Source MAC adresom i destination MAC adresom

(Layer 2 po OSI tj Layer 1 po TCP/IP modelu ):

&nbsp;

Dakle računalo A šalje paket na računalo B :

&nbsp;

**Pojednostavljeno to radi ovako**:

  1. Switch pogleda Source MAC (to je MAC od Računala A) i vidi da ga već ima u tablici (ako nema zapamti ga sada, na portu na koji je spojen) te pogleda i destination MAC adresu (to je MAC od Računala B)</p> 
  2. Switch provjerava svoju tablicu i gleda da li ima MAC adresu od računala B, ako ima gleda na kojem je portu (interface-u) i paket šalje na taj port (interface)

Ako nema MAC adresu od računala B, pokuša ju saznati slanjem ARP poruke te ju zapamti i izgradi si tablicu.

&nbsp;

Ova MAC tablica na switch-u se zove i CAM tablica (Content addressable memory) tablica.

  1. Sada kada switch ima u CAM tablici i Source i Destination MAC adrese od ovog (i svakog) paketa od Računala A on paket (jedan po jedan) prebaci/preklopi na interface na kojem se nalazi spojeno računalo B. Ovo se ponavlja za svaki paket i za sve komunikacije.

&nbsp;

# **Koji su nedostaci i na što treba paziti kod dizajna LAN mreža upotrebom Layer 2 switcheva.**

&nbsp;

**Nasljeđe prošlosti** : CSMA/CD (Carrier Sense Multiple Access With Collision Detection). Prije vremena switcheva, koristili su se uređaji zvani HUB-ovi.

Računala i druga mrežna oprema se na njih spajala na isti način kao na switcheve (prema topologiji : zvijezda [star]) &#8211; sva računala i oprema, svaki na svoj port na HUB-u. Na HUB-ovima se dijelila zajednička veza jer je on praktično bio samo pojačalo električnog signala. Veza je prema tome bila Half Duplex (samo primanje ili slanje na mrežu u jednom trenutku). Dakle u praksi se stalno dešavalo da su dva ili više računala u jednom djeliću vremena krenula u slanje podataka. Tu je uskakao CSMA/CD koji je tada detektirao ovaj slučaj koji se zove kolizija dakle “Collision Detection”  mehanizam, koji radi tako da tada svaki od pošiljatelja mora sačekati određeni nasumični broj nekoliko milisekundi te probati slati podatke ponovno i tako iz početka.

Upotrebom switcheva više nema kolizije ako se koristi Full Duplex mod rada portova (interface-a).Važno je znati da je i dalje ostao Half Duplex mod konfiguracija svakog porta na koji treba paziti jer se svaki port na switchu i krajnje računalo ili mrežna oprema mogu krivo “dogovoriti” te uspostaviti Half Duplex umjesto Full Duplex moda.

Full duplex je mod rada u kojemu je moguće istovremeno slanje i primanje podataka i to samo ako je tako konfigurirano na strani switcha i druge strane (računalo, drugi switch, poslužitelj , ….).

&nbsp;

## **Podsjetimo se još nekih pojmova.**

&nbsp;

### **Network IP adresa** 

Network IP adresa (adresa mreže) je adresa koja definira samu mrežu. To je prva

adresa u mrežnom segmentu ili prva adresa u subnetu (subnetiranje je posebna prića [članak]).

&nbsp;

### **BROADCAST IP adrese** 

Broadcast IP adrese ovisi o tome da li je mreža subnetirana ili nije. Univerzalna

broadcast adresa je: 255.255.255.255. inače ovisi o kojoj se mreži radi i u pravilu je to zadnja adresa unutar opsega mreže ili zadnja adresa u subnetu. Sve što se pošalje na broadcast adresu, primiti će svi unutar te mreže, a u slučaju univerzalnog broadcasta svi na svim mrežama. (Routeri po defaultu ne propuštaju broadcast poruke).

&nbsp;

<p style="padding-left: 30px;">
  <b>Problem Layer 2  switchinga je i Broadcast domena</b>.
</p>

<p style="padding-left: 30px;">
  Naime mnogi protokoli u komunikaciji koriste broadcast poruke koje nepotrebno zagušuju mrežu i sve što se nalazi na mreži. Layer 2 switchevi proslijeđuju sve Broadcast poruke.
</p>

<p style="padding-left: 30px;">
  Riješenje ovog problema je logička segmentacija mreže na više virtualnih mreža (VLAN-ova). Dakle switchevi propuštaju (forward) sav promet samo unutar svakog VLAN-a. Da bi komunikacija između VLAN-o bila moguća potreban nam je Layer 3  / 4 uređaj : Router ili Multilayer Switch.
</p>

<p style="padding-left: 30px;">
  Pod pojmom multilayer switch smatramo uređaj koji radi barem na Layer 2, 3 i 4. (prema OSI modelu).
</p>

&nbsp;

### **VLAN-ovi**

VLAN čini logičku grupu ili cjelinu raznih mrežnih komponenti (računala, mrežnih uređaja  i sl.). VLAN-ovi se obično grupiraju prema nekim logičkim podjelama mreže: pr. prema odjelu tvrtke, prema specifičnim zahtjevima korisnika, poslužitelja i sl. Switch-evi i bridge-vi propuštaju unicast, multicast i broadcast promet samo unutar VLAN-a unutar kojega se nalaze. Dakle komunikacija je moguća samo između svih mrežnih uređaja i računala unutar jednog VLAN-a.

Promet između VLAN-ova nije moguć bez Layer 3 uređaja (Routeri ili Multilayer Switchevi).

&nbsp;

### **VLAN TRUNK**

TRUNK-ovi (prema Cisco terminologiji) omogućavaju “propuštanje” više istovremenih VLAN-ova, kroz određeni interface. Naime standardno svaki interface može biti isključivo samo u jednom VLAN-u. U slučaju potrebe da kroz određeni interface (port na switchu/routeru/&#8230;) moramo ili želimo propuštati više VLAN-ova, moramo interface konfigurirati kao trunk te odabrati neki od “trunk” protokola, koji pojednostavljeno, na svaki mrežni paket lijepe VLAN-ID, tkzv “tag” ili “naljepnicu” ,  sve dok putuje kroz interface koji je u trunk mod-u.Dakle kada paket koji ima VLAN tag, dođe do “normalnog” interface-a, u točno određenom VLAN-u (čiji “tag/ID” nosi), taj tag se skida i paket dalje nastavlja put kao običan/normalan. Postoji nekoliko protokola za trunk-ing a to su:

  * Cisco ISL
  * IEEE 802.1Q

&nbsp;

Kako to radi na pojednostavljenom modelu, vidljivo je na slici.

<a href="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/TRUNK.png?ssl=1" data-rel="lightbox-4" title=""><img class="alignnone size-medium wp-image-1592" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/TRUNK.png?resize=300%2C272&#038;ssl=1" alt="TRUNK" width="300" height="272" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/TRUNK.png?resize=300%2C272&ssl=1 300w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/TRUNK.png?resize=150%2C136&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/TRUNK.png?w=629&ssl=1 629w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" /></a>

&nbsp;

&nbsp;

# **Multilayer Switching**

&nbsp;

U daljem tekstu, bazirati ćemo se na Cisco Multilayer Switchevima zbog svojih specifičnosti (od kojih neke imaju i neki drugi proizvođaći) i to na entry &#8211; medium level uređajima poput: Catalyst 3560 ili Catalyst 3750 switcheva jer je na njima najlakše objasniti cijeli koncept.

&nbsp;

## **Što se dešava na kojem sloju i kojom brzinom (za switcheve):**

**Layer 2 :** sve se odrađuje na osnovi MAC adresa, brzinom hardvera (tkzv. “Wire Speed”)

**Layer 3 :** sve operacije preklapanja tj, ovdje govorimo o routing-u (usmjeravanju) se odrađuju na osnovi IP adresa , sve se odrađuje brzinom hardvera (za razliku od Routera-a kod kojih CPU sve odrađuje)

**Layer 4 :** Dodaje se mogućnost rada na Transportnom sloju (TCP/UDP portovi) &#8211; možemo reći da je ovaj sloj “Application aware” &#8211; svjestan aplikacija.

&nbsp;

## **Prvo sumarizirajmo mogućnosti Layer 2 switchinga:**

  * Bridge-ing brzinom hardvera “Hardware based bridging” tj “Wire Speed performance”
  * Kolizijska domena je na nivou porta , odnosno upotrebom Full Duplex moda ne postoji
  * Nema mrežnog prometa između VLAN-ova
  * Broadcast domena se proteže na sve portove (interface-e) i sve međusobno spojene Layer 2 switcheve

&nbsp;

## **Bacimo pogled na klasične Routere (usmjerivače):**

  * Broadcast domena ja unutar jednog porta (interface-a)
  * Layer 3 procesiranje je od  strane CPU-a i samim time je više kašnjenje (latency) od Layer 2 switchinga :(Routeri s mrežnim paketima rade u miliskundama , switchevi i mikrosekundama [1.000 puta brže])
  * Visoka cijena prema broju portova (interface-a)

&nbsp;

## Pregled logike rada Cisco switcha

Tipičnu logičku arhitekturu Cisco Switcha možemo vidjeti na slici :

<a href="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Cisco-ASIC3.png?ssl=1" data-rel="lightbox-5" title=""><img class="alignnone size-medium wp-image-1632" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Cisco-ASIC3.png?resize=300%2C225&#038;ssl=1" alt="Cisco ASIC" width="300" height="225" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Cisco-ASIC3.png?resize=300%2C225&ssl=1 300w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Cisco-ASIC3.png?resize=150%2C112&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Cisco-ASIC3.png?w=960&ssl=1 960w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" /></a>

Slika: Primjer osnovne logičke sheme 48 portnog Multilayer switcha

&nbsp;

**O čemu se radi (ASIC)** ?

ASIC (Application Specific Integrated Circuit) je IC (“chip”) koji se ovisno o izvedbi i modelu switcha praktično nalazi na svakom portu (interface-u). On je u mogućnosti unutar granica milisekundi: primiti, obraditi i proslijediti svaki mrežni paket.

Veliko ubrzanje u radu ASIC-a, uz upotrebu vrlo brze SRAM memorije, donosi i upotreba slijedećih komponenti integriranih u sam ASIC:

  * CAM memorije (tablice) za Layer 2 funkcionalnosti
  * TCAM memorije (tablice) za Layer 3 funkcionalnosti,

&nbsp;

Zbog gore navedenih karakteristika, standardno ASIC omogućava obradu slijedećih funkcija, hardverskom brzinom :

  * Traffic forwarding (obrada i prosljeđivanje paketa)
  * QoS (Quality of Service)
  * ACL lookup  (Access Liste)
  * Route Processing (Obrada Routing funkcionalnosti)
  * STP (Spanning Tree protokol)

&nbsp;

Multi-layer switch-evi mogu odluke o switching-u/routingu odraditi na osnovi :

  * source/destination MAC adrese u Layer 2 ili
  * source/destination IP adrese u Layer 3 ili
  * source/destination porta u Layer 4.

Osim toga ne postoji razlika u brzini rada Layer 2 , Layer 3 ili Layer 4. Dakle sve se odrađuje brzinom “hardvera”.

&nbsp;

## **Pojednostavljeno Multilayer switching kombinira funkcionalnosti :**

  * Layer 2 switchinga
  * Layer 3 routing/switchinga
  * Layer 4 routing/switchinga i to uz vrlo nisku latenciju koja je oko 1.000 puta manja od Routera.

Dakle većinu operacija sa mrežnim paketima Multilayer switch odrađuje oko 1.000 puta brže od klasičnih Routera (usmjerivača).

Možemo reći da je Multilayer switch spoj “klasičnog” Layer 2 switcha i Routera koji radi na “Wire Speed”-u unutar jedne hardverske platforme.

Naime sve operacije koje on obavlja, obavlja i klasični Layer 2 Switch i standardni Router (usmjerivač) ali sve na hardverskoj brzini unutar milisekundi. Njegovom upotrebom možemo povećati performanse cijele mreže, uz pravilan dizajn iste, uz nekoliko vrlo bitnih stvari na koje treba paziti:

  * Dizajn mreže (to važi za sve mreže), morao bi topološki biti hijerarhijski i sadržavati : 
      * Core Layer mrežu
      * Distribution Layer mrežu
      * Access Layer mrežu

&#8230; i to pridržavajući se pravila dizajna svakog od navedenih hijerarhijskih slojeva.

  * Multilayer Switch, iako je praktično spoj Routera i Switcha predstavlja “single point of failure” tako da kod dizajna mreža moramo i na to paziti tj. uvesti redundanciju.

  * Uvođenjem redundancije sa Multilayer Switchevima moramo paziti da smo pravilno dizajnirali sve međuveze i njihove redundancije te iskoristili protokole koje osiguravaju brzu konvergenciju te štite mrežu od “loop-a”
  * Koristiti VLAN-ove već u samom dizajnu mreže.

&nbsp;

&nbsp;

&nbsp;

# Zaključimo priču sa jednim jednostavnim primjerom upotrebljivim u praksi.

Slika prikazuje osnovnu zamišljenu redundantnu mrežu sa multilayer switchevima:

<a href="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Multilayer-Switch-hierarchy-basic.png?ssl=1" data-rel="lightbox-6" title=""><img class="alignnone size-medium wp-image-1594" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Multilayer-Switch-hierarchy-basic.png?resize=278%2C300&#038;ssl=1" alt="Multilayer Switch-hierarchy-basic" width="278" height="300" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Multilayer-Switch-hierarchy-basic.png?resize=278%2C300&ssl=1 278w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Multilayer-Switch-hierarchy-basic.png?resize=139%2C150&ssl=1 139w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Multilayer-Switch-hierarchy-basic.png?w=595&ssl=1 595w" sizes="(max-width: 278px) 100vw, 278px" data-recalc-dims="1" /></a>

&nbsp;

Sada na u tu mrežu uvedimo slijedeće VLAN-ove.

&nbsp;

<span style="color: #808080;">VLAN10 → Ovdje će biti sva PC Računala iz nabave, računovodstva, managementa i prodaje</span>

<span style="color: #808080;">VLAN20 → Ovdje će biti razvojni poslužitelji za R&D odjel</span>

<span style="color: #808080;">VLAN21 → Ovdje će biti PC računala razvojnih timova (R&D)</span>

<span style="color: #808080;">VLAN25 → Ovdje će biti svi ostali poslužitelji</span>

<span style="color: #808080;">VLAN100 → Ovdje će biti sva oprema prema internetu</span>

&nbsp;

Logička shema mreže, poslužitelja i računala sada će izgledati ovako:

<a href="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Multilayer-Switch-hierarchy-basic-VLANs.png?ssl=1" data-rel="lightbox-7" title=""><img class="alignnone size-medium wp-image-1595" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Multilayer-Switch-hierarchy-basic-VLANs.png?resize=300%2C276&#038;ssl=1" alt="Multilayer Switch-hierarchy-basic-VLANs" width="300" height="276" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Multilayer-Switch-hierarchy-basic-VLANs.png?resize=300%2C276&ssl=1 300w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Multilayer-Switch-hierarchy-basic-VLANs.png?resize=150%2C138&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Multilayer-Switch-hierarchy-basic-VLANs.png?w=677&ssl=1 677w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" /></a>

Komunikaciju između VLAN-ova omogućavamo i ograničavamo preko Multilayer switcha.

Možemo kreirati neka (osnovna) pravila popout:

&nbsp;

<span style="color: #808080;">Svi iz VLAN10 mogu komunicirati sa svima, samo iz VLAN21 i VLAN25</span>

<span style="color: #808080;">Svi iz VLAN 21 mogu komunicirati sa svim ostalim VLAN-ovima</span>

<span style="color: #808080;">Svi razvojni poslužitelji iz VLAN20 mogu komunicirati samo sa VLAN21 i sa VLAN 25 i to samo sa određenim servisima iz VLAN 25 i to : DNS , NTP , HTTP i FTP.</span>

<span style="color: #808080;">Omogućimo svima da mogu ići prema VLAN100 (to je praktično izlaz na internet) ali onemogućimo uspostavljanje veze od bilo koga sa strane VLAN100 na bilo koji drugi VLAN.</span>

&nbsp;

Na ovaj način smo omogučili komunikaciju u određenom smjeru a zabranili u drugom ili omogućili komunikaciju između određenih VLAN-ova za samo određene portove/protokole a zabranili za sve druge protokole i sl.

Ograničenjima na VLAN100 smo onemogućili bilo kome tko je možda “provalio” na neki od Routera prema internetu, da otvori bilo kakvu vezu prema unutarnjim mrežama 🙂

&nbsp;

Autor : [Hrvoje Horvat][1]

&nbsp;

&nbsp;

&nbsp;

&nbsp;

 [1]: https://www.opensource-osijek.org/wordpress/o-nama/hrvoje-horvat/ "Hrvoje Horvat"