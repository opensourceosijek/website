---
title: 'Retrospektiva : Virtualizacija, linux kontejneri i Proxmox VE'
author: Hrvoje Horvat
type: post
date: 2016-06-28T14:50:18+00:00
url: /2016/06/28/retrospektiva-virtualizacija-linux-kontejneri-i-proxmox-ve/
featured_image: /wp-content/uploads/2015/12/ProxMox-small.jpg
categories:
  - Hardware
  - Linux
  - Open Source projekti
  - Predavanja
  - Vijesti
  - Zanimljivosti

---
18.6.2016 održalo se predavanje &#8220;Virtualizacija, linux kontejneri i Proxmox VE&#8221;.

&nbsp;

Pogledajte kako je bilo:

 <img class="alignnone size-full wp-image-2193" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/Virtualizacija-i-ProxmoxVE-1.jpg?resize=1100%2C619&#038;ssl=1" alt="Virtualizacija i ProxmoxVE -1" width="1100" height="619" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/Virtualizacija-i-ProxmoxVE-1.jpg?w=1100&ssl=1 1100w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/Virtualizacija-i-ProxmoxVE-1.jpg?resize=150%2C84&ssl=1 150w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/Virtualizacija-i-ProxmoxVE-1.jpg?resize=300%2C169&ssl=1 300w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/Virtualizacija-i-ProxmoxVE-1.jpg?resize=768%2C432&ssl=1 768w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/Virtualizacija-i-ProxmoxVE-1.jpg?resize=1024%2C576&ssl=1 1024w" sizes="(max-width: 1000px) 100vw, 1000px" data-recalc-dims="1" /><img class="alignnone size-full wp-image-2194" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/Virtualizacija-i-ProxmoxVE-2.jpg?resize=1100%2C619&#038;ssl=1" alt="Virtualizacija i ProxmoxVE -2" width="1100" height="619" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/Virtualizacija-i-ProxmoxVE-2.jpg?w=1100&ssl=1 1100w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/Virtualizacija-i-ProxmoxVE-2.jpg?resize=150%2C84&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/Virtualizacija-i-ProxmoxVE-2.jpg?resize=300%2C169&ssl=1 300w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/Virtualizacija-i-ProxmoxVE-2.jpg?resize=768%2C432&ssl=1 768w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/Virtualizacija-i-ProxmoxVE-2.jpg?resize=1024%2C576&ssl=1 1024w" sizes="(max-width: 1000px) 100vw, 1000px" data-recalc-dims="1" />

&nbsp;

# O čemu smo razgovarali ?

&nbsp;

## Zbog čega uopće koristiti virtualizaciju

Upotrebom virtualizacije u odnosnu na tradicionalne sustave, instalirane direktno na hardver:

  * Smanjujemo troškove održavanja
  * Ubrzavamo proces izrade sigurnosne kopije cijelog operacijskog sustava i svih podataka unutar njega. Naime cijelo virtualno računalo je jedna datoteka koja se obično komprimira zajedno sa svim podacima o virtualiziranom hardveru od kojega se “sastoji” to virtualno računalo : 
      * disk kontroler,
      * vrsta i veličina diska,
      * količina dostupne RAM memorije,
      * mrežne kartice i sl.
  * Drastično ubrzavamo proces povratka cijelog operacijskog sustava i svih podataka uslijed nekog kvara ili problema u radu. Kao što smo rekli – praktično cijelo virtualno računalo je jedna jedina datoteka koju treba “vratiti” nazad iz sigurnosne kopije, na nekom drugom fizičkom računalu, bez ikakvih dodatnih intervencija poput : 
      * instalacije operacijskog sustava
      * instalacije svih upravljačkih programa
      * instalacije i konfiguracije svih aplikacija
      * povratka svih podataka i sl

u globalu pojednostavljuje se management svih virtualiziranih računala

&nbsp;

## Kako radi virtualizacija

&nbsp;

Za virtualizaciju je potrebna određena platforma odnosno takozvani “Hypervisor” operacijski sustav, bilo samostalan ili unutar ostojećeg operacijskog sustava, a koji ima mogućnost kreiranja virtualiziranog okruženja za naša virtualna računala.

Naučili smo da postoje dvije kategorije platformi za virtualizaciju:

<ul style="list-style-type: circle;">
  <li>
    &#8220;<strong>Type 2</strong>&#8221; koji se zapravo pokreću na već instaliranom operacijskom sustavu, Najčešće korisšteni su : <strong>VirtualBox</strong> i <strong>VMware player/workstation</strong> i sl. Oni u pravilu nisu namjenjeni za &#8220;produkcijsku&#8221; upotrebu jer (namjerno) nemaju sve alate i mogučnosti &#8220;samostojećih&#8221; sustava za virtualizaciju. S druge strane zbog čega bi netko razvijao i istovremeno rješenje poput &#8220;<strong>VMware player/workstation</strong>&#8221; i &#8220;<strong>VMware ESXi</strong>&#8220;
  </li>
</ul>

&nbsp;

<ul style="list-style-type: circle;">
  <li>
    &#8220;<strong>Type 1</strong>&#8221; su oni koji su &#8220;samostojeći&#8221; operacijski sustavi s pripadajućim Hypervizorom. Cijeli &#8220;paket&#8221; : OS + Hypervizor je optimiziran za virtualizaciju te ne sadrži nepotrebne programe ili alate. Predstavnici ove grupe su : VMware ESXi , Xen Server, Microsoft Hyper-V (iako je on prema logici rada nešto između ova dva tipa), OpenStack i naravno Proxmox VE.
  </li>
</ul>

Virtualizirano okruženje kreira sve resurse hardvera koji i inače postoje na svakom računalu, ali virtualno odnosno simulira ih se i to počevši od :

<ul style="list-style-type: circle;">
  <li>
    Matične ploče, njenog BIOSa i svih njenih funkcionalnosti,
  </li>
  <li>
    Centralnog procesora (CPU) i pristupa RAM memoriji
  </li>
  <li>
    Disk kontrolera, njegovog BIOSa i njegove funkcionalnosti
  </li>
  <li>
    Tvrdog diska, CD/DVD-ROMa i drugih uređaja
  </li>
  <li>
    Mrežne kartice, njenog BIOSa i svih njenih funkcionalnosti<br /> … itd.
  </li>
</ul>

Dakle virtualizira (simulira) se svaka komponenta računala, koja se onda dodjeljuje našem virtualnom računalu. Na to virtualno računalo se potom normalno instalira cijeli operacijski sustav od “nule”, sa svim upravljačkim programima, našim aplikacijama i sl.
  
