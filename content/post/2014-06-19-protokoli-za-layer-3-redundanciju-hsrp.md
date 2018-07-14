---
title: 'Protokoli za “Layer 3” redundanciju : HSRP'
authors: hhorvat
type: post
date: 2014-06-19T20:13:31+00:00
url: /2014/06/19/protokoli-za-layer-3-redundanciju-hsrp/
featured_image: /wp-content/uploads/2014/06/2xISP-HSRP-osnovno.png
categories:
  - Cisco
  - Članci
tags:
  - cisco
  - HSRP

---
&nbsp;

[toc]

&nbsp;

&nbsp;

&nbsp;

# Zbog čega nam uopće treba Layer 3 redundancija ?

**(Layer 3 : OSI i/ili  TCP/IP model &#8211; sloj 3 tj. IP)** 

U slučajevima kada nam je bitan ulaz odnosno izlaz prema internetu, prva stvar koju moramo osigurati uz postojeću (primarnu) vezu prema internetu, je druga (backup) veza. preko istog ili drugog internet providera (ISP-a). Bez obzira da li se radi o istom ili drugačijem tipu veze (pr. optika, ADSL, SDSL ili drugo),sa strane mreže, prema korisničkim računalim ili poslužiteljima, potrebno je osigurati jedinstvenu metodu izlaza na internet (tj. u konačnici jedinstvenu IP adresu).

Tu IP adresu zapravo koristimo kao “Default Gateway”.

<a href="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/2xISP-osnovno.png?ssl=1" data-rel="lightbox-0" title=""><img class="alignnone size-medium wp-image-1571" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/2xISP-osnovno.png?resize=300%2C300&#038;ssl=1" alt="2xISP-osnovno" width="300" height="300" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/2xISP-osnovno.png?resize=300%2C300&ssl=1 300w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/2xISP-osnovno.png?resize=150%2C150&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/2xISP-osnovno.png?resize=160%2C160&ssl=1 160w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/2xISP-osnovno.png?w=583&ssl=1 583w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" /></a>

# **Koje najčešće opcije imamo:**

**a.)** Primarni Router (Router1) i pripadajući link su stalno aktivni a sekundarni (Router2) tj. backup ručno uključujemo po potrebi (u slučaju kvara primarnog) &#8211; ovo nije baš najsretnije riješenje.

**b.)** Oba uređaja su aktivna, svaki ima svoju inside IP adresu (pr. 20.20.20.x) i svima je preko DHCP poslužitelja kao Default Gateway postavljena IP adresa prvog Routera (pr. 20.20.20.1). U slučaju kvara prvog, na DHCP poslužitelju mijenjamo svima Default Gateway u drugi Router (pr. 20.20.20.2) te svi korisnici moraju ponovno pokupiti IP parametre sa DHCP poslužitelja (iz GUI-a ili komandne linije) ili restartati računalo &#8211; ovo je malo bolje ali i dalje primitivno riješenje

**c.)** Ili nešto slično kao a.) i b.)

