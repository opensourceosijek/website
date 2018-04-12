---
title: “Proxmox Server Solutions GmbH” je postao tehnološki partner inicijative “Open Source Osijek”
author: Hrvoje Horvat
type: post
date: 2015-12-24T12:44:13+00:00
url: /2015/12/24/proxmox-server-solutions-gmbh-je-postao-tehnoloski-partner-inicijative-open-source-osijek/
featured_image: /wp-content/uploads/2015/12/ProxMox-i-OpenSourceOsijek.jpg
categories:
  - Članci
  - Hardware
  - Linux
  - Open Source projekti
  - OS@OS
  - Vijesti
  - Zanimljivosti

---
**Ostvarili smo partnerstvo s tvrtkom “[Proxmox Server Solutions GmbH][1]” za platformu Proxmox Virtual Environment
  
** 

&nbsp;

Pred sam kraj ove godine (21.12.2015), tvrtka “Proxmox Server Solutions GmbH” koja je odgovorna za veći dio razvoja te komercijalnu podršku za “[Proxmox Virtual Environment][2]” postala je tehnološki partner inicijativi “Open Source Osijek”.

&nbsp;

Pri kraju smo i s pregovorima za proširenje partnerstva na druge usluge i servise tvrtke “Proxmox Server Solutions GmbH” a koji će se realizirati vrlo brzo, pošto smo prošli sve točke provjera i sva potrebna odobrenja.

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;

<img class="alignnone wp-image-2050" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-small.jpg?resize=656%2C105&#038;ssl=1" alt="ProxMox small" width="656" height="105" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-small.jpg?w=1154&ssl=1 1154w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-small.jpg?resize=150%2C24&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-small.jpg?resize=300%2C48&ssl=1 300w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-small.jpg?resize=768%2C123&ssl=1 768w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-small.jpg?resize=1024%2C164&ssl=1 1024w" sizes="(max-width: 656px) 100vw, 656px" data-recalc-dims="1" />

#  **A sada malo o Proxmox Virtual Environment platformi** 

&nbsp;

## **Instalacija i zahtjevi platforme**

Instalacija dolazi u obliku [ISO image-a][3], koji snimate na CD ili USB i s kojega instalirate cijeli (operacijski) sustav.

Proxmox VE je baziran na Debian distribuciji linuxa.

&nbsp;

## **Osnovni zahtjevi Proxmox platforme su :**

  * 64. bitni CPU s hardverskom virtualizacijom (Intel VT-x ili AMD-V)
  * 2 GB RAM
  * 20 GB Diskovnog prostora
  * 100Mbps LAN

&nbsp;

Naravno za zahtjevniju (ozbiljniju produkcijsku) upotrebu, potreban je i razmjerno snažniji hardver.

&nbsp;