U inicijalnom dijelu instalacije operacijskog sustava unutar virtualnog računala, kada se instaliraju upravljački programi, instaliraju se upravljački programi za virtualne komponente našeg virtualnog računala, koje nam je ddijelio “Hypervisor”.

Ako smo recimo kao disk kontroler za naše virtualno računalo unutar “Hypervisor”-a odabrali IDE (ATA) disk kontroler, tada ćemo dobiti primjerice virtualiziran PIIX3 disk kontroler, sa svojim pripadajućim BIOS-om i svim svojim funkcionalnostima.

Dakle u trenutku kada krenemo s instalacijom našeg virtualnog računala (pr. sa ISO image-a od našeg operacijskog sustava), kada se budu morali instalirati upravljački programi za disk kontroler – biti će odabran PIIX3 disk kontroler. Ista je stvar sa svakom dugom komponentom našeg budućeg virtualnog računala.

Operacijski sustav i sve aplikacije unutar virtualnog računala nisu svjesne da se nalaze unutar virtualnog računala te se ponašaju kao da su instalirane na “normalno” računalo.

Za efikasnu virtualizaciju, potrebna je i podrška centralnog procesora (CPU), a koja može drastično ubrzati sve procese potrebne za virtualizaciju:

<ul style="list-style-type: circle;">
  <li>
    Intel ovu funkcionalnost unutar centralnog procesora naziva VT-x a AMD ju naziva AMD-V.
  </li>
</ul>

Ovakvu vrstu virtualizacije nazivamo i puna virtualizacija (engl. Full Virtualization).

&nbsp;

&nbsp;

&nbsp;

**Upoznali smo se i s logičkom shemom &#8220;Type 1&#8221; platformi za virtualizaciju.
  
** 

&nbsp;

Ovdje imamo pripadnike rješenja koja su inicijalno zamišljena i razvijana za velika okruženja sa stotinama ili tisučama poslužitelja.

&nbsp;

&nbsp;

Osnovna dva predstavnika (prema logičkoj implementaciji ) su :

**VMware ESXi** te **Microsoft Hyper-V** (kao i **Xen Server**).