**d.)** Upotreba protokola za Layer 3 redundanciju (nazivaju se i &#8220;First Hop Redundancy Protocols&#8221; ili protokoli koji osiguravaju dostupnost &#8220;Default Gateway-a&#8221;)

  * (1) : HSRP (Cisco only, razvijen 1994)
  * (2) : VRRP (Industrijski standard , opisan u RFC 2338, razvijen 1999, po uzoru na HSRP )
  * (3) : GLBP (Cisco only, razvijen 2005)

Dakle zaključili smo da želimo automatizam koji će riješiti ovaj problem.

&nbsp;

## **(1) Što nam nudi HSRP i kako on radi:**

HSRP (Hot Standby Routing Protocol) je razvio Cisco te se koristi (i radi) samo na Cisco uređajima. On pojednostavljeno radi tako da dva ili više uređaja preko HSRP protokola dijele jednu virtualnu IP adresu (koju mi koristimo kao Default Gateway). Na tu virtualnu IP adresu svaki puta odgovara Router koji je Aktivan HSRP Router a ostali ništa ne rade, osim što svako malo provjeravaju da li su svi živi i koji od živih routera ima najviši prioritet.

Naime onaj Router koji u određenom trenutku ima najviši HSRP prioritet, on postaje i aktivan i preko njega zapravo teće sav promet. Kao na slici.

<a href="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/2xISP-HSRP-osnovno.png?ssl=1" data-rel="lightbox-1" title=""><img class="alignnone size-medium wp-image-1572" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/2xISP-HSRP-osnovno.png?resize=300%2C300&#038;ssl=1" alt="2xISP-HSRP-osnovno" width="300" height="300" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/2xISP-HSRP-osnovno.png?resize=300%2C300&ssl=1 300w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/2xISP-HSRP-osnovno.png?resize=150%2C150&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/2xISP-HSRP-osnovno.png?resize=160%2C160&ssl=1 160w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/2xISP-HSRP-osnovno.png?w=583&ssl=1 583w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" /></a>

Mana HSRP protokola je u tome što je u svakom trenutku samo jedan aktivan Router te se drugi (tj. svi ostali ako imamo više Routera/ISP-ova) ne koriste za promet, kao što se ne iskorištavaju niti sekundarni/backup linkovi prema internetu.

Postoji i poluautomatsko riješenje za to.

Naime HSRP protokol, sa Virtualnom IP adresom, svim routerima koji učestvuju u HSRP “razgovoru/dogovoru” te prioritetima istih (uz potencijalnu autentikaciju) se definira na nivou tkzv. “HSRP grupe”, kojih može biti više istovremeno.

Dakle krenimo malo dublje.

&nbsp;

Sve gore navedeno za HSRP se definira za HSRP grupu, što znači da možemo imati jednu grupu u kojoj je Router 1 aktivan i drugu grupu u kojoj je Router 2 aktivan, problem je samo kako konfigurirati klijente.

Konfiguracija klijenata (pr. PC računala) za ovaj slučaj je najpraktičnija tako da se na DHCP poslužitelju podjele DHCP rezervacije na pola te da se prvoj polovici konfigurira kao Default Gateway prva Virtualna IP (gdje je Router 1 aktivan) a drugoj polovici Virtualna IP adresa od druge HSRP grupe , u kojoj je Router 2 aktivan. Na ovaj način smo iskoristili oba routera i oba linka prema internetu.

&nbsp;

### **HSRP osnovni dio konfiguracije Routera bi tada izgledao ovako:**

&nbsp;

**Napomena:**

FastEthernet 0/0  ⇒ Veza prema ISP-u i internetu

FastEthernet 0/1  ⇒ LAN mreža

&nbsp;

**Router 1 :**

========

<pre class="lang:default decode:true">interface Fast Ethernet 0/1

 ip address 20.20.20.1 255.255.255.0

 standby 1 priority 105

 standby 1 ip 20.20.20.254

 

 standby 10 priority 100

 standby 10 ip 20.20.20.253</pre>

&nbsp;

&nbsp;

&nbsp;

**Router 2 :**

========

<pre class="lang:default decode:true">interface Fast Ethernet 0/1

 ip address 20.20.20.2 255.255.255.0

 standby 1 priority 100

 standby 1 ip 20.20.20.254



 standby 10 priority 105

 standby 10 ip 20.20.20.253</pre>

&nbsp;

**Konfiguracija DHCP Poslužitelja (DHCP rezervacije klijenata):**

PC1 : 20.20.20.100 : …&#8230;. , Default gateway : 20.20.20.25**4** ,&#8230;.

PC2 : 20.20.20.101 : …&#8230;. , Default gateway : 20.20.20.25**4** ,&#8230;.

… … … …

PC10 : 20.20.20.110 : …&#8230;. , Default gateway : 20.20.20.25**3** ,&#8230;.

PC11 : 20.20.20.111 : …&#8230;. , Default gateway : 20.20.20.25**3** ,&#8230;.

**Što će se dogoditi ako jedan od routera ili link ne rade ?**

**1.** U slučaju da Router uopće ne radi , prvi Router u istoj HSRP grupi će preuzeti ulogu aktivnog i proslijeđivati promet, te će ostati aktivan do daljnjeg !

⇒ Osim ako smo konfigurirali tkzv “preemptive”:

U slučaju da smo samo konfigurirali preemptive (za HSRP grupe 1 i 10) pr.:

<pre class="lang:default decode:true">standby 1 preempt

standby 10 preempt</pre>

&nbsp;

Tada će Router koji je inicijalno bio aktivan, kada se ponovno uključi preuzeti ulogu aktivnog od onoga koji je trenutno aktivan.

Ovdje postoji problem, jer ako Router koji je prvi bio aktivan, pa je otišao u standby (zbog metode objašjene nekoliko rečenica dolje [točka **2**.]) zbog toga što mu se pokvario mrežni interface te se stalno pali i gasi (što zna biti slučaj u praksi), prvi router će malo malo postajati standby pa ponovno active, jer smo uključili “preempt” .

&nbsp;

#### &#8220;Preempt&#8221;

Zbog toga se preporuča uz “preempt” dodati i timere tj. vremenski odmak (delay) koji mora proći, prije nego router preuzme ulogu aktivnog, naredba bi u našem slučaju bila

((za HSRP grupe 1 i 10)):

<pre class="lang:default decode:true">standby 1 preempt delay minimum 180

standby 10 preempt delay minimum 180</pre>

&nbsp;

Dakle 180 sekundi je okvirno potencijalno dovoljno sigurno da se gore opisana greška vrlo vjerojatno neće dogoditi.

Osim parametra **minimum** , postoje i **reload** i **sync** od kojih je praktičan i **reload** .jer čeka &#8211; ako se router restartao, nakon restarta definiran period vremena : pr.:

<pre class="lang:default decode:true">standby 1 preempt delay reload 180

standby 10 preempt delay reload 180</pre>

&nbsp;

&nbsp;

U praksi je najsigurnije ne koristiti “preempt” osim ako stvarno ne znate što radite.

&nbsp;

#### Interface tracking

**2.**Došli smo i do slučaja da samo link prema internetu ne radi, što onda ?

Moramo dodati još jedan parametar u konfiguraciji koji će pratiti i stanje krucijalnih interface-a (indirektno ili direktno, linka prema internetu u našem slučaju).

Ako naši routeri 1 i 2 imaju opremu ISP-a, spojenu na mrežne interface FastEthernet 0/0 , tada bi naša konfiguracija trebala izgledati ovako  ((za HSRP grupe 1 i 10)):

<pre class="lang:default decode:true">standby 1 track  FastEthernet 0/0

standby 10 track  FastEthernet 0/0</pre>

&nbsp;

Na ovaj način se prati stanje interface-a FastEthernet 0/0 i ako se on sruši, prioritet HSRP grupe 1 , se spušta za vrijednost 10 (default), te pada na 95 , što znaći da router sa većim prioritetom &#8211; u našem slućaju 100 (Router 2) , preuzima ulogu aktivnog. Isti sistem vrijedi i za HSRP grupu 10.

Ako želimo promjeniti smanjivanje prioriteta (decrement) sa 10 na neku drugu vrijednost tu vrijednost dodajemo na kraj naredbi od prije &#8211; neka bude za 20

<pre class="lang:default decode:true">standby 1 track  FastEthernet 0/0  20

standby 10 track  FastEthernet 0/0  20</pre>

&nbsp;

&nbsp;

**Dodatne opcije HSRP-a, su :**

&nbsp;

#### Autentikacija

**Autentikacija** &#8211; za svaku HSRP grupu moguće je i definirati iautentikaciju (dakle lozinku).

Postoji nekoliko opcija.:

<ul style="list-style-type: circle;">
  <li>
    1.) Plain text
  </li>
  <li>
    2.) MD5
  </li>