Sama platforma koristi u praksi višestruko provjerene i dokazane servise i tehnologije:

  * Za virtualizaciju se koristi [Linux KVM][4] (Kernel Based Virtual Machine) koji je dokazan dugim nizom godina rada u produkciji
  * Za Linux kontejnere se koristi : 
      * za verziju 3.x : [OpenVZ,][5] koji je također u produkciji godinama
      * a za verziju 4.x : [LXC,][6] koji je noviji ali se također dokazao u produkciji
  * Za Proxmox klasterski datotečni sustav je razvijen [**pmxcfs**][7] koji se oslanja na &#8220;[Corosync Cluster Engine][8]) a koji je također dokazan u produkciji 
      * Za ostale klasterske funkcionalnosti se koriste **RedHat Cluster** i drugi provjereni i produkcijski dokazani alati.
  * Za mrežni model se koriste : 
      * Linux mrežne komponenete ([Bridge][9]/[Bond][10]/&#8230;) i/ili
      * [OpenvSwitch][11] (Bridge/Bond/&#8230;) mrežne komponente
  * &#8230;

&nbsp;

## Koje su prednosti Proxmox VE platforme

### 

### Zbog čega uopće koristiti virtualizaciju

Upotrebom virtualizacije u odnosnu na tradicionalne sustave, instalirane direktno na hardver:

  * Smanjujemo troškove održavanja
  * Ubrzavamo proces izrade sigurnosne kopije (engl. Backup) cijelog operacijskog sustava i svih podataka unutar njega. Naime cijelo virtualno računalo je jedna datoteka koja se obično komprimira zajedno sa svim podacima o virtualiziranom hardveru od kojega se &#8220;sastoji&#8221; to virtualno računalo (disk kontroler, vrsta diska i veličina diska, količina dostupne RAM memorije, mrežne kartice i sl.)
  * Drastično ubrzavamo proces povratka (engl. Restore) cijelog operacijskog sustava i svih podataka uslijed nekog kvara ili problema u radu. Kao što smo rekli &#8211; praktično cijelo virtualno računalo je jedna jedina datoteka koju treba &#8220;vratiti&#8221; nazad iz sigurnosne kopije, na nekom drugom fizičkom računalu, bez ikakvih dodatnih intervencija poput : 
      * instalacije operacijskog sustava
      * instalacije svih upravljačkih programa
      * instalacije i konfiguracije svih aplikacija
      * povratka svih podataka i sl
  * Pojednostavljuje se management svih virtualiziranih računala

#### 

#### Kako radi virtualizacija

Za virtualizaciju je potrebna određena platforma odnosno takozvani &#8220;Hypervisor&#8221; operacijski sustav, bilo samostalan ili unutar postoječeg operacijskog sustava, a koji ima mogućnost kreiranja virtualiziranog okruženja za naša virtualna računala.

Virtualizirano okruženje kreira sve resurse hardvera koji i inače postoje na svakom računalu ali virtualno odnosno simulira ih se i to počevši od :

  * Matične ploče, njenog BIOSa i svih njenih funkcionalnosti,
  * Centralnog procesora (CPU)
  * RAM memorije
  * Disk kontrolera, njegovog BIOSa i njegove funkcionalnosti
  * Tvrdog diska, CD/DVD-ROMa i  drugih uređaja
  * Mrežne kartice, njenog BIOSa i njene funkcionalnosti
  * &#8230; itd.

Dakle virtualizira (simulira) se svaka komponenta računala, koja se onda dodjeljuje našem virtualnom računalu na koje se potom normalno instalira cijeli operacijski sustav od &#8220;nule&#8221;, sa svim upravljačkim programima, našim aplikacijama i sl.

U inicijalnom dijelu instalacije operacijskog sustava unutar virtualnog računala, kada se instaliraju upravljački programi, instaliraju se upravljački programi za virtualne komponente našeg virtualnog računala, koje nam je dodjelio &#8220;Hypervisor&#8221;.

Ako smo recimo kao disk kontroler za naše virtualno računalo unutar &#8220;Hypervisor&#8221;-a odabrali IDE (ATA) disk kontroler, tada ćemo dobiti primjerice virtualiziran PIIX3 disk kontroler, sa svojim pripadajućim BIOS-om i svim svojim funkcionalnostima.

U trenutku kada krenemo s instalacijom našeg virtualnog računala (pr. sa ISO image-a od našeg operacijskog sustava), kada se budu morali instalirati upravljački programi za disk kontroler &#8211; biti će odabran PIIX3 disk kontroler. Ista je stvar sa svakom dugom komponentom našeg budućeg virtualnog računala.

Nadalje operacijski sustav i sve aplikacije unutar virtualnog računala nisu svjesne da se nalaze unutar virtualnog računala te se ponašaju kao da su instalirane na &#8220;normalno&#8221; računalo.

Za efikasnu virtualizaciju, potrebna je i podrška centralnog procesora (CPU), a koja može drastično ubrzati sve procese potrebne za virtualizaciju.

Intel ovu funkcionalnost unutar centralnog procesora naziva VT-x a AMD ju naziva AMD-V.

Ovakvu vrstu virtualizacije nazivamo i puna virtualizacija (engl. Full Virtualization).

&nbsp;

&nbsp;

### Zbog čega je važno da platforma za virtualizaciju podržava i Linux kontejnere

Upotrebom Linux kontejnera štedimo hardverske resurse te u konačnici dobivamo na brzini rada.Samim time dobivamo na mogućnosti da na istom hardveru pokrećemo znatno veći broj linux kontejnera nego što bi mogi pokrenuti klasičnih virtualnih računala.

Kao što smo rekli &#8211;  klasična virtualizacija mora virtualizirati (simulirati) svaku pojedinu komponentu našeg virtualnog računala. Ovaj proces kod klasične virtualizacije troši hardverske resurse, pogotovo čim više virtualnih računala imate na sustavu jer svako od njih mora imati virtualizirane (simulirane) sve komponente računala.

Ako imamo deset virtualnih računala tada hypervisor mora virtualizirati (simulirati) deset matičnih ploča, deset disk kontrolera, deset diskova, &#8230;. (resursi, resursi)

&nbsp;

**Što su uopće Linux kontejneri ?**

Linux kontejneri su jedan oblik virtualizacije ali na razini operacijskog sustava Linux, unutar kojega se pokreću izolirani Linux operacijski sustavi odnosno Linux kontejneri.

Ovdje se ne radi o virtualnim računalima već o izoliranom pokretanju novih instanci linuxa, unutar postojećeg linuxa.

U svakom slučaju nema cijelog niza slojeva virtualizacije i simulacije virtualiziranog hardvera.

Rad linux kontejnera se svodi na pristup već postoječem (instaliranom) linuxu, odnosno njegovom kernelu i  sistemskim pozivima, kroz samo jedan kontrolni sloj, koji dodaje potrebna ograničenja odnosno prava pristupa na dostupne resurse.

U ovom sloju se zapravo ograničava pristup na dostupan broj centralnih procesora (pr. dozvoljavamo samo 2 CPU jezgre za pojedini linux kontejner), količinu RAM memorije, diskovnog prostora i sl.

Već je iz ovoga vidljivo da to sve mora raditi brže nego klasična virtualizacija, ali i istovremeno biti štedljivije prema dostupnim resursima.

Jedan linux kontejner je za linux koji ga &#8220;opslužuje&#8221; samo novi niz linux procesa, ništa više.

&nbsp;

Pogledajmo izlistanje svih pokrenutih procesa na Proxmox VE platofrmi (koja je u pozadini također malo optimiziran debian linux) te se fokusirajmo na <span style="color: #ff0000;">označene procese</span>:

&nbsp;

Slika 1: Prikaz svih Linux procesa na Proxmox VE v.3.x

<img class="alignnone size-full wp-image-2062" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-Linux-kontejner-procesi-pogled.jpg?resize=612%2C445&#038;ssl=1" alt="ProxMox-Linux-kontejner-procesi-pogled" width="612" height="445" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-Linux-kontejner-procesi-pogled.jpg?w=612&ssl=1 612w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-Linux-kontejner-procesi-pogled.jpg?resize=150%2C109&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-Linux-kontejner-procesi-pogled.jpg?resize=300%2C218&ssl=1 300w" sizes="(max-width: 612px) 100vw, 612px" data-recalc-dims="1" />

Slika 2: Prikaz svih Linux procesa na Proxmox VE v.4.x

<img class="alignnone  wp-image-2071" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/LXC-Linux-containers-process-view.jpg?resize=632%2C268&#038;ssl=1" alt="LXC Linux containers - process view" width="632" height="268" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/LXC-Linux-containers-process-view.jpg?w=996&ssl=1 996w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/LXC-Linux-containers-process-view.jpg?resize=150%2C64&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/LXC-Linux-containers-process-view.jpg?resize=300%2C127&ssl=1 300w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/LXC-Linux-containers-process-view.jpg?resize=768%2C325&ssl=1 768w" sizes="(max-width: 632px) 100vw, 632px" data-recalc-dims="1" />

&nbsp;

&nbsp;

Vidimo sve procese koji su od Proxmox VE linuxa (crno) te sve procese koji su od jednog linux kontejnera (<span style="color: #ff0000;">crveno</span>).

Za one koji poznaju linux malo bolje &#8211; pogledajte **init** procese (za sve ostale &#8211; malo proučite ( [1.][12] i [2.][13] ) :

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

&nbsp;

## **Tko sve koristi Proxmox VE ?**

Proxmox VE koriste razni hosting provideri a jedan od većih je OVH koji ima svoje podatkovne centre u Europi i SAD-u. Oni raspolažu s više od 180.000 poslužitelja. Na popriličnom broju njih se &#8220;vrti&#8221; i Proxmox VE.

Prema njihovim statistikama (<a href="https://www.ovh.de/images/newsletter/012014/infographie-distrib-de.jpg" data-rel="lightbox-0" title="">Info1</a>) za europu za 2014.g.  za sve njihove podatkovne centre Proxmox VE se koristi na oko 19% svih poslužitelja (uz VMware ESXi 12.8% i XEN 20%). S druge strane njihove statistike (<a href="https://www.ovh.de/images/newsletter/012014/infographie-distrib-en.jpg" data-rel="lightbox-1" title="">info2</a>) za SAD su malo drugačije : Proxmox VE drži 4.8% (VMware ESXi 8% , XEN 1.91%).

[Info3 (Proxmox VE i OVH)][14]

&nbsp;

Proxmox VE ima više od 5.000 komercijalnih pretplatnika koje čine uglavnom tvrtke. Osim navedenih, postoji i znatan broj instaliranih sustava za koje se pojedinci ili tvrtke još nisu odlučili za plačanje podrške ali intenzivno koriste Proxmox VE.

&nbsp;

&nbsp;

## **Što nam sve nudi Proxmox VE ?**

&nbsp;

**Proxmox Virtual Environment platforma za Virtualizaciju i linux kontejnerizaciju nudi :**

&nbsp;

  * ### **Centralizirani management**
    
    Centralizirani management je dostupan na svim poslužiteljima unutar Proxmox klastera a koji se automatski sinkronizira između svih poslužitelja u klasteru. Dakle ne postoji jedan ili nekolicina poslužitelja nadležnih za management već su to apsolutno svi poslužitelji unutar Proxmox klastera u takozvanoj Multi-Master konfiguraciji. Ovo je standardna funkcionalnost ProxmoxVE klastera.</li> </ul> 
    
    Slika &#8211; Proxmox klaster &#8211; centralizirani management s tri Proxmox VE poslužitelja
    
    (Pogled na jedan poslužitelj [**pve-2-51**]) i njegove resurse:
    
    <img class="alignnone size-full wp-image-2047" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-klaster.jpg?resize=998%2C745&#038;ssl=1" alt="ProxMox -klaster" width="998" height="745" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-klaster.jpg?w=998&ssl=1 998w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-klaster.jpg?resize=150%2C112&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-klaster.jpg?resize=300%2C224&ssl=1 300w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-klaster.jpg?resize=768%2C573&ssl=1 768w" sizes="(max-width: 998px) 100vw, 998px" data-recalc-dims="1" />
    
    Slika : Pogled na cijeli Proxmox klaster sa svim fizičkim poslužiteljima (nodovima):
    
    <img class="alignnone wp-image-2046" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-klaster-node-view.jpg?resize=796%2C594&#038;ssl=1" alt="ProxMox -klaster-node-view" width="796" height="594" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-klaster-node-view.jpg?w=994&ssl=1 994w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-klaster-node-view.jpg?resize=150%2C112&ssl=1 150w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-klaster-node-view.jpg?resize=300%2C224&ssl=1 300w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-klaster-node-view.jpg?resize=768%2C573&ssl=1 768w" sizes="(max-width: 796px) 100vw, 796px" data-recalc-dims="1" />
    
    &nbsp;
    
      * Moguće je koristiti i REST web API za izradu svojih funkcionalnosti prema potrebi,
      * Centralizirani management je moguće definirati prema specifičnim korisničkim grupama, korisnicima ili akcijama (pravima) koje su dozvoljene za njih.
      * Autentikacija je moguća i preko vanjskih servisa popu Acive Directory-ja ili  LDAP-a
    
    Slika: Autentikacija preko postojećeg Active Directory poslužitelja:
    
    <img class="alignnone size-full wp-image-2049" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-AD.jpg?resize=1003%2C752&#038;ssl=1" alt="ProxMox --AD" width="1003" height="752" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-AD.jpg?w=1003&ssl=1 1003w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-AD.jpg?resize=150%2C112&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-AD.jpg?resize=300%2C225&ssl=1 300w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-AD.jpg?resize=768%2C576&ssl=1 768w" sizes="(max-width: 1000px) 100vw, 1000px" data-recalc-dims="1" />
    
    &nbsp;
    
      * Dostupno je i preko 50 gotovih Linux kontejnera &#8211; direktno preko centraliziranog web sučelja.
    
    Slika:  Dostupni Linux kontejner template-i (intenzivno se radi i na LXC template-ima za verziju 4.x):
    
    <img class="alignnone wp-image-2048" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-Templates.jpg?resize=479%2C487&#038;ssl=1" alt="ProxMox -- Templates" width="479" height="487" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-Templates.jpg?w=543&ssl=1 543w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-Templates.jpg?resize=148%2C150&ssl=1 148w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-Templates.jpg?resize=295%2C300&ssl=1 295w" sizes="(max-width: 479px) 100vw, 479px" data-recalc-dims="1" />
    
    &nbsp;
    
    ● Preko centraliziranog i klasteriziranog grafičkog sučelja omogućen je i konzolni pristup na bilo koje virtualno računalo ili linux kontejner.
    
    Osim toga, moguć je pristup na konzolu bilo kojeg virtualnog računala ili linux kontejnera i preko noVNC, VNC i [Spice][15] klijenata.
    
    &nbsp;
    
    Slika: Konzolni pristup na virtualno računalo s Debian Linuxom iz Web sučelja:
    
    <img class="alignnone size-full wp-image-2045" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-konzola.jpg?resize=994%2C741&#038;ssl=1" alt="ProxMox --konzola" width="994" height="741" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-konzola.jpg?w=994&ssl=1 994w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-konzola.jpg?resize=150%2C112&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-konzola.jpg?resize=300%2C224&ssl=1 300w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-konzola.jpg?resize=768%2C573&ssl=1 768w" sizes="(max-width: 994px) 100vw, 994px" data-recalc-dims="1" />
    
    &nbsp;
    
      * ### **Backup sustav** 
        
        Zadužen je za izradu sigurnosnih kopija virtualnih računala ili linux kontejnera. Integriran je za cijeli klaster Proxmox VE poslužitelja. Podržava razne metode izrade sigurnosnih kopija :</li> 
        
          * “Stop/Start” Virtualke/Linux kontejnera u trenutku izrade sigurnosne kopije ili
          * “Snapshot” Virtualke/Linux kontejnera u trenutku izrade sigurnosne kopije ili
          * “Suspend” Virtualke/Linux kontejnera u trenutku izrade sigurnosne kopije.
  
            Backup sustav omogućava izradu sigurnosnih kopija na razini svake pojedine virtualke ili linux
  
            kontejnera i to :
  
            ○ Ručno &#8211; za trenutnu željenu (odabranu) virtualku ili linux kontejner ili
  
            ○ Automatizirano prema vremenskim okvirima  (pr. svaki dan u točno određeno vrijeme ili sl.)</ul> 
        
        Slika : Automatizirana izrada backupa u zadano vrijeme:
        
        <img class="alignnone size-full wp-image-2044" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-Automatski-Backup.jpg?resize=996%2C745&#038;ssl=1" alt="ProxMox -Automatski-Backup" width="996" height="745" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-Automatski-Backup.jpg?w=996&ssl=1 996w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-Automatski-Backup.jpg?resize=150%2C112&ssl=1 150w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-Automatski-Backup.jpg?resize=300%2C224&ssl=1 300w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-Automatski-Backup.jpg?resize=768%2C574&ssl=1 768w" sizes="(max-width: 996px) 100vw, 996px" data-recalc-dims="1" />
        
        &nbsp;
        
        #### **Napomene :**
        
        ⇒ Backup-om se dobija jedna jedina komprimirana datoteka, koju dodatno možete prekopirati na neki drugi medij kao dodatnu sigurnosnu kopiju.
        
        → Procedura povratka (engl. Restore) virtualke ili linux kontejnera se svodi na dohvačanje backup datoteke i odabira “Restore”. Nakon nekog vremena (ovisno o veličini datoteke i brzini poslužitelja ) vaša virtualka ili linux kontejner su “vraćeni” u identično i funkcionalno stanje od trenutka kada je napravljen backup.
        
        &nbsp;
        
        ⇒ ⇒ Razmislite o ovome ako još uvijek ne koristite virtualizaciju ili linux kontejnere  ⇐ ⇐
        
        Koliko vremena vam je potrebno da u potpunosti osposobite vaš sustav i sve podatke u slučaju nekog kvara ?.
        
        &nbsp;
        
          * ### **Izrada snapshota**
            
            **Snapshot-i su** kopije virtualke u realnom vremenu, koji predstavljaju snimljeno stanje virtualke u tom trenutku.
            
              * Moguća je izrada tkzv. “snapshot”-a bilo koje virtualke, u potpunosti bez njenog zaustavljanja &#8211; kao sigurnosne kopije u vremenu &#8211; dodatno uključujuči (ili ne) i stanje RAM memorije.
        
        <img class="alignnone wp-image-2043" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-Snapshot.jpg?resize=995%2C740&#038;ssl=1" alt="ProxMox --Snapshot" width="995" height="740" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-Snapshot.jpg?w=992&ssl=1 992w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-Snapshot.jpg?resize=150%2C112&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-Snapshot.jpg?resize=300%2C223&ssl=1 300w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-Snapshot.jpg?resize=768%2C571&ssl=1 768w" sizes="(max-width: 995px) 100vw, 995px" data-recalc-dims="1" />
        
        &nbsp;
        
          * #### **Vraćanje na prijašnji snapshot**
            
            **  U** bilo kojem trenutku se možete vratiti na bilo koji snapshot koji ste napravili u prošlosti &#8211; odnosno vratiti se u stanje rada vaše virtualke u vremenu**.**</li> </ul> 
            
            &nbsp;
            
            &nbsp;
            
              * ### **Izrada template-a (gotovih predložaka ) i kloniranje istih**
                
                  * **Moguća je izrada template-a (predložaka) virtualki** (a uskoro će biti moguće i za linux kontejnere). Ovom procedurom možemo pripremiti virtualku na koju ćemo instalirati sav potreban softver te od nje napraviti “template”. Taj template ili predložak   možemo kasnije klonirati i vrlo brzo kreirati nove funkcionalne virtualke koje će već imati instaliran i konfiguriran sav softver koji smo instalirali na template virtualku. 
                      * Na osnovi Template-a virtualke moguće je raditi njene klonove :
            
            Slika : Pogled na izrađeni template [ID template-a : **100 (jessie1-template)**] te odabir kloniranja tog template-a u novu virtualku &#8211;  ID nove virtualke: **116**
            
            <img class="alignnone size-full wp-image-2042" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-Template.jpg?resize=998%2C745&#038;ssl=1" alt="ProxMox --Template" width="998" height="745" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-Template.jpg?w=998&ssl=1 998w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-Template.jpg?resize=150%2C112&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-Template.jpg?resize=300%2C224&ssl=1 300w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-Template.jpg?resize=768%2C573&ssl=1 768w" sizes="(max-width: 998px) 100vw, 998px" data-recalc-dims="1" />
            
            &nbsp;
            
            &nbsp;
            
              * ### **Sustav visoke dostupnosti (HA System)** 
                
                  * Proxmox VE klaster podržava do 16 fizičkih poslužitelja u klasteru (nova verzija do 32), bez ograničenja na broj jezgri CPU-a, RAM memorije ili diskova &#8211; za svaki fizički poslužitelj.
            
            Dodatno konfiguriran Proxmox VE klaster, omogućava “**failover**” Virtualki ili Linux kontejnera odnosno njihovo automatsko podizanje u slučaju kvara ili održavanja fizičkog poslužitelja u klasteru. To se u pozadini odrađuje automatskim pokretanjem na drugom (ispravnom) fizičkom poslužitelju, automatizirano i bez naše intervencije.
            
            Slika : Odabir virtualke ili Linux kontejnera koju/kojeg označavamo kao HA (otpornog na kvar bilo kojeg fizičkog poslužitelja )
            
            <img class="alignnone wp-image-2041" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-HA-node.jpg?resize=426%2C166&#038;ssl=1" alt="ProxMox --HA-node" width="426" height="166" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-HA-node.jpg?w=500&ssl=1 500w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-HA-node.jpg?resize=150%2C59&ssl=1 150w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-HA-node.jpg?resize=300%2C117&ssl=1 300w" sizes="(max-width: 426px) 100vw, 426px" data-recalc-dims="1" />
            
            &nbsp;
            
            Slika: Pogleda na cijeli Proxmox VE klaster i sve virtualke i linux kontejnere koji su označeni kao HA (pogledajte **HA Service Status &#8211;** vidimo dvije virtualke il linux kontejnera (110 i 111) označena kao **HA**):
            
            <img class="alignnone wp-image-2040" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-HA-Service-Status.jpg?resize=774%2C412&#038;ssl=1" alt="ProxMox --HA-Service Status" width="774" height="412" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-HA-Service-Status.jpg?w=977&ssl=1 977w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-HA-Service-Status.jpg?resize=150%2C80&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-HA-Service-Status.jpg?resize=300%2C160&ssl=1 300w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-HA-Service-Status.jpg?resize=768%2C409&ssl=1 768w" sizes="(max-width: 774px) 100vw, 774px" data-recalc-dims="1" />
            
              * **Migracija virtualki ili linux kontejnera sa fizičkog poslužitelja na drugi fizički poslužitelj
  
** </p> 
                  *    Moguća je i ručna “**live**” **migracija** bilo kojeg (pojedinog) virtualnog računala ili Linux kontejnera koji je pokrenut na bilo kojem fizičkom poslužitelju unutar klastera, na drugi fizički poslužitelj  (prema želji), uključujuči i stanje RAM memorije. Ovo se koristi primjerice  u slučajevima planiranog održavanja/gašenja pojedinog fizičkog poslužitelja. Važna osobina ove funkcionalnosti su  minimalni zastoji u radu željene virtualke ili linux kontejnera koji se prebacuje na drugi fizički server, u tijeku migracije.
            
            Slika: Odabir virtualke ili linux kontejnera (br. 116) na Proxmox VE poslužitelju (**prox01**) koji želimo &#8220;na živo&#8221; migrirati na Proxmox VE poslužitelj **prox02**:
            
            <img class="alignnone size-full wp-image-2059" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-Migrate.jpg?resize=349%2C131&#038;ssl=1" alt="ProxMox --Migrate" width="349" height="131" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-Migrate.jpg?w=349&ssl=1 349w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-Migrate.jpg?resize=150%2C56&ssl=1 150w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-Migrate.jpg?resize=300%2C113&ssl=1 300w" sizes="(max-width: 349px) 100vw, 349px" data-recalc-dims="1" />
            
            &nbsp;
            
            &nbsp;
            
              * ### **Napredni Mrežni model koji podržava**
                
                  * Firewall na razini : 
                      * CIjelog klastera,
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
                      * Podržava i mnoge druge protokole (NetFlow, sFlow, SPAN, RSPAN, STP, Multiple Tunneling protocols,&#8230;)
            
            &nbsp;
            
            &nbsp;
            
              * ****Podržava mnoge NAS ili SAN sustave za pohranu podataka ** (**Od samih virtualki i Linux kontejnera, ISO image-a, Template-a i sl.**)**
            
            &nbsp;
            
              * LVM (Linux LVM2) za bilo koji “Block Device” ili lokalni disk
              * iSCSI Target i/ili direct to iSCSI LUN
              * NFS
              * CEPH RBD
              * GlusterFS
              * Directory (on local disk)
              * ZFS
            
            Slika: Dodavanje storage-a u klaster za cijeli klaster ili samo za željene Proxmox VE poslužitelje:
            
            <img class="alignnone wp-image-2039" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-Add-Storage.jpg?resize=168%2C321&#038;ssl=1" alt="ProxMox --Add-Storage" width="168" height="321" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-Add-Storage.jpg?w=187&ssl=1 187w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-Add-Storage.jpg?resize=79%2C150&ssl=1 79w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-Add-Storage.jpg?resize=157%2C300&ssl=1 157w" sizes="(max-width: 168px) 100vw, 168px" data-recalc-dims="1" />
            
            &nbsp;
            
            &nbsp;
            
              * ### **Podržava izradu Linux kontejnera**
            
            &nbsp;
            
              * Osim izrade klasičnih virtualki, moguća je i izrada [linux kontejnera][16] ,koji rade puno brže i fleksibilniji su od virtualki. Proxmox VE verzije 3.x podržava [OpenVZ][5] linux kontejnere a Proxmox VE verzije 4.x podržava [LXC][6] linux kontejnere.
            
            Slika (izrada Linux kontejnera → Pogled na mrežne parametre linux kontejnera):
            
            <img class="alignnone wp-image-2038" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-LinuxCOntainer-LAN-view.jpg?resize=900%2C675&#038;ssl=1" alt="ProxMox --LinuxCOntainer-LAN-view" width="900" height="675" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-LinuxCOntainer-LAN-view.jpg?w=991&ssl=1 991w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-LinuxCOntainer-LAN-view.jpg?resize=150%2C112&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-LinuxCOntainer-LAN-view.jpg?resize=300%2C225&ssl=1 300w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-LinuxCOntainer-LAN-view.jpg?resize=768%2C576&ssl=1 768w" sizes="(max-width: 900px) 100vw, 900px" data-recalc-dims="1" />
            
            &nbsp;
            
            &nbsp;
            
            &nbsp;
            
              * ### **Napredna podrška za Virtualna računala :**
            
              * #### Podrška za CPU:
            
              * Podržava mnoge arhitekture procesora : 486, pentium, pentium2, pentium3, athlon, core2duo, coreduo, &#8230;.
              * Podržava NUMA (uz riješen NUMA scheduler) između: 
                  * Više fizičkih procesora (“CPU Socket”) i u kombinaciji sa
                  * Više jezgri procesora &#8211; na jednom ili između više fizičkih procesora
            
            &nbsp;
            
              * #### **Podrška za HotPlug :**
            
              * Podržava Hot plug CPU,
              * Podržava Hot plug Hard disk,
              * Podržava Hot plug RAM memorije,
              * Podržava Hot plug mrežnih kartica i
              * Podržava Hot plug USB uređaja
            
            &nbsp;
            
              * #### **RAM memorija &#8211;  podržava dva modela:**
            
              * Fiksno ograničenje (limitirana je maksimalna kolićina dostupne RAM memorije) ili
              * DInamički : garantiran je minimum RAM memorije i ograničen je maksimum
            
            &nbsp;
            
              * #### **Podrška za veliki broj operacijskih sustava, za koje je optimiziran:**
            
              * Linux : 
                  * Sve postojeće distribucije linuxa (RedHat/CentOS/SuSE, Debian/Ubuntu,Slackware, &#8230;)
              * Windows: 
                  * Windows 2000, XP, 2003, Vista, 2008, 7, 2008 R2, 8, 2012 , &#8230;
              * Solaris : 10, 11,  …  OpenSolaris/Indiana , Illumos/OmniOS, &#8230;
              * FreeBSD/NetBSD/…
              * Ostali
            
            &nbsp;
            
              * #### **Virtualizirane grafičke kartice i terminali:**
            
              * Standard VGA
              * VMWare display
              * Cirrus Logic GD 5446
              * SPICE (s podrškom za više monitora)
              * Serijski terminal
            
            &nbsp;
            
              * #### **Virtualizirani disk kontroleri i diskovi :**
            
              * IDE (ATA) , SATA , SCSI ili VIRTIO
              * Razni modeli SCSI kontrolera, prema potrebi : 
                  * LSI 53C895A
                  * LSI 53C810
                  * Mega RAID SAS (8708EM2)
                  * VMware PVSCSI
            
            &nbsp;
            
              * #### **Razne vrste disk image formata:**
            
              * RAW disk image (raw)
              * QEMU image format (qcow2)
              * VMware image format (vmdk)
            
            &nbsp;
            
              * #### **Moguća ograničenja rada svakog virtualnog diska:**
            
              * Read/Write Limit (MB/s),
              * Read/Write IOPS limit,
              * Read/Write max burst limit (MB/s),
              * Read/Write max burst limit IOPS,
            
            &nbsp;
            
              * #### **Operacije nad virtualnim diskovima:**
            
              * Resize kapaciteta,
              * Prebacivanje (na drugi disk/NAS/SAN)
              * Online konverziju formata (QCOW2 ←→ RAW , ….)
            
            &nbsp;
            
              * #### **Razni modeli hard disk cache-a:**
            
              * None (no cache) → “pass through”
              * Direct sync
              * Write through
              * Write back
            
            &nbsp;
            
              * #### **Virtualizirana mreža**
            
              * Bridge ili NAT modeli
              * Podržavaju napredne funkcionalnosti: 
                  * Ograničenje maksimalne propusnosti svake mrežne kartice (MB/s)
                  * Moguć je “direct disconnect” odnosno direktno isključivanje mrežne kartice
                  * Podržava više “Multiqueues” kanala za svaku mrežnu karticu
              * Podrška za razne modele mrežnih kartica: 
                  * Intel E1000
                  * VirtIO
                  * Realtec RTL8139
                  * VMWare vmxnet3
            
            &nbsp;
            
              * #### **SMBIOS podrška (type 1), omogućava definiranje (za svaku virtualku):**
            
              * UUID, Manufacturer, Product,Version, Serial, SKU, &#8230;
            
            &nbsp;
            
            … i još mnogo toga
            
            &nbsp;
            
            &nbsp;
            
            &nbsp;
            
            &nbsp;
            
            &nbsp;
            
            &nbsp;
            
            # **Što je prethodilo partnerstvu**
            
            Iskustvo od 15+.g. rada u IT struci, kao i dugogodišnje iskustvo kolega koji su naši aktivni članovi “sistemaškog” tima (min. 5+.g.) s konkretnim uspješnim projektima iza sebe, dovelo nas je do razine znanja a kasnije i suradnje o kojoj ćemo govoriti dalje u tekstu.
            
            &nbsp;
            
            Nakon učenja i rada na raznim projektima koji su uključivali mrežne sustave i elemente,dublje razumjevanje i konfiguraciju raznih mrežnih servisa i protokola, preko sustava za pohranu podataka, do virtualizacije s kojom sam/smo krenuli negdje u toku 2009.g., krenuli smo od  testiranja, korištenja, optimizacija i rada na raznim virtualizacijskim platformama :
            
              * VMware (gotovo svi proizvodi za virtualizaciju),
              * Linux KVM,
              * Puno kasnije i Microsoft Hyper-V (koji je i najmlađi “igrač” na ovom području), &#8230;
            
            &nbsp;
            
            Uslijedilo je testiranje rada i optimizacije NAS i SAN sustava za pohranu podataka optimiziranih za upotrebu u  sustavima za virtualizaciju.
            
            &nbsp;
            
            Počela je potraga za platformom za virtualizaciju.
            
            Što smo zahtjevali  ?
            
            &nbsp;
            
              * Platformu za virtualizaciju i Linux kontejnerizaciju
              * Platformu koja je dokazana u produkcijskoj upotrebi minimalno nekoliko godina
              * Prije svega Open Source  platformu: 
                  * za koju postoji i komercijalna podrška i koju je prihvatio veći broj korisnika
                  * za koju postoji velika zajednica ljudi koja ju razvija i koristi
                  * za koju postoji “službena” dokumentacija ali i dokumentacija od strane zajednice
              * Platformu koja u osnovnoj verziji podržava “Enterprise” funkcionalnosti bez dodatnih troškova ili komplikacija
            
            &nbsp;
            
            Potom smo došli do tada relativno nove ali produkcijski dokazane platforme za virtualizaciju “Proxmox Virtual Environment” koja je u to vrijeme nudila u OpenSource-u više nego što su nudili drugi komercijalni (veliki) igrači.
            
            &nbsp;
            
            Osim “klasične” virtualizacije Proxmox je nudio (i nudi) i Linux kontejnere, koji su radili za gotovo bilo koju distribuciju linuxa a trošili su samo djelić resursa koje bi trošila neka virtualka.
            
            Za posebne potrebe, moguće je i od praktično bilo koje distribucije linuxa napraviti linux kontejner.
            
            &nbsp;
            
            Dakle savršeno u slučaju kada nam trebaju Linux virtualna računala &#8211; u većini slučajeva &#8211;  zaboravite na virtualke i pređite na Linux kontejnere. Rade brže i troše vrlo malo resursa.
            
            &nbsp;
            
            No vratimo se negdje u 2011/2012 &#8211; već tada je zajednica okupljena oko ovog riješenja bila poprilično velika, a razvoj je bio nevjerojatan &#8211; gotovo nije mogao proći tjedan da se nešto nije poboljšavalo (ili otkrivalo pa popravljalo ili optimiziralo).
            
            Nas nekoliko je u to vijeme radilo i profesionalno na drugim platformama, koje su nudile i naprednije tj. “Enterprise” funkcionalnosti ali uz astronomske cijene.
            
            &nbsp;
            
            Proxmox je već tada počeo uvoditi iste funkcionalnosti &#8211; koje su za divno čudo i radile upravo ono što su i trebale raditi a nisu se prodavale za tisuće U$/€ već su dolazile u Open Source verziji (čitaj besplatno), naravno uz mogućnost komercijalne podrške za koju su se neki od nas i odlućili nešto kasnije.
            
            &nbsp;
            
            I odluka je pala &#8211; idemo u testnu produkcijsku upotrebu &#8211; vrlo oprezno, za nekoliko sustava.
            
            Mjeseci i godine su prolazili &#8211; morali smo i dalje koristiti i neka druga riješenja ali Proxmox je i dalje ostajao i poboljšavao se, zajednica se širila.
            
            &nbsp;
            
            Pojavljivala su se i neka druga riješenja (i nestajala) te dolazili neki veliki igrači sa svojim idejama koje su i danas u fazi razvoja ali obečavaju (pogotovo za velike data centre). Mada mislim da će proći još cijeli niz godina da se oni ustabile i postanu “production ready”.
            
            &nbsp;
            
            Nakon oko 4 godine iskustva u produkcijskom radu s Proxmox VE platformom, pročitanog cijelog niza knjiga te tisuća stranica s optimizacijama za platformu uz naša iskustva i optimizacije u radu &#8211; uslijedila je izrada naših detaljnih step-by-step uputa za instalaciju,konfiguraciju, i testiranje.
            
            &nbsp;
            
            Uveli smo i dokumentirali točne procedure i radnje za drugi krug optimizacija, koje se odnose na trenutak prije puštanja u produkcijski rad (na ovome se radilo mjesecima a i još se radi).
            
            &nbsp;
            
            Naime svaki hardver (a i softver) ima neke specifičnosti, prednosti i mane te mogućnosti optimizacije &#8211; koja ne mora uvijek završiti najbolje (kao niti sustav koji uopće nije optimiziran) :
            
              * počevši od mrežne opreme i njenih funkcionalnosti i optimizacija (i bug-ova ili loših i/ili problematičnih implementacija raznih funkcionalnosti i protokola),
              * preko NAS/SAN sustava i njihovih specifičnosti
              * do samog hardvera na koji se instalira Proxmox VE (Koji poslužitelj, CPU, RAM , RAID kontroler i diskovi, LAN kartice, &#8230;).
            
            &nbsp;
            
            Negdje unutar tog vremena krenuli smo i s instalacijom unutar poduzetničkog inkubatora BIOS
            
            ( <http://inkubator.hr/>  ).
            
            &nbsp;
            
            **Važno za znati**
            
            Samu instalaciju može napraviti gotovo svatko s vrlo malo informatičkog znanja &#8211; i vrlo brzo podići prvu virtualku ili Linux container ali za sustav u stvarnoj, ozbiljnoj produkciji, potrebno je ipak “malo” više od toga. … možda pokoja godina iskustva u produkcijskoj upotrebi virtualizacije, naprednih mrežnih tehnologija i protokola, NAS/SAN storage-a i sl. (ali sve se da naučiti 🙂 ).
            
            &nbsp;
            
            Ne želim nikoga obeshrabriti &#8211;  igrajte se i učite ali nemojte očekivati da će nešto što ste “naboli” da radi za par sati opsluživati vaš produkcijski sustav za koji očekujete da radi pouzdano dugi niz godina.
            
            &nbsp;
            
            Mislim da je računica relativno jednostavna : 1 godina = 365 dana = 8760 radnih sati poslužitelja ( ili sl.).
            
            Ako kažemo da nam za uspješan rad poslužitelja u tom periodu treba 0.5% vremena od ukupnog (pouzdanog) vremena rada, to ispada da unutar godine dana trebamo računati 43.5 radna sata za instalaciju, konfiguraciju, optimizaciju i testiranje rada poslužitelja + vrijeme za neplanirane i neke planirane intervencije.
            
            Naravno ako se radi o više poslužitelja vremena se ne zbrajaju u potpunosti, već samo onaj dio inicijalne instalacije, konfiguracije i optimizacije &#8211; što je okvirno pola toga vremena, ali o ispravnom planiranju radnih sati nekom drugom prilikom.
            
            Želim samo reći  da kod planiranja treba uzeti malo širu sliku od čiste instalacije &#8211; po principu samo da proradi pa ćemo poslije &#8230; to poslije NIKADA ne dođe a jedino što dođe poslije su problemi zbog toga što se u početku nije planiralo kako treba.
            
            &nbsp;
            
            Ova napomena vrijedi za sve tehnologije &#8211; planirajte dugogodišnja ulaganja u znanje i računajte da ako nešto treba raditi godinama &#8211; da se za to treba dobro potruditi i optimizirati, testirati sve scenarije, paljenja, gašenja, ispada, kvarova itd. A to sve poprilično traje ali vam osigurava točno definirane scenarije rada u svakom (predviđenom) slučaju kvara ili planiranog održavanja te dugoročno isplativu investiciju.
            
            &nbsp;
            
            &nbsp;
            
            **Vratimo se na temu** 
            
            Mi i dalje ostajemo (i) na Proxmox VE-u, pratimo ga optimiziramo, izrađujemo svoje skripte, testiramo nove funkcionalnosti,  koristimo ga i dokumentiramo jer nam se do sada pokazao kao najbolje riješenje u slučaju kada nemate više od 16 fizičkih poslužitelja u Proxmox klasteru (u novoj verziji do 32 poslužitelja).
            
            &nbsp;
            
            S druge strane većina tvrtki niti nema više od toliko fizičkih poslužitelja za potrebe virtualizacije + eventualno dodatne poslužitelje za redundantne NAS/SAN sustave.
            
            &nbsp;
            
            Mogu reći &#8211;  u našim “uvjetima” više nego dovoljno.
            
            Dakle Proxmox VE je idealna platforma za virtualizaciju za većinu tvrtki (ne samo iz mog iskustva).

 [1]: http://proxmox.com/en/
 [2]: https://www.proxmox.com/en/proxmox-ve
 [3]: https://www.proxmox.com/en/downloads/category/iso-images-pve
 [4]: http://www.linux-kvm.org/page/Main_Page
 [5]: https://en.wikipedia.org/wiki/OpenVZ
 [6]: https://en.wikipedia.org/wiki/LXC
 [7]: http://pve.proxmox.com/wiki/Proxmox_Cluster_file_system_%28pmxcfs%29
 [8]: http://corosync.github.io/corosync/
 [9]: https://wiki.debian.org/BridgeNetworkConnections
 [10]: https://en.wikipedia.org/wiki/Link_aggregation
 [11]: http://openvswitch.org/
 [12]: https://www.opensource-osijek.org/dokuwiki/wiki:knjige:uvod_u_linux#procesi
 [13]: https://www.opensource-osijek.org/dokuwiki/wiki:knjige:uvod_u_linux#kako_to_radi_sistemski_dio
 [14]: http://proxmox.com/en/partners/hosting-partner/item/ovh
 [15]: http://www.spice-space.org/download.html
 [16]: https://en.wikipedia.org/wiki/Operating-system-level_virtualization