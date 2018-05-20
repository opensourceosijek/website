---
title: Proxmox VE (platforma za virtualizaciju i Linux kontejnere) – novosti
author: hhorvat
type: post
date: 2017-04-19T12:04:27+00:00
url: /2017/04/19/proxmox-ve-platforma-za-virtualizaciju-i-linux-kontejnere-novosti/
featured_image: /wp-content/uploads/2017/04/Proxmox_logo_standard_hex_400px.png
categories:
  - Članci
  - Open Source projekti
  - Proxmox VE
  - Vijesti
  - Zanimljivosti
tags:
  - Blog
  - Novosti

---
<img class="alignnone size-full wp-image-2487" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Proxmox_logo_standard_hex_400px.png?resize=400%2C60&#038;ssl=1" alt="" width="400" height="60" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Proxmox_logo_standard_hex_400px.png?w=400&ssl=1 400w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Proxmox_logo_standard_hex_400px.png?resize=150%2C23&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Proxmox_logo_standard_hex_400px.png?resize=300%2C45&ssl=1 300w" sizes="(max-width: 400px) 100vw, 400px" data-recalc-dims="1" />

&nbsp;

&nbsp;

Duže vrijeme nismo spominjali Proxmox VE platformu za virtualizaciju i Linux kontejnere, zapravo od [zadnjeg predavanja][1] o **Proxmox VE** platformi iz 6. mjeseca prošle godine.

&nbsp;

&nbsp;