</ul>

U našem slučaju koristiti ćemo običnu “plain text“ lozinku, a to se radi ovako

(u našem slučaju za HSRP grupe 1 i 10):

<pre class="lang:default decode:true">standby 1 authentication Lozinka1

standby 10 authentication Lozinka10</pre>

Mana “plain text” lozinke je sigurnosne prirode jer se lozinka šalje preko mreže nekriptirana.

Pogledajmo komunikaciju sa Routera 1, na mreži, u slučaju da smo ostavili HSRP grupu bez definirane autentikacije:

<a href="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/HSRP-Auth-default.jpg?ssl=1" data-rel="lightbox-2" title=""><img class="alignnone size-medium wp-image-1583" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/HSRP-Auth-default.jpg?resize=300%2C93&#038;ssl=1" alt="HSRP-Auth-default" width="300" height="93" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/HSRP-Auth-default.jpg?resize=300%2C93&ssl=1 300w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/HSRP-Auth-default.jpg?resize=150%2C46&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/HSRP-Auth-default.jpg?w=833&ssl=1 833w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" /></a>

Vidljivo je da se unatoč činjenici da nismo defnirali lozinku, u pozadini ipak koristi &#8220;default&#8221; lozinka (cisco).

Sada ćemo probati definirati lozinku (Lozinka), te pogledajmo kako sada izgleda isti paket na mreži:

