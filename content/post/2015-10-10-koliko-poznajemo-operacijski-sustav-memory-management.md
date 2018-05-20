---
title: 'Koliko poznajemo operacijski sustav : Memory Management'
author: hhorvat
type: post
date: 2015-10-10T20:11:07+00:00
url: /2015/10/10/koliko-poznajemo-operacijski-sustav-memory-management/
featured_image: /wp-content/uploads/2015/10/samsung_lrdimm_-32gb.jpg
categories:
  - Članci
  - Hardware
  - Linux
  - Programiranje
  - Zanimljivosti

---
# **Memory management**

Memory management je proces upravljanja memorijom na nivou operacijskog sustava. Njegova osnovna zadaća je osigurati mogućnost dinamičkog alociranja memorije, na zahtjev programa (procesa odnosno aplikacije) ali i osloboditi memoriju koja više nije potrebna, u trenutku kada nije potrebna. Ova zadaća je vrlo važna i to dodatno s obzirom na činjenicu da su svi današnji Linuxi, kao i drugi operacijski sustavi u kojima više programa/procesa/aplikacija radi u isto vrijeme.

&nbsp;

Memory management koristi nekoliko metoda da bi povećao efikasnost korištenja memorije.

&nbsp;

## **Sustav virtualne memorije**

Upotreba tkzv. virtualne memorije je metoda koja se koristi za odvajanje virtualnih memorijskih adresa koje koriste procesi, od stvarnih memorijskih adresa RAM memorije. Ova metoda omogućava odvajanje procesa u smislu korištenja posebnog memorijskog adresnog prostora te efikasnijeg korištenja RAM memorije, pomoću metode koja se zove **“Paging”**.

&nbsp;

Osim toga “Memory management” može koristiti i “**Swapping**” na disk, prema potrebi.

I na kraju, kvaliteta memorijskog managera ima znatan utjecaj na performanse cijelog sustava.

&nbsp;

### **Virtualna memorija**

Korištenje Virtualne memorije odvaja korištenje fizičke memorije i od same aplikacije odnosno

procesa. Dakle aplikacije koriste virtualni adresni prostor i to na način da kada aplikacija treba

pristupiti memoriji, zahtjev za memorijskom adresom se translatira (pretvara) iz virtualnog adresnog prostora u fizički adresni proctor RAM memorije.

&nbsp;

Ovo znači da vaš program nikada ne koristi “stvarne” memorijske adrese (tj. adrese fizičke RAM

memorije), niti ima pristup do njih. Umjesto toga svaki program dobiva virtualne memorijske adrese koje koristi.

Memorijske adrese su zapravo pokazivači na memorijske lokacije na kojima se nalazi naš program.

Kada program treba nešto zapisati ili čitati u memoriju ili iz memorije, on mora provjeriti s koje memorijske adrese će čitati koji dio podataka.

O točnom načinu čitanja i zapisivanja čemo kasnije kada budemo pričali o “Paging”-u.

&nbsp;

Upotrebom virtualne memorije, operativni sustav ima potpunu kontrolu nad fizičkom memorijom odnosno nad njenim pristupom. Samim time operacijski sustav može limitirati način na koji procesi (aplikacije) pristupaju memoriji.

Ta kontrola se zove “Memory protection” i ona ograničava pristup svakog procesa, na dio memorije koji je alociran samo za njega te mu onemogućava ulazak u adresni prostor nekog drugog procesa (aplikacije). Implikacije ovoga su vrlo jasne : onemogućavanje malicioznih namjernih ili nenamjernih radnji.

Iako svaki proces (aplikacija) radi unutar svog ograničenog adresnog prostora u memoriji, često je potrebno dijeljenje određenog adresnog prostora memorije između više aplikacija. Primjerice potreban  je pristup podacima koji se dijele između procesa (aplikacija).

&nbsp;

Klasičan primjer su neke biblioteke, kojima treba pristupati veći broj procesa odnosno aplikacija istovremeno. Ova metoda se zove “Shared Memory”.