Njihova ideja je instalacija osnovnog Hypervizora na direktno na poslužitelj (zbog toga pripadaju kategoriji &#8220;**Type-1**&#8220;) a uz koje dobivamo samo osnovne funkcionalnosti (koje imamo i u &#8220;**VMware player/workstation**&#8221; ili &#8220;**Virtual Box**&#8220;-u) te malo više od doga.

Sve važne funkcionalnosti koje stvarno želimo od ovakvog sustava dobivamo instalacijom Tzv. &#8220;Virtual Appliance&#8221;-a odnosno virtualnog računala koje se pokreće unutar Hypervizora.

&nbsp;

Kod ESXi rješenja je to obično virtualka koja se zove &#8220;vCenter Server&#8221; tj. &#8220;VCSA&#8221; koja u najosnovnijoj konfiguraciji ima integriran Tzv. &#8220;Embedded Platform Controler&#8221; koji pokreće postgreSQL bazu podataka u koju se snimaju sve konfiguracijske posstavke :

  * od konfiguracije svakog virtualnog računala
  * preko mrežne konfiguracije svakog poslužitelja i virtualnih računala
  * do konfiguracije clustera kao i drugih &#8220;Virtual Appliance&#8221; tj, virtzalki.

Klijenti koji se spajaju na management sučelje se zapravo spajaju na gore navedenu virtualku, koja nakon dodavanja svakog pojedinog ESXi poslužitelja u vCenter/vSphere, postaje svjesna i svih virtualki te naravno svih ostalih komponenti cijelog sustava.

Jedan od primjera je i Backup funkcionalnost. Naime unutar ESXi+vCenter/vSphere funkcionalnost backupa je na razini rješenja koja su dostupna i na VirtualBox/VMware Player/Workstation &#8220;Type 2&#8221; sustavima. Dakle praktično samo ručni backup pojedine virtualke.

Ako žeimo imalo više od toga &#8211; pr. automatiziranu izradu backupa svekih x dana, potrebno je kupiti profesionalni sustav za izradu backupa &#8211; koji dolazi kao zasebna (još jedna) virtualka. Jedno od VMware certificiranih rješenja je i rješenje (virtualka) tvrtke &#8220;[VEEAM][1]&#8221; koja nudi i cijeli niz naprednih mogućnosti za backup i restore, podršku za [tračne uređaje][2], inkrementalni backup i desetke drugih stvari koje su važne za podatkovne centre.

&nbsp;

**Da sumariziramo ovaj koncept**

U slučaju potrebe za dodatnim funkcionalnostima, uglavnom se stvar svodi ili na plačanje i otključavanje funkcionalnosti ili na instalaciju još jednog &#8220;Virtual Appliance-a&#8221; tj. dodatne virtualke (obično uz plačanje iste).

&nbsp;

&nbsp;

VMware ESXi logička shema rada:

<img class="alignnone size-full wp-image-2195" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/VMware-ESXi.jpg?resize=960%2C540&#038;ssl=1" alt="VMware ESXi" width="960" height="540" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/VMware-ESXi.jpg?w=960&ssl=1 960w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/VMware-ESXi.jpg?resize=150%2C84&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/VMware-ESXi.jpg?resize=300%2C169&ssl=1 300w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/VMware-ESXi.jpg?resize=768%2C432&ssl=1 768w" sizes="(max-width: 960px) 100vw, 960px" data-recalc-dims="1" />

&nbsp;

Kod Microsoft &#8220;Hyper-V&#8221; rješenja stvar je slična kao kod &#8220;**VMware** **ESXi**&#8221; s time da se ovdje nudi nekoliko &#8220;Virtual Appliance&#8221;-a odnosno virtualki od kojih svaka pokriva jedan dio funkcionalnosti, tako imamo :

  * &#8220;System Center Virtual Machine Manager&#8221; virtualku,
  * &#8220;System Center Configuration Manager&#8221; virtualku ,
  * &#8220;System Center Operation Manger&#8221; virtualku,

I ovdje se sve konfiguraciju pohranjuju na (ovaj puta) Microsoft SQL Server koji mora biti negdje instaliran (obično unutar neke četvrte virtualke).

&nbsp;

Microsoft Hyper-V:

<img class="alignnone size-full wp-image-2197" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/MS-Hyper-V.jpg?resize=960%2C540&#038;ssl=1" alt="MS Hyper-V" width="960" height="540" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/MS-Hyper-V.jpg?w=960&ssl=1 960w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/MS-Hyper-V.jpg?resize=150%2C84&ssl=1 150w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/MS-Hyper-V.jpg?resize=300%2C169&ssl=1 300w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/MS-Hyper-V.jpg?resize=768%2C432&ssl=1 768w" sizes="(max-width: 960px) 100vw, 960px" data-recalc-dims="1" />

&nbsp;

**Kod oba gore navedena pristupa možemo si postaviti pitanje : što je s redundancijom (zalihosti) ?**

Točnije što ako (kada) se prvi poslužitelj na kojemu se nalazi virtualka koja je &#8220;Kontroler i Web GUI&#8221; sruši ili pokvari. Želimo ipak redundanciju i njegove funkcionalnosti jer ne žalimo izgubiti dane na reinstalaciju novog poslužitelja, pa (u najbojem slučaju) povrat virtualke iz backupa.

&nbsp;

Odgovor je &#8211; postoje rješenja od strane oba proizvođaća koja uz potrebu za uvođenjem dodatnih komponenti koje osiguravaju osnovu za redundantan rad, donose i potrebu za minimalnim dupliciranjem svih gore navedenih virtualnih računala. Naravno od kojih bi se svaki moralo pokretati na drugom fizičkom poslužitelju (da bi cijeli suatav bio otporan na ispad bilo kojeg fizičkog poslužitelja).  Sada nismo niti došli do redundantnog sustava za pohranu podataka (virtualki) : dakle nekog NAS/SAN sustava, ta komponenta je podržana djelom od oba proizvođaća a djelom od trećih tvrtki koji prodaju takve (profesionalne) sustave.

&nbsp;

&nbsp;

**Drugoj gupi pripada OpenStack**

Ovo rješenje je slično kao prethodna dva, s time da ovdje nema potrebe za instaliranjem virtualnih računala koja nude određene funkcionalnosti, već se to postiže instaliranjem Tzv &#8220;Rola&#8221; ili uloga, na svaki fizički poslužitelj.

&nbsp;

Tako nam je za minimalno funkcioniranje sustava potrebna minimalno jedna instalacijua &#8220;Kontrolera sa svojom pripadajućim SQL serverom&#8221; na koji se pohranjuju sve konfiguracije.

Dodatno potrebna nam je  i &#8220;Network&#8221; rola &#8211; tj. poslužitelj koji ima pristup svim unutarnjim i vanjskim mrežama i preko kojeg prolazi mrežni promet : unutra <-> van .  Ova komponenta/role-a se zove &#8220;**Neutron**&#8221;

Svi ostali poslužitelji na kojima se pokreću virtualke, moraju imati &#8220;role&#8221;-u , odnosno ulogu &#8220;Compute&#8221; poslužitelja, koja se zove  &#8220;**Nova**&#8220;.

Još nam trebaju i slijedeće &#8220;Role&#8221;:

  * &#8220;Horizon&#8221; je zadužen za Web sučelje
  * &#8220;Keystone&#8221; za korisničke račune, &#8220;policy&#8221; i sl .(Identity service),
  * U slučaju da nam trebaju template-i , tada nama treba i &#8220;Heat&#8221;,
  * Kao &#8220;Block storage&#8221; se koristi komponenta koja se zove &#8220;Cinder&#8221;,
  * &#8220;Glance&#8221; je manager za image-e virtualki ,
  * tu je još i cijeli niz drugih komponenti

Logička shema OpenStack-a:

<img class="alignnone size-full wp-image-2196" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/OPenStack.jpg?resize=960%2C540&#038;ssl=1" alt="OPenStack" width="960" height="540" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/OPenStack.jpg?w=960&ssl=1 960w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/OPenStack.jpg?resize=150%2C84&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/OPenStack.jpg?resize=300%2C169&ssl=1 300w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/OPenStack.jpg?resize=768%2C432&ssl=1 768w" sizes="(max-width: 960px) 100vw, 960px" data-recalc-dims="1" />

&nbsp;

**Što je s redundancijom OpenStacka ?**

Nudi se slično rješenje kao kod &#8220;**VMware ESXi**&#8221; i &#8220;**Microsoft Hyper-V**&#8221; dakle prvo instalacija i konfiguracija komponenti koje su preduvjet za redundaniciju te konfiguraciju &#8220;poduplanih&#8221; &#8220;Role&#8221;-a , na više fizičkih poslužitelja.

&nbsp;

To kreće od SQL poslužitelja koji sada mora biti redundantan i po mogućnosti u &#8220;Multi-Master&#8221; konfiguraciji ispred kojega mora biti instaliran Load Balancer, koji isto mora biti redundantan a ispred njega neka Layer 3 (na IP sloju) komponenta koja isto mora biti redundantna.

I sve druge &#8220;Role&#8221; moraju biti posebno (&#8220;poduplano&#8221;) instalirane na različitim fizičkim poslužiteljima te konfigurirane za ovakav način rada.

&nbsp;

Sve navedeno drastično  komplicira dizajn i znanja potrebna za otkrivanje grešaka, kada se jednom pojave.

&nbsp;

**Prva i druga grupa &#8211; zbog čega ovakav dizajn ?.**

Zbog same namjene u kojoj će se ovakvi sustavi integrirati unutar podatkovnih centara sa tisućama i tisućama poslužitelja i desecima ili stotinama tisuća virtualnih računala. OSim toga postoji i potreba korisnika da svatko (kao tvrtka ili korisnik) ima svoju izoliranu mrežu i IP adresni prostor (Virtual Private Cloud) unutar postojećeg ogromnog sustava.

&nbsp;

&nbsp;

**I na kraju i Proxmox VE**

Ovdje smo došli do potpuno drugačijeg dizajna, zbog potpuno drugačije namjene.

Proxmox VE je namjenjen za manja okruženja i ograničen je &#8211; u staroj verziji 3.x na 16. a u novoj v.4.x na, do maksimalno, 32. fizička poslužitelja.

&nbsp;

Zbog potpuno drugačije namjene i sam dizajn je potpuno drugačiji iako i ovdje imamo slične komponente.

&nbsp;

I dalje imamo mjesto gdje se pohranjuju apsolutno sve konfiguracije : od konfiguracija svake virtualke ili mrežnih komponenti, preko sustava za pohranu podataka, firewall-a i sl.

Ali pošto je ovo manji sustav od gore navedenih, stoga je bio moguć kompromis. Nema potreba za SQL serverom, i njegovom redundanijom jer možemo imati &#8220;samo&#8221; 32 fizička poslužitelja. To u praksi znači da nećemo  imati tisuće i tisuće virtualnih računala u našem podatkovnom centru, već  vrlo vjerojatno &#8220;samo&#8221; nekoliko stotina virtualki i/ili linux kontejnera, pa nam stvarno ne treba SQL poslužitelj ili cluster SQL poslužitelja (u slučaju redundancije).

Ekipa iz Proxmox VE se odlućila upogoniti &#8220;Corosync&#8221; kao višestuko dokazan clusterski sutav ispred kojeg se nalazi datotečni sustav koji se  sinkronizira između svih poslužitelja koji se nalaze u Proxmox VE clusteru.

Ovdje se radi o &#8220;[Proxmox cluster file system][3]&#8221; rješenju :

  * stabilno je (u produkcijskoj je upotrebi cijeli niz godina),
  * pouzdano je i otporno na ispade bilo kojeg poslužitelja (ili više njih &#8211; ovisno o njihovom broju),
  * distribuirano &#8211; svi poslužitelji imaju pristup svim konfiguracijskim datotekama u svakom trenutku
  * sve promjene na bilo kojoj konfiguracijskoj datoteci su vidljive svim Proxmox VE poslužiteljima u clusteru, trenutno &#8211; čim se promjena dogodila

&nbsp;

Naime svaka promjena bilo koje konfigutacije se odmah sinkronizira sa svim poslužiteljima, tako je već u startu sve redundantno.

&nbsp;

Dodatno i uloga &#8220;Kontrolera&#8221; odnosno poslužitelja na koji se spajamo preko Web sučelja je isto redundantna jer se ovdje možemo spojiti na bilo koji poslužitlj u Proxmox VE clusteru &#8211; jer oni ionako dijele sve konfiguracije preko clusterskog dijeljenog datotečnog sustava.

U konačnici je svejedno na koji ste se fizički poslužitelj spojili preko Web sučelja &#8211; svi oni &#8220;vide&#8221; sve ostale poslužitelje, sve konfiguracijske datoteke, sve virtualke i sve ostalo što je potrebno za rad.

&nbsp;

Možemo reći da ako smo kreirali Proxmox VE cluster sa tri (ili više) poslužitelja u njemu, tada imamo trostruku (ili više) redundanciju što se tiće managementa i konfiguracije.

Nadalje ostaje pitanje s redundantim sustavom za pohranu podataka (NAS/SAN), kao i kod drugih sustava (što se nudi po tom pitanju pogledajte dalje u tekstu)

&nbsp;

Možemo rreći i da je svaki fizički poslužitelj u Proxmox VE clusteru :

  * i &#8220;Kontroler&#8221;  poslužitelj,
  * i &#8220;Web poslužitelj,
  * i &#8220;Identity&#8221; poslužitelj  (korisnički računi i grupe, prava pristupa),
  * i SQL poslužitelj (barem njegov ekvivalent),
  * i &#8220;Network&#8221; poslužitelj,
  * i &#8220;Compute&#8221; poslužitelj odnosno &#8220;Hypervisor&#8221; poslužitelj
  * i još štošta

&nbsp;

Ništa dodatno se ne mora instalirati na Proxmox VE poslužitelje &#8211; sve je već dostupno i spremno za rad.  Potrebno je samo znanje za konfiguraciju svega što vam treba za rad.

&nbsp;

Pogledajmo i logičku shemu:

&nbsp;

<img class="alignnone size-full wp-image-2198" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/Proxmox-VE.jpg?resize=960%2C540&#038;ssl=1" alt="Proxmox VE" width="960" height="540" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/Proxmox-VE.jpg?w=960&ssl=1 960w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/Proxmox-VE.jpg?resize=150%2C84&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/Proxmox-VE.jpg?resize=300%2C169&ssl=1 300w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/Proxmox-VE.jpg?resize=768%2C432&ssl=1 768w" sizes="(max-width: 960px) 100vw, 960px" data-recalc-dims="1" />

&nbsp;

&nbsp;

## Zbog čega je važno da platforma za virtualizaciju podržava i Linux kontejnere

Upotrebom Linux kontejnera štedimo hardverske resurse te u konačnici dobivamo na brzini rada. Samim time dobivamo na mogućnosti da na istom hardveru pokrećemo znatno veći broj linux kontejnera nego što bi mogli pokrenuti klasičnih virtualnih računala.

Kao što smo rekli – klasična virtualizacija mora virtualizirati (simulirati) svaku pojedinu komponentu našeg virtualnog računala.  Ovaj proces kod klasične virtualizacije troši hardverske resurse, pogotovo čim više virtualnih računala imate na sustavu jer svako od njih mora imati virtualizirane (simulirane) sve komponente računala.

Ako primjerice imamo deset virtualnih računala tada hypervisor mora virtualizirati (simulirati) deset matičnih ploča, deset disk kontrolera, deset diskova, …. (resursi, resursi).

&nbsp;

### Što su uopće Linux kontejneri ?

Linux kontejneri su jedan oblik virtualizacije ali na razini operacijskog sustava Linux, unutar kojega se pokreću izolirani Linux operacijski sustavi odnosno Linux kontejneri.

Ovdje se ne radi o virtualnim računalima već o izoliranom pokretanju novih instanci linuxa. Dakle pokretanje linuxa unutar postojećeg linuxa.

U svakom slučaju nema cijelog niza slojeva virtualizacije i simulacije virtualiziranog hardvera.

Rad linux kontejnera se svodi na pristup već postojećem (instaliranom) linuxu, odnosno njegovom kernelu i sistemskim pozivima, kroz samo jedan kontrolni sloj, koji dodaje potrebna ograničenja odnosno prava pristupa na dostupne resurse.

U ovom sloju se ograničava pristup na dostupan broj centralnih procesora (pr. dozvoljavamo samo 2 CPU jezgre za pojedini linux kontejner), količinu RAM memorije, diskovnog prostora i sl.

Već je iz ovoga vidljivo da to sve mora raditi brže nego klasična virtualizacija, ali i istovremeno biti štedljivije prema dostupnim resursima.

Jedan linux kontejner je za linux koji ga “opslužuje” samo novi niz linux procesa, ništa više.

Pogledajmo izlistanje svih pokrenutih procesa na <a id="g0" class="xx" name="greska"></a>Proxmox VE <a id="g3" class="promijenjenaRijec" name="greska"></a>platformi (koja je u pozadini također malo optimiziran <a id="g4" class="ll" name="greska"></a>debian linux) te se fokusirajmo na označene procese:

Slika 1: Prikaz svih Linux procesa na Proxmox VE v.3.x (ovdje se radi o OpenVZ linux kontejnerima):

<img class="alignnone size-full wp-image-2062" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-Linux-kontejner-procesi-pogled.jpg?resize=612%2C445&#038;ssl=1" alt="ProxMox-Linux-kontejner-procesi-pogled" width="612" height="445" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-Linux-kontejner-procesi-pogled.jpg?w=612&ssl=1 612w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-Linux-kontejner-procesi-pogled.jpg?resize=150%2C109&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-Linux-kontejner-procesi-pogled.jpg?resize=300%2C218&ssl=1 300w" sizes="(max-width: 612px) 100vw, 612px" data-recalc-dims="1" />

Slika 2. Pogledajmo kako to izgleda na novoj verziji Proxmox VE 4.x. (ovdje se radi o LXC linux kontejnerima):

<img class="alignnone size-full wp-image-2071" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/LXC-Linux-containers-process-view.jpg?resize=996%2C422&#038;ssl=1" alt="LXC Linux containers - process view" width="996" height="422" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/LXC-Linux-containers-process-view.jpg?w=996&ssl=1 996w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/LXC-Linux-containers-process-view.jpg?resize=150%2C64&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/LXC-Linux-containers-process-view.jpg?resize=300%2C127&ssl=1 300w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/LXC-Linux-containers-process-view.jpg?resize=768%2C325&ssl=1 768w" sizes="(max-width: 996px) 100vw, 996px" data-recalc-dims="1" />

Na slikama gore vidimo sve procese koji su od Proxmox VE linuxa (crno) te sve procese koji su od jednog linux kontejnera (crveno).

Za one koji poznaju linux malo bolje – pogledajte **init** procese (za sve ostale – malo proučite ( [1.][4] i [2.][5] ) :

Za Proxmox VE v.3.x (slika 1):

  * Prvi  **init** (gore) je **init** od samog Proxmox VE linuxa i on pokreče sve ostale procese,
  * Drugi **init** (dolje) je **init** od linux kontejnera i on pokreće sve procese od tog linux kontejnera

Za Proxmox VE v.4.x (slika 2):

  * Prvi proces je **systemd** (gore) od samog Proxmox VE linuxa (on je nova generacija **init** procesa) i on pokreče sve ostale procese,
  * **init** (dolje) je **init** od linux kontejnera i on pokreće sve procese od tog linux kontejnera

&nbsp;

Vrlo jednostavno i učinkovito. Osim toga nije potrebna nikakva hardverska podrška unutar centralnog procesora.

&nbsp;

I na kraju da ne bi bilo zabune: Linux kontejneri mogu pokretati samo i isključivo Linux operacijski sustav.

&nbsp;

# Proxmox VE

Nekoliko činjenica o ovoj platformi:

<ul style="list-style-type: circle;">
  <li>
    Prva stabilna verzija je razvijena 2008 s podrškom za Virtualizaciju i Linux kontejnere  (OpenVZ)
  </li>
  <li>
    U potpunosti je &#8220;Open Source&#8221; bez skrivenih i nedostupnih funkcionalnosti
  </li>
  <li>
    Koristi se na preko 120 000 računala/poslužitelja u više od 140 zemalja svijeta
  </li>
  <li>
    Aktivna zajednica broji oko 29 500 članova (forum)
  </li>
  <li>
    GUI je preveden na 19 jezika
  </li>
  <li>
    Više od 6 500 korisnika plaća komercijalnu podršku
  </li>
</ul>

&nbsp;

**Osnovni hardverski zahtjevi platforme su:**

  * 64. bitni CPU s hardverskom virtualizacijom (Intel VT-x ili AMD-V)
  * 2 GB RAM
  * 20 GB Diskovnog prostora
  * 100Mbps LAN

&nbsp;

**Sama platforma koristi u praksi višestruko provjerene i dokazane servise i tehnologije:**

  * Za virtualizaciju se koristi [Linux KVM][6] (Kernel Based Virtual Machine) koji je dokazan dugim nizom godina rada u produkciji
  * Za Linux kontejnere se koristi : 
      * za verziju 3.x : [OpenVZ,][7] koji je također u produkciji godinama
      * a za verziju 4.x : [LXC,][8] koji je noviji ali se također dokazao u produkciji
  * Za Proxmox klasterski datotečni sustav je razvijen [**pmxcfs**][9] koji se oslanja na “[Corosync Cluster Engine][10]) a koji je također dokazan u produkciji 
      * Za ostale klasterske funkcionalnosti se koriste **RedHat Cluster** i drugi provjereni i produkcijski dokazani alati.
  * Za mrežni model se koriste : 
      * Linux mrežne komponenete ([Bridge][11]/[Bond][12]/…) i/ili
      * [OpenvSwitch][13] (Bridge/Bond/…) mrežne komponente
  * …

&nbsp;

## Što nam sve nudi Proxmox VE

&nbsp;

### **Centralizirani management**

  * Centralizirani management je dostupan na svim poslužiteljima unutar Proxmox klastera a koji se automatski sinkronizira između svih poslužitelja u klasteru.
  * Ne postoji jedan ili nekolicina poslužitelja nadležnih za management već su to apsolutno svi poslužitelji unutar Proxmox klastera u takozvanoj Multi-Master konfiguraciji. Ovo je standardna funkcionalnost ProxmoxVE klastera.

Slika – Proxmox klaster – centralizirani management s tri Proxmox VE poslužitelja

(Pogled na jedan poslužitelj [**pve-2-51**]) i njegove resurse:

<img class="alignnone size-full wp-image-2199" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/Prox-1.jpg?resize=998%2C745&#038;ssl=1" alt="Prox-1" width="998" height="745" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/Prox-1.jpg?w=998&ssl=1 998w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/Prox-1.jpg?resize=150%2C112&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/Prox-1.jpg?resize=300%2C224&ssl=1 300w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/Prox-1.jpg?resize=768%2C573&ssl=1 768w" sizes="(max-width: 998px) 100vw, 998px" data-recalc-dims="1" />

Slika : Pogled na cijeli Proxmox klaster sa svim fizičkim poslužiteljima :

<img class="alignnone size-full wp-image-2200" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/Prox-2.jpg?resize=994%2C742&#038;ssl=1" alt="Prox-2" width="994" height="742" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/Prox-2.jpg?w=994&ssl=1 994w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/Prox-2.jpg?resize=150%2C112&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/Prox-2.jpg?resize=300%2C224&ssl=1 300w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/Prox-2.jpg?resize=768%2C573&ssl=1 768w" sizes="(max-width: 994px) 100vw, 994px" data-recalc-dims="1" />

  * Moguće je koristiti i REST [web API][14] za izradu svojih funkcionalnosti prema potrebi,
  * Centralizirani management je moguće definirati prema specifičnim korisničkim grupama, korisnicima ili akcijama (pravima) koje su dozvoljene za njih.
  * Autentikacija je moguća i preko vanjskih servisa popu Acive Directory-ja ili  LDAP-a

Slika: Autentikacija preko postojećeg Active Directory poslužitelja:

<img class="alignnone size-full wp-image-2201" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-AD.jpg?resize=1003%2C752&#038;ssl=1" alt="ProxMox-AD" width="1003" height="752" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-AD.jpg?w=1003&ssl=1 1003w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-AD.jpg?resize=150%2C112&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-AD.jpg?resize=300%2C225&ssl=1 300w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-AD.jpg?resize=768%2C576&ssl=1 768w" sizes="(max-width: 1000px) 100vw, 1000px" data-recalc-dims="1" />

&nbsp;

  * Dostupan je i cijeli niz gotovih Linux kontejnera – direktno preko centraliziranog web sučelja.

Slika:  Dostupni Linux kontejner template-i v.3.x (intenzivno se radi i na LXC template-ima za verziju 4.x):

<img class="alignnone size-full wp-image-2202" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-Templates.jpg?resize=543%2C552&#038;ssl=1" alt="ProxMox-Templates" width="543" height="552" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-Templates.jpg?w=543&ssl=1 543w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-Templates.jpg?resize=148%2C150&ssl=1 148w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-Templates.jpg?resize=295%2C300&ssl=1 295w" sizes="(max-width: 543px) 100vw, 543px" data-recalc-dims="1" />

Preko centraliziranog i klasteriziranog grafičkog sučelja omogućen je i konzolni pristup na bilo koje virtualno računalo ili linux kontejner.

Osim toga, moguć je pristup na konzolu bilo kojeg virtualnog računala ili linux kontejnera i preko noVNC, VNC i [Spice][15] klijenata.

&nbsp;

Slika: Konzolni pristup na virtualno računalo s Debian Linuxom iz Web sučelja:

<img class="alignnone size-full wp-image-2203" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-konzola.jpg?resize=994%2C741&#038;ssl=1" alt="ProxMox-konzola" width="994" height="741" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-konzola.jpg?w=994&ssl=1 994w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-konzola.jpg?resize=150%2C112&ssl=1 150w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-konzola.jpg?resize=300%2C224&ssl=1 300w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-konzola.jpg?resize=768%2C573&ssl=1 768w" sizes="(max-width: 994px) 100vw, 994px" data-recalc-dims="1" />

&nbsp;

### **Backup sustav** 

  * Zadužen je za izradu sigurnosnih kopija virtualnih računala ili linux kontejnera. Integriran je za cijeli klaster Proxmox VE poslužitelja. Podržava razne metode izrade sigurnosnih kopija :
  * “Stop/Start” Virtualke/Linux kontejnera u trenutku izrade sigurnosne kopije ili
  * “Snapshot” Virtualke/Linux kontejnera u trenutku izrade sigurnosne kopije ili
  * “Suspend” Virtualke/Linux kontejnera u trenutku izrade sigurnosne kopije.

Backup sustav omogućava izradu sigurnosnih kopija na razini svake pojedine virtualke ili linux
  
kontejnera i to :
  
○ Ručno – za trenutnu željenu (odabranu) virtualku ili linux kontejner ili
  
○ Automatizirano prema vremenskim okvirima  (pr. svaki dan u točno određeno vrijeme ili sl.)

Slika : Automatizirana izrada backupa u zadano vrijeme:

<img class="alignnone size-full wp-image-2204" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-Automatski-Backup.jpg?resize=996%2C745&#038;ssl=1" alt="ProxMox-Automatski-Backup" width="996" height="745" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-Automatski-Backup.jpg?w=996&ssl=1 996w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-Automatski-Backup.jpg?resize=150%2C112&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-Automatski-Backup.jpg?resize=300%2C224&ssl=1 300w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-Automatski-Backup.jpg?resize=768%2C574&ssl=1 768w" sizes="(max-width: 996px) 100vw, 996px" data-recalc-dims="1" />

&nbsp;

### **Izrada snapshota**

  *  **Snapshot-i su** kopije virtualke u realnom vremenu, koji predstavljaju snimljeno stanje virtualke u tom trenutku. 
      * Moguća je izrada tkzv. “snapshot”-a bilo koje virtualke, u potpunosti bez njenog zaustavljanja – kao sigurnosne kopije u vremenu – dodatno uključujuči (ili ne) i stanje RAM memorije.

<img class="alignnone size-full wp-image-2205" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-Snapshot.jpg?resize=992%2C738&#038;ssl=1" alt="ProxMox-Snapshot" width="992" height="738" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-Snapshot.jpg?w=992&ssl=1 992w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-Snapshot.jpg?resize=150%2C112&ssl=1 150w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-Snapshot.jpg?resize=300%2C223&ssl=1 300w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-Snapshot.jpg?resize=768%2C571&ssl=1 768w" sizes="(max-width: 992px) 100vw, 992px" data-recalc-dims="1" />

**  U** bilo kojem trenutku se možete vratiti na bilo koji snapshot koji ste napravili u prošlosti – odnosno vratiti se u stanje rada vaše virtualke u vremenu**.**

&nbsp;

  * ### **Izrada template-a (gotovih predložaka ) i kloniranje istih**
    
      * **Moguća je izrada template-a (predložaka) virtualki** (a uskoro će biti moguće i za linux kontejnere). Ovom procedurom možemo pripremiti virtualku na koju ćemo instalirati sav potreban softver te od nje napraviti “template”. Taj template ili predložak   možemo kasnije klonirati i vrlo brzo kreirati nove funkcionalne virtualke koje će već imati instaliran i konfiguriran sav softver koji smo instalirali na template virtualku. 
          * Na osnovi Template-a virtualke moguće je raditi njene klonove :

Slika : Pogled na izrađeni template [ID template-a : **100 (jessie1-template)**] te odabir kloniranja tog template-a u novu virtualku –  ID nove virtualke: **116**

<img class="alignnone size-full wp-image-2206" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-Template.jpg?resize=998%2C745&#038;ssl=1" alt="ProxMox-Template" width="998" height="745" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-Template.jpg?w=998&ssl=1 998w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-Template.jpg?resize=150%2C112&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-Template.jpg?resize=300%2C224&ssl=1 300w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-Template.jpg?resize=768%2C573&ssl=1 768w" sizes="(max-width: 998px) 100vw, 998px" data-recalc-dims="1" />

&nbsp;

  * ### **Sustav visoke dostupnosti (HA System)** 
    
      * Proxmox VE klaster podržava do 16 fizičkih poslužitelja u klasteru (nova verzija 4.x do 32), bez ograničenja na broj jezgri CPU-a, RAM memorije ili diskova – za svaki fizički poslužitelj.

Dodatno konfiguriran Proxmox VE klaster, omogućava “**failover**” Virtualki ili Linux kontejnera odnosno njihovo automatsko podizanje u slučaju kvara ili održavanja fizičkog poslužitelja u klasteru. To se u pozadini odrađuje automatskim pokretanjem na drugom (ispravnom) fizičkom poslužitelju, automatizirano i bez naše intervencije.

Slika : Odabir virtualke ili Linux kontejnera koju/kojeg označavamo kao HA (otpornog na kvar bilo kojeg fizičkog poslužitelja )

<img class="alignnone size-full wp-image-2207" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-HA-node.jpg?resize=500%2C195&#038;ssl=1" alt="ProxMox-HA-node" width="500" height="195" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-HA-node.jpg?w=500&ssl=1 500w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-HA-node.jpg?resize=150%2C59&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-HA-node.jpg?resize=300%2C117&ssl=1 300w" sizes="(max-width: 500px) 100vw, 500px" data-recalc-dims="1" />

&nbsp;

Slika: Pogleda na cijeli Proxmox VE klaster i sve virtualke i linux kontejnere koji su označeni kao HA (pogledajte **HA Service Status –** vidimo dvije virtualke il linux kontejnera (110 i 111) označena kao **HA**):

<img class="alignnone size-full wp-image-2208" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-HA-Service-Status.jpg?resize=977%2C520&#038;ssl=1" alt="ProxMox-HA-Service-Status" width="977" height="520" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-HA-Service-Status.jpg?w=977&ssl=1 977w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-HA-Service-Status.jpg?resize=150%2C80&ssl=1 150w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-HA-Service-Status.jpg?resize=300%2C160&ssl=1 300w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-HA-Service-Status.jpg?resize=768%2C409&ssl=1 768w" sizes="(max-width: 977px) 100vw, 977px" data-recalc-dims="1" />

&nbsp;

  * ### **Migracija virtualki ili linux kontejnera sa fizičkog poslužitelja na drugi fizički poslužitelj
  
** 
    
      *    Moguća je i ručna “**live**” **migracija** bilo kojeg (pojedinog) virtualnog računala ili Linux kontejnera koji je pokrenut na bilo kojem fizičkom poslužitelju unutar klastera, na drugi fizički poslužitelj  (prema želji), uključujuči i stanje RAM memorije.

Ovo se koristi primjerice  u slučajevima planiranog održavanja/gašenja pojedinog fizičkog poslužitelja. Važna osobina ove funkcionalnosti su  minimalni zastoji u radu željene virtualke ili linux kontejnera koji se prebacuje na drugi fizički server, u tijeku migracije.

Slika: Odabir virtualke ili linux kontejnera (br. 116) na Proxmox VE poslužitelju (**prox01**) koji želimo “na živo” migrirati na Proxmox VE poslužitelj **prox02**:

<img class="alignnone size-full wp-image-2209" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-Migrate.jpg?resize=349%2C131&#038;ssl=1" alt="ProxMox-Migrate" width="349" height="131" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-Migrate.jpg?w=349&ssl=1 349w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-Migrate.jpg?resize=150%2C56&ssl=1 150w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-Migrate.jpg?resize=300%2C113&ssl=1 300w" sizes="(max-width: 349px) 100vw, 349px" data-recalc-dims="1" />

&nbsp;

  * ## **Proxmox VE napredni Mrežni model  podržava:**
    
      * Firewall na razini : 
          * Cijelog klastera,
          * Pojedinog  fizičkog poslužitelja unutar klastera,
          * Pojedinog virtualnog računala ili Linux kontejnera
      * Linux model : 
          * Bridge,
          * Linux Bond (LACP, Balance-RR, Active backup, balance-xor, balance-tlb , balance-alb),
          * VLAN-ove i za Bridge i za Bond mod rada
      * Open vSwitch model: 
          * Bridge
          * Bond (LACP-balance SLB , LACP-balance-tcp, active-backup, balance-slb)
          * VLAN-ove i za Bridge i za Bond mod rada
          * Podržava i mnoge druge protokole (NetFlow, sFlow, SPAN, RSPAN, STP, Multiple Tunneling protocols,…)

Mrežni model nam omogućava i izolacije mreža &#8211; standardno pomoću VLAN-ova u kombinaciji s konfiguracijom mrežne opreme.

To nam daje potpunu izolaciju ali nam ne nudi (barem ne na jadnostavan način ) kreiranje nečega što bi bio &#8220;Virtual Private Cloud&#8221; u punom smislu rijeći.

S druge strane kome stvarno treba više od standardnih 1024 ili 4096 potpuno izoliranih VLAN-ova sa proizvoljnim odabirom IP adresnog prostora za svaki od njih.

&nbsp;

&#8230; govorimo ipak o okruženju za sve koji nemaju svoj podatkovni centar, pa su bili potrebni i neki kompromisi   :-).

&nbsp;

&nbsp;

<ul style="list-style-type: disc;">
  <li>
    <h2>
      <b>Proxmox VE podržava mnoge NAS ili SAN sustave za pohranu podataka  </b>
    </h2>
    
    <p>
      Na dolje odabranim sustavima za pohranu podataka možete pohranjivati:</li> 
      
      <li>
        same virtualke,
      </li>
      <li>
        Linux kontejnere,
      </li>
      <li>
        ISO image-a,
      </li>
      <li>
        Template-a ili
      </li>
      <li>
        Backupe  i sl.
      </li></ul> 
      
      <p>
        &nbsp;
      </p>
      
      <p>
        &nbsp;
      </p>
      
      <p>
        &nbsp;
      </p>
      
      <p>
        Sve ovisi o vašim potrebama.
      </p>
      
      <p>
        Što je trenutno dostupno kao sustav za pohranu podataka:
      </p>
      
      <p>
        &nbsp;
      </p>
      
      <ul>
        <ul>
          <li>
            LVM (Linux LVM2) za bilo koji “Block Device” ili lokalni disk
          </li>
          <li>
            iSCSI
          </li>
          <li>
            NFS
          </li>
          <li>
            CEPH RBD
          </li>
          <li>
            GlusterFS
          </li>
          <li>
            Directory (vidljivo kao direktorij na lokalno disku)
          </li>
          <li>
            ZFS
          </li>
        </ul>
      </ul>
      
      <p>
        Slika: Dodavanje &#8220;storage-a&#8221; u klaster  &#8211; za cijeli klaster ili samo za željene Proxmox VE poslužitelje:
      </p>
      
      <p>
        <img class="alignnone size-full wp-image-2210" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-Add-Storage.jpg?resize=187%2C357&#038;ssl=1" alt="ProxMox-Add-Storage" width="187" height="357" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-Add-Storage.jpg?w=187&ssl=1 187w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-Add-Storage.jpg?resize=79%2C150&ssl=1 79w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/ProxMox-Add-Storage.jpg?resize=157%2C300&ssl=1 157w" sizes="(max-width: 187px) 100vw, 187px" data-recalc-dims="1" />
      </p>
      
      <p>
        Od gore vidljivih NAS/SAN sustava, neki su razvijani kao redundantni i distribuirani &#8211; poput :
      </p>
      
      <ul>
        <li>
          <a href="https://en.wikipedia.org/wiki/GlusterFS">GlusterFS</a> ,
        </li>
        <li>
          <strong>RBD</strong> &#8211; CEPH <a href="http://ceph.com/ceph-storage/block-storage/">Rados Block Device</a> &#8211; pogledajte kako integrirati <a href="https://en.wikipedia.org/wiki/Ceph_(software)">CEPH</a> kao visoko distribuirani clusterizirani, redundantni sustav za pohranu podataka ( za virtualke i linux kontejnere ) :  &#8211;> <strong><sub>dokument je u izradi:</sub></strong>  <a href="https://www.opensource-osijek.org/dokuwiki/wiki:knjige:ceph-storage">https://www.opensource-osijek.org/dokuwiki/wiki:knjige:ceph-storage</a>
        </li>
        <li>
          Moguće je koristiti i <a href="https://www.drbd.org/en/">DRBD</a> ili <a href="https://www.linbit.com/en/p/products/drbd9">DRBD9</a> ali kao sloj ispod ili kao mrežnu komponentu (na drugim poslužiteljima), lokalno vidljivu kao <strong>Direktorij </strong>ili  direktno kao <strong>NFS</strong> ili <strong>iSCSI</strong>.
        </li>
      </ul>
      
      <p>
        &nbsp;
      </p>
      
      <p>
        &nbsp;
      </p>
      
      <p>
        &nbsp;
      </p>
      
      <p>
        <span style="color: #ff0000;"><strong>Osim svega navedenog tu su nam dostupni i deseci drugih naprednih mogućnosti te dodatne mogućnosti optimizacije svakog dijela sustava, prema hardveru ili vašim potrebama.</strong></span>
      </p>
      
      <p>
        &nbsp;
      </p>
      
      <p>
        &nbsp;
      </p>
      
      <h1>
        Podrška
      </h1>
      
      <p>
        Proxmox VE platforma, iako je razvijena i razvija se prema licenci otvorenog koda te je samim time dostupna svima na korištenje, nudi i komercijalnu podršku u nekoliko modela.
      </p>
      
      <p>
        &nbsp;
      </p>
      
      <p>
        Osnovni komercijslni modeli su vidljivi na slici dolje:
      </p>
      
      <p>
        <img class="alignnone size-full wp-image-2211" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/Proxmox-VE-pricing.jpg?resize=1051%2C408&#038;ssl=1" alt="Proxmox VE - pricing" width="1051" height="408" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/Proxmox-VE-pricing.jpg?w=1051&ssl=1 1051w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/Proxmox-VE-pricing.jpg?resize=150%2C58&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/Proxmox-VE-pricing.jpg?resize=300%2C116&ssl=1 300w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/Proxmox-VE-pricing.jpg?resize=768%2C298&ssl=1 768w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/Proxmox-VE-pricing.jpg?resize=1024%2C398&ssl=1 1024w" sizes="(max-width: 1000px) 100vw, 1000px" data-recalc-dims="1" />
      </p>
      
      <p>
        &nbsp;
      </p>
      
      <p>
        Nekako s terminom ovog predavanja dobili smo i tvrtku (našeg partnera) koja je postala partner i distributer Proxmox VE platforme za Hrvatsku:
      </p>
      
      <p>
        &nbsp;
      </p>
      
      <p>
        <a href="https://www.proxmox.com/en/partners/reseller/category/croatia"><img class="alignnone size-full wp-image-2212" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/06/suma-informatika-logo_1bf414a8457a9e8760240f8e11afe8251.png?resize=150%2C90&#038;ssl=1" alt="suma-informatika-logo_1bf414a8457a9e8760240f8e11afe825[1]" width="150" height="90" data-recalc-dims="1" /></a>
      </p>
      
      <p>
        &nbsp;
      </p>
      
      <p>
        Dakle od sada za komercijalnu podršku za Proxmox VE platformu možete kontaktirati tvtrku:
      </p>
      
      <p>
        &nbsp;
      </p>
      
      <p>
        <strong>Suma informatika</strong>
      </p>
      
      <p>
        Badalićeva 27
      </p>
      
      <p>
        <strong>1</strong>0000 Zagreb
      </p>
      
      <p>
        <a href="http://www.suma-informatika.hr/">http://www.suma-informatika.hr/</a>
      </p>
      
      <p>
        &nbsp;
      </p>
      
      <p>
        &nbsp;
      </p>

 [1]: https://www.veeam.com/vmware-esx-backup.html
 [2]: https://www.opensource-osijek.org/dokuwiki/wiki:knjige:uvod_u_linux#rad_s_tracnim_uredajima
 [3]: https://pve.proxmox.com/wiki/Proxmox_Cluster_file_system_(pmxcfs)
 [4]: https://www.opensource-osijek.org/dokuwiki/wiki:knjige:uvod_u_linux#procesi
 [5]: https://www.opensource-osijek.org/dokuwiki/wiki:knjige:uvod_u_linux#kako_to_radi_sistemski_dio
 [6]: http://www.linux-kvm.org/page/Main_Page
 [7]: https://en.wikipedia.org/wiki/OpenVZ
 [8]: https://en.wikipedia.org/wiki/LXC
 [9]: http://pve.proxmox.com/wiki/Proxmox_Cluster_file_system_%28pmxcfs%29
 [10]: http://corosync.github.io/corosync/
 [11]: https://wiki.debian.org/BridgeNetworkConnections
 [12]: https://en.wikipedia.org/wiki/Link_aggregation
 [13]: http://openvswitch.org/
 [14]: http://pve.proxmox.com/pve2-api-doc/
 [15]: http://www.spice-space.org/download.html