<a href="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/HSRP-Auth-Lozinka.jpg?ssl=1" data-rel="lightbox-3" title=""><img class="alignnone size-medium wp-image-1584" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/HSRP-Auth-Lozinka.jpg?resize=300%2C91&#038;ssl=1" alt="HSRP-Auth-Lozinka" width="300" height="91" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/HSRP-Auth-Lozinka.jpg?resize=300%2C91&ssl=1 300w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/HSRP-Auth-Lozinka.jpg?resize=150%2C45&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/HSRP-Auth-Lozinka.jpg?w=822&ssl=1 822w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" /></a>

Dakle vidimo da se sada koristi lozinka (Lozinka), koju smo kreirali.

Iz oba primjera potvrdili smo i to da se lozinke šalju nekriptirane.

&nbsp;

Upotreba MD5 metode riješava ovaj problem jer se više ne šalje nekriptirani ključ, ali o njoj nekom drugom prilikom.

&nbsp;

&nbsp;

&nbsp;

#### &#8220;Hello&#8221; poruke

**Hello Message Timeri** &#8211; dakle svako malo Routeri unutar svake HSRP grupe šalju određene pakete , koji sadrže slijedeće poruke (za router koji šalje paket):

**Prioritet routera** : 0 &#8211; 255 (veći ima prioritet)

**Hello Time** (default 3.s.) : Svakih koliko sekundi (moguće je konfigurirati i msec) se   šalje paket

**Holdtime** (default 10.s) : Vrijeme unutar kojeg se smatra da su “Hello Time”  poruke važeće i da je sve u redu.

&nbsp;

&nbsp;

&nbsp;

### Dijagram toka HSRP poruka

&nbsp;

**Rad HSRP-a pojednostavljeno radi ovako:**

**1.** Kreiramo HSRP grupe,pripadajuće IP adrese i druge parametre, na svim Routerima

**2. **Šalju se Hello paketi od strane svih Routera koji koriste HSRP, svake 3 sekunde na sve routere (zapravo na multicast adresu 224.0.0.2 na koju su “pretplačeni” svi routeri)

**3. **Na osnovi ovih paketa se odlučuje (rade se izbori [election]) koji Router će postati “Active”.

**4.** Kreira se Virtualna IP adresa i virtualna MAC adresa za koju je zadužen aktivni router

&nbsp;

Oblik virtualne MAC adrese za svaku HSRP grupu je :

<table>
  <tr>
    <td>
      00:00:0C
    </td>
    
    <td>
      07:AC
    </td>
    
    <td>
      _ _
    </td>
  </tr>
  
  <tr>
    <td>
      Cisco ID
    </td>
    
    <td>
      HSRP ID
    </td>
    
    <td>
      ID (broj) HSRP grupe
    </td>
  </tr>
</table>

&nbsp;

Potom virtualnu MAC adresu zapamti prvi Switch i stavi ju u svoju tablicu (MAC →  Port Nr.)

Dakle “ljepi” se MAC adresa na port na switchu na kojem je aktivni HSRP Router, prema kojoj se svi paketi prosljeđuju na njega.

**5. **Šalju se (i očekuju) paketi unutar 10. sekundi, nakon toga ponovno se šalju i primaju novi, ako je sve po starom ništa se ne mijenja a ako se pojavio Router sa većim HSRP prioritetom (ovo se dešava za svaku HSRP grupu) skače se na točku 2 te se preskače na točku **4.**

&nbsp;

Standardno se svake 3 sekunde šalju poruke i drže se 10 sekundi. Dakle može se reći i ovako &#8211; ako poruka ne stigne od trenutno aktivnog routera unutar Holdtime-a (default 10 sekundi) , nakon toga dolazi do reizbora novog aktivnog routera koji switchevima šalje promijenu za virtualnu MAC adresu &#8211; dakle sada switchevi imaju port spojen na njega kao destination virtualnu MAC adresu od virtualne IP adrese (tako za svaku HSRP grupu)