Istovremeno “Shared Memory” je najbrža metoda za komunikaciju između procesa (aplikacija).

&nbsp;

Ovo se postiže klasifikacijom pristupa memoriji na tkzv. “Primary Storage” i “Secondary Storage”. Jedan od zadataka “Memory Manager”-a je i baratanje s ove dvije vrste pristupa memoriji, na nivou svakog procesa.

&nbsp;

Dakle adresni prostor koji vidi proces (aplikacija), aplikaciji izgleda kao kontinuirani adresni prostor, koji se sastoji od više dijelova ili segmenata.

&nbsp;

Translacija Virtualnih adresa u fizičke se događa unutar procesora (CPU) i to unutar dijela koji se zove “Memory Management Unit” (MMU).

&nbsp;

Slika prikazuje način mapiranja virtualne memorije u fizičku memoriju:

<img src="https://i2.wp.com/www.opensource-osijek.org/dokuwiki/_media/wiki:knjige:linux:linux_-_ram-new.jpg?ssl=1" alt="linux_-_ram-new.jpg" data-recalc-dims="1" />

### **Paging**

Prije nego se uveo “Paging”, operacijski sustav je morao ubaciti cijeli proces (aplikaciju) u RAM memoriju, popunivši ju u kontinuiranom slijedu. S obzirom da se ista stvar morala raditi za svaki proces (program), svaki od njih je zauzeo memoriju u konituiranom nizu.

Problem je nastajao kada bi se neki proces (aplikacija) ugasio, te bi na tom mjestu ostala “prazna” memorija i ta fragmentacija bi se sve više povećavala, gašenjem i podizanjem novih procesa (aplikacija) i uzrokovala probleme.

&nbsp;

Kao što smo spomenuli, virtualna memorija je podjeljena na segmente odnosno tkzv. stranice (engl.Pages) odnosno blokove virtualnog adresnog prostora.

Ovi blokovi su uglavnom veličine 4kB.

&nbsp;

Dakle sva raspoloživa memorija je “razlomljena” u blokove od 4kB.

Slično kao što je površina tvrdog diska, razlomljena u sektore, koji su najmanje jedinice za zapis podataka na tvrdi disk.

&nbsp;

### **Paging i dijeljenje memorije (Shared Memory)**

Dijeljenje memorije (engl. Sharing) koje smo također spominjali, se nadzire od strane “Memory managera”.

&nbsp;

<span style="color: #ff00ff;">Svaki proces (aplikacija) u memoriji podjeljen je u blokove (Pages) i to na način da je izvršni dio programa u jednom dijelu a dio koji sadrži podatke u drugom dijelu memorije<strong>.</strong></span>

&nbsp;

Memorija se djeli tako da se unutar tkzv. tablice blokova (engl. Page Table) za različite procese,

pokazuje na iste stranice (Page) koje su dijeljene između njih.

&nbsp;

#### **Kako to radi**

Korištenjem modela dijeljenja memorije, više nema potrebe za dupliciranjem zauzeća memorije. Osim toga na ovaj način procesi (aplikacije) lakše mogu dijeliti podatke. Dio memory management zadužen za dijeljenje memorije se zove “IPC System” (Inter Process Communication).

&nbsp;

Pojednostavljeno više procesa (aplikacija) dijeli dio memorije, koji se koristi za njihovu međusobnu komunikaciju.

Ti dijelovi memorije, zbog toga što se dijele između procesa, moraju imati kontrolu : tko im može

pristupiti a tko ne može.

Za to je potreban mehanizam zaključavanja pristupa (engl. Locking)  tom (svakom) dijelu memorije.

Ovdje se uključuju tkzv semafori (engl. Semaphores), a oni su zapravo jednostavne

zastavice (engl. Flags).

&nbsp;

Semafori odnosno zastavice rade tako da ako se određeni dio dijeljene memorije trenutno koristi od strane nekog procesa (aplikacije), tada se podiže zastavica i drugi procesi (aplikacije) koje bi u istom trenutku željele pristupiti toj istoj memoriji (na toj istoj adresi), moraju malo pričekati, sve dok se semafor za pristup ne isključi.