Pošto je naš tehnološki partner (**Proxmox Server Solutions GmbH** &#8211; [**Proxmox**][2]) od tada napravio mnoge promjene, vrijeme je, a jednim dijelom i naša obaveza, kako bi vas upoznali s novostima.

&nbsp;

&nbsp;

Za one od vas koji su ostali na verziji 3.x, preporuka je prelazak na novu generaciju 4.x. Namjerno ne govorim o verziji 4.x. jer se radi o prelasku na potpuno novu platformu. I dalje je hipervizor za virtualke Linux QEMU/KVM ali se s **OpenVZ** Linux kontejnera prešlo na **LXC** Linux kontejnere. Sve ostale sličnosti su u novoj generaciji sve manje.

&nbsp;

Naime stara generacija 3.x. je nasljeđivale razne tehnologije još od prije, a s novom generacijom 4.x. prešlo se na nove tehnologije ili na novije verzije starih tehnologija a koje u pravilu više nisu unatrag kompatibilne.  Jedna od tih tehnologija je poznati [corosync klaster ][3] koji se unutar Proxmox VE platforme koristi za dodavanje Proxmox VE poslužitelja u Proxmox klaster, te za sve poslove koji su vezani uz klasterski rad. Sve ovo ne bi bilo moguće bez dodatno razvijenog tzv.  [**Proxmox Cluster File System**][4].

Ovaj transakcijski klasterski datotečni sustav donosi slijedeće mogućnosti (uz dodatne funkcionalnosti koje ubjedinjuje Proxmox klaster) :

  * stabilnan je (u produkcijskoj je upotrebi cijeli niz godina),
  * pouzdan je i otporan na ispade bilo kojeg poslužitelja (ili više njih – ovisno o njihovom broju),
  * distribuiran – svi poslužitelji imaju pristup svim konfiguracijskim datotekama u svakom trenutku
  * repliciranje promjena između poslužitelja u klasteru se izvodi transakcijski (pouzdano)
  * sve promjene na bilo kojoj konfiguracijskoj datoteci su vidljive svim Proxmox VE poslužiteljima u klasteru, trenutno – čim se promjena dogodila

&nbsp;

Vezano za sam rad klastera i njegove mogućnosti, sada novi Proxmox VE 4.x. ima novi klaster, koji podržava rad do 32 fizička poslužitelja u klasteru, a i sam klaster radi puno jednostavnije i brže. Sve to zahvaljujući prelasku na novu generaciju **_corosync_**_a_ _(koji je naravno nekompatibilan sa starom generacijom__)_.

&nbsp;

Prelaskom na novi klaster poboljšana je i HA ([High Availability][5]) funkcionalnost za virtualna računala i/ili linux kontejnere. Dakle sposobnost Proxmox VE klastera koja u slučajevima kada imamo vrlo važne virtualke ili linux kontejnere (one koje označimo kao **HA**) a koji stalno moraju biti pokrenuti, da se sustav brine o njihovom &#8220;zdravlju&#8221;. Naime za takve virtualke ili linux kontejnere, u slučaju kvara ili gašenja fizičkog Proxmox VE poslužitelja, **HA** komponenta sustava ih automatski pokreće na drugom dostupnom (živom) fizičkom poslužitelju.

&nbsp;

Kao što sam spomenuo, vezano za Linux kontejnere, prešlo se sa OpenVZ Linux kontejnera na LXC Linux kontejnere.

&nbsp;

**Zbog čega prelazak s OpenVZ na LXC kontejnere ?**

OpenVZ linux kontejneri su stara i pouzdana te u produkciji provjerena tehnologija linux kontejnera koja se koristi desetak godina.

Ali ?!.

[OpenVZ linux kontejneri][6] su zahtijevali modifikaciju samog linux kernela te su bile potrebne i neke druge (doduše sitne) komponente i promjene. Pošto je Proxmox VE baziran na **Debian Linux** distribuciji, to je značilo kako se kod svake nove nadogradnje koja je došla od strane Debian Linuxa, prvo morao _rekompajlirati kernel_ te su se morale napraviti dodatne promjene.  Osim toga ova tehnologija je zaslužila umirovljenje, barem prema odluci razvojnog tima Proxmox VE ali i mnogih ljudi koji su open source (volonteri) programeri za Proxmox VE ili su aktivni u Proxmox VE zajednici.

Odluka je bila očita: [LXC linux][7] kontejnerska tehnologija koja je postala integrirana u novije linux kernele. Dakle sve što je bilo potrebno od strane kernela, sada se već nalazilo u njemu. Prošlo je neko vrijeme i određene stvari su se ispeglale &#8211; u linux kernelu a vezane za LXC.  Naravno prve verzije Proxmox VE 4.x nisu imale sve funkcionalnosti LXC linux kontejnera, kao što su imale za OpenVZ linux konetjnere ali to je bila stvar razvoja samih LXC kontejnera i podrške unutar Linux kernela. Velika prednost odnosno jednostavnost LXC kontejnera je upotreba tzv. [Linux kernel namespaces][8] tehnologija (naravno unutar samog linux kernela).

Ovdje se radi o tehnologijama za izolaciju:

  1. procesa i njihovih mehanizama komunikacije (IPC &#8211; _Interprocess Communication_)
  2.  PID (Process ID)  &#8211; (_PID namespace_) &#8211; izolacija PID-ova pokrenutih procesa
  3. mreže i mrežnih sustava (koji se oslanjaju na tzv.  _network namespace_ )
  4. korisnika i njihovog rada ( _user namespace_)
  5. kontrolnih grupa (_cgroups_) &#8211; za izolaciju pripadnosti kontrolnih grupa pokrenutih procesa (kontrolne grupe su zadužene za dodjeljivanje, ograničavanje i izolaciju resursa : CPU, RAM, disk I/O, mreža, &#8230;)
  6. _mount namespace_ &#8211; zaduženih za mountanje unutar izoliranog prostora (LXC kontejnera konkretno)
  7. _UTS namespace_ &#8211; omogućava promjene _hostname i domainname unutar_ izolacije za različite procese

Pogled na LXC kontejner iz perspektive Linuxa iz kojeg je pokrenut (Proxmox VE) :

<img class="alignnone size-full wp-image-2514" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Pogled-na-LXC-1.png?resize=759%2C524&#038;ssl=1" alt="" width="759" height="524" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Pogled-na-LXC-1.png?w=759&ssl=1 759w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Pogled-na-LXC-1.png?resize=150%2C104&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Pogled-na-LXC-1.png?resize=300%2C207&ssl=1 300w" sizes="(max-width: 759px) 100vw, 759px" data-recalc-dims="1" />

&nbsp;

Pregled ostalih osnovnih tehnologija, koje su podržane već dugo vremena u Proxmox VE platformi:

  * Linux Bonding (Agregacija/Teaming) i VLANovi &#8211; od 07.2008.g (Proxmox VE v. 0.9)
  * live migracija KVM (Virtualke) i  OpenVZ (linux kontejneri)  &#8211; od 10.2008.g. (Proxmox VE v. 1). Slika migracija virtualke (ID: 103) s jednog (fizičkog) Proxmox VE poslužitelja na drugi:

 <img class="alignnone wp-image-2540" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Prox-VM-migrate-select.png?resize=114%2C221&#038;ssl=1" alt="" width="114" height="221" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Prox-VM-migrate-select.png?w=140&ssl=1 140w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Prox-VM-migrate-select.png?resize=77%2C150&ssl=1 77w" sizes="(max-width: 114px) 100vw, 114px" data-recalc-dims="1" />&#8211;>  <img class="alignnone wp-image-2537" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Prox-VM-migrate-select-Prox-server.png?resize=271%2C106&#038;ssl=1" alt="" width="271" height="106" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Prox-VM-migrate-select-Prox-server.png?w=347&ssl=1 347w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Prox-VM-migrate-select-Prox-server.png?resize=150%2C59&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Prox-VM-migrate-select-Prox-server.png?resize=300%2C118&ssl=1 300w" sizes="(max-width: 271px) 100vw, 271px" data-recalc-dims="1" />

  * podrška za VIRTIO uz dodanu podršku za  [**virtio_blk **][9] (_para-virtualized block devices_) &#8211; od 05.2009 (Proxmox VE v.1.2)
  * novi storage model, koji podržava razne vanjske i interne storage &#8211; od 09.2009 (Proxmox VE v.1.4. beta 1): 
      * iSCSI
      * NFS
      * LVM
      * DRBD
  * mogućnost dodjeljivanje CPU Socketa ili jezgri (postao je svjestan [NUMA arhitekture][10]) za virtualke  &#8211; od 09.2009 (Proxmox VE v.1.4. beta 2)
  * Uvodi se [SCST][11] podrška (na razini kernela i softvera) a koja daje brži rad te podržava više protokola : iSCSI, FC. Dodatno uvodi podršku za više storage interface-a prema virtualkama (SCSI pass-through, [block][12] I/O i file I/O) &#8211; od 10.2009.g (Proxmox VE v.1.4)
  * prelazak na [qemu-kvm][13] (KVM) za virtualizaciju (brži i optimiziraniji od QEMU) &#8211; od 01.2010.g. (Proxmox VE v.1.5) &#8211; u novije vrijeme su oba projekta spojena u jedan &#8211; [**QEMU**][14]
  * &#8230;
  * osim linux bond (agregacija/team),  bridge i VLAN podrške (od 2008.g.) dodana je podrška za Open vSwitch, koji je znatno napredniji i prilagođen virtualizaciji. Preko njega  su podržane iste tehnologije (bond, bridge, i VLANovi) ali i mnoge druge napredne mogućnosti &#8211; od 03.2014.g. (Proxmox VE v.3.2 )
  * &#8230; i tako dalje

Za više detalja o osnovnim i naprednijim stvarima koje nudi Proxmox VE platforma, pogledajte članak od prije : <https://www.opensource-osijek.org/wordpress/2016/06/28/retrospektiva-virtualizacija-linux-kontejneri-i-proxmox-ve/>

&nbsp;

&nbsp;

**Što je još zanimljivo kod Proxmox VE platforme ?**

Za većinu funkcionalnosti nije otkrivana &#8220;topla voda&#8221; već su odabrane provjerene i dokazane tehnologije i rješenja iz _open source_ svijeta. Veliki naglasak je uvijek bio i biti će na optimalnoj upotrebi tih tehnologija, bez puno kompliciranja. Štoviše cilj je svaku potrebnu tehnologiju iskoristiti na najbolji mogući inženjerski način, uz što manje komponenti, što jednostavniji dizajn i što bolje performanse.

Ako samo pogledamo mrežni model &#8211; dizajn je jednostavan, pouzdan, brz i bez puno komplikacija i filozofija. Bez obzira koristi li se Linux model : bond, bridge, VLAN ili open vSwitch model s istim komponentama. Način funkcioniranja je nevjerojatno jednostavan za rad i održavanje ali i _debuggiranje_:

<img class="alignnone size-full wp-image-2499" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Proxmox-NET.png?resize=952%2C756&#038;ssl=1" alt="" width="952" height="756" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Proxmox-NET.png?w=952&ssl=1 952w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Proxmox-NET.png?resize=150%2C119&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Proxmox-NET.png?resize=300%2C238&ssl=1 300w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Proxmox-NET.png?resize=768%2C610&ssl=1 768w" sizes="(max-width: 952px) 100vw, 952px" data-recalc-dims="1" />

Dakle ovakav model je najjednostavniji mogući (ne postoji jednostavniji način povezivanja Virtualnog računala i Linux hipervizora od ovog).

Kako ne bi mislili da se išta mora konfigurirati ručno, pogledajte dio konfiguracije mreže za Virtualku:

<img class="alignnone wp-image-2530" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Prox-VM-Net-config.png?resize=484%2C350&#038;ssl=1" alt="" width="484" height="350" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Prox-VM-Net-config.png?w=616&ssl=1 616w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Prox-VM-Net-config.png?resize=150%2C108&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Prox-VM-Net-config.png?resize=300%2C217&ssl=1 300w" sizes="(max-width: 484px) 100vw, 484px" data-recalc-dims="1" />

S time kako možemo mijenjati model virtualizirane mrežne kartice:

<img class="alignnone size-full wp-image-2531" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Prox-VM-Net-LAN-selection.png?resize=177%2C99&#038;ssl=1" alt="" width="177" height="99" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Prox-VM-Net-LAN-selection.png?w=177&ssl=1 177w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Prox-VM-Net-LAN-selection.png?resize=150%2C84&ssl=1 150w" sizes="(max-width: 177px) 100vw, 177px" data-recalc-dims="1" />

&nbsp;

**LXC**

Model kod upotrebe **LXC** Linux kontejnera je vrlo sličan samo što se ne koriste **tap** (_virtualni interface_) već **veth** (također posebna vrsta _virtualnog interface-a_ ) koji se kreira u paru (na slici dolje je par : **veth A1** i **veth A2**), poput tunela &#8211; jedna strana je unutar Linuxa ili open vSwitcha a druga unutar LXC kontejnera (koji zapravo završava unutar _**network namespace**-a unutar_ **LXC** kontejnera ).  Ovakav par **veth** interaface-a se doslovno ponaša kao prolazni tunel &#8211; sve što uđe s jedne strane izađe na drugu stranu i obratno a ovo je jedini mogući način komunikacije između Linuxa i Linux kontejnera, barem što se mreže tiće. Istu metodu koristi i **docker** . Možda zvući komplicirano ali nema druge ili barem jednostavnije metode komunikacije od i prema Linux kontejneru, preko mreže.

Pogledajmo i logičku shemu ovakvog scenarija, s jednom fizičkom mrežnom karticom (LAN1- eth0) na poslužitelju:

<img class="alignnone size-full wp-image-2525" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Proxmox-LXC-1.png?resize=992%2C571&#038;ssl=1" alt="" width="992" height="571" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Proxmox-LXC-1.png?w=992&ssl=1 992w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Proxmox-LXC-1.png?resize=150%2C86&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Proxmox-LXC-1.png?resize=300%2C173&ssl=1 300w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Proxmox-LXC-1.png?resize=768%2C442&ssl=1 768w" sizes="(max-width: 992px) 100vw, 992px" data-recalc-dims="1" />

Pogledajmo konfiguraciju mreže LXC kontejnera:

<img class="alignnone wp-image-2535" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Prox-LXC-Net-config.png?resize=531%2C246&#038;ssl=1" alt="" width="531" height="246" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Prox-LXC-Net-config.png?w=617&ssl=1 617w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Prox-LXC-Net-config.png?resize=150%2C70&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Prox-LXC-Net-config.png?resize=300%2C139&ssl=1 300w" sizes="(max-width: 531px) 100vw, 531px" data-recalc-dims="1" />

&nbsp;

**Vratimo se na virtualke**

Ako pogledamo i druge funkcionalnosti, od samog pokretanja virtualnih računala, također se ne koriste nikakvi među slojevi (pr. [**libvirt**][15] ili sl.), kako bi se i ovdje rad pojednostavnio i ubrzao. Naime Proxmox VE, pokreće virtualna računala i to direktno iz KVM/QEMU hipervizora. Pogledajmo kako **Proxmox VE** pokreće jednu virtualku :

<pre class="lang:sh decode:true">/usr/bin/kvm -id 103 -chardev socket,id=qmp,path=/var/run/qemu-server/103.qmp,server,nowait 
-mon chardev=qmp,mode=control -vnc unix:/var/run/qemu-server/103.vnc,x509,password 
-pidfile /var/run/qemu-server/103.pid -daemonize 
-smbios type=1,uuid=03804a77-ca26-48c1-ad86-8e80fbe09921 
-name Windows-Server-01 -smp 2,sockets=1,cores=2,maxcpus=2 -nodefaults 
-boot menu=on,strict=on,reboot-timeout=1000 -vga std -no-hpet
 -cpu kvm64,hv_spinlocks=0xffff,hv_relaxed,+lahf_lm,+x2apic,+sep 
 -m 13312 -object memory-backend-ram,size=13312M,id=ram-node0 
 -numa node,nodeid=0,cpus=0-1,memdev=ram-node0 -k en-us 
 -device piix3-usb-uhci,id=uhci,bus=pci.0,addr=0x1.0x2 
 -device usb-tablet,id=tablet,bus=uhci.0,port=1 
 -device virtio-balloon-pci,id=balloon0,bus=pci.0,addr=0x3 
 -iscsi initiator-name=iqn.1993-08.org.debian:01:49f3217929a5 
 -drive if=none,id=drive-ide1,media=cdrom,aio=native 
 -device ide-cd,bus=ide.0,unit=1,drive=drive-ide1,id=ide1,bootindex=200 
 -drive if=none,id=drive-ide2,media=cdrom,aio=native 
 -device ide-cd,bus=ide.1,unit=0,drive=drive-ide2,id=ide2,bootindex=201 
 -drive file=/var/lib/vz/images/103/vm-103-disk-1.qcow2,if=none,id=drive-virtio0,format=qcow2,aio=native,cache=none,detect-zeroes=on 
 -device virtio-blk-pci,drive=drive-virtio0,id=virtio0,bus=pci.0,addr=0xa,bootindex=100 
 -netdev type=tap,id=net0,ifname=tap103i0,
 script=/var/lib/qemu-server/pve-bridge,downscript=/var/lib/qemu-server/pve-bridgedown,vhost=on 
 -device virtio-net-pci,mac=5A:D8:6E:DA:8F:AF,netdev=net0,bus=pci.0,addr=0x12,id=net0,bootindex=300 
 -rtc driftfix=slew,base=localtime -global kvm-pit.lost_tick_policy=discard</pre>

(Ovo naravno nije vidljivo iz GUIa iz kojega je zamišljeno da **isključivo** i radite)

&nbsp;

Ovakvim načinom, bez posrednika, dobilo se na jednostavnosti, brzini ali i mogućnosti dodatnih optimizacija za svaku pojedinu virtualku. Naime konfiguracijski parametri svake virtualke se nalaze u zasebnoj datoteci na Proxmox VE linuxu, tako da je uključivanje i onih parametara ili opcija koje nisu dostupne preko GUI sučelja, jednostavno &#8211; editiranjem konfiguracijske datoteke od željene virtualke. Dodatno ako imamo Proxmox VE klaster &#8211; sve ove (i sve druge ) konfiguracijske datoteke se repliciraju na sve Proxmox VE poslužitelje u klasteru (preko već spomenutog Proxmox klastersog datotečnog sustava [[pmxcfs][4]]).

Ovime se dobilo i na pouzdanosti &#8211; nisu razvijane neke posebne metode ili programi koji su potrebni za pokretanje, praćenje i druge mogućnosti rada virtualki, već se koriste dostupne metode koje nam daje QEMU/KVM.

&nbsp;

> <sup><strong>Linux kontejneri</strong> i <strong>docker</strong> (kontejner) nisu isto. Linux kontejneri (OpenVZ ili LXC) su kontejneri koji sadrže kompletan izolirani linux (točnije specifičnu, željenu distribuciju Linuxa). Ovakav Linux kontejner se ponaša slično kao bilo koja Linux virtualka  (ili računalo na koje je instaliran Linux). Razlika između Linux kontejnera i virtualke je u tome što Linux kontejner troši drastično manje resursa od virtualke te nema cijeli niz slojeva virtualizacije. Dakle na Linux kontejner možete normalno instalirati programe kao što bi ih instalirani na bilo koji linux.</sup>
> 
> <sup>S druge strane <strong>docker</strong> (kontejner) je kontejner za aplikacije, unutar njega se pokreću aplikacije/programi, kojima je Linux koji se vrti negdje &#8220;ispod haube&#8221; nevidljiv. Docker također koristi istih sedam (7) tehnologija za izolaciju (<em>cgroups</em>, i <em>namespaces</em>) kao i LXC. Dakle iz <em>dockera</em> ne vidite izvršne linux datoteke, servise, linux biblioteke (engl. <em>librarys</em>) ili datotečni sustav sa strukturom datoteka i direktorija već <em>docker</em> &#8220;daje&#8221; sve potrebno aplikaciji koja se pokreće unutar <em>dockera. </em></sup>

&nbsp;

&nbsp;

Iste metode koriste se i za svaku drugu komponentu sustava &#8211; od Storage sustava za pohranu virtualnih diskova, snapshote istih, do storage sustava za backup te drugih komponenti. [**KISS**][16] principi razvoja, implementacije i rada uvijek i svugdje.

Pogledajte izbornik vrste virtualiziranog disk kontrolera:

<img class="alignnone wp-image-2532" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Prox-VM-controller-type.png?resize=505%2C186&#038;ssl=1" alt="" width="505" height="186" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Prox-VM-controller-type.png?w=613&ssl=1 613w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Prox-VM-controller-type.png?resize=150%2C55&ssl=1 150w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Prox-VM-controller-type.png?resize=300%2C111&ssl=1 300w" sizes="(max-width: 505px) 100vw, 505px" data-recalc-dims="1" />

&#8230; te ako ste odabrali SCSI, pod odabir modela virtualiziranog SCSI kontrolera:

<img class="alignnone wp-image-2533" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Prox-VM-SCSI-controller-type.png?resize=266%2C217&#038;ssl=1" alt="" width="266" height="217" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Prox-VM-SCSI-controller-type.png?w=302&ssl=1 302w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Prox-VM-SCSI-controller-type.png?resize=150%2C122&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Prox-VM-SCSI-controller-type.png?resize=300%2C244&ssl=1 300w" sizes="(max-width: 266px) 100vw, 266px" data-recalc-dims="1" />

&nbsp;

&nbsp;

&nbsp;

**Razvoj i nadogradnje  Proxmox VE platforme**

**Proxmox VE** je baziran na **Debian** distribuciji Linuxa, pa tako i sve nadogradnje koje se razvijaju i dolaze za Debian, dolaze i za Proxmox VE. Pošto je Debian jedna od najkorištenijih i najstabilnijih distribucija Linuxa, s desecima tisuća programera i ljudi koji ju koriste (samo se sjetite da su i sve varijante **Ubuntu** distribucije Linuxa bazirane na Debianu ) ovdje smo dobili cijelu vojsku ljudi koji stalno pronalaze potencijalne greške i otklanjaju ih. Dodatno stalno se rade optimizacije postojećih programskih paketa, koji u konačnici završe i na Proxmox VE platformi.

Drugi dio čine programi i komponente koje razvija tvrtka koja stoji iza Proxmox VE  open source platforme : &#8220;**Proxmox Server Solutions GmbH**&#8221; ali i cijeli niz programera i korisnika ove platforme.  Naime cijela platforma je objavljena prema <a title="Read more at www.gnu.org" href="http://www.gnu.org/licenses/agpl-3.0.en.html" target="_blank" rel="noopener noreferrer">GNU AGPL, v3</a> licenci, te nema skrivenih djelova ili funkcionalnosti koje se posebno naplaćuju &#8211; sve je otvoreno i dostupno (i besplatno).

Tvrtka koja podupire i razvija ovu platformu &#8211; dakle **Proxmox Server Solutions GmbH** ima stalno zaposleni tim programera i tehničara koji razvijaju platformu ali i pružaju podršku onim korisnicima koji su spremni platiti za željenu razinu podrške.

Za one korisnike koji se žele pretplatiti na Proxmox VE platformu, distributer za Hrvatsku je tvrtka:

* * *

**Suma informatika**

**<http://www.suma-informatika.hr/>**

Badalićeva 27, 10 000 Zagreb

Kontaktni e-mail : tonci@suma-informatika.hr

* * *

&nbsp;

Opcije podrške i cijene su vidljive na slici dolje:

<img class="alignnone size-full wp-image-2503" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Proxmox-VE-pricing.png?resize=1016%2C522&#038;ssl=1" alt="" width="1016" height="522" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Proxmox-VE-pricing.png?w=1016&ssl=1 1016w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Proxmox-VE-pricing.png?resize=150%2C77&ssl=1 150w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Proxmox-VE-pricing.png?resize=300%2C154&ssl=1 300w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Proxmox-VE-pricing.png?resize=768%2C395&ssl=1 768w" sizes="(max-width: 1000px) 100vw, 1000px" data-recalc-dims="1" />

Još jednom ću naglasiti kako je ovo platforma otvorenog koda, te se podrška ne mora plaćati ako to ne želite. S druge strane za poslovne korisnike se ipak preporuča neki od modela komercijalne podrške. Cijene koje se navode **per CPU** se odnose na cijenu za jedan fizički poslužitelj s jednim fizičkim procesorom, bez obzira da li ima jednu ili 40 jezgri. Prema tome ako kupujete licencu za jedan fizički poslužitelj s dva fizička procesora, cijena je nešto veća. Detaljnije cijene možete vidjeti na stranici : [https://www.proxmox.com/en/proxmox-ve/pricing.][17]

&nbsp;

&nbsp;

**Vratimo se na razvoj**

Zbog svoje potpune otvorenosti cjelokupnog programskog koda, vrlo često i sami korisnici koji su programeri, optimiziraju platformu ili ispravljaju greške na njoj.

&nbsp;

Što se tiče repozitorija s kojih Proxmox VE &#8220;skida&#8221; nadogradnje oni su podijeljeni u dvije kategorije:

  * Oni koji su vezani za OS (Linux) se spajaju direktno na **Debianove** repozitorije, bez ikakve rekonfiguracije
  * Oni koji su vezani za Proxmox VE specifični softver i komponente, standardno se spajaju na Proxmox VE repozitorij i to: 
      * Standardno (bez pretplate) dobivate pristup na stabilni repozitorij u kojemu su sve potrebne nadogradnje koje su testirane od strane zajednice (svih korisnika Proxmox VE platforme) i to duže vrijeme, te su potvrđene kao stabilne od strane tvrke koja stoji iza ove platforme. Pristup ovom repozitoriju je standardno već konfiguriran pa ne morate ništa mijenjati. 
          * I za one željne isprobavanja novih tehnologija, koje su u fazi isprobavanja i testiranja i od strane open source zajednice programera i korisnika Proxmox VE ali i od gore imenovane tvrtke. Za pristup ovom repozitoriju je potrebna mala rekonfiguracija (dvije linije konfiguracije repozitorija ). Ovaj repozitorij nije za produkcijsku upotrebu i koristite ga na vlastitu odgovornost. Ali u njemu se nalaze one stvari koje će vrlo vjerojatno jednoga dana završiti u novim verzijama Proxmox VE (ili ih se uopće neće koristiti i biti će potpuno napuštene)
      * Za one koji su spremni platiti minimalno, prvu kategoriju &#8220;podrške&#8221; tj. **COMMUNITY** razinu (pogledajte tablicu gore) a  koja se zapravo odnosi na pristup još stabilnijim i dodatno testiranim softverskim paketima, koje dodatno testira i verificira tvrtka **Proxmox Server Solutions GmbH**. Dake za pristup ovom repozitoriju morate platiti podršku te dobivate aktivacijski kod koji unosite za svaki poslužitelj zasebno (jer se tako i naplaćuje )

&nbsp;

**Nove funkcionalnosti**

Nove funkcionalnosti se stalno dodaju na Proxmox VE platformu, jednim djelom ako se registrirate na Proxmox VE forum: <https://forum.proxmox.com/> te zatražite neku funkcionalnost koju će potvrditi i mnogi drugi korisnici, tada će vrlo vjerojatno netko (ili vi) početi raditi na njoj a ako je stvarno prihvaćena od drugih tada će i službeni programeri (zaposlenici tvrtke **Proxmox Server Solutions GmbH**) dobiti zeleno svjetlo za razvoj iste.

Druga opcija je uvijek &#8211; sami slobodno možete razviti novu funkcionalnost:

  * nešto potpuno novo
  * ili nešto korištenjem API-ja koji imate dostupan za cijelu Proxmox VE platformu: 
      * Pročitajte: [https://pve.proxmox.com/wiki/Proxmox\_VE\_API][18] te možete pogledati i cijelu listu podržanog : <http://pve.proxmox.com/pve-docs/api-viewer/index.html>

&nbsp;

&nbsp;

**Prijavljivanje grešaka**

Za prijavljivanje grešaka, morate se prvo registrirati (besplatno) te sve greške možete prijaviti na Bugzillu : <https://bugzilla.proxmox.com/>.

&nbsp;

&nbsp;

&nbsp;

&nbsp;

**Pogledajmo novosti koje su uvedene u generaciji 4.x. Proxmox VE platforme
  
** 

&nbsp;

**Verzija 4.0**

Osnovnu listu novosti koje je dovela nova generacija Proxmox VE 4.0. pogledajte na videu u prilogu:

[//www.youtube.com/embed/T0yP2cSVRBI]

Stabilna verzija 4.0 je objavljena 05.10.2015. nakon toga su uslijedila mnogobrojna poboljšanja i optimizacije ali i naravno ispravke grešaka.

&nbsp;

&nbsp;

**Ali što je s migracijom s verzije 3.x na 4.x. ?**

Kratki odgovor: ne postoji, zbog prevelikih promjena u novoj generaciji/verziji.

Duži odgovor:  ako ste imali Proxmox VE klaster 3.x. najbrža metoda je izrada _bakupa_ svih **virtualki** i **linux kontejnera** te kreiranje novog Proxmox VE 4.x. klastera te restore virtualki. Potom slijedi procedura konverzije OpenVZ linux kontejnera u LXC Linux kontejnere, opisana u službenom dokumentu :

[https://pve.proxmox.com/wiki/Convert\_OpenVZ\_to_LXC][19]

&nbsp;

&nbsp;

**Verzija 4.1**

Ova verzija (stabilna) objavljena je  11.12.2015. Donijela je slijedeće stvari :

  * bazirana je na  Debian Jessie 8.2.0 linux
  * Prelazi se na novi linux kernel 4.2.6
  * poboljšano je pokretanje i stopiranje (startup/shutdown behavior (systemd)) servisa
  * NTP je sada standardno uključen
  * kod instalacije Proxmox VE je moguće odabrati do 8 diskova za ZFS (ako želimo ZFS datotečni sustav za sistemske diskove)
  * Linux KVM opcije za sve virtualke iz GUIa: 
      *  dodan je **qemu agent**  &#8211; zadužen za komunikaciju Gues OS (virtualke) i Hipervizora (Proxmox VE [QEMU+KVM]) **
  
** 
      * nadograđen je network Boot ROM
  * Poboljšan je HA GUI za korisnike s ograničenim pravima
  * LXC linux kontejneri 
      *  dodana je mogućnost povečanja _rootfs_-a iz GUIa
      * dodani su LXC template-i za : 
          * Fedora 22
          * Debian stretch/sid i
          * Ubuntu 15.10
      * Dodana je podrška za  &#8220;_unpriviledged containers_&#8221; (kao &#8220;_technology preview_&#8220;)
  * storage:  dodana je podrška za &#8220;_LVM thin support_&#8221; (kao &#8220;_technology preview_&#8220;) &#8211; dakle _**Thin provisioning**_ pomoću LVM ([Linux LVM2][20] konkretno)
  * dodana je naredba  **pvereport**
  * &#8230; i mnoge druge optimizacije i _bugfix_ovi

&nbsp;

**Verzija 4.2**

Ova verzija (stabilna) objavljena je  27.04.2016. Donijela je slijedeće stvari &#8211; nabrojati ću samo ono osnovno:

&nbsp;

  * GUI update &#8211; prelazak na  **Sencha Ext JS 6**, uključujući nove ikone i dinamičke prikaze opterečenja sustava. 
      * Novi i responzivniji GUI
  * baziran na Debian Jessie 8.4.0
  * Novi Linux kernel 4.4.6
  * Novi KVM/qemu 2.5.1
  * kod instalacije Proxmox VE -moguće je odabrati &#8220;_LVM thin_&#8221;  particije ili  ZFS
  * Storage : 
      * dodana je podrška za &#8220;_LVM thin_&#8221; particije koje su sada _default_ (ovo je bio _technology preview_ a u ovoj verziji postaje sastavni, produkcijski dio)
      * Podrška za DRBD**9**: drbd 9.0.2 kernel module i drbdmanage 0.95
  * <a class="external text" href="http://pve.proxmox.com/wiki/HTTPSCertificateConfiguration#Let.27s_Encrypt_using_acme.sh" rel="nofollow">Podrška za Let´s Encrypt</a>
  * LXC podrška : 
      * poboljšan setup LXC kontejnera
      * dodana je mogućnost ograničavanja brzine mrežnih kartica LXC kontejnera
      * dodavanja _mount point_-a preko GUI
      * &#8230;
      * poboljšanja kod backup/snapshot procedura
      * dodana je podrška za nove LXC kontejnere : 
          * Alpine Linux i
          * Ubuntu 16.04
  * pobojlšanja HA managera
  * nova poruka kod  brisanja virtualke ili LXC kontejnera (kao zaštita od slučajnog brisanja)
  * poboljšanja u dijelu GUI sučelja vezanim za CEPH storage
  * mnoge druge oiptimizacije i popravke grešaka

Pogledajmo i kratki video s novostima u verziji 4.2:

[//www.youtube.com/embed/OCMWhAb69ec]

&nbsp;

&nbsp;

**Verzija 4.3**

Ova verzija (stabilna) objavljena je  27.09.2016. Donijela je slijedeće stvari &#8211; nabrojati ću samo ono osnovno:

&nbsp;

  * Poboljšanja GUI-a 
      * dodano je pretraživanje  (“_**ctrl-shift-f**_”)
      * vertikalni meniji sa grupama i novim ikonama
      * dvostruki klik za otvaranje konzole za VM/CT
      * novi statusni pregled, prema Proxmox VE poslužiteljima,  VM i LXC kontejnerima i opterečenjima istih
  * čarobnjak kod kreiranja VM (virtualke) sada predlaže optimalne (vrlo dobro testirane)postavke, ovisno o odabranoj vrsti virtualnog računala koje želimo kreirati
  * sada su dostupne kontekstualne upute (ovisno što gledamo ili želimo mijenjati)
  * novi disk managenet, koji uključuje S.M.A.R.T. i provjeru istrošenosti SSD diskova (_SSD wearout level_) &#8211; za sada za Samsung, Sandisk i Intel SSD diskove (novi se dodaju sveko malo)
  * Baziran je na Debian Jessie 8.6.0
  * Novi Linux kernel 4.4.19
  * KVM/qemu nove verzije 2.6.1
  * LXC: nadogradnja na v. 2.0.4
  * i moge druge optimizacije i popravci.

Pogledajte i kratki video s novostima koje je ova verzija uvela:

[//www.youtube.com/embed/Mk3ytGD5-vU]

&nbsp;

&nbsp;

**Verzija 4.4**

Ova verzija (stabilna) objavljena je  13.12.2016. Donijela je slijedeće stvari:

  * Nadogradnju na linux kernel 4.4.35
  * KVM: update na qemu 2.7.0
  * poboljšanja LXCa 
      * nadograđen na LXC 2.0.6
      * implementirana nova funkcionalnost  _restart migration_
      * Tzv. _unprivileged containers_  se sada nalazi u GUIu (bio je _technology preview_ u verziji 4.1)
      * Dodani su novi _templatei:_ 
          * Debian, Ubuntu, CentOS, Fedora, Arch i Alpine

Trenutno ih je dostupan popriličan broj (14 &#8220;čistih&#8221; Linux distribucija i 100 [_turnkeylinux_][21] &#8211; _debian_ baziranih, s već instaliranim određenim paketima/servisima) :

<img class="alignnone wp-image-2543" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Prox-LXC-Templates.png?resize=476%2C569&#038;ssl=1" alt="" width="476" height="569" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Prox-LXC-Templates.png?w=633&ssl=1 633w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Prox-LXC-Templates.png?resize=125%2C150&ssl=1 125w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Prox-LXC-Templates.png?resize=251%2C300&ssl=1 251w" sizes="(max-width: 476px) 100vw, 476px" data-recalc-dims="1" />

  * Poboljšanja GUI 
      * novi ceph dashboard
      * novi cluster dashboard
      * poboljšani disk management , smart status s podrškom za nove  SSD diskove
      * poboljšan HA GUI
  * Instalacija Proxmox VE sustava podržava napredne postavke ZFSa
  * Uvedena je zasebna mreža za migraciju  virtualki (VM) ili kontejnera (CT)
  * Poboljšana je dokumentacija
  * Storage : DRBD9 je izbačen &#8211; zbog promjene licencnog modela od strane tvrtke Linbit (koja ga razvija) 
      *  Trenutno su podržani slijedeći _Storage-i (interni i/ili vanjski/mrežni)_:

<img class="alignnone size-full wp-image-2545" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Prox-STORAGE-ADD.png?resize=275%2C285&#038;ssl=1" alt="" width="275" height="285" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Prox-STORAGE-ADD.png?w=275&ssl=1 275w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/04/Prox-STORAGE-ADD.png?resize=145%2C150&ssl=1 145w" sizes="(max-width: 275px) 100vw, 275px" data-recalc-dims="1" />

  * &#8230;
  * napravljene su i mnoge druge optimizacije i ispravke grešaka

Pogledajmo kratki video s novim mogućnostima u ovoj verziji :

[//www.youtube.com/embed/GWnHVe5HtK8]

&nbsp;

Uz aktivan razvoj na verziji 4.x razvija se i verzija 5.x koja ne predstavlja novu generaciju već evolucijski pomak (barem je to plan za sada).

&nbsp;

Za sada toliko, do produkcijske verzije 5.x.

&nbsp;

&nbsp;

&nbsp;

Za sve dodatne informacije slobodno kontaktirate autora ili tvrtku [Suma informatika][22] (ovlaštenog distributera Proxmox VE platforme za Hrvatsku).

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;

Autor: Hrvoje Horvat

[LinkedIN][23]

&nbsp;

&nbsp;

 [1]: https://www.opensource-osijek.org/wordpress/2016/06/28/retrospektiva-virtualizacija-linux-kontejneri-i-proxmox-ve/
 [2]: https://www.proxmox.com
 [3]: http://corosync.github.io/corosync/
 [4]: https://pve.proxmox.com/wiki/Proxmox_Cluster_File_System_(pmxcfs)
 [5]: https://pve.proxmox.com/wiki/High_Availability_Cluster
 [6]: https://openvz.org/Main_Page
 [7]: https://linuxcontainers.org/lxc/introduction/
 [8]: https://en.wikipedia.org/wiki/Linux_namespaces
 [9]: https://www.linux-kvm.org/images/f/f9/2012-forum-virtio-blk-performance-improvement.pdf
 [10]: https://www.opensource-osijek.org/dokuwiki/wiki:knjige:uvod_u_linux#numa
 [11]: https://en.wikipedia.org/wiki/SCST
 [12]: https://en.wikipedia.org/wiki/Block_%28data_storage%29 "Block (data storage)"
 [13]: http://www.linux-kvm.org/page/FAQ#Preparing_to_use_KVM
 [14]: http://www.qemu.org/
 [15]: https://libvirt.org/
 [16]: https://en.wikipedia.org/wiki/KISS_principle
 [17]: https://www.proxmox.com/en/proxmox-ve/pricing
 [18]: https://pve.proxmox.com/wiki/Proxmox_VE_API
 [19]: https://pve.proxmox.com/wiki/Convert_OpenVZ_to_LXC
 [20]: https://en.wikipedia.org/wiki/Logical_Volume_Manager_(Linux)
 [21]: https://en.wikipedia.org/wiki/TurnKey_Linux_Virtual_Appliance_Library
 [22]: https://www.proxmox.com/en/partners/reseller/item/suma-informatika-d-o-o?category_id=63
 [23]: https://www.linkedin.com/in/hrvoje-horvat-48477b1/