**5.1 **Poseban slučaj tj. iznimka je slučaj kada smo uključili praćenje (**track**) nekog interface-a, pr:

<pre class="lang:default decode:true">standby 1 track  FastEthernet 0/0</pre>

&nbsp;

⇒ Ako se dogodi ispad interface-a, koji se prati, u roku od nekoliko milisekundi isti router šalje Hello paket sa porukom u kojoj se vidi da mu je pao prioritet. Gotovo trenutno prvi slijedeći Router (po HSRP prioritetu) preuzima ulogu aktivnog.

**6.**Povratak na točku **1.**

&nbsp;

&nbsp;

&nbsp;

Sada se možemo vratiti na **Hello Time** i **Hold Time**.

Ako želimo optimizirati/mijenjati timere, osnovno pravilo kaže:

**Hold Time = min. 3 x Hello Time**

Zbog čega 3 x **Hello Time** →   jer je nedolazak 3 paketa ili isticanje **Hold Time**-a okidač za reizbore unutar HSRP grupe.

&nbsp;

Naš primjer bi bio tuning HSRP-a sa brzinama VRRP-a:, dakle smanjivanje na slanja paketa svake sekunde i istek vremena na 4 sekunde, što je dovoljno da 3 paketa dođu.

<pre class="lang:default decode:true">standby 1 timers 1 4

standby 10 timers 1 4</pre>

&nbsp;

Možemo ići i dalje (brže), te smanjiti vrijeme u milisekunde (150ms i 600ms)

<pre class="lang:default decode:true">standby 1 timers msec 150 msec 600

standby 10 timers msec 150 msec 600</pre>

&nbsp;

&nbsp;

Sa ovim zadnjim postavkama možemo biti sigurni da će se sve odigrati ispod jedne sekunde.

Napomena : treba biti oprezan i ne pretjerivati jer pr. ovako generiramo pakete svakih 150ms i dodatno opterečujemo Router (ili Layer3/4 Switch) **!! .**

&nbsp;

Nakon što smo oba routera konfigurirali za dvije HSRP grupe,  pogledajmo što nam govore HSRP statusi:

&nbsp;

**Router 1**

<pre class="lang:default decode:true">Router1#sh standby
FastEthernet0/1 - Group 1
State is Active
2 state changes, last state change 00:01:27
Virtual IP address is 20.20.20.254
Active virtual MAC address is 0000.0c07.ac01
Local virtual MAC address is 0000.0c07.ac01 (v1 default)
Hello time 3 sec, hold time 10 sec
Next hello sent in 2.676 secs
Preemption disabled
Active router is local
Standby router is 20.20.20.2, priority 100 (expires in 8.052 sec)
Priority 105 (configured 105)
IP redundancy name is "hsrp-Fa0/1-1" (default)
FastEthernet0/1 - Group 10
State is Standby
2 state changes, last state change 00:01:03
Virtual IP address is 20.20.20.253
Active virtual MAC address is 0000.0c07.ac0a
Local virtual MAC address is 0000.0c07.ac0a (v1 default)
Hello time 3 sec, hold time 10 sec
Next hello sent in 2.644 secs
Preemption disabled
Active router is 20.20.20.2 priority 105 (expires in 8.524 sec)
Standby router is local
Priority 100 (default 100)
IP redundancy name is "hsrp-Fa0/1-10" (default)</pre>

**Router 2:**

<pre class="lang:default decode:true">Router2#sh standby
FastEthernet0/1 - Group 1
State is Standby
1 state change, last state change 00:01:32
Virtual IP address is 20.20.20.254
Active virtual MAC address is 0000.0c07.ac01
Local virtual MAC address is 0000.0c07.ac01 (v1 default)
Hello time 3 sec, hold time 10 sec
Next hello sent in 0.876 secs
Preemption disabled
Active router is 20.20.20.1, priority 105 (expires in 9.560 sec)
Standby router is local
Priority 100 (default 100)
IP redundancy name is "hsrp-Fa0/1-1" (default)
FastEthernet0/1 - Group 10
State is Active
1 state change, last state change 00:01:24
Virtual IP address is 20.20.20.253
Active virtual MAC address is 0000.0c07.ac0a
Local virtual MAC address is 0000.0c07.ac0a (v1 default)
Hello time 3 sec, hold time 10 sec
Next hello sent in 0.000 secs
Preemption disabled
Active router is local
Standby router is 20.20.20.1, priority 100 (expires in 9.556 sec)
Priority 105 (configured 105)
IP redundancy name is "hsrp-Fa0/1-10" (default)</pre>