&nbsp;

Naredba u Linuxu koja barata s “IPC System” (Inter Process Communication) je **ipcs****.**

&nbsp;

<span style="color: #ff00ff;">Veličina odnosno količina RAM memorije koja se može koristiti kao “Shared Memory”, je definirana za cijeli operacijski sustav ali se može i povećavati ili smanjivati.</span>

<span style="color: #ff00ff;">Njena veličina je definirana brojem blokova (standardneveličine 4KB)</span>

&nbsp;

Postoje dva limita na veličinu dijeljene memorije:

  1. SHMMAX je maksimalna veličina jednog (bilo kojeg) segmenta dijeljene memorije
  2. SHMALL je zbroj svih segmenata dijeljene memorije za cijeli operacijski sustav.

&nbsp;

&nbsp;

Kako provjeriti ove vrijednosti ?.

Provjera veličine bloka &#8211; ovo je “Page size” (obično je 4096 byte tj. 4KB):

&nbsp;

<pre class="lang:default decode:true">sysctl kernel.shmmni


kernel.shmmni = 4096</pre>

&nbsp;

Provjera SHMMAX:

&nbsp;

<pre class="lang:default decode:true ">sysctl kernel.shmmax

kernel.shmmax = 68719476736</pre>

&nbsp;

Provjera SHMALL:

&nbsp;

<pre class="lang:default decode:true ">sysctl kernel.shmall

kernel.shmall = 4294967296</pre>

&nbsp;

### **Uloga &#8220;Page Table&#8221;-a**

“Page Table” ili tablica memorijskih stranica odnosno blokova je strukturirana tablica u kojoj se nalaze sva mapiranja između virtualnih i fizičkih memorijskih adresa.

U operacijskim sustavima, koji koriste virtualnu memoriju (a to su svi moderni OS-ovi) svaki proces vidi svoju memoriju koju koristi kao kontinuiranu. Zapravo je ta memorija raspoređena po fizičkoj RAM memoriji i eventualno se još nalazi dijelom na “Swap” particiji tvrdog diska.

Kada proces (aplikacija) traži pristup memoriji, u nadležnosti je operacijskog sustava, da pogleda u “Page Table” tablicu te napravi povezivanje odnosno mapiranje virtualne memorijske adrese i fizičke memorijske adrese te dohvati tražene podatke (u konačnici pročita ili snimi [“read” ili “write” ] nešto u ili iz memorije).

Svaki unos u tablici : Virtualna adresa ↔ Fizička adresa se zove “Page table entry” (PTE).

&nbsp;

### **Proces translacije adresa**

“Memory Managemet Unit” (MMU) procesora (engl. CPU) pohranjuje (engl. Cache) unose iz “Page” tablice koji su nedavno korišteni, u svoju internu (vrlo malu) memoriju odnosno svoj međuspremnik (engl. Buffer). Ovaj međuspremnik se zove “Translation Lookaside Buffer” (TLB).

Kada se virtualna adresa treba translatirati u fizičku, prvo se provjerava TLB. Ako je unos pronađen i fizička adresa je poznata, nastavlja se s pristupom memoriji.

Ako traženi unos ne postoji u TLB memoriji (ovo je tkzv. “TLB miss”), nastavlja se s čitanjem originalne “Page” tablice i traži se potreban unos (ovo se zove “Page walk”). Kada se unos pronađe on se odmah i upisuje u TLB memoriju te se ponovno pokreće proces čitanja iz TLB memorije. Potom se standardno nastavlja s pristupom fizičkoj memoriji tj. točnoj adresi u njoj, gdje se nalaze traženi podaci.

Ovo je proces koji se stalno ponavlja, s obzirom da u TLB memoriju modernih procesora (CPU) stane tek nekoliko stotina unosa.

Moramo biti svjesni da, što se više memorije alocira i dodjeli procesima (aplikacijama), “Page table” sve više i više raste. S obzirom je da “Page size” samo 4KB, to praktično znači da je za svakih alociranih 1GB RAM memorije, potrebna Page tablica, sa 262144 unosa, koji se stalno pretražuju i oni zadnji korišteni se stavljaju u TLB međuspremnik, kako je gore objašnjeno.

Dakle ako imate 8GB RAM koji su potpuno iskorišteni to znači da će “Page” tablica narasti na 2 097 152 unosa. Ovo unosi znatne probleme, kod aplikacija koje koriste veću količinu RAM memorije, jer za svaki pristup svakoj pojedinoj memorijskoj lokaciji slijedi proces od gor. Dakle pretraživanje stotine tisuća ili mlijuna unosa, za svako čitanje ili pisanje po svakoj pojedinoj lokaciji memorije (veličine 4KB).

&nbsp;

### **Koliki je TLB modernih procesora**

Za primjerice Intel “[Nehalem][1]” mikroarhitekturu odnosno generaciju CPU-a, stanje po pitanju TLB-a je slijedeće.

Ova generacija procesora ima dvo razinski TLB: manji L1 (ITLB1 i DTLB1) koji je i najbrži te potom veći L2 (DTLB1 ), koji je i malo sporiji.

Koje su njihove veličine odnosno kapacitet ?

  1.       L1 (DTLB1): 64 unosa za “Page” veličine 4KB (standardna veličina) i 32 unosa za Page veličine 2 ili 4 MB (o ovim veličinama u naprednom dijelu)</p> 
  2.      L1 (ITLB1): 128 unosa za “Page” veličine 4KB (standardna veličina) i 14 unosa za Page veličine 2 ili 4 MB (o ovim veličinama u naprednom dijelu)

  3.     L2 (DTLB) : 512 unosa za “Page” veličine 4KB (standardna veličina)

&nbsp;

Pogledajmo sada procesor : Intel “Core 2 Duo E7500”, sa dvije fizičke jezgre :

<img class="" src="https://i2.wp.com/www.opensource-osijek.org/dokuwiki/_media/wiki:knjige:linux:cpu-core2-duo-e7500.jpg?resize=278%2C338&#038;ssl=1" alt="" width="278" height="338" data-recalc-dims="1" />

&nbsp;

Sada pogledajmo i noviji poslužiteljski procesor “Xeon” i to model “E5-2650 V.3”.

Slika prikazuje sustav sa 128GB RAM, od kojih 64GB pripada prvom fizičkom procesoru a 64GB drugom:

&nbsp;

<img src="https://i1.wp.com/www.opensource-osijek.org/dokuwiki/_media/wiki:knjige:linux:cpu-e5-2650-v3.jpg?ssl=1" alt="" data-recalc-dims="1" />

Ova logička shema je dobivena s naredbom:

<pre class="lang:default decode:true ">lstopo –whole-system –no-io</pre>

&nbsp;