** Iz ispisa statusa HSRP-a, vidljivo je :**

**_Za HSRP grupu 1 :_**

State is Active , &#8211; Za Router 1  , za Router 2 : Standby

Vidimo da Hello paketi istiću za 8.052 tj .

Virtualna IP : 20.20.20.254,

Virtualna MAC &#8211; podsjetimo se opisa  : 0000.0C07.ac**01 **

Hello time : 3.sec, HoldTime 10.s ec. (dakle vidljivo da smo ostavili default parametre)

Vidimo i da je preemption isključen.

&nbsp;

**_Za HSRP grupu 10 :_**

State is Active , &#8211; Za Router 2  , za Router 1 : Standby

Vidimo da Hello paketi istiću za  9.556 sec.

Virtualna IP : 20.20.20.253,

Virtualna MAC &#8211; podsjetimo se opisa  : 0000.0C07.ac**0a **

Hello time : 3.sec, HoldTime 10.s ec. (dakle vidljivo da smo ostavili default parametre)

Vidimo i da je preemption isključen.

&nbsp;

&nbsp;

&nbsp;

### **Brza usporedba HSRP i VRRP protokola:**

Razlike između HSRP i VRRP su minimalne, praktično u brzini konvergencije (koja je po default-u na strani VRRP ali se može konfigurirati u HSRP na istu ili bržu razinu).

Osim toga HSRP radi samo na Cisco opremi dok VRRP  radi na opremi svih proizvođaća (uključujući Cisco)

&nbsp;

**Timeri :**

**=======**

**HSRP** : Hello time : 3 sekunde , Hold Time 10 sekundi

**VRRP**: Hello time : 1 sekunda , Hold Time 3 sekunde

&nbsp;

&nbsp;

**Brza usporedab HSRP/VRRP i GLBP protokola :**

HSRP i VRRP rade na principu Active/Standby (prema VRRP terminolgiji : Master/Backup) tj. samo jedan uređaj u svakoj grupi je aktivan te se iskorištava samo link aktivnog uređaja.

Kod GLBP (Gateway Load Balancing Protocol) protokola promet ide kroz sve uređaje te se iskorištavaju svi linkovi istovremeno, prema nekom od ponuđenih Load Balancing algoritama:

&nbsp;

**1. Round-robin** : Na osnovi liste aktivnih (živih) routera se prosljeđuje promet sa krajnjih računala sekvencijalno prema routerima:

Pr. Ako imamo dva routera i 4 PC računala:

PC1 <==> Router 1

PC2 <==> Router 2

PC3 <==> Router 1

PC4 <==> Router 2

&#8230;

**2. Weighted load-balancing :**   Load Balancing algoritam koji na osnovi &#8220;težinskog&#8221; koeficjenta daje veći ili manji prioritet u opterečenju (slanju prometa) na određeni GLBP router u odnosu na ostale GLBP Routere.

&nbsp;

**3. Host-dependent :** Promet će se raspoređivati prema GLBP routerima  tako da će  svaki puta isti host (krajnje računalo) prolaziti kroz isti Router:

Pr. Dva routera i 4 PC računala :

PC1 <==> Router 1 (svaki puta PC1 ide samo na Router 1),

PC2 <==> Router 2 (svaki puta PC2 ide samo na Router 2),

PC3 <==>Router 1 (svaki puta PC3 ide samo na Router 1),

PC4 <==> Router 2 (svaki puta PC4 ide samo na Router 2)

&nbsp;

ali o detaljima o GLBP u nekom drugom članku.

&nbsp;

&nbsp;

Autor: [Horvat Hrvoje][1]

 [1]: https://www.opensource-osijek.org/wordpress/o-nama/hrvoje-horvat/ "Hrvoje Horvat"