Vidljivo je da prvi fizički procesor (Socket P#0) ima fizičkih 10 jezgri (P#0 do P#12) a unutar svake od njih se nalaze po dvije logičke jezgre (to su “Hyper Threading” jezgre), oznaka **PU P#** “BROJ jezgre”.

Istu konfiguraciju ima i drugi fizički procesor. Naime ovo je poslužiteljska matična poloča koja ima dva procesora Intel Xeon E-2650 v.3. sa ukupno 40 jezgri (20 na prvom a 20 na drugom fizičkom procesoru).

&nbsp;

#### **Vratimo se na TLB**

Slika prikazuje proces dohvaćanja podataka iz Page tablice i TLB memorije:

<img class="" src="https://i0.wp.com/www.opensource-osijek.org/dokuwiki/_media/wiki:knjige:linux:640px-page_table_actions.svg_1_.png?resize=524%2C340&#038;ssl=1" alt="" width="524" height="340" data-recalc-dims="1" />

Naučili smo kako se pronalaze i dohvaćaju  unosi ali dobro je znati i da se proces koji slijedi kod TLB promašaja (engl. TLB miss) može odraditi na dva načina :

  1.    Hardverski &#8211; korištenjem registara procesora (CPU) [CR3][2] registar na x86 arhitekturi] &#8211; CPU odrađuje pretraživanje, ostalo Operacijski sustav
  2.    Softverski &#8211; Operacijski sustav odrađuje sve (od popunjavanja TLB-a, pretraživanja (page walk) i sl).

Prosječne performanse TLB-a su:

  * Vrijeme dohvata unosa : 0.5 &#8211; 1 takt procesora (engl. clock cycle)
  * Promašaj : 10 &#8211; 100 taktova procesora (engl. clock cycles)
  * Prosječni postotak promašaja 0.01 -1 %

&nbsp;

Osnovna računica ako je vrijeme dohvata 1 takt, a promašaj 30 taktova te postotak promašaja 1% , tada je potrebno 1.3 taktova procesora za dohvaćanje jednog unosa u TLB tablici.

&nbsp;

##### **Zbog čega toliko priče o TLB-u ?**

Kao što smo rekli operacijski sustav istovremeno obrađuje više procesa u pozadini. To “istovremeno” baš i nije potpuno točno.

Naime jedan procesor, odnosno u novijim arhitekturama se to odnosi na jednu jezgru procesora (engl. CPU Core), u bilo kojoj jedinici vremena, u stanju je obrađivati samo jedan tok informacija odnosno jedan proces ili nit (engl. Thread), potom se prebaciti na drugi, pa na prvi , i tako dalje  ovo prebacivanje se zove “Context Switching”.

Ovo je zapravo ono što zovemo “Multitasking” ili “višezadaćnost” odnosno privid da jedan procesor može obrađivati više zadataka (engl. Tasks).

Kod ovog prebacivanja između procesa, TLB tablica se u većini slučajeva mora **potpuno** isprazniti (engl. TLB Flush), pošto je vrlo vjerojatno da će većina ako ne i gotovo svi unosi u tablici biti nevažeći. Nevažeči zbog toga jer je TLB prilično malog kapaciteta, a svaki proces koristi druge djelove memorije, pa prema tome mapiranja koja su ostala u TLB memoriji pokazuju na translacije (virtualna memorija &#8211; fizička memorija )za adrese koje novi proces ne koristi &#8211; on je u nekom drugom opsegu memorijskih adresa.

&nbsp;

<span style="color: #ff00ff;">Svako novo prebacivanje između procesa odnosno “Context Switch”, prazni TLB memoriju, te ju ponovno popunjava pretraživanjem “glavne” “Page” tablice. S obzirom da se svake sekunde dešava ogroman broj ovih prebacivanja, jasno je koliko ovo može utjecati a i utiče na performanse cijelog sustava.</span>

&nbsp;

Ovo nije jedini problem koji uzrokuje “Context switching”, isto tako se uz pražnjenje TLB-a, briše i večina registara procesora, koji se moraju ponovno popuniti kod svake nove promjene procesa koji je trenutno aktivan.

&nbsp;

#### Zbog čega toliko priče o &#8220;Page Table&#8221;-u

Pogledajmo poslužitelj sa 128 GB RAM, od koje je u upotrebi večina, odnosno oko 127 GB.

Filtrirati ćemo sve iz statistike upotrebe RAM memorije **/proc/meminfo** što je vezano za pojam “Page”

&nbsp;

<pre class="lang:default decode:true">cat /proc/meminfo | grep Page

AnonPages:        47143856 
kBPageTables:       109852 
kBAnonHugePages:         0 
kBHugePages_Total:       0
HugePages_Free:          0
HugePages_Rsvd:          0
HugePages_Surp:          0
Hugepagesize:         2048 kB</pre>

<span style="font-size: 10.5pt; font-family: 'Arial','sans-serif'; color: #333333;">Prva stvar koja je vidljiva je ta da je &#8220;Page&#8221; tablica narasla na<span class="apple-converted-space"> </span><strong><span style="font-family: 'Arial','sans-serif';">107 MB (109852 kB)</span></strong><span class="apple-converted-space"> </span>što znači da se u tablici nalazi oko<span class="apple-converted-space"> </span><strong><span style="font-family: 'Arial','sans-serif';">28 049 408</span></strong><span class="apple-converted-space"> (28 milijuna 49 tisuća i 408 </span>unosa)  &#8211; za 4kB stranice.</span>

<span style="font-size: 10.5pt; font-family: Arial, sans-serif; color: #ff00ff;">Ovdje se koristi standardna veličina stranice (page) od 4KB.</span>

<span style="font-size: 10.5pt; font-family: 'Arial','sans-serif'; color: #333333;">Sjetimo se : problem je u tome što se kod svakog pristupa RAM memoriji, koja je za naše aplikacije, razlomljena u komadiće od 4KB, potrebno svaki puta pogledati u “Page Table” tablicu , pronači (jednu po jednu) memorijsu lokaciju od 4KB te nakon toga i doći do nje.</span>

<span style="font-size: 10.5pt; font-family: 'Arial','sans-serif'; color: #333333;">Zamislimo da vaša aplikacija treba nešto upisati ili čitati u 40MB RAM memorije koja je zapravo razlomljena u blokove od 4KB, što znači da je potrebno čitanje 10000 unosa u tablici da bi se došlo do svih memorijskih lokacija s kojih treba čitati ili u koje treba nešto upisati.</span>

<span style="font-size: 10.5pt; font-family: 'Arial','sans-serif'; color: #333333;">U primjeru gore s relativno velikom količinom RAM memorije u upotrebi stvari postaju još gore.</span>

<span style="font-size: 10.5pt; font-family: 'Arial','sans-serif'; color: #333333;">Riješenje je upotreba tkzv “Huge Pages” odnosno prelazak s 4KB blokova na puno veće blokove (za x86 je tu o pravilu 2MB), s ovom metodom , smanjili smo broj unosa u tablicu i samim time broj pregledavanja i dohvaćanja unosa u “Page” tablicu, poprilično, točnije<span class="apple-converted-space"> </span><strong><span style="font-family: 'Arial','sans-serif';">512 puta</span></strong>.</span>

<span style="font-size: 10.5pt; font-family: 'Arial','sans-serif'; color: #333333;">I naravno uvijek postoji problem &#8211; ovo nije moguće napraviti za cijeli sustav već samo za točno određeni dio memorije. </span>

<span style="font-size: 10.5pt; font-family: 'Arial','sans-serif'; color: #333333;">I još malo komplikacije, “Huge Pages” neće raditi sam od sebe, već vaša aplikacija tj. programski jezik u kojem ste ju napisali, mora podržavati ovakan način rada.</span>

<span style="font-size: 10.5pt; font-family: 'Arial','sans-serif'; color: #333333;">Dobra strana je to što večina ozbiljnijih apikacija zna koristiti “Huge Pages”, potrebno je “samo” sve znati konfigurirati, što ponekad (zapravo često) nije jednostavno.</span>

&nbsp;

&nbsp;

&nbsp;

&nbsp;

Ovaj članak je samo dio priče o RAM memoriji, koja se nalazi u  knjizi “[Uvod u Linux][3]”.

&nbsp;

Ako vas zanima malo više, pogledajte poglavlje o RAM memoriji :

[https://www.opensource-osijek.org/dokuwiki/wiki:knjige:uvod\_u\_linux#ram_memorija][4]

 [1]: https://upload.wikimedia.org/wikipedia/commons/6/64/Intel_Nehalem_arch.svg
 [2]: https://en.wikipedia.org/wiki/Control_register
 [3]: https://www.opensource-osijek.org/dokuwiki/wiki:knjige:uvod_u_linux
 [4]: https://www.opensource-osijek.org/dokuwiki/wiki:knjige:uvod_u_linux#ram_memorija