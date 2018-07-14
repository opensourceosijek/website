---
title: Osnove NAS i SAN sustava (i malo više)
authors: hhorvat
type: post
date: 2016-09-08T11:06:34+00:00
thumbnail: "thumbnail.jpg"
categories:
  - Članci
  - Linux
  - Open Source projekti
  - Zanimljivosti
tags:
  - Članci
  - linux
  - Open Source
---

<p class="sectionedit3">
  <strong>U daljem tekstu upoznati ćemo se s jednostavnijim NAS i SAN sustavima, preko malo složenijih (ZFS) sve do onih klasterskih. Potom ćete vidjeti kako rade i što su uopće &#8220;Object Storage&#8221; sustavi.</strong>
</p>

### Što su NAS sustavi ? {#sto_je_uopce_nas_sustav.sectionedit3}

<div class="level3">
  <p>
    NAS (Engl. Network Attached Storage) odnosno “mrežno spojena spremišta podataka” osiguravaju nam prostor za spremanje podataka, preko mreže. Ovo su zapravo mrežni dijeljeni sustavi za spremanje podataka, koji rade na razini datoteka (i naravno direktorija) koje pohranjujemo na njih i to preko mrežnih protokola za dijeljenje datoteka.
  </p>
</div>

&nbsp;

> <p style="padding-left: 30px;">
>   <span style="color: #ff0000;">Svako dijeljenje datoteka preko mreže (Engl. Network Share), korištenjem nekog od mrežnih protokola koji postoje za tu namjenu, možemo nazvati upotrebom kao NAS sustava.</span>
> </p>

&nbsp;

Dijeljeni pristup datotekama preko mreže omogućavaju nam sljedeći mrežni protokoli. Navesti ćemo one najčešće u upotrebi:

<li class="level1">
  <div class="li">
    <strong>NFS</strong> (<a class="urlextern" title="https://en.wikipedia.org/wiki/Network_File_System" href="https://en.wikipedia.org/wiki/Network_File_System" rel="nofollow">Network Files System</a>) &#8211; koristi se uglavnom na Linux/Unix operacijskim sustavima (ili ponekad u Windows okruženju). Open source varijanta podrazumjeva korištenje nekog od <strong>nfs</strong> daemona (servisa)
  </div>
</li>

<li class="level1 node">
  <div class="li">
    <strong>SMB/CIFS</strong> (<a class="urlextern" title="https://en.wikipedia.org/wiki/Server_Message_Block" href="https://en.wikipedia.org/wiki/Server_Message_Block" rel="nofollow">Server Message Block / Common Internet File System</a>) &#8211; koristi se uglavnom na Windows ili Linux okruženjima. Koristi se osim za dijeljenje datoteka i za dijeljenje pisača, i drugih uređaja te dodatnih funkcionalnosti,preko mreže.
  </div>
  
  <ul>
    <li class="level2">
      <div class="li">
        Open source riješenje se zove <a class="urlextern" title="https://en.wikipedia.org/wiki/Samba_(software)" href="https://en.wikipedia.org/wiki/Samba_%28software%29" rel="nofollow">samba</a>
      </div>
    </li>
    
    <li class="level2">
      <div class="li">
        <strong>Windows Share</strong> je integriran u sve Windows operacijske sustave, s ograničenjem od maksimalno 10 paralelnih (otvorenih) konekcija na Windows dijeljeni direktorij ako se radi o verziji Windowsa koja NIJE : Windows Server: 2003/2003 R2/2008/2008 R2/2012/2012(R2)
      </div>
    </li>
  </ul>
</li>

<li class="level1">
  <div class="li">
    <strong>AFP</strong> (<a class="urlextern" title="https://en.wikipedia.org/wiki/AppleShare" href="https://en.wikipedia.org/wiki/AppleShare" rel="nofollow">Apple Filing Protocol</a>) &#8211; koristi se za dijeljenje datoteka na Mac <abbr title="Operating System">OS</abbr> računalima.
  </div>
</li>

<li class="level1">
  <div class="li">
    Istoj kategoriji pripadaju i <strong><abbr title="File Transfer Protocol">FTP</abbr></strong> (<a class="urlextern" title="https://en.wikipedia.org/wiki/File_Transfer_Protocol" href="https://en.wikipedia.org/wiki/File_Transfer_Protocol" rel="nofollow">File Transfer Protocol</a>) i <strong>TFTP</strong> (<a class="urlextern" title="https://en.wikipedia.org/wiki/Trivial_File_Transfer_Protocol" href="https://en.wikipedia.org/wiki/Trivial_File_Transfer_Protocol" rel="nofollow">Trivial File Transfer Protocol</a>) protokoli, s time da su oni jednostavniji i nemaju naprednije mogućnosti kao gore navedeni.
  </div>
</li>

<li class="level1">
  <div class="li">
    Često se koristi i <strong>WebDAV</strong> (<a class="urlextern" title="https://en.wikipedia.org/wiki/WebDAV" href="https://en.wikipedia.org/wiki/WebDAV" rel="nofollow">Web Distributed Authoring and Versioning</a>) koji je što se tiće funkcionalnosti negdje između <abbr title="File Transfer Protocol">FTP</abbr> i gore navedenih protokola
  </div>
</li>

<li class="level1">
  <div class="li">
    …
  </div>
</li>

&nbsp;

Najosnovniji primjer upotrebe sustava za koji bi mogli reći da je neka vrsta NAS sustava bi bio klasično dijeljenje nekog direktorija preko mreže, iz Windows OS-a.

Nešto poput dijeljenja (Engl. Sharing) ovog direktorija (D:\BKP) na slici:

<img class="alignnone size-full wp-image-2231" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/windows_sharing-1.jpg?resize=363%2C481&#038;ssl=1" alt="windows_sharing-1" width="363" height="481" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/windows_sharing-1.jpg?w=363&ssl=1 363w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/windows_sharing-1.jpg?resize=113%2C150&ssl=1 113w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/windows_sharing-1.jpg?resize=226%2C300&ssl=1 226w" sizes="(max-width: 363px) 100vw, 363px" data-recalc-dims="1" />

&nbsp;

U slučaju upotrebe na Windows operacijskom sustavu, sve se za jednostavno mrežno dijeljenje svodi na odabir željenog direktorija te njegovog dijelljenja preko SMB/CIFS sustava.

&nbsp;

Ako govorimo o “samostalnom” NAS sustavu odnosno uređaju pod nekom od varijanti Unix ili Linux operacijskih sustava, ova procedura se u konačnici uglavnom svodi na nekoliko koraka :

<p style="padding-left: 30px;">
  1. Kreiranje nekog RAID polja diskova, koje ćemo dalje koristiti kao jedan “logički” disk<br /> 2. Particioniranje “logičkog” diska koji ćemo koristiti za dijeljenje datoteka<br /> 3. Formatiranje kreiranih particija (Linux ext3/4 ,Linux XFS, Windows NFS ili sl. (ovisno o operacijskom sustavu NAS uređaja i našim potrebama) )<br /> 4. Mountanje formatirane particije u neki direktorij<br /> 5. Odabir mountanog direktorija te konfiguracija i aktivacija nekog od mrežnih protokola za dijeljeni pristup preko mreže &#8211; pogledajte dolje (NFS, SMB/CIFS, AFP ili sl.)
</p>

&nbsp;

#### Osnovne pretpostavke i planiranje za NAS ili SAN sustav {#osnovne_pretpostavke_i_planiranje_za_nas_ili_san_sustav.sectionedit6}

<div class="level4">
  <p>
    1. Kod odabira NAS ili SAN sustava odnosno poslužitelja, prvo moramo biti svjesni zahtjeva za softverom (operacijskima sustavom). Operacijski sustav za NAS ili SAN može biti :
  </p>
  
  <ul>
    <li class="level1 node">
      <div class="li">
        Specijalizirani open source <abbr title="Operating System">OS</abbr> poput :
      </div>
      
      <ul>
        <li class="level2">
          <div class="li">
            OpenFiler
          </div>
        </li>
        
        <li class="level2">
          <div class="li">
            OpenMediaVault
          </div>
        </li>
        
        <li class="level2">
          <div class="li">
            FreeNAS
          </div>
        </li>
        
        <li class="level2">
          <div class="li">
            Nas4Free
          </div>
        </li>
        
        <li class="level2">
          <div class="li">
            NexentaStor (Nexenta Community Edition)
          </div>
        </li>
      </ul>
    </li>
    
    <li class="level1 node">
      <div class="li">
        ili neko od komercijalnih rješenja za NAS/SAN :
      </div>
      
      <ul>
        <li class="level2">
          <div class="li">
            NexentaStor (Nexenta Enterprise Edition)
          </div>
        </li>
        
        <li class="level2">
          <div class="li">
            TrueNAS
          </div>
        </li>
        
        <li class="level2">
          <div class="li">
            Open-E
          </div>
        </li>
        
        <li class="level2">
          <div class="li">
            …
          </div>
        </li>
      </ul>
    </li>
  </ul>
  
  <ul>
    <li class="level1 node">
      <div class="li">
        ili <abbr title="Operating System">OS</abbr> za opću upotrebu, koji ćemo dodatno konfigurirati prema našim potrebama:
      </div>
      
      <ul>
        <li class="level2">
          <div class="li">
            Neki Linux koji želimo prilagoditi našim potrebama ili
          </div>
        </li>
        
        <li class="level2">
          <div class="li">
            Windows server koji već imamo te ga želimo optimizirati ili prenamjeniti za NAS/SAN sustav
          </div>
        </li>
        
        <li class="level2">
          <div class="li">
            ili nešto drugo
          </div>
        </li>
      </ul>
    </li>
  </ul>
</div>

&nbsp;

> <p style="padding-left: 30px;">
>   <span style="color: #ff9900;">Postoje i gotovi “samostojeći” uređaji koji dolaze zajedno s operacijskim sustavom. Proizvode ih : EMC<sup>2</sup>, IBM, Dell, NetApp i drugi (oni nisu tema ove priče ). </span>
> </p>

&nbsp;

  1. Nakon što smo odabrali operacijski sustav za NAS ili SAN poslužitelj, moramo biti svjesni i njegovih zahtjeva za hardverom:

<li class="level1">
  <div class="li">
    Koji CPU će zadovoljiti naše potrebe
  </div>
</li>

<li class="level1">
  <div class="li">
    Koliko RAM memorije (i koji tip)
  </div>
</li>

<li class="level1">
  <div class="li">
    Koje mrežne kartice: 1Gbps ili 10Gbps, koji modeli (chipovi) i koliko ih je potrebno (jedna, dvije, tri, …)
  </div>
</li>

<li class="level1">
  <div class="li">
    Koji mrežni preklopnik (Switch) odabrati, s kojom verzijom Firmware-a (<abbr title="Operating System">OS</abbr>-a) i s kojim funkcionalnostima Pogledajte članak “<a class="urlextern" title="https://www.opensource-osijek.org/wordpress/2016/02/16/switching-i-routing-jucer-danas-sutra/" href="https://www.opensource-osijek.org/wordpress/2016/02/16/switching-i-routing-jucer-danas-sutra/" rel="nofollow">Switching i routing: jučer, danas, sutra</a>”
  </div>
</li>

<li class="level1">
  <div class="li">
    Koji RAID kontroler, s koliko RAM memorije, BBU i sl. odabrati
  </div>
</li>

<li class="level1">
  <div class="li">
    Koje tvrde diskove odabrati
  </div>
</li>

  1. Nakon planiranja resursa koji će nam trebati, potrebno je revidirati točku 2.

&nbsp;

Pošto govorimo o NAS i SAN sustavima, ovdje ćemo se fokusirati na dio o RAID kontrolerima i diskovima, pošto ćemo bez njihovog dobrog odabira kasnije u radu doći do problema ili vrlo često gubitka podataka a koji ćemo vrlo skupo platiti ( $$$ ).

&nbsp;

&nbsp;

&nbsp;

&nbsp;

#### **Zbog čega RAID kontroler i pažnja pri odabiru diskova** {#zbog_cega_raid_kontroler_i_paznja_pri_odabiru_diskova.sectionedit9}

<div class="level5">
</div>

<div class="level5">
  <strong>Krenimo od diskova</strong>
</div>

Diskovi se u grubo dijele prema namjeni. U svakom slučaju želimo diskove koji su pouzdani ali i koji su proizvedeni za Tzv. Serversku namjenu u kombinaciji s RAID kontrolerima.

&nbsp;

> <p style="padding-left: 30px;">
>   <span style="color: #ff9900;">Budite svjesni činjenice da postoje i “serverski” diskovi koji nisu dizajnirani odnosno optimizirani za rad s RAID kontrolerima.</span>
> </p>

Za više detalja pogledajte knjigu “[Uvod u Linux i Linux napredno][1]{.wikilink1}” , poglavlje :“[Podjela prema namjeni diskova][2]{.wikilink1}”

&nbsp;

**RAID kontroleri**

I ovo je priča za sebe ali svakako želimo imati pošteni hardverski RAID kontroler provjerenoga proizvođača. Dodatno, važna je i verzija Firmware-a za RAID kontroler u kombinaciji s driverom za operacijski sustav na kojemu ga koristite.

U praksi su se čak i kombinacije određenih verzija Firmware-a i drivera kao i kombinacije Firmware RAID kontrolera i Firmware-a drugih komponenti poslužitelja (pr. matične ploče), pokazale katastrofalnim odabirom.

Dakle treba si dati malo truda i proučiti što se kupuje, kao i komentare korisnika, za što približniju konfiguraciju vašoj : OS, driveri (RAID. LAN. MB, …), Firmare-i, Softver, …

Cjenovni opseg poštenih RAID kontrolera (ovisno o broju diskova koje možete spojiti na njega), kreće se od minimalno tisuću KN na više. Sve ispod toga, kao i odabir Tzv. “Integriranih RAID” kontrolera na matičnim pločama (osim ako su u pitanju prave Serverske matične ploče : 5.000+ KN) nemojte niti pomišljati koristiti.

Za više detalja pogledajte poglavlje “<a class="urlextern" title="https://www.opensource-osijek.org/dokuwiki/wiki:knjige:uvod_u_linux#hardverski_raid" href="https://www.opensource-osijek.org/dokuwiki/wiki:knjige:uvod_u_linux#hardverski_raid" rel="nofollow">hardverski RAID</a>”

&nbsp;

<p style="padding-left: 30px;">
  <strong>Integrirana RAID rješenja</strong>
</p>

U ovim “<em class="u">Integriranim</em>” kombinacijama, dobivate upravljački program (driver) i pripadajući softver, koji :

<li class="level1">
  <div class="li">
    je loše dokumentiran ili
  </div>
</li>

<li class="level1">
  <div class="li">
    se jako rijetko održava ili
  </div>
</li>

<li class="level1">
  <div class="li">
    je pun grešaka
  </div>
</li>

<li class="level1">
  <div class="li">
    a u slučaju katastrofe nema definirane korake (što i kako) ili su oni nejasni (a uglavnom i ne rade)
  </div>
</li>

Kod ovih rješenja, zapravo ne postoji pravi hardverski RAID kontroler već se većina ili gotovo sve funkcionalnosti RAID kontrolera odrađuju unutar upravljačkog programa (drivera) koji se pretvara da je RAID kontroler. On nadalje operacijskom sustavu prijavljuje RAID polje diskova o kojem se brine, kao jedan fizički disk &#8211; slično kako bi to uradio i pravi RAID kontroler.

I na kraju sve je zapravo prepušteno navedenom softveru (driveru) i operacijskom sustavu, pa što bude. Nakon nekog vremena obično bude : “Nešto ne radi. A kako da vratimo svoje podatke” … e lijepo sam vam rekao.

Na kraju priče s krivim odabirom tehnologije ili uređaja uvijek završite sa slanjem diskova u neku od tvrtki specijaliziranih za povrat podataka. Ova zabava će vas obično koštati znatno više nego da ste odmah kupili možda i najskuplje komponente koje postoje na (našem) tržištu.

&nbsp;

> <p style="padding-left: 30px;">
>   <span style="color: #ff0000;">Povrat odnosno spašavanje podataka se često naplaćuje po <abbr title="Gigabyte">GB</abbr>, pa cifre vrlo brzo mogu narasti na desetke tisuća KN. </span>
> </p>

&nbsp;

**Opcija dva : Logical Volume Manager**

Zaboravimo na “Integrirane RAID” kontrolere. Druga prihvatljivija opcija je upotreba Tzv. “Logical Volume Managera” unutar operacijskog sustava (govorimo o linuxu). U linuxu se radi o Logical Volume Manageru verzije 2 (LVM2). Za više detalja o LVM2 pogledajte poglavlje [LVM2][3]{.wikilink1}.

I ovdje radi o softverskom RAID-u odnosno njegovoj funkcionalnosti. Ipak ovo je puno sigurnije i stabilnije riješenje od onoga koje dobivamo s upotrebom “Integriranih RAID kontrolera” na matičnim pločama za stolna računala (tj. Ne serverskim matičnim pločama). Ovo je dokazano rješenje koje koristi velika zajednica ljudi, a koje se razvija s otvorenim kodom pa se svaka novootkrivena greška vrlo brzo popravlja. Osim toga vrlo je dobro dokumentirano te postoje dobro definirane procedure u slučaju neke havarije odnosno što i kako napraviti u kojem slučaju.

**Zbog čega je ipak bolji hardverski RAID kontroler i pripadajuće RAID polje**

Zbog toga što će vam na budućem NAS ili SAN sustavu biti pohranjeni važni podaci. Stoga ne želite da se sve snima na samo jedan tvrdi disk, već na više njih i to u RAID polju koje vam osigurava najbolji odnos:

<li class="level1">
  <div class="li">
    sigurnosti podataka (koliko kopija podataka želite &#8211; na dva, tri ili više tvrdih diskova istovremeno)
  </div>
</li>

<li class="level1">
  <div class="li">
    brzine rada
  </div>
</li>

<li class="level1">
  <div class="li">
    brze zamjene neispravnog diska i povratka u normalan rad
  </div>
</li>

<li class="level1">
  <div class="li">
    lakoće proširenja kapaciteta RAID polja
  </div>
</li>

Dodatno želite RAID kontroler jer ne želite prepustiti nekom traljavom programčiću (mislim na “Integrirana RAID riješenja”) da vam odrađuje ovako važne zadatke pohranjivanja vama osjetljivih i za život tvrtke važnih podataka. A s druge strane želite iskoristiti hardversku snagu pravog RAID kontrolera koji ne opterećuje sustav (CPU/RAM) pošto ima svoj specijalizirani CPU i pripadajuću RAM memoriju.

**Dakle želite ozbiljan zadatak oko RAID-a prepustiti tvrtci koja RAID kontrolere proizvodi profesionalno, kao i njihov pripadajući firmware/softver.**

&nbsp;

> <p style="padding-left: 30px;">
>   <span style="color: #ff9900;">Neka najbolji proizvođač specijaliziranog hardvera i softvera zaradi na onome što radi najbolje.</span>
> </p>

&nbsp;

&nbsp;

**Odabir RAID polja**

Kao što je i odabir dobrog RAID kontrolera važan, važno je i pravilno odabrati RAID polje, ovisno o vašem budžetu i potrebama.

A sada ponovno bacite pogled na RAID polja u već navedenoj knjizi, u poglavlju : [Koja su najčešća RAID polja u upotrebi i koje su im prednosti i mane][4]{.wikilink1} “”

Skraćena verzija (navesti ćemo par često korištenih RAID polja) :

<table class="inline" style="border-color: #000000; width: 735.933px;">
  <tr class="row0">
    <td class="col0" style="width: 53px;">
      <strong>RAID polje</strong>
    </td>
    
    <td class="col1" style="width: 90px;">
      <strong>Brzina</strong>
    </td>
    
    <td class="col2" style="width: 78px;">
      <strong>Min. broj diskova</strong>
    </td>
    
    <td class="col3" style="width: 154px;">
      <strong>Koliko diskova se može istovremeno pokvariti</strong>
    </td>
    
    <td class="col4" style="width: 167px;">
      <strong>Vrijeme od zamjene pokvarenog diska do normalnog rada</strong>
    </td>
    
    <td class="col5" style="width: 146.933px;">
      <strong>Jednostavnost proširenja RAID polja</strong>
    </td>
  </tr>
  
  <tr class="row1">
    <td class="col0" style="width: 53px;">
      1
    </td>
    
    <td class="col1" style="width: 90px;">
      Jednako ili brže od jednog diska
    </td>
    
    <td class="col2" style="width: 78px;">
      2
    </td>
    
    <td class="col3" style="width: 154px;">
      1
    </td>
    
    <td class="col4" style="width: 167px;">
      Brzo
    </td>
    
    <td class="col5" style="width: 146.933px;">
      Vrlo teško
    </td>
  </tr>
  
  <tr class="row2">
    <td class="col0" style="width: 53px;">
      5
    </td>
    
    <td class="col1" style="width: 90px;">
      Brže od RAID 1
    </td>
    
    <td class="col2" style="width: 78px;">
      3
    </td>
    
    <td class="col3" style="width: 154px;">
      1
    </td>
    
    <td class="col4" style="width: 167px;">
      Sporo
    </td>
    
    <td class="col5" style="width: 146.933px;">
      Teško
    </td>
  </tr>
  
  <tr class="row3">
    <td class="col0" style="width: 53px;">
      6
    </td>
    
    <td class="col1" style="width: 90px;">
      Sporije od RAID 5
    </td>
    
    <td class="col2" style="width: 78px;">
      4
    </td>
    
    <td class="col3" style="width: 154px;">
      2
    </td>
    
    <td class="col4" style="width: 167px;">
      Sporo
    </td>
    
    <td class="col5" style="width: 146.933px;">
      Teško
    </td>
  </tr>
  
  <tr class="row4">
    <td class="col0" style="width: 53px;">
      10
    </td>
    
    <td class="col1" style="width: 90px;">
      Najbrže
    </td>
    
    <td class="col2" style="width: 78px;">
      4
    </td>
    
    <td class="col3" style="width: 154px;">
      2
    </td>
    
    <td class="col4" style="width: 167px;">
      Brzo
    </td>
    
    <td class="col5" style="width: 146.933px;">
      Jednostavnije
    </td>
  </tr>
</table>

&nbsp;

**I na kraju zbog čega priča o diskovima, RAID kontrolerima i RAID poljima ?**

Kada smo kreirali neko RAID polje (na RAID kontroleru po mogućnosti) slijedeće je na redu upotreba tog RAID polja, preko nekog od mrežnih protokola za NAS (NFS, SNB/CIFS, AFP ili dr.) ili SAN, preko kojih dijelite podatke preko mreže (vrlo jednostavno  <img class="icon" src="https://i1.wp.com/www.opensource-osijek.org/dokuwiki/lib/images/smileys/icon_smile.gif?ssl=1" alt=":-)" data-recalc-dims="1" />).

&nbsp;

&nbsp;

&nbsp;

&nbsp;

### A što je SAN sustav ? {#a_sto_je_san_sustav.sectionedit17}

<div class="level3">
  <p>
    SAN (Storage Area Network) sustavi s druge strane ne nude mrežno dijeljenje datoteka, već nam osiguravaju mrežni pristup Tzv. “Block-based” mediju. Ovo u praksi znači da SAN sustavi preko mreže praktično dijele svoje diskove ili polja diskova vidljiva klijentskoj (drugoj) strani kao “običan tvrdi disk”. Nadalje takav disk se sastoji od blokova podataka kao i bilo koji lokalni ATA,SATA,SAS ili neki drugi disk. Za više detalja o diskovima pogledajte knjigu “Uvod u Linux”, <a class="urlextern" title="https://www.opensource-osijek.org/dokuwiki/wiki:knjige:uvod_u_linux#diskovi_i_particije" href="https://www.opensource-osijek.org/dokuwiki/wiki:knjige:uvod_u_linux#diskovi_i_particije" rel="nofollow">poglavlje o diskovima</a>.
  </p>
  
  <p>
    Za ovakvo mrežno dijeljenje praktično “sirove” površine diska, potrebi su mrežni protokoli koji nam osiguravaju ovakav pristup.
  </p>
  
  <p>
    Neki od SAN protokola su :
  </p>
  
  <ul>
    <li class="level1">
      <div class="li">
        <strong>Fibre Channel</strong>
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        <strong>iSCSI</strong>
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        <strong>ATA over Ethernet (AoE)</strong>
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        <strong>HyperSCSI</strong>.
      </div>
    </li>
  </ul>
  
  <p>
    Nakon što se klijent preko nekog od gore navedenih SAN protokola spoji (na površinu diska), takav disk se mora prvo particionirati i formatirati kao da se radi o lokalnom disku odnosno disku spojenom na vaše lokalno računalo.
  </p>
</div>

&nbsp;

&nbsp;

## Zbog čega uopće koristiti NAS ili SAN sustave {#zbog_cega_uopce_koristiti_nas_ili_san_sustave.sectionedit18}

<div class="level2">
  <p>
    Zašto bi uopće koristili ovakve sustave ?
  </p>
  
  <ul>
    <li class="level1 node">
      <div class="li">
        Zbog potrebe za izradom sigurnosnih kopija vaših podataka (Engl. Backup), na centralni mrežni uređaj (obično NAS):
      </div>
      
      <ul>
        <li class="level3">
          <div class="li">
            koji bi morao (i obično je) biti znatno sigurniji jer u pravilo snima podatke na više diskova istovremeno (obično koristi neko RAID polje)
          </div>
        </li>
        
        <li class="level3">
          <div class="li">
            i ima sve ostale komponente kvalitetnije i pouzdanije od “običnog” računala
          </div>
        </li>
      </ul>
    </li>
  </ul>
  
  <ul>
    <li class="level1 node">
      <div class="li">
        Zbog centraliziranog pohranjivanja i upotrebe. Dakle želimo centralizirano mjesto za pohranu :
      </div>
      
      <ul>
        <li class="level3">
          <div class="li">
            Svih podataka (datoteka) s kojima radimo
          </div>
        </li>
        
        <li class="level3">
          <div class="li">
            Virtualnih računala, a što je preduvjet za bilo koji rad u klasteru u slučaju potrebe za redundancijom (otpornosti na kvar pojedinog poslužitelja ili njegovog održavanja odnosno nadogradnje ).
          </div>
        </li>
      </ul>
    </li>
    
    <li class="level1">
      <div class="li">
        Zbog pohranjivanja sigurnosnih kopija virtualnih računala i drugih podataka (pr. dokumenti, slike, …) i to na dnevnoj, tjednoj, mjesečnoj, polugodišnjoj ili godišnjoj bazi.
      </div>
    </li>
  </ul>
</div>

&nbsp;

> <p style="padding-left: 30px;">
>   <span style="color: #ff6600;">I NAS i SAN sustavi osim čiste pohrane podataka imaju (i moraju imati) i cijeli niz drugih naprednih mogućnosti koje su vrlo važne za ovu namjenu odnosno upotrebu.</span>
> </p>

&nbsp;

**Koje opcije bi najminimalnije morali imati NAS/SAN sustavi ?**

Praćenje:

<li class="level1">
  <div class="li">
    performansi sustava
  </div>
</li>

<li class="level1">
  <div class="li">
    RAID kontrolera i svih njegovih polja
  </div>
</li>

<li class="level1">
  <div class="li">
    svakog pojedinog diska (performanse ali i što je još važnije grešaka u radu)
  </div>
</li>

<li class="level1">
  <div class="li">
    servisa/daemona
  </div>
</li>

<li class="level1">
  <div class="li">
    mreže i mrežnih komponenti
  </div>
</li>

Napredne opcije:

<li class="level1">
  <div class="li">
    Firewall
  </div>
</li>

<li class="level1 node">
  <div class="li">
    naprednu konfiguraciju mreže :
  </div>
  
  <ul>
    <li class="level2">
      <div class="li">
        VLAN-ovi,
      </div>
    </li>
    
    <li class="level2">
      <div class="li">
        Agregacija/Bonding &#8211; i to nekoliko mogućnosti i protokola
      </div>
    </li>
  </ul>
</li>

<li class="level1">
  <div class="li">
    mogućnost replikacije podataka na sekundarni NAS/SAN sustav
  </div>
</li>

<li class="level1">
  <div class="li">
    izradu “snapshota” &#8211; u zadanim vremenskim okvirima i ručno a koja je po mogućnosti vidljiva i direktno u operacijskom sustavu klijenata (Pr. kao Windows “Previous Versions”)
  </div>
</li>

<li class="level1">
  <div class="li">
    optimizacija svake važnije komponente sustava
  </div>
</li>

<li class="level1">
  <div class="li">
    Prava pristupa : kreiranje korisničkih grupa kao i pojedinačnih korisnika, uz mogućnost integracije s Active Directory ili LDAP servisima.
  </div>
</li>

<li class="level1">
  <div class="li">
    …
  </div>
</li>

Sve ove “napredne” opcije i parametri vrlo su važni u realnim radnim uvjetima. Naime svaka mreža i IT sustav su specifični i imaju specifične potrebe. Većina IT sustava je osim toga otvorena za mnoge optimizacije (jer ih obično nitko i nije optimizirao, barem ne na profesionalan način). Mnogi će se zapitati da li je ovo stvarno potrebno. U praksi (s kojom sam se sam susreo) reći ću **DA**.

Kreće se od optimizacije:

<li class="level1">
  <div class="li">
    operacijskog sustava
  </div>
</li>

<li class="level1">
  <div class="li">
    do mrežne razine (uz pretpostavku da imate <a class="urlextern" title="https://www.opensource-osijek.org/wordpress/2016/02/16/switching-i-routing-jucer-danas-sutra/" href="https://www.opensource-osijek.org/wordpress/2016/02/16/switching-i-routing-jucer-danas-sutra/" rel="nofollow">pravu mrežnu opremu</a>) koja je preduvjet za bilo kakav imalo ozbiljniji IT sustav. Ovdje se radi o mrežnim parametrima
  </div>
</li>

<li class="level1">
  <div class="li">
    preko optimizacije mrežnih protokola i protokola za NAS ili SAN sustav
  </div>
</li>

<li class="level1">
  <div class="li">
    do optimizacija na razini ispod NAS ili SAN sustava (prema RAID razini)
  </div>
</li>

Pogledajte i logičku shemu NAS i/ili SAN sustava na slici dolje:

<img class="alignnone wp-image-2232" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/raid-i-nas-san-pogled.jpg?resize=990%2C775&#038;ssl=1" alt="raid-i-nas-san-pogled" width="990" height="775" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/raid-i-nas-san-pogled.jpg?w=900&ssl=1 900w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/raid-i-nas-san-pogled.jpg?resize=150%2C118&ssl=1 150w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/raid-i-nas-san-pogled.jpg?resize=300%2C235&ssl=1 300w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/raid-i-nas-san-pogled.jpg?resize=768%2C602&ssl=1 768w" sizes="(max-width: 990px) 100vw, 990px" data-recalc-dims="1" />

Sada ćemo zaokružiti sve naućeno do sada:

Krenimo od RAID kontrolera

<li class="level1">
  <div class="li">
    RAID kontroler ima svoj centralni procesor i specijalizirani procesor (obično su obije funkcionalnosti integrirane u jednom chipu). Specijalizirani (dio) procesora se zove RAID <a class="urlextern" title="https://en.wikipedia.org/wiki/Application-specific_integrated_circuit" href="https://en.wikipedia.org/wiki/Application-specific_integrated_circuit" rel="nofollow">ASIC</a> i on je zadužen za RAID polja.
  </div>
</li>

<li class="level1">
  <div class="li">
    RAID kontroler ima i svoju ROM i RAM memoriju kao i disk kontroler na koji se zapravo spajaju diskovi
  </div>
</li>

<li class="level1">
  <div class="li">
    RAID kontroler ima svoj “minijaturni” operacijski sustav, niže razine a koji je inicijalno pohranjen u ROM memoriji i iz koje se učitava. Unutar tog “minijaturnog” operacijskog sustava se nalaze metode za pristup svim diskovima spojenim na njega kao i sve potrebno za kreiranje RAID polja unutar kojega će diskovi raditi.
  </div>
</li>

Diskovi i njihova veza s RAID kontrolerom te veza s Linuxom (operacijskim sustavom)

<li class="level1">
  <div class="li">
    Promatrajmo diskove koji su u konačnici spojeni na RAID kontroler kao na jednu komponentu koja komunicira s ostatkom računala odnosno operacijskim sustavom i to preko upravljačkog programa (Engl. Driver) za taj RAID kontroler.
  </div>
</li>

<li class="level1">
  <div class="li">
    Operacijski sustav preko upravljačkog programa za RAID kontroler vidi samo polja diskova koja su kreirana od strane RAID kontrolera,i to kao jedan jedini disk. Ako smo kao na slici, kreirali RAID 10 polje unutar kojega se nalaze četiri (4) tvrda diska, operacijski sustav (u ovom primjeru je to Linux), vidjeti će jedan jedini tvrdi disk, koji je zapravo cijelo RAID 10 polje diskova. Taj “logički” disk se s točke operacijskog sustava sastoji od svih dijelova od kojih se sastoji bilo koji “normalan” tvrdi disk (trake, cilindri, klasteri i sektori).
  </div>
</li>

<li class="level1 node">
  <div class="li">
    Nadalje taj “logički” disk je potrebno particionirati te kasnije formatirati s nekim datotečnim sustavom.
  </div>
  
  <ul>
    <li class="level2">
      <div class="li">
        Svi programi dalje koriste taj datotečni sustav za pohranjivanje datoteka, što je i slučaj s programima za dijeljenje datoteka preko mreže (NAS) : NFS, SMB/CIFS , AFP , …
      </div>
    </li>
    
    <li class="level2">
      <div class="li">
        Što se tiće sustava koji pristupaju podacima na razini blokova (SAN sustavi), oni disku pristupaju na razini blokova podataka tj. ispod razine datotečnog sustava.
      </div>
    </li>
  </ul>
</li>

&nbsp;

&nbsp;

### U čemu je problem sa standardnim NAS ili SAN sustavima {#u_cemu_je_problem_sa_standardnim_nas_ili_san_sustavima.sectionedit21}

<div class="level3">
  <p>
    Što kada se pokvari ovakav NAS ili SAN sustav odnosno poslužitelj ?
  </p>
  
  <p>
    Obično ako niste imali još jedan sustav na koji ste izrađivali sigurnosne kopije &#8211; ostajete bez svih podataka.
  </p>
  
  <p>
    Koliko vam je to važno &#8211; da izgubite sve podatke važne za poslovanje vaše tvrtke ?.
  </p>
</div>

&nbsp;

&nbsp;

## Slijedeći korak: Klasterski i/ili redundantni NAS sustavi {#slijedeci_korakklasterski_i_ili_redundantni_nas_sustavi.sectionedit22}

<div class="level2">
  <p>
    <strong>Što nam omogućavaju ovakvi sustavi</strong> ?
  </p>
  
  <p>
    Osim sigurnosti, jer se sada svi podaci mogu zapisivati na dva ili više uređaja istovremeno, dolazimo i do njihovih ograničavajućih faktora, a to su :
  </p>
  
  <ul>
    <li class="level1">
      <div class="li">
        Omogućavaju horizontalno skaliranje (nadogradnju) ali uz više troškove &#8211; znatno više od cijene samog drugog uređaja
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        Ograničeni su na proširenje prostora tj. kapaciteta (proširenje dodavanjem diskova ili dodatnih uređaja), Pri tome proširenje dodavanjem dodatnih uređaja (ako je to uopće moguće jer za svaki model odnosno seriju redundantnih NAS uređaja postoji ograničenje do koliko se mogu proširivati) &#8211; cijene ovdje odlaze u nebo.
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        U konačnici daju nam redundanciju (zalihost/sigurnost od gubitka podataka) uz ekstra cijenu.
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        Uz što veću cijenu, dobivamo i veću brzinu rada
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        To su sve uglavnom rješenja koja su zaštićena i zatvorenog dizajna od strane proizvođača poput (EMC<sup>2</sup>, IBM, …)
      </div>
    </li>
  </ul>
</div>

<div class="secedit editbutton_section editbutton_22">
</div>

### Redundantni ili Klasterizirani NAS Sustavi {#redundantni_ili_klasterizirani_nas_sustavi.sectionedit23}

<div class="level3">
  <p>
    <strong>Redundantni NAS Sustavi</strong>
  </p>
  
  <p>
    Redundantni sustavi su nešto jednostavnijeg dizajna jer se ispred njih logički nalazi sustav koji osigurava pristup jednoj jedinoj virtualnoj IP adresi kojoj klijenti i pristupaju (postoje i drugačije implementacije ali ova je najčešća).
  </p>
  
  <p>
    U pozadini se redundantni NAS sustav brine da se svi podaci uredno kopiraju s prvog (NAS-1) na drugi (NAS-2) NAS sustav. U slučaju kvara prvog (NAS-1) sustava, drugi (NAS-2) preuzima njegovu funkciju i svi podaci su sačuvani. Ovakvi sustavi su često izvedeni sa samo dva NAS sustava i rade na principu : Active-Standby (jedan je aktivan a drugi je pričuva).
  </p>
  
  <p>
    Kako logički izgledaju ovakvi sustavi ?
  </p>
  
  <p>
    &nbsp;
  </p>
  
  <p>
    Redundantni NAS sustav, logički izgleda ovako:
  </p>
  
  <p>
    <img class="alignnone size-full wp-image-2233" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/redundantni-nas.jpg?resize=351%2C437&#038;ssl=1" alt="redundantni-nas" width="351" height="437" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/redundantni-nas.jpg?w=351&ssl=1 351w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/redundantni-nas.jpg?resize=120%2C150&ssl=1 120w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/redundantni-nas.jpg?resize=241%2C300&ssl=1 241w" sizes="(max-width: 351px) 100vw, 351px" data-recalc-dims="1" />
  </p>
</div>

&nbsp;

**Klasterizirani NAS Sustavi**

NAS sustavi koji se nalaze u klasteru (grozd) su obično znatno kompleksnijeg dizajna koji uključuje i razne dodatne hardverske i softverske komponente.

Svi klijenti u pravilu pristupaju vršnoj klasterskoj komponenti, koja je često izvedena samo u softveru a koja se brine za raspodjelu podataka unutar klastera, na pojedine NAS uređaje.

Sama replikacija tih (odnosno svih) podataka između pojedinih NAS sustava se često izvodi i u softveru i na specijaliziranom hardveru (na slici bi to odgovaralo donjem sloju). Zbog ovakvog, složenog dizajna i potrebe za posebnim hardverom i njihova cijena je poprilično veća od redundantnih NAS sustava.

&nbsp;

Klasterizirani NAS sustavi logički izgledaju ovako:

<img class="alignnone size-full wp-image-2234" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/klasterizirani-nas.jpg?resize=402%2C434&#038;ssl=1" alt="klasterizirani-nas" width="402" height="434" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/klasterizirani-nas.jpg?w=402&ssl=1 402w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/klasterizirani-nas.jpg?resize=139%2C150&ssl=1 139w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/klasterizirani-nas.jpg?resize=278%2C300&ssl=1 278w" sizes="(max-width: 402px) 100vw, 402px" data-recalc-dims="1" />

&nbsp;

#### Softverska rješenja {#softverska_rjesenja.sectionedit24}

<div class="level4">
  <p>
    Postoje i mnoga Open Source softverska rješenja koja nam omogućavaju osnovnu redundanciju ili klasterizirane NAS sustave.
  </p>
  
  <p>
    Neki od njih su :
  </p>
  
  <ul>
    <li class="level1 node">
      <div class="li">
        <strong>GlusterFS</strong> : Omogućava osnovne i nekoliko naprednih razina redundancije :
      </div>
      
      <ul>
        <li class="level3">
          <div class="li">
            mirror &#8211; poput RAID 1 između dva NAS sustava (poslužitelja) &#8211; min. 2 puslužitelja,
          </div>
        </li>
        
        <li class="level3">
          <div class="li">
            stripe &#8211; poput RAID 0 između dva NAS sustava (poslužitelja) &#8211; min. 2 puslužitelja,
          </div>
        </li>
        
        <li class="level3">
          <div class="li">
            mirror + stripe &#8211; poput RAID 10 između dva para NAS sustava (poslužitelja) &#8211; min. 4 puslužitelja (1 i 2 u RAID 1, 3 i 4 u RAID 1 , oba para poslužitelja (1,2 + 3,4), vršno u RAID 0, što zajedno čini RAID 10)
          </div>
        </li>
      </ul>
    </li>
    
    <li class="level1">
      <div class="li">
        <strong>pNFS</strong> (Parallel NFS &#8211; od verzije NFS v.4.1+) :Paralelni/Distribuirani NFS &#8211; stabilna (produkcijuska verzija ) je još u izradi
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        <strong>OCFS2</strong> (Oracle open source) : ima slične mogućnosti kao <strong>GlusterFS</strong>
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        …
      </div>
    </li>
  </ul>
  
  <p>
    Svaki od njih ima svoje prednosti i mane kao i ciljanu upotrebu (za koju je i razvijan ili se pokazao kao vrlo dobar)
  </p>
</div>

&nbsp;

&nbsp;

&nbsp;

&nbsp;

### Redundantni ili Klasterizirani SAN Sustavi {#redundantni_ili_klasterizirani_san_sustavi.sectionedit25}

<div class="level3">
  Slično kao i za redundantne ili klasterizirane NAS sustave &#8211; osim sigurnosti jer se sada svi podaci mogu zapisivati na dva ili više uređaja istovremeno, ovdje imamo sljedeće mogućnosti odnosno ograničenja :
</div>

<li class="level1">
  <div class="li">
    Omogućavaju veće horizontalno skaliranje (nadogradnju) ali uz znatno više troškove &#8211; znatno više od cijena za NAS sustave.
  </div>
</li>

<li class="level1">
  <div class="li">
    Ograničeni su na ekspanziju prostora tj. kapaciteta (proširenje dodavanjem diskova ili dodatnih uređaja), Pri tome proširenje dodavanjem dodatnih uređaja (ako je to uopće moguće jer za svaki model odnosno seriju redundantnih NAS uređaja postoji ograničenje do koliko se mogu proširivati) &#8211; cijene ovdje odlaze u nebo.
  </div>
</li>

<li class="level1">
  <div class="li">
    U konačnici daju nam redundanciju (zalihost/sigurnost od gubitka podataka) uz ekstremno visoku cijenu i vrlo kompleksan dizajn.
  </div>
</li>

<li class="level1">
  <div class="li">
    u pravilu uz što veću cijenu, dobivamo i veću brzinu rada
  </div>
</li>

<li class="level1">
  <div class="li">
    To su sve uglavnom rješenja koja su zaštićena i zatvorenog dizajna od strane proizvođača poput (EMC<sup>2</sup>, IBM, …)
  </div>
</li>

<div class="secedit editbutton_section editbutton_25">
</div>

<div class="secedit editbutton_section editbutton_25">
  <p>
    Klasterizirani SAN sustavi logički izgledaju slično poput klasteriziranih NAS sustava ali su znatno kompleksniji (i samim time skuplji):
  </p>
  
  <p>
    <img class="alignnone wp-image-2256" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/Klasterizirani-SAN.jpg?resize=383%2C484&#038;ssl=1" alt="Klasterizirani-SAN" width="383" height="484" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/Klasterizirani-SAN.jpg?w=354&ssl=1 354w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/Klasterizirani-SAN.jpg?resize=119%2C150&ssl=1 119w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/Klasterizirani-SAN.jpg?resize=238%2C300&ssl=1 238w" sizes="(max-width: 383px) 100vw, 383px" data-recalc-dims="1" />
  </p>
</div>

<div class="secedit editbutton_section editbutton_25">
</div>

#### Softverska rješenja za SAN i klasterske SAN sustave {#softverska_rjesenja_za_san_i_klasterske_san_sustave.sectionedit26}

<div class="level4">
  <p>
    I u ovoj kategoriji imamo nekoliko opensource rješenja koje možete proučiti,a koja su dosta česta u upotrebi &#8211; i to obično u kombinaciji s drugim elementima odnosno komponentama (ovisno da li se radi o SAN ili klasterskom SAN rješenju ).
  </p>
  
  <ul>
    <li class="level1 node">
      <div class="li">
        <strong>DRBD8</strong> (Distribuirani &#8211; replicirani “Block Device”) &#8211; “Distributed Replicated Block Device” : &#8211; praktično RAID1 (mirror) preko mreže, prema principu : Primari poslužitelj → Sekundarni poslužitelj. Potrebna su dva poslužitelja ( nije za sve primjene !)
      </div>
      
      <ul>
        <li class="level3">
          <div class="li">
            <strong>DRBD9</strong> (u aktivnom razvoju) : omogućava rad s više poslužitelja, višestruke replikacije i sl.
          </div>
        </li>
      </ul>
    </li>
    
    <li class="level1 node">
      <div class="li">
        <strong>iscsid (open-iscsi)</strong> (iSCSI initiator) servis/daemon za Linux (sam po sebi nije redundantan već pruža osnovnu iSCSI funkcionalnost )
      </div>
      
      <ul>
        <li class="level4">
          <div class="li">
            <strong>device-mapper-multipath</strong> &#8211; DM-Multipath (“Device Mapper Multipathing” ) servis/daemon koji omogućava redundanciju (ili load balancing) prema iSCSI uređajima (SAN storage-ima) (i dalje je pitanje kako sinkronizirati dva ili više SAN storage-a) &#8211; koristi se najčešće kod active/passive SAN sustava
          </div>
        </li>
        
        <li class="level4">
          <div class="li">
            <strong>ALUA</strong> (“Asymmetric Logical Unit Assignment”) nudi load balancing prema SAN storage-u (ostaje isto pitanje sinkronizacije SAN storage-a) &#8211; koristi se za active/active SAN sustave
          </div>
        </li>
      </ul>
    </li>
  </ul>
</div>

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;

### ZFS &#8211; negdje između {#zfs_-_negdje_izmedu.sectionedit27}

<div class="level3">
</div>

<div class="secedit editbutton_section editbutton_27">
</div>

#### Ali prvo malo o ZFS-u i tvrtki Sun Microsystems {#ali_prvo_malo_o_zfs-u_i_tvrtki_sun_microsystems.sectionedit28}

<div class="level4">
  <p>
    ZFS je razvila tvrtka <strong><a class="urlextern" title="https://en.wikipedia.org/wiki/Sun_Microsystems" href="https://en.wikipedia.org/wiki/Sun_Microsystems" rel="nofollow">SUN Microsystems</a></strong>, danas u vlasništvu tvrtke <strong>Oracle</strong>. Ideja je bila riješiti gore navedene probleme, uvesti mnoga poboljšanja i mogućnosti koje su do tada bile dostupne samo kao specijalizirana rješenja ili uopće nisu postojala, te sve integrirati u jednom “proizvodu”.
  </p>
  
  <p>
    ZFS je prema svojoj funkcionalnosti praktično kombinacija:
  </p>
  
  <ul>
    <li class="level1">
      <div class="li">
        Naprednog RAID kotrolera odnosno “Logical Volume Managera” i
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        Datotečnog sustava s naprednim sustavom kontrole ( <abbr title="Access Control List">ACL</abbr>) odnosno “Access Listama” za prava pristupa
      </div>
    </li>
  </ul>
  
  <p>
    Izvorno je bio razvijan unutar tvrtke <strong>SUN Microsystems</strong> kao zatvoreni kod, unutar njihovog UNIX operacijskog sustava <strong>Solaris</strong> 2005. godine. Već slijedeće godine je prebačen u open source pod <a class="urlextern" title="https://en.wikipedia.org/wiki/Common_Development_and_Distribution_License" href="https://en.wikipedia.org/wiki/Common_Development_and_Distribution_License" rel="nofollow">CDDL</a> licencom unutar projekta “<a class="urlextern" title="https://en.wikipedia.org/wiki/OpenSolaris" href="https://en.wikipedia.org/wiki/OpenSolaris" rel="nofollow">OpenSolaris</a>” te je postao sastavni dio Solaris UNIX-a v.10, sredinom 2006. godine.
  </p>
  
  <p>
    Naravno, nakon što ih je kupio <strong>Oracle</strong>, već nakon par mjeseci cijeli izvorni kod ZFS-a se više nije održavao od strane Oracle-a. Dakle Oracle je prestao s razvojem “OpenSolaris”-a pa je zajednica morala sav kod prebaciti u novi projekt imena “Illumos” ( tu se nalazio i kod ZFS-a ). Zajednica koja je stajala iza projekta “Illumos” preuzela je zadnju verziju dostupnog koda te ga nastavila razvijati. Nakon nekog vremena je pokrenut i projekt “OpenZFS” koji je prihvatila još veća zajednica programera i korisnika ili i sve veći broj tvrtki. Svi zajedno su nastavili s razvojem open source verzije ZFS-a, koja se razvija i danas.
  </p>
</div>

&nbsp;

&nbsp;

> <p style="padding-left: 30px;">
>   <span style="color: #ff9900;">Kao i većina programa ili sustava koji su izašli iz tvrtke <strong>SUN Microsystems</strong> ZFS je razvijan od strane inženjera za inženjere, na najbolji mogući način, kao nedostižni uzor svim ostalim tvrtkama (barem za 99.9999% njih). </span>
> </p>

&nbsp;

&nbsp;

**Borba s open source licencama**

Pošto je ZFS razvijan pod <a class="urlextern" title="https://en.wikipedia.org/wiki/Common_Development_and_Distribution_License" href="https://en.wikipedia.org/wiki/Common_Development_and_Distribution_License" rel="nofollow">CDDL</a> licencom a koja nije kompatibilna s Linux GPL licencom pod kojom je razvijan Linux kernel, već od početka javnog razvoja (krajem 2005.g i početkom 2006.g.) bilo je jasno da se ZFS ne smije direktno implementirati u Linux kernel.

Za linux je osmišljeno privremeno rješenje : upotreba preko FUSE frameworka, unutar kojega su se smjeli pokretati programi s drugim licencama. Problem je bio u tome što se <a class="urlextern" title="https://en.wikipedia.org/wiki/Filesystem_in_Userspace" href="https://en.wikipedia.org/wiki/Filesystem_in_Userspace" rel="nofollow">FUSE</a> izvršava na višoj razini iznad kernela te je samim time znatno sporiji. Ali i ovo je bilo nešto za početak. Istovremeno s ovom borbom krenulo se u razvoj ZFS-a od nule te je 2013.g. razvijena prva stabilna verzija ( v.0.6.1 ) &#8211; iste godine je pokrenut i projekt “OpenZFS”. Godine 2016 s Ubuntu Linuxom v.16.0.4, ZFS koji se razvijao u projektu “OpenZFS” je uključen u ovu distribuciju Linuxa.

Što se tiće drugih open source UNIX operacijskih sustava poput onih koji su razvijani s BSD licencom : FreeBSD, NetBSD, OpenBSD i drugih ovdje nije bilo problema s korištenjem te je ZFS na njima zaživio vrlo brzo te se smatra (zbog godina korištenja i testiranja/popravljanja) kao jedna od najboljih implementacija u open source operacijskim sustavima.

&nbsp;

> <p style="padding-left: 30px;">
>   <span style="color: #ff9900;">OpenZFS projekt nudi implementaciju ZFS-a za Mac <abbr title="Operating System">OS</abbr> X.</span>
> </p>

&nbsp;

&nbsp;

**ZFS** je nastao u želji da se riješe problemi koje niti najnapredniji RAID kontroleri nisu mogli riješiti. Osim rješenja problema, željele su se dodati i neke napredne mogućnosti koje su većini korisnika bile poželjne i dobrodošle.

&nbsp;

&nbsp;

Neki od problema koji su poznati a ZFS ih rješava :

&nbsp;

<li class="level1">
  <div class="li">
    problemi s RAID5 i RAID6 poljima (pogledajte <a class="urlextern" title="https://en.wikipedia.org/wiki/RAID#Unrecoverable_read_errors_during_rebuild" href="https://en.wikipedia.org/wiki/RAID#Unrecoverable_read_errors_during_rebuild" rel="nofollow">WIKI</a>)
  </div>
</li>

<li class="level1">
  <div class="li">
    problem kada želimo zamijeniti neispravni tvrdi disk s novim diskom (koji na većini RAID kontrolera <strong>mora</strong> biti identičan onome koji se mijenja [pr. po broju glava/cilindara/sektora] )
  </div>
</li>

<li class="level1">
  <div class="li">
    problemi odnosno komplikacije kod proširenja RAID polja ovisno o RAID polju
  </div>
</li>

<li class="level1">
  <div class="li">
    problem u slučaju da nam se RAID kontroler pokvario te ga moramo zamijeniti s novim (ovo je ponekad nemoguće jer možemo izgubiti sve podatke )
  </div>
</li>

<li class="level1">
  <div class="li">
    problem kada nam se pokvari pr. matična ploča (<abbr title="Megabyte">MB</abbr>) te moramo prebaciti sve diskove i RAID kontroler na novi hardver (ovo ponekad može poći po zlu)
  </div>
</li>

<li class="level1">
  <div class="li">
    problem koji nastaje s vremenom &#8211; podaci na površini tvrdih diskova postaju nekonzistentni a RAID kontroleri nisu toga svjesni, sve dok ne naiđu na problematični dio površine diska. Ovaj problem se naziva “Data decay” ili “Data rot”. On je znan i kao degradacija podataka na površini diska, a tek najnapredniji RAID kontroleri imaju mogućnost (Engl. disk-scrubbing ) korekcije ovakvih grešaka i to samo do neke granice. Sličan problem nastaje i uslijed grešaka u firmware-u diska ili RAID kontrolera, “fantomskog” zapisvanja (ako podatak nije stvarno zapisan na površinu diska) ili grešaka kod zapisivanja ili čitanja zbog pristupa prema ili od krivih bokova na ili sa površine diska.
  </div>
</li>

&nbsp;

&nbsp;

&nbsp;

Dodatne Funkcionalnosti ZFS-a :

&nbsp;

<li class="level1">
  <div class="li">
    komprimiranje podataka “u letu”, prema konfigurabilnom tipu (algoritmu) i razini kompresije. S obzirom na dostupne algoritme za ovu namjenu i brzine ali i mogućnosti modernih CPU-a, komprimiranje i dekomprimiranje podataka “u letu” je gotovo neprimjetno. ZFS trenutno podržava slijedeće algoritme za komprimiranje : LZJB, LZ4, ZLE i GZIP.
  </div>
</li>

<li class="level1 node">
  <div class="li">
    ZFS je i Tzv. “Copy On Write” i “transakcijski” datotečni sustav što znači da se operacije snimanja rade transakcijski (poput <a class="urlextern" title="https://en.wikipedia.org/wiki/Database_transaction" href="https://en.wikipedia.org/wiki/Database_transaction" rel="nofollow">transakcija</a> u SQL bazama podataka). To znači da se svaka operacija zapisivanja završava tek kada je potvrđeno uredno zapisivanje (kada je transakcija uredno završila). Performanse su i dalje zadržane naprednim modelom transakcija te uvođenjem posebnog <a class="urlextern" title="https://pthree.org/2013/04/19/zfs-administration-appendix-a-visualizing-the-zfs-intent-log/" href="https://pthree.org/2013/04/19/zfs-administration-appendix-a-visualizing-the-zfs-intent-log/" rel="nofollow">ZIL</a> log-a za operacije snimanja. Ovaj “Copy On Write” model uvodi i :
  </div>
  
  <ul>
    <li class="level2">
      <div class="li">
        mogućnost izrade Tzv. “Snapshota” odnosno snimke stanja diska/podataka u vremenu te mogućnost povratka na bilo koji trenutak kada je izrađen bilo koji od “Snapshot”.
      </div>
    </li>
    
    <li class="level2">
      <div class="li">
        mogućnost izrade “klonova” odnosno verzije “snapshota” na kojoj se može i zapisivati
      </div>
    </li>
  </ul>
</li>

<li class="level1">
  <div class="li">
    mogućnost naprednih <abbr title="Access Control List">ACL</abbr>-a (sigurnosnih postavki/prava na datotečni sustav ali i na NFS share direktno )
  </div>
</li>

<li class="level1">
  <div class="li">
    … te cijeli niz drugih funkcionalnosti
  </div>
</li>

&nbsp;

&nbsp;

#### ZFS u radu {#zfs_u_radu.sectionedit33}

&nbsp;

<div class="level4">
  <p>
    Nakon što smo instalirali ZFS, na njega dodajemo diskove i kreiramo ekvivalente RAID poljima, slično kao što ih dodajemo u neki hardverski RAID kontroler (što se konfiguracije tiće). Tako je moguće kreirati ekvivalente gotovo svim RAID poljima :
  </p>
  
  <p>
    &nbsp;
  </p>
  
  <ul>
    <li class="level1">
      <div class="li">
        RAID 0 ( ovdje se naziva <strong>stripe</strong> ) ,
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        RAID 1 ( ovdje se naziva <strong>mirror</strong> ),
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        RAID 5 ( ovdje se naziva <strong>RAID-Z</strong> ili <strong>RAID-Z1</strong> ),
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        RAID 6 ( ovdje se naziva <strong>RAID-Z2</strong> ),
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        Nešto poput RAID “6” ali s tri paritetna diska umjesto dva &#8211; naziva se <strong>RAID-Z3</strong>
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        RAID 10
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        …
      </div>
    </li>
  </ul>
  
  <p>
    &nbsp;
  </p>
  
  <p>
    S jedinom razlikom da to sve radi bez grešaka i problema koje možemo imati na bilo kojem RAID kontroleru a pogotovo ako nismo prethodno testirali sve scenarije u slučaju nekog kvara. Osim toga na današnjem hardveru to sve radi ekstremno brzo a sve je moguće i dodatno drastično ubrzati uvođenjem :
  </p>
  
  <p>
    &nbsp;
  </p>
  
  <ul>
    <li class="level1">
      <div class="li">
        <strong>L2ARC</strong>-a za ubrzavanje operacija ćitanja (read) i /ili
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        <strong>ZIL log</strong>-a za ubrzavanje operacija pisanja (write)
      </div>
    </li>
  </ul>
</div>

&nbsp;

<div class="level4">
  <p>
    S time da se za obije metode (<strong>L2ARC</strong> i <strong>ZIL log</strong>) mogu koristiti zasebni SSD diskovi a koji dodatno mogu biti i u nekom ekvivalentu RAID polja, da bi se dodatno dobilo na brzini i/ili pouzdanosti.<br /> Pošto je jasno da je ZFS povezan s NFS-om a i vrlo jednostavno sa SMB/CIFS ili nekim drugim sustavom za dijeljenje datoteka (NAS sustavom) vidljiva je njegova upotreba kao naprednog NAS sustava.
  </p>
  
  <p>
    Jedna od naprednih stvari oko ZFS-a je i u tome što se na bilo kojem ZFS polju diskova (ekvivalent RAID polju) može kreirati poseban “Block device” koji se može koristiti kao iSCSI logički uređaj (disk). Taj logički disk je samo potrebno proslijediti nekom od iSCSI “serverskih” servisa/daemona. Ovime dobivamo upotrebu ZFS-a kao SAN sustava.
  </p>
  
  <p>
    Potencijalna mana upotrebe ZFS-a leži u tome što nije trivijalan kao što je više manje korištenje RAID kontrolera i kreiranje nekog RAID polja. U svakom slučaju potrebna su vam neka naprednija predznanja. ZFS-ove mnogobrojne opcije i funkcionalnosti početnicima mogu izgledati komplicirane ali su profesionalcima definitivno vrlo važne.
  </p>
  
  <p>
    Na kraju krajeva niti ne želite da vam NAS ili SAN sustav “složi” netko onako usput, za sat-dva, uz svoj svakodnevni posao koji obično nema veze s ovom temom, jer bi mogli zažaliti kada nešto krene po zlu. Namjerno nisam napisao “ako” već “kada” jer je uvijek pitanje vremena kada će doći do problema i dali ćete ih biti u stanju riješiti te koliko vremena i novaca će vam biti potrebno za tu “igru”.
  </p>
  
  <p>
    O ZFS-u su napisane knjige i knjige te više nećemo ulaziti dublje u ovaj najbolji “Volume Manager” i datotečni sustav svih vremena. O njemu detaljnije u nekom od slijedećih postova.
  </p>
</div>

&nbsp;

&nbsp;

### Proces učenja {#proces_ucenja.sectionedit34}

<div class="level3">
  <p>
    Ako tek krećete s učenjem, prvo si dajte nekoliko dana da bi dobro savladali:
  </p>
  
  <ul>
    <li class="level1">
      <div class="li">
        osnove Storage tehnologija te napredne mogućnosti
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        osnove rada RAID kontrolera te njihove mogućnosti, način rada i dodatne opcije (uz njihovo razumjevanje)
      </div>
    </li>
  </ul>
  
  <p>
    I na kraju dodajte još koji dan za proučavanje foruma koji se bave ovom tematikom, kao i foruma od strane proizvođača s pitanjima i odgovorima vezanim za pojedine (konkretne) modele RAID kontrolera koji vam je ušao u użi izbor (ako ste odlučili da čete koristiti RAID kontroler a ne ZFS).
  </p>
  
  <p>
    Kada završite prvu fazu učenja i nakon što ste kupili RAID kontroler, slijedi novo učenje :
  </p>
  
  <ul>
    <li class="level1">
      <div class="li">
        proučite napredne parametre i testirajte ih (istovremeno testirajte i performanse sustava ovisno o promjeni parametara)
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        testirajte razne scenarije havarija za barem nekoliko RAID polja (pogledajte dolje za ZFS) i povrata podataka , mjerite i vrijeme koje potrebno da se sve vrati na “staro stanje” &#8211; i vrijeme potrebno za “recovery” je ponakad ključno za konačan odabir vrste RAID polja (RAID 1, RAID 5, RAID 6, RAID 10, …)
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        sve dobro i detaljno dokumentirajte (ovo ćete najviše cijeniti kad vam se dogodi prva veća greška &#8211; višestruko će se isplatiti dani i dani testiranja i dokumentiranja)
      </div>
    </li>
  </ul>
  
  <p>
    Ako ste krenuli prema ZFS-u tada krenite s proučavanjem osnova:
  </p>
  
  <ul>
    <li class="level1">
      <div class="li">
        <a class="urlextern" title="https://en.wikipedia.org/wiki/ZFS" href="https://en.wikipedia.org/wiki/ZFS" rel="nofollow">WIKI ZFS info</a>
      </div>
    </li>
  </ul>
  
  <p>
    Proučite si i pripremite upute iz nekoliko izvora te odvojite još par tjedana za upoznavanje i isprobavanje te smišljajte razne scenarije havarija (i smislite/pronađite najbolje riješenje ) :
  </p>
  
  <ul>
    <li class="level1 node">
      <div class="li">
        Kreirajte jedno ZFS polje:
      </div>
      
      <ul>
        <li class="level2 node">
          <div class="li">
            a. Mirror (Ekvivalent RAID 1)
          </div>
          
          <ul>
            <li class="level3">
              <div class="li">
                0. Kreirajte share (NFS ili SMB/CIFS), dodjelite ovlasti i dobro ih naučite (proučite kako se dodjeljuju, nasljeđuju, ne nasljeđuju i sl.), Zapišite određene podatke i pratite performanse kod zapisivanja i čitanja (s različitim parametrima).
              </div>
            </li>
            
            <li class="level3">
              <div class="li">
                1. Izvadite jedan disk iz ZFS polja, pa ga vratite
              </div>
            </li>
            
            <li class="level3">
              <div class="li">
                2. Ponovite 1. korak ali prije vračanja diska, obrišite ga
              </div>
            </li>
            
            <li class="level3">
              <div class="li">
                3. Zamijenite mjesta diskovima (prvi na mjesto drugog i sl.)
              </div>
            </li>
            
            <li class="level3">
              <div class="li">
                4. Izvadite sve diskove, reinstalirajte cijelo računalo pa vratite diskove i pokušajte importirati staro ZFS polje
              </div>
            </li>
          </ul>
        </li>
      </ul>
    </li>
    
    <li class="level1 node">
      <div class="li">
        b. Obrišite postojeće ZFS polje i kreirajte novo (Pr. RAID-Z)
      </div>
      
      <ul>
        <li class="level3">
          <div class="li">
            Ponovite sve točke : 0 &#8211; 4
          </div>
        </li>
      </ul>
    </li>
    
    <li class="level1 node">
      <div class="li">
        c. Obrišite postojeće ZFS polje i kreirajte novo (Pr. RAID-Z2)
      </div>
      
      <ul>
        <li class="level3">
          <div class="li">
            Ponovite sve točke : 0 &#8211; 4
          </div>
        </li>
      </ul>
    </li>
    
    <li class="level1 node">
      <div class="li">
        d. Obrišite postojeće ZFS polje i kreirajte novo (Pr. RAID-10 : 2 x “mirror” u “stripe”)
      </div>
      
      <ul>
        <li class="level3">
          <div class="li">
            Ponovite sve točke : 0 &#8211; 4
          </div>
        </li>
      </ul>
    </li>
  </ul>
  
  <p>
    Napravite što više scenarija te:
  </p>
  
  <ul>
    <li class="level1">
      <div class="li">
        sve isprobajte (testirajte i performanse) i dokumentirajte
      </div>
    </li>
    
    <li class="level1 node">
      <div class="li">
        isprobavajte rad s osnovnim postavkama, pa sve probajte optimizirati (za svaki scenarij) &#8211; testirate i stabilnost i izdržljivost ovisno o scenariju i opcijama koje ste mijenjali &#8211; uz:
      </div>
      
      <ul>
        <li class="level3">
          <div class="li">
            restart poslužitelja
          </div>
        </li>
        
        <li class="level3">
          <div class="li">
            restart servisa/daemona
          </div>
        </li>
        
        <li class="level3">
          <div class="li">
            namjerno stopirane servise/daemone (uz ručno pokretanje &#8211; naknadno)
          </div>
        </li>
      </ul>
    </li>
  </ul>
  
  <p>
    U ovim koracima/scenarijima ćete naučiti najviše, te se pribliżiti produkcijskoj primjeni i znanju o ovim sustavima.
  </p>
</div>

&nbsp;

&nbsp;

&nbsp;

&nbsp;

# Što je slijedeće {#sto_je_slijedece.sectionedit35}

<div class="level1">
  <p>
    <strong>Problemi klasterskih NAS i SAN sustava</strong>
  </p>
  
  <p>
    Kao što smo vidjeli u prethodnom poglavlju klasterski NAS i SAN sustavi imaju svoje limitirajuće faktore. Kod većine je to cijena ali i ograničenja skalabilnosti. Naime veći sustavi često trebaju sve veći i veći kapacitet pohrane podataka, koji postaje ili preskup u startu ili zahtjeva vrlo velika ulaganja kod proširenja. I na kraju krajeva svi oni opet imaju svoje limite, najviše sa strane proširenja.
  </p>
  
  <p>
    Kod najvećih igrača poput “Cloud” providera pružanje usluge pohrane velike količine podataka pr. za spremanje virtualnih računala i sl. je svakodnevni posao. Proširivost ovakvih sustava je krucijalna.
  </p>
  
  <p>
    Rani odgovor na ovu problematiku je bio razvoj (i kasnija upotreba) sustava koji uopće ne rade na način na koji rade tradicionalni klasterski NAS ili SAN sustavi.
  </p>
</div>

<div class="secedit editbutton_section editbutton_35">
</div>

## Object storage {#object_storage.sectionedit36}

<div class="level2">
  <p>
    I rodio se “Object storage”, koji podatke “promatra” i pohranjuje kao objekte, za razliku od tradicionalnih sustava kod kojih postoji neka struktura datoteka i direktorija (odnosno klasičan datotečni sustav) kod NAS sustava. Ovo je drugačije i od SAN sustava koji rade s blokovima podataka koji se spremaju u sektore na disku (logičkom ili fizičkom).
  </p>
</div>

&nbsp;

> <p style="padding-left: 30px;">
>   <span style="color: #ff0000;">Kao što RAID kontroler “razlama” neku datoteku na male blokove podataka koje dalje raspoređuje na diskove, ovisno o RAID polju, tako i ovi sustavi “razlamaju” podatke na Tzv. objekte (uz pripadajuće metapodatke), koje onda raspoređuju na poslužitelje u klasteru. </span>
> </p>

&nbsp;

&nbsp;

Objektni “storage” trebao bi nam nuditi, skalabilni (proširivi) sustav otporan na greške. Ovakvi sustavi su se počeli znatnije razvijati od 1995 godine iako su neki radovi i ideje nastali i znatno ranije.

Prvo komercijalno riješenje je razvila tvrtka “Centera Technology” koju je odmah kupila tvrtka “EMC²” te je 2002 izbacila na tržište pod tržišnim nazivom “**<a class="urlextern" title="http://emc2.la/data-protection/centera.htm" href="http://emc2.la/data-protection/centera.htm" rel="nofollow">EMC Centera</a>**”. Ova linija proizvoda se i danas razvija.

Smatra se da se u razvoj ove tehnologije od strane neovisnih investitora u prvim godinama uložilo oko 300 milijuna dolara (ova cifra je rasla sve više). Ne računajući ulaganja tvrtki poput : DataDirect Networks, Centera, Atmos, HDS, EMC2, HP, IBM, NetApp, Redhat i drugih a kasnije i od strane “Cloud providera” poput : Amazon AWS, Microsoft (Microsoft Azure), Google (Google Cloud Storage) i drugih.

Pogledajmo listu nekoliko visoko skalabilnih, redundantnih “Object storage” sustava dostupnih pod nekom od “open source” licenci:

&nbsp;

<li class="level1">
  <div class="li">
    CEPH (<a class="urlextern" title="https://en.wikipedia.org/wiki/Ceph_(software)" href="https://en.wikipedia.org/wiki/Ceph_%28software%29" rel="nofollow">info</a>)
  </div>
</li>

<li class="level1">
  <div class="li">
    Lustre (<a class="urlextern" title="https://en.wikipedia.org/wiki/Lustre_(file_system)" href="https://en.wikipedia.org/wiki/Lustre_%28file_system%29" rel="nofollow">info</a>)
  </div>
</li>

<li class="level1">
  <div class="li">
    LizardFS (<a class="urlextern" title="https://en.wikipedia.org/wiki/LizardFS" href="https://en.wikipedia.org/wiki/LizardFS" rel="nofollow">info</a>)
  </div>
</li>

<li class="level1">
  <div class="li">
    Hadoop Distributed File System(<a class="urlextern" title="https://en.wikipedia.org/wiki/Apache_Hadoop#Hadoop_distributed_file_system" href="https://en.wikipedia.org/wiki/Apache_Hadoop#Hadoop_distributed_file_system" rel="nofollow">info</a>)
  </div>
</li>

<li class="level1">
  <div class="li">
    Moose File System (<a class="urlextern" title="https://en.wikipedia.org/wiki/Moose_File_System" href="https://en.wikipedia.org/wiki/Moose_File_System" rel="nofollow">info</a>)
  </div>
</li>

<li class="level1">
  <div class="li">
    Quantcast File System (<a class="urlextern" title="https://en.wikipedia.org/wiki/Quantcast_File_System" href="https://en.wikipedia.org/wiki/Quantcast_File_System" rel="nofollow">info</a>)
  </div>
</li>

<li class="level1">
  <div class="li">
    …
  </div>
</li>

&nbsp;

Kod većih sustava, kao i kod sustava kod kojih korisnici NE žele kupovati super skupi hardver i softver za “Object Storage” sustave, jedno od open source rješenja je “**CEPH**” o kojemu ćemo govoriti dalje u tekstu.

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;

## CEPH {#ceph.sectionedit39}

<img class="alignnone size-full wp-image-2235" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/ceph_logo_1_.png?resize=200%2C54&#038;ssl=1" alt="ceph_logo_1_" width="200" height="54" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/ceph_logo_1_.png?w=200&ssl=1 200w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/ceph_logo_1_.png?resize=150%2C41&ssl=1 150w" sizes="(max-width: 200px) 100vw, 200px" data-recalc-dims="1" />

&nbsp;

Ceph je distribuirani objektni sustav za pohranu podataka (Engl. Storage) koji je dizajniran za postizanje odličnih performansi, te sustav koji je visoko dostupan i pouzdan. Osim toga on je krajnje skalabilan odnosno proširiv do razine <a class="urlextern" title="https://en.wikipedia.org/wiki/Exabyte" href="https://en.wikipedia.org/wiki/Exabyte" rel="nofollow">Exabyte-a</a>.

Ovo je sustav koji je zbog svog dizajna otporan na greške i kvarove cijelih poslužitelja i/ili pojedinačnih diskova ili grupe diskova, a u većim implementacijama, cijelih ormara punih poslužitelja pa čak i cijelih podatkovnih centara a samim time i desetcima, stotinama ili tisućama diskova. Sve ovisno o konfiguraciji i raspoloživoj opremi.

Više informacije možete pronaći na : <a class="urlextern" title="http://ceph.com" href="http://ceph.com" rel="nofollow">http://ceph.com</a>

&nbsp;

&nbsp;

**Malo o povijesti CEPH-a**
  
Razvio ga je <a class="urlextern" title="https://en.wikipedia.org/wiki/Sage_Weil" href="https://en.wikipedia.org/wiki/Sage_Weil" rel="nofollow">Sage Weil</a> kao temu za doktorski rad na sveučilištu “University of California, Santa Cruz”.

Razvoj se nastavio u tvrtki “Inktank”. Navedenu tvrtku je kupio “RedHat” , 30.04.2014 (za 175 milijuna U$ u gotovini). Tvrtka “Red Hat” ga nastavlja razvijati do danas (kao i zajednica koja ga koristi). Projekt je i dalje, i ostati će “open source”.

&nbsp;

&nbsp;

 **Da li postoji i podrška od strane proizvođača hardvera** 

Naravno, vrlo brzo nakon učlanjenja u obitelj “Red Hat” svi važniji proizvođači hardvera počeli su nuditi sustave koji su certificirani za CEPH, pr. :

<li class="level1">
  <div class="li">
    <a class="urlextern" title="https://www.supermicro.com/solutions/datasheet_Ceph.pdf" href="https://www.supermicro.com/solutions/datasheet_Ceph.pdf" rel="nofollow">Supermicro</a>
  </div>
</li>

<li class="level1">
  <div class="li">
    <a class="urlextern" title="http://www8.hp.com/h20195/v2/GetPDF.aspx/4AA5-2784ENN.pdf" href="http://www8.hp.com/h20195/v2/GetPDF.aspx/4AA5-2784ENN.pdf" rel="nofollow">HP</a>
  </div>
</li>

<li class="level1">
  <div class="li">
    <a class="urlextern" title="http://i.dell.com/sites/doccontent/shared-content/data-sheets/en/Documents/dell-red-hat-cloud-solutions.pdf" href="http://i.dell.com/sites/doccontent/shared-content/data-sheets/en/Documents/dell-red-hat-cloud-solutions.pdf" rel="nofollow">DELL</a>
  </div>
</li>

<li class="level1">
  <div class="li">
    … i mnogi drugi
  </div>
</li>

&nbsp;

Osim navedenog hardvera, CEPH se može koristiti i na bilo kojem hardveru koji imate a na kojem se može pokretati bilo koja **RedHat** ili **Debian** bazirana distribucija Linuxa, imalo novije generacije. Dakle dostupni su RPM i Debian <a class="urlextern" title="http://docs.ceph.com/docs/master/install/get-packages/" href="http://docs.ceph.com/docs/master/install/get-packages/" rel="nofollow">paketi</a>.

&nbsp;

Osim toga dostupan je i izvorni kod CEPH-a, pa je sve moguće kompajlirati i za druge distibucije Linuxa.

&nbsp;

&nbsp;

&nbsp;

 **Integracija** 

&nbsp;

CEPH klijent se već standardno nalazi unutar Linux kernela. Server je dostupan ionako kao open source na stranici : <a class="urlextern" title="http://ceph.com/resources/downloads/" href="http://ceph.com/resources/downloads/" rel="nofollow">http://ceph.com/resources/downloads/</a>.

Osim navedenog CEPH je trenutno integriran s dvije platforme za virtualizaciju:

<li class="level1 node">
  <div class="li">
    <strong>Open Stack</strong> &#8211; <a class="urlextern" title="https://www.openstack.org" href="https://www.openstack.org" rel="nofollow">info</a> :
  </div>
  
  <ul>
    <li class="level2">
      <div class="li">
        Integriran je sa : <strong>Nova</strong>, <strong>Cinder</strong> i <strong>Glance</strong> za “Block storage”
      </div>
    </li>
    
    <li class="level2">
      <div class="li">
        Integriran je sa <strong>Keystone</strong> i <strong>Swift</strong> za “Object storage”
      </div>
    </li>
  </ul>
</li>

<li class="level1 node">
  <div class="li">
    <strong>Proxmox VE</strong> &#8211; pogledajte <a class="urlextern" title="https://www.opensource-osijek.org/wordpress/2016/06/28/retrospektiva-virtualizacija-linux-kontejneri-i-proxmox-ve/" href="https://www.opensource-osijek.org/wordpress/2016/06/28/retrospektiva-virtualizacija-linux-kontejneri-i-proxmox-ve/" rel="nofollow">info</a> :
  </div>
  
  <ul>
    <li class="level2">
      <div class="li">
        “Block storage” za virtualna računala i za Linux kontejnere
      </div>
    </li>
  </ul>
</li>

&nbsp;

&nbsp;

&nbsp;

 **Tko ga trenutno koristi** 

Koriste ga i najveći igrači, poput :

<li class="level1">
  <div class="li">
    Amazon AWS &#8211; prema nekim informacijama, koristi se za neke dijelove <a class="urlextern" title="https://aws.amazon.com/s3/" href="https://aws.amazon.com/s3/" rel="nofollow">S3 Storage</a> sustava
  </div>
</li>

<li class="level1">
  <div class="li">
    Facebook &#8211; za neke dijelove sustava
  </div>
</li>

<li class="level1">
  <div class="li">
    CERN &#8211; prema podacima od prošle godine &#8211; koriste ga za ukupno 1+ PB (za spremanje podataka)
  </div>
</li>

<li class="level1 node">
  <div class="li">
    DreamHost (Web hosting provider) :
  </div>
  
  <ul>
    <li class="level2">
      <div class="li">
        2+ PB za S3
      </div>
    </li>
    
    <li class="level2">
      <div class="li">
        3+ PB kao “Block Device” &#8211; za virtualke
      </div>
    </li>
  </ul>
</li>

<li class="level1">
  <div class="li">
    … i mnogi drugi (mnogi i ne žele iznositi što točno koriste iz sigurnosnih razloga)
  </div>
</li>

&nbsp;

&nbsp;

 **Za što se sve može koristiti CEPH** 

CEPH iako radi s objektima na najnižoj razini, na vršnoj se može koristiti za tri različite “upotrebe”, i to :

<li class="level1">
  <div class="li">
    Kao “<strong>Block Device</strong>” i to ako se koristi kao “Rados Block Device” ( RBD ) &#8211; vidljiv dalje kao “Block Device” ili logički disk koji se koristi za opću upotrebu (pr. za spremanje diskova virtualki i sl.)
  </div>
</li>

<li class="level1">
  <div class="li">
    Kao “<strong>Object Storage</strong>” preko “RADOSGW”-a, a koji je “S3” i “Swift” kompatibilan &#8211; najčešće se koristi za snimanje/čitanje datoteka bilo kojeg tipa preko web-a (korištenjem “put” ili “get” metoda)
  </div>
</li>

<li class="level1">
  <div class="li">
    Kao “<strong>Filesystem</strong>” tj. direktno kao datotečni sustav, preko “CEPHFS” &#8211; može se “mountati” kao običan datotečni sustav
  </div>
</li>

&nbsp;

&nbsp;

Pogledajte i malo više detalja :

&nbsp;

<img class="alignnone size-full wp-image-2236" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/ceph-usporedba.jpg?resize=900%2C353&#038;ssl=1" alt="ceph-usporedba" width="900" height="353" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/ceph-usporedba.jpg?w=900&ssl=1 900w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/ceph-usporedba.jpg?resize=150%2C59&ssl=1 150w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/ceph-usporedba.jpg?resize=300%2C118&ssl=1 300w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/ceph-usporedba.jpg?resize=768%2C301&ssl=1 768w" sizes="(max-width: 900px) 100vw, 900px" data-recalc-dims="1" />

&nbsp;

Odabirom pojedinog modela :

&nbsp;

<li class="level1">
  <div class="li">
    “<strong>CEPH Block Device</strong>”
  </div>
</li>

<li class="level1">
  <div class="li">
    “<strong>CEPH Object Stoage</strong>” ili
  </div>
</li>

<li class="level1">
  <div class="li">
    “<strong>CEPH FIlesystem</strong>”
  </div>
</li>

moramo koristiti i dodatne servise odnosno funkcionalnosti koje su nužne za ovakav rad. Prema tome potrebno je detaljnije se upoznati sa zahtjevima i načinom implementacije te konfiguracije svakoga od njih.

&nbsp;

&nbsp;

&nbsp;

&nbsp;

## Prednosti CEPH-a {#prednosti_ceph-a.sectionedit40}

&nbsp;

<div class="level2">
  <p>
    Osnovne prednosti CEPH-a (<a class="urlextern" title="https://www.proxmox.com/en/proxmox-ve" href="https://www.proxmox.com/en/proxmox-ve" rel="nofollow">i u kombinaciji s Proxmox VE platformom za virtualizaciju</a>) su :
  </p>
  
  <ul>
    <li class="level1">
      <div class="li">
        (Relativno) Jednostavan setup i management iz naredbene linije i grafičkog sučelja Proxmox VE
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        “Thin provisioning” (minimalno zauzeće stvarnog diskovnog prostora s podacima)
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        Izrada Snapshot-a podataka (datoteka) u letu (dok se radi na njima)
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        Automatsko popravljanje grešaka u radu (kod ispada diska, poslužitelja i sl.)
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        Ne postoji niti jedna komponenta sustava koja nije redundantna (zalihost)
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        Sustav je skalabilan ( proširiv ) do razine Exabyte-a
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        Moguća je konfiguracija više segmenata (Engl. Ceph Pools) polja za pohranu podataka, te razina performansi/replikacije za svaki segment
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        Svi podaci unutar polja su replicirani, čineći cijelo polje otpornim na kvarove
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        CEPH je moguće instalirati i na pristupačan hardver
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        Nema potrebe za RAID kontrolerima ( “zabranjena” je njihova upotreba &#8211; kao i kod ZFS-a (kod kojega je to izričito <strong>ZABRANJENO</strong>))
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        CEPH je razvijan kao “open source” prema licenci <a class="urlextern" title="https://en.wikipedia.org/wiki/GNU_Lesser_General_Public_License" href="https://en.wikipedia.org/wiki/GNU_Lesser_General_Public_License" rel="nofollow">LGPL 2.1</a>
      </div>
    </li>
  </ul>
</div>

&nbsp;

&nbsp;

### Kako se podaci distribuiranju unutar cijelog CEPH clustera {#kako_se_podaci_distribuiranju_unutar_cijelog_ceph_clustera.sectionedit41}

<div class="level3">
  <p>
    Koristi se Tzv. <a class="urlextern" title="https://access.redhat.com/documentation/en/red-hat-ceph-storage/1.3/paged/storage-strategies/chapter-3-introduction-to-crush" href="https://access.redhat.com/documentation/en/red-hat-ceph-storage/1.3/paged/storage-strategies/chapter-3-introduction-to-crush" rel="nofollow">CRUSH algoritam</a> i pripadajuća “CRUSH” tablica (koja je distribuirana na više poslužitelja) a koja je zadužen za distribuciju, replikaciju i redistribuciju podataka unutar CEPH clustera.
  </p>
  
  <p>
    CRUSH je dizajniran da omogućava raznoliku upotrebu, ovisno o veličini implementacije.
  </p>
  
  <p>
    Prema tome postoje “CRUSH” tipovi koji opisuju fizičku poziciju CEPH-a unutar cijelog CEPH clustera. Drugim riječima definiramo fizičku hijerarhijsku strukturu svakog elementa unutar hijerarhije :
  </p>
</div>

&nbsp;

<li class="level1">
  <div class="li">
    <strong>root</strong> (predstavlja vršnu komponentu cijelog CEPH-a &#8211; nazovimu ju “cijelom planetom”)
  </div>
</li>

<li class="level1">
  <div class="li">
    <strong>region</strong> (predstavlja prvu nižu hijerarhiju &#8211; recimo kontinent)
  </div>
</li>

<li class="level1">
  <div class="li">
    <strong>datacenter</strong> (predstavlja pojedini podatkovni centar)
  </div>
</li>

<li class="level1">
  <div class="li">
    <strong>room</strong> (predstavlja “sobu” unutar podatkovnog centra)
  </div>
</li>

<li class="level1">
  <div class="li">
    <strong>pod</strong> (predstavlja logičku podjelu unutar jedne “serverske” sobe) &#8211; može predstavljati i jedan dio podatkovnog centra koji može biti podjeljen na više ovakvih potencijalno nezavisnih (što se tiće mreže, napajanje, klimatizacije i sl.) cjelina.
  </div>
</li>

<li class="level1">
  <div class="li">
    <strong>pdu</strong> “Power Distribution Unit” odnosno podjela prema izvoru napajanja (u podatkovnim centrima ih imamo više pa je ovo dobrodošla dodatna razdioba)
  </div>
</li>

<li class="level1">
  <div class="li">
    <strong>row</strong> (predstavlja jedan red s ormarima punim poslužitelja)
  </div>
</li>

<li class="level1">
  <div class="li">
    <strong>rack</strong> (predstavlja jedan ormar s poslužiteljima)
  </div>
</li>

<li class="level1">
  <div class="li">
    <strong>chassis</strong> (predstavlja jedno kučište unutar kojega može biti više poslužitelja &#8211; misli se na “Blade” učilišta)
  </div>
</li>

<li class="level1">
  <div class="li">
    <strong>host</strong> (predstavlja jedan poslužitelj)
  </div>
</li>

<li class="level1">
  <div class="li">
    <strong>osd</strong> (predstavlja, u konačnici, pojedinačni disk)
  </div>
</li>

&nbsp;

Pogledajmo kako to izgleda:

&nbsp;

<img class="alignnone size-full wp-image-2237" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/ceph-crush-scheme.jpg?resize=273%2C638&#038;ssl=1" alt="ceph-crush-scheme" width="273" height="638" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/ceph-crush-scheme.jpg?w=273&ssl=1 273w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/ceph-crush-scheme.jpg?resize=64%2C150&ssl=1 64w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/ceph-crush-scheme.jpg?resize=128%2C300&ssl=1 128w" sizes="(max-width: 273px) 100vw, 273px" data-recalc-dims="1" />

&nbsp;

Osim toga u svakoj kategoriji u hijerarhiji, može biti i više elemenata na istoj razini &#8211; poput ovoga na slici dolje:

&nbsp;

<img class="alignnone size-full wp-image-2238" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/ceph-crush-scheme-expanded.jpg?resize=520%2C665&#038;ssl=1" alt="ceph-crush-scheme-expanded" width="520" height="665" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/ceph-crush-scheme-expanded.jpg?w=520&ssl=1 520w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/ceph-crush-scheme-expanded.jpg?resize=117%2C150&ssl=1 117w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/ceph-crush-scheme-expanded.jpg?resize=235%2C300&ssl=1 235w" sizes="(max-width: 520px) 100vw, 520px" data-recalc-dims="1" />

&nbsp;

&nbsp;

Ovakav hijerarhijski model nam omogućava stvarno raznolike scenarije upotrebe.

Stoga CEPH može biti implementiran od najmanjih sustava &#8211; pr. s minimalno tri (3) poslužitelja s diskovima a s druge strane na sustavima koji imaju tisuće poslužitelja s diskovima, koji su raspoređeni u konačnici na veliki broj podatkovnih centara.

&nbsp;

**Pogledajmo nekoliko mogućih scenarija :**

  1. Dva podatkovna centra, svaki s par poslužitelja

<img class="alignnone size-full wp-image-2239" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/crush-map-1.jpg?resize=841%2C147&#038;ssl=1" alt="crush-map--1" width="841" height="147" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/crush-map-1.jpg?w=841&ssl=1 841w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/crush-map-1.jpg?resize=150%2C26&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/crush-map-1.jpg?resize=300%2C52&ssl=1 300w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/crush-map-1.jpg?resize=768%2C134&ssl=1 768w" sizes="(max-width: 841px) 100vw, 841px" data-recalc-dims="1" />

Vidljivo je da unutar svakog podatkovnog centra (**datacenter**) imamo dva poslužitelja (**host**) od kojih svaki ima po tri tvrda diska (**osd**)

&nbsp;

  1. Prošireni scenarij u kojemu isto imamo dva podatkovna centra ali sada imamo poslužitelje s običnim (tvrdim diskovima) i poslužitelje sa SSD diskovima. Poslužitelji s “običnim” diskovima su u jednoj “grupi” a oni s SSD diskovima u drugoj “grupi”.

<img class="alignnone size-full wp-image-2240" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/crush-map-2.jpg?resize=835%2C142&#038;ssl=1" alt="crush-map--2" width="835" height="142" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/crush-map-2.jpg?w=835&ssl=1 835w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/crush-map-2.jpg?resize=150%2C26&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/crush-map-2.jpg?resize=300%2C51&ssl=1 300w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/crush-map-2.jpg?resize=768%2C131&ssl=1 768w" sizes="(max-width: 835px) 100vw, 835px" data-recalc-dims="1" />

&nbsp;

2.1. Logička shema dolje prikazuje i inicijalizaciju Tzv. “**Pool**”-a.

U CEPH terminologiji “Pool” je ono što bi u RAID-u bilo RAID polje diskova.

Moguće je imati više “Pool”-ova, svaki sa svojom konfiguracijom.

&nbsp;

<div class="wrap_center wrap_round wrap_info plugin_wrap">
  <blockquote>
    <p>
      <span style="color: #ff9900;">Pri tome, svaki pojedini <strong>Pool</strong> može biti za svoju namjenu:</span>
    </p>
    
    <ul>
      <li class="level1">
        <div class="li">
          <span style="color: #ff9900;">brzina</span>
        </div>
      </li>
      
      <li class="level1">
        <div class="li">
          <span style="color: #ff9900;">pouzdanost</span>
        </div>
      </li>
      
      <li class="level1">
        <div class="li">
          <span style="color: #ff9900;">vrijeme odziva</span>
        </div>
      </li>
      
      <li class="level1">
        <div class="li">
          <span style="color: #ff9900;">georeplikacija</span>
        </div>
      </li>
      
      <li class="level1">
        <div class="li">
          <span style="color: #ff9900;">…</span>
        </div>
      </li>
    </ul>
  </blockquote>
  
  <p>
    <img class="alignnone size-full wp-image-2241" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/crush-map-2-pool.jpg?resize=840%2C217&#038;ssl=1" alt="crush-map--2-pool" width="840" height="217" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/crush-map-2-pool.jpg?w=840&ssl=1 840w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/crush-map-2-pool.jpg?resize=150%2C39&ssl=1 150w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/crush-map-2-pool.jpg?resize=300%2C78&ssl=1 300w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/crush-map-2-pool.jpg?resize=768%2C198&ssl=1 768w" sizes="(max-width: 840px) 100vw, 840px" data-recalc-dims="1" />
  </p>
</div>

U primjeru na slici u svakom podatkovnom centu imamo poslužitelje sa SSD i poslužitelje s običnim tvrdim diskovima.

<li class="level1">
  <div class="li">
    Vršno Pool “<strong>hdd</strong>” koristi sve poslužitelje koji imaju obične diskove
  </div>
</li>

<li class="level1">
  <div class="li">
    Vršno Pool “<strong>ssd</strong>” koristi sve poslužitelje koji imaju SSD diskove
  </div>
</li>

&nbsp;

> <p style="padding-left: 30px;">
>   <span style="color: #ff9900;">Kod kreiranja <strong>Pool</strong>-a (to je korak koji možete vidjeti u tekstu o radu CEPH-a) odabiremo koliko replika će imati, kao i druge parametre.</span>
> </p>

Slike za gornja tri primjera su preuzete sa <sup><a class="urlextern" title="http://cephnotes.ksperis.com/blog/2015/02/02/crushmap-example-of-a-hierarchical-cluster-map" href="http://cephnotes.ksperis.com/blog/2015/02/02/crushmap-example-of-a-hierarchical-cluster-map" rel="nofollow">http://cephnotes.ksperis.com/blog/2015/02/02/crushmap-example-of-a-hierarchical-cluster-map</a></sup>

&nbsp;

&nbsp;

&nbsp;

### Kako se zapisuju podaci na CEPH cluster {#kako_se_zapisuju_podaci_na_ceph_cluster.sectionedit46}

<div class="level3">
  <p>
    Nakon što je definirana hijerarhijska struktura za CEPH cluster (CRUSH) te kreiran ekvivalent RAID polja koji se prema CEPH terminologiji naziva “<strong>Pool</strong>” sve je spremno za rad (to je opisano negdje od koraka ”<a class="urlextern" title="https://www.opensource-osijek.org/dokuwiki/wiki:knjige:ceph-storage#ceph_pools" href="https://www.opensource-osijek.org/dokuwiki/wiki:knjige:ceph-storage#ceph_pools" rel="nofollow">CEPH pools</a>“).
  </p>
  
  <p>
    Pojednostavljeno svaka datoteka koja se zapisuje razlama se na manje blokove koji se onda u konačnici zapisuju odnosno <strong>distribuiraju</strong> na dostupne poslužitelje i njihove diskove.
  </p>
  
  <p>
    Dakle ako smo za određeni <strong>Pool</strong> na kojem radimo, kod kreiranja odabrali da je broj <strong>Replika</strong> odnosno prema CEPH terminologiji “<strong>CEPH Pool Size</strong>” jednak tri (3) to znači da se podaci zapisuju na odredišni poslužitelj a potom na jod druga dva (2) poslužitelja. Tako da ćemo u ovom slučaju isti podatak imati sveukupno na tri (3) mjesta.
  </p>
  
  <p>
    Veličina bloka je standardno 4 <abbr title="Megabyte">MB</abbr> ali se može promijeniti do razine više <abbr title="Megabyte">MB</abbr> &#8211; ovisno o vrsti podataka koje zapisujemo ili čitamo. To znači da je za neke primjene ova veličina zadovoljavajuća a za neke je ova veličine premalena jer se zapisuju ili čitaju podaci koji zahtijevaju dohvaćanje većih blokova podataka odjednom. Promjenom veličina bloka možemo poboljšati performanse i smanjiti opterećenje sustava &#8211; zbog smanjenja broja operacija dohvaćanja velikog broja malih objekata.
  </p>
</div>

&nbsp;

> <p style="padding-left: 30px;">
>   <span style="color: #ff9900;">Ulazno/izlazne operacije prema diskovnom sustavu kod pisanja ili čitanja se zovu <a class="urlextern" style="color: #ff9900;" title="https://en.wikipedia.org/wiki/IOPS" href="https://en.wikipedia.org/wiki/IOPS" rel="nofollow">IOPS-i</a>. Klasični (magnetski) odnosno “mehanički” diskovi su znatnije pogođeni ovim operacijama od SSD diskova. Dakle SSD diskovi u prosjeku mogu podnijeti desetke, stotine i tisuće puta više ulazno/izlaznih operacija u sekundi, od mehaničkih/magnetskih diskova</span>
> </p>

**Proces distribucije podataka**

Podaci se distribuiraju na cijeli CEPH cluster, sve njegove poslužitelje i njima dostupne tvrde diskove, te se istovremeno radi replikacija, svakog bloka podataka na drugi poslužitelj odnosno disk na njemu. Sve prema tome kako je konfigurirana hijerarhija za CRUSH te koliko replika smo odabrali za određeno CEPH polje odnosno **Pool**.

Proces zapisivanja i dodatno replikacije, radi se transakcijski (pogledajte ZFS i transakcijski model) &#8211; zbog konzistentnosti podataka.

Kod procesa čitanja se također prema klasterskoj tablici i CRUSH algoritmu zna (određuje/izračunava) koji blok podataka je završio na kojem poslužitelju, i na kojem disku na njemu, te se počinje s čitanjem blokova podataka &#8211; sa svih poslužitelja i svih diskova.

U konačnici sve se svodi na to da se podaci zapisuju na sve poslužitelje te se kod čitanja također čitaju sa svih njih. Ovime se znatno povećavaju performanse : što više poslužitelja to je brže zapisivanje ili čitanje.

&nbsp;

&nbsp;

**Redistribucija podataka** 

Što u slučajevima kada se primjerice :

&nbsp;

<li class="level1">
  <div class="li">
    poslužitelj gasi (zbog kvara, održavanje ili bilo kojeg razloga) ili se dodaje novi
  </div>
</li>

<li class="level1">
  <div class="li">
    dodaje se novi poslužitelj
  </div>
</li>

<li class="level1">
  <div class="li">
    dodaju se novi diskovi u postojeće poslužitelje ili se neki diskovi vade
  </div>
</li>

&nbsp;

Tada CEPH radi Tzv. redistribuciju podataka.

Pogledajte sliku upotrebe CEPH-a na Proxmox VE platformi za virtualizaciju:

<img class="alignnone size-full wp-image-2242" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/proxmoxve-ceph-re-distribucija-1.jpg?resize=458%2C305&#038;ssl=1" alt="proxmoxve-ceph--re-distribucija---1" width="458" height="305" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/proxmoxve-ceph-re-distribucija-1.jpg?w=458&ssl=1 458w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/proxmoxve-ceph-re-distribucija-1.jpg?resize=150%2C100&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/proxmoxve-ceph-re-distribucija-1.jpg?resize=300%2C200&ssl=1 300w" sizes="(max-width: 458px) 100vw, 458px" data-recalc-dims="1" />

Na slici su vidljiva samo dva poslužitelja **225x** i **224x** (iako su u testu bila tri (i **223x**)) od njih svaki ima po 8 tvrdih diskova:

&nbsp;

<table class="inline" style="border-color: #000000; width: 500px;">
  <tr class="row0">
    <td class="col0" style="width: 87px;">
      <strong>Poslužitelj</strong>
    </td>
    
    <td class="col1" style="width: 58.6335px;">
      <strong>Diskovi</strong>
    </td>
    
    <td class="col2" style="width: 339.366px;">
      <strong>Kapacitet diskova</strong>
    </td>
  </tr>
  
  <tr class="row1">
    <td class="col0" style="width: 87px;">
      225x
    </td>
    
    <td class="col1" style="width: 58.6335px;">
      OSD.8<br /> OSD.9<br /> OSD.10<br /> OSD.11<br /> OSD.12<br /> OSD.13<br /> OSD.14<br /> OSD.15
    </td>
    
    <td class="col2" style="width: 339.366px;">
      832 GB dostupnog kapaciteta<br /> 832 GB dostupnog kapaciteta<br /> 832 GB dostupnog kapaciteta<br /> 832 GB dostupnog kapaciteta<br /> 832 GB dostupnog kapaciteta<br /> 832 GB dostupnog kapaciteta<br /> 832 GB dostupnog kapaciteta<br /> 832 GB dostupnog kapaciteta
    </td>
  </tr>
  
  <tr class="row2">
    <td class="col0" style="width: 87px;">
       224x
    </td>
    
    <td class="col1" style="width: 58.6335px;">
      OSD.0<br /> OSD.1<br /> OSD.2<br /> OSD.3<br /> OSD.4<br /> OSD.5<br /> OSD.6<br /> OSD.7
    </td>
    
    <td class="col2" style="width: 339.366px;">
      832 GB dostupnog kapaciteta<br /> 832 GB dostupnog kapaciteta<br /> 832 GB dostupnog kapaciteta<br /> 832 GB dostupnog kapaciteta<br /> 832 GB dostupnog kapaciteta<br /> 832 GB dostupnog kapaciteta<br /> 832 GB dostupnog kapaciteta<br /> 832 GB dostupnog kapaciteta
    </td>
  </tr>
  
  <tr class="row3">
    <td class="col0" style="width: 87px;">
      223x
    </td>
    
    <td class="col1" style="width: 58.6335px;">
      OSD.16<br /> OSD.17<br /> OSD.18<br /> OSD.19<br /> OSD.20<br /> OSD.21<br /> OSD.22<br /> OSD.23
    </td>
    
    <td class="col2" style="width: 339.366px;">
      832 GB dostupnog kapaciteta<br /> 832 GB dostupnog kapaciteta<br /> 832 GB dostupnog kapaciteta<br /> 832 GB dostupnog kapaciteta<br /> 832 GB dostupnog kapaciteta<br /> 832 GB dostupnog kapaciteta<br /> 832 GB dostupnog kapaciteta<br /> 832 GB dostupnog kapaciteta
    </td>
  </tr>
</table>

&nbsp;

Pogledajte stupac “**Used**” i to postotke (kreću se od 0.27 do 0.31).

Kod dobro balansiranog sustava, postotak zauzeća (upotrebe) svih diskova mora biti podjednak. Za to su zaduženi automatizmi o kojima ćemo malo kasnije.

Dodavanjem novog diska, vađenjem jednog od njih ili dodavanjem/izbacivanjem cijelog poslužitelja sa svim diskovima CEPH kreće u redistribuciju svih podataka. To znači da ako smo recimo dodali novi poslužitelj s osam diskova (detaljnije se radi i o koeficjentu svakog diska ovisno o njegovom kapacitetu i drugim parametrima) podaci se preraspoređuju unutar cijelog klastera i svih diskova, tako da svi diskovi na svim poslužiteljima budu podjednako zauzeti.

Ovo je vrlo važno jer se nakon dovršetka redistribucije podaci tada počinju zapisivati ili čitati i s tog novog poslužitelja ili novog diska, ravnomjerno koristeći sve resurse (poslužitelje i diskove) klastera.

&nbsp;

> <p style="padding-left: 30px;">
>   <span style="color: #ff9900;">Za Redistribuciju kao i za replikaciju podataka, koristi se (preporuča) zasebna mreža &#8211; da se ne opterećuje “radna” mreža. </span>
> </p>

&nbsp;

Prema CEPH preporukama, potrebno je imati dvije zasebne mreže :

<li class="level1">
  <div class="li">
    “Public Network” &#8211; preko nje čitamo i pišemo podatke na CEPH
  </div>
</li>

<li class="level1">
  <div class="li">
    “Cluster Network” &#8211; preko nje se odrađuju sve ostale radnje poput redistribucije i replikacije podataka
  </div>
</li>

&nbsp;

&nbsp;

#### Logička shema cijelog sustava {#logicka_shema_cijelog_sustava.sectionedit52}

<div class="level4">
  <p>
    Logička shema je vidljiva na slici:
  </p>
  
  <p>
    <img class="alignnone size-full wp-image-2252" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/ceph-pool-osd-and-pg-1.jpg?resize=697%2C577&#038;ssl=1" alt="ceph-pool-osd-and-pg" width="697" height="577" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/ceph-pool-osd-and-pg-1.jpg?w=697&ssl=1 697w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/ceph-pool-osd-and-pg-1.jpg?resize=150%2C124&ssl=1 150w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/ceph-pool-osd-and-pg-1.jpg?resize=300%2C248&ssl=1 300w" sizes="(max-width: 697px) 100vw, 697px" data-recalc-dims="1" />
  </p>
  
  <p>
    Opis :
  </p>
  
  <ul>
    <li class="level1">
      <div class="li">
        Podaci se spremaju kao objekti
      </div>
    </li>
    
    <li class="level1 node">
      <div class="li">
        Objekti se nalaze unutar <strong>Pool</strong>-a
      </div>
      
      <ul>
        <li class="level2">
          <div class="li">
            Standardna veličina objekta je 4MB
          </div>
        </li>
      </ul>
    </li>
    
    <li class="level1">
      <div class="li">
        Objekti se grupiraju u “Placement Grupe” (PG). Placement Grupe su distribuirane preko više OSD-ova (diskova)
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        OSD-ovi se koriste za stvarnu distribuciju (“read” i “write” operacija) objekata na tvrde diskove
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        “CRUSH” tablica/konfiguracija se koristi za kreiranje i kasniju upotrebu i distribuciju objekata (podataka) unutar svakog pojedinog “<strong>Pool</strong>-a” za cijeli CEPH klaster. (Moguće je imati i više <strong>Pool</strong>-ova s različitim konfiguracijama).
      </div>
    </li>
  </ul>
  
  <p>
    &nbsp;
  </p>
  
  <div class="wrap_center wrap_round wrap_info plugin_wrap">
    <blockquote>
      <p style="padding-left: 30px;">
        <span style="color: #ff0000;"><strong>Pool</strong> promatrajte kao RAID polje.</span>
      </p>
    </blockquote>
  </div>
</div>

&nbsp;

&nbsp;

**Malo detaljnije**

&nbsp;

Iako se podaci u konačnici zapisuju kao objekti, odnosno najmanji blok podataka je jedan objekt, standardne veličine 4MB, objekti se prvo grupiraju u Tzv. “Placement” grupe. Ove “Placement” grupe prema tome povezuju niz objekata koji su dalje raspoređeni na niz OSD-ova. Pohrana objekata na OSD-ove znači pohranu na niz tvrdih diskova, raspoređenih na više poslužitelja &#8211; ovisno o Pool-u i hijerarhijskoj strukturi definiranoj u CRUSH tablici/konfiguraciji.

&nbsp;

<div class="wrap_center wrap_round wrap_info plugin_wrap">
  <blockquote>
    <p style="padding-left: 30px;">
      <span style="color: #ff6600;">Prisjetimo se da “CRUSH maps” tablica/konfiguracija definira fizičku topologiju cijelog CEPH klastera koju koristi CRUSH algoritam za određivanje (izračun) točnih pozicija na koje će se podaci (u konačnici objekti) i njihove replike spremati odnosno čitati.</span>
    </p>
  </blockquote>
</div>

&nbsp;

Sve operacije čitanja i pisanja se zapravo rade na razini svake pojedine “Placement” grupe a ne na razini svakog pojedinog objekta. U protivnom bi rad na razini svakog pojedinog objekta uz dohvaćanje metapodataka za svaki objekt drastično usporilo cijeli sustav.

“Placement” grupe rješavaju problem s performansama, jer se transakcije događaju na razini PG-a, kao i pohranjivanje ili baratanje s pripadajućim metapodacima, koje su definirani za cijelu placement grupu a n pojedini objekt u njoj.

CEPH kod čitanja ili pisanja radi na razini “placement” grupa i njihovih metapodataka (koji ih opisuju), i to transakcijski.

Osim poboljšanja performansi,uvođenjem “Placement” grupa, poboljšala se i skalabilnost (proširivost) cijelog CEPH sustava.

Odnos između broja objekata i broja “Placement” grupa se može okvirno izračunati ili utvrditi testiranjem. Prema preporukama, osnovna formula za izračun  je :

&nbsp;

<img class="alignnone size-full wp-image-2244" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/pg-calc-formula-classic.jpg?resize=525%2C169&#038;ssl=1" alt="pg-calc-formula-classic" width="525" height="169" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/pg-calc-formula-classic.jpg?w=525&ssl=1 525w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/pg-calc-formula-classic.jpg?resize=150%2C48&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/pg-calc-formula-classic.jpg?resize=300%2C97&ssl=1 300w" sizes="(max-width: 525px) 100vw, 525px" data-recalc-dims="1" />

&nbsp;

Za što bolji odabir odnosno izračun broja “Placement grupa” potrebo je uzeti i druge parametre (o tome <span class="curid"><a class="wikilink1" title="wiki:knjige:ceph-storage" href="https://www.opensource-osijek.org/dokuwiki/wiki:knjige:ceph-storage#ceph_pools">kasnije</a></span>).

&nbsp;

**Pool i PG**

Možemo promatrati “Placement” grupe (PG) kao segmente unutar svakog logičkog **Pool**-a odnosno polja (objekata) na koje se logički “spaja” svaki CEPH klijent za čitanje ili pisanje na CEPH klaster.

Dakle CEPH vršno gledano, sprema podatke unutar **Pool**-a, koji predstavlja logičku grupu PG-ova. Pool se brine i o tome koliko je primjerice replika potrebno izraditi kod svakog zapisivanje podataka. CEPH može raditi i “snapshot” **Pool**-a, u bilo kojem trenutku &#8211; kao “snimku stanja u vremenu”.

&nbsp;

&nbsp;

&nbsp;

### CEPH Block Device (Rados Block Device) tj. RBD {#ceph_block_device_rados_block_device_tj_rbd.sectionedit57}

<div class="level3">
  <p>
    &nbsp;
  </p>
  
  <p>
    Mi ćemo se dalje u tekstu fokusirati na upotrebu “<strong>CEPH Block device</strong>”-a.
  </p>
  
  <p>
    Prema tome druga dva modela (“CEPH Object Storage” i “CEPH Filesystem”) više nećemo spominjati.
  </p>
</div>

<div class="secedit editbutton_section editbutton_57">
</div>

#### Potrebne funkcionalnosti (CEPH Roles) za RBD {#potrebne_funkcionalnosti_ceph_roles_za_rbd.sectionedit58}

<div class="level4">
  <p>
    Kao što smo rekli za svaki od CEPH modela, potrebne su određene funkcionalnosti na strani CEPH poslužitelja u CEPH klasteru.
  </p>
  
  <p>
    Za upotrebu CEPH-a kao “Block device”-a tj. kao RBD-a, potrebne su nam dvije funkcionalnosti odnosno “uloge” poslužitelja. To prema definiciji znači da moramo imati poslužitelje od kojih je svaki zadužen samo i isključivo za jednu ulogu:
  </p>
  
  <p>
    &nbsp;
  </p>
  
  <ul>
    <li class="level1">
      <div class="li">
        uloga Monitor poslužitelja (Engl. Monitor Node)
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        uloga OSD poslužitelja (ovo su poslužitelji na kojima se nalaze tvrtdi diskove koje ćemo koristiti u CEPH klasteru).
      </div>
    </li>
  </ul>
  
  <p>
    &nbsp;
  </p>
  
  <p>
    Preporuka za najosnovniju upotrebu kao CEPH RBD, bi bila:
  </p>
  
  <p>
    &nbsp;
  </p>
  
  <ul>
    <li class="level1">
      <div class="li">
        minimalno 3 poslužitelja s ulogom “Monitor”
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        minimalno 3 poslužitelja s ulogom “OSD”
      </div>
    </li>
  </ul>
  
  <p>
    &nbsp;
  </p>
  
  <p>
    Mi ćemo, s obzirom da imamo samo tri poslužitelja s diskovima (koje želimo koristiti kao CEPH kalster za “Block device”) te stoga što što ne tražimo ekstra/turbo brz/proširiv/… sustav, napraviti slijedeće.
  </p>
  
  <p>
    Uloge poslužitelja:
  </p>
  
  <ul>
    <li class="level1">
      <div class="li">
        Poslužitelj 1 : <strong>OSD</strong> i <strong>MON</strong>itor
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        Poslužitelj 2 : <strong>OSD</strong> i <strong>MON</strong>itor
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        Poslužitelj 3 : <strong>OSD</strong> i <strong>MON</strong>itor
      </div>
    </li>
  </ul>
  
  <p>
    &nbsp;
  </p>
  
  <p>
    Dakle svaki poslužitelj će imati i OSD i MONitor ulogu. S ovime smo na malo zaobilazan način osigurali da imamo i tri OSD-a i tri MONitora.
  </p>
</div>

&nbsp;

&nbsp;

<div class="level4">
  <p>
    <strong>Zbog čega minimalno tri (3) poslužitelja za klaster</strong>
  </p>
  
  <p>
    Većina klastera u radu rade na principu ”<a class="urlextern" title="https://en.wikipedia.org/wiki/Quorum_(distributed_computing)" href="https://en.wikipedia.org/wiki/Quorum_%28distributed_computing%29" rel="nofollow">Quoruma</a>“ dakle tri je najmanji broj poslužitelja u kojemu minimalna većina (dva) poslužitelja sudjeluju u dogovaranju i provjerama rada.
  </p>
  
  <p>
    Ovdje se radi o sustavu “glasovanja” i izbora što znači da svaki poslužitelj ima jedan glas za glasovanje. Ako su samo dva poslužitelja u sustavu glasovanja izbori su nemogući. Prema tome za sustav glasovanja je potrebno minimalno troje.
  </p>
  
  <p>
    &nbsp;
  </p>
  
  <p>
    <strong>Quorum pojednostavljeno</strong>
  </p>
  
  <p>
    U ovakvim minimalnim klasterima s tri poslužitelja, u svakom trenutku moraju biti aktivna i funkcionalna dva (2) poslužitelja. Ovo ne mora čak značiti da je jedan poslužitelj ugašen već možda ne radi kako treba, pa daje pr. krive rezultate (ili ih ne daje uopće) tada se ta zadnja dva pokušavaju sustavom “glasovanja” dogovoriti. Ovakav sustav “Quoruma” se koristi i kod klasterskih sustava za virtualizaciju pr. <a class="urlextern" title="https://pve.proxmox.com/wiki/Proxmox_VE_4.x_Cluster" href="https://pve.proxmox.com/wiki/Proxmox_VE_4.x_Cluster" rel="nofollow">Proxmox VE cluster</a>.
  </p>
  
  <p>
    Zamislimo tri poslužitelja koja imaju “Cluster Map” tablicu s pripadajućom verzijom tablice i njen <a class="urlextern" title="https://en.wikipedia.org/wiki/Hash_function" href="https://en.wikipedia.org/wiki/Hash_function" rel="nofollow">hash/checksum</a> koji govori o tome da li je integritet tablice narušen.
  </p>
  
  <p>
    &nbsp;
  </p>
  
  <p>
    <strong>Primjer</strong> :
  </p>
  
  <p>
    Prva dva poslužitelja kažu da im je zadnja verzija v.234 te HASH : A348F3609D a treći poslužitelj tvrdi da je njegova zadnja verzija v.252 te HASH : 35D56FAB5D. Dogoditi će se to da će prva dva nadglasti treći iako ima veći broj verzije (što bi značilo da je novija) te se on IZBACUJE iz klastera te se više ne uzima u obzir koje slijedeće provjere (sve dok i on ne bude imao sve iste “podatke” kao i preostala dva). Obično kod ovakvih sustava postoje Tzv. “Izbori” za klaster “Mastera”, a koji se događaju svakih nekoliko sekundi (pr. svakih 15. sekundi). Dakle u jedinici vremena unutar koje se događaju izbori (ili reizbori) za “Mastera” tj. “Primarnog” poslužitelja, svaki poslužitelj ima određeni prioritet: Pr. :
  </p>
  
  <ul>
    <li class="level1">
      <div class="li">
        Prvi poslužitelj &#8211; prioritet 1
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        Drugi poslužitelj &#8211; prioritet 2
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        Treći poslužitelj &#8211; prioritet 3
      </div>
    </li>
  </ul>
  
  <p>
    &nbsp;
  </p>
  
  <p>
    Ako se recimo onaj s najmanjim brojem prioriteta bira za “Master”-a (tj. “Primarnog”) , tada će “Prvi poslužitelj” postati “Master” ako je sve u redu s njegovim verzijama i integritetom. Ako nije tada će “Master” postati onaj s prioritetom 2 tj. “Drugi poslužitelj” itd. Dakle svakih recimo 15. sekundi se odabire novi “MAster”.
  </p>
  
  <p>
    &nbsp;
  </p>
  
  <p>
    “Master” je obično zadužen za vrlo važne operacije odlučivanja &#8211; koji će poslužitelj biti izbačen iz klastera te će on to i fizički napraviti (obično zapisati u datoteku u kojoj je lista aktivnih poslužitelja u klasteru). Ova funkcionalnost je ne zahtjevna prema resursima ali kao što je vidljivo, vrlo važna. “Master” osim toga radi još nekoliko resursno ne zahtjevnih zadaća &#8211; ovisno o vrsti i tipu klastera.
  </p>
  
  <p>
    &nbsp;
  </p>
  
  <p>
    Ovo znači da ako primjerice restartamo cijeli klaster (recimo zbog nadogradnji sustava), da to radimo oprezno. Prvo jedan poslužitelj, pa kada je on potpuno funkcionalan nakon restarta, drugi, pa kada je drugi nakon restarta funkcionaln, tek onda treći.
  </p>
</div>

<div class="secedit editbutton_section editbutton_58">
</div>

<div class="secedit editbutton_section editbutton_58">
</div>

<div class="secedit editbutton_section editbutton_58">
</div>

##### MONitor uloga u CEPH clusteru {#monitor_uloga_u_ceph_clusteru.sectionedit59}

<div class="level5">
  <p>
    MONitor uloga mora biti instalirana na minimalno tri poslužitelja. Ona se brine o:
  </p>
  
  <ul>
    <li class="level1">
      <div class="li">
        tome koji poslužitelji u CEPH klasteru su živi OSD poslužitelji i koji su sve dostupni diskovi (OSD-ovi).
      </div>
    </li>
    
    <li class="level1 node">
      <div class="li">
        Pohranjuje i održava 5 “tablica/konfiguracija”:
      </div>
      
      <ul>
        <li class="level2">
          <div class="li">
            <strong>Monitor map</strong> &#8211; tablica s MONitor poslužiteljima
          </div>
        </li>
        
        <li class="level2">
          <div class="li">
            <strong>OSD map</strong> &#8211; tablica s OSD poslužiteljima/diskovima
          </div>
        </li>
        
        <li class="level2">
          <div class="li">
            <strong>PG map</strong> &#8211; tablica s PG (Placement Group)- grupama za pohranu objekata
          </div>
        </li>
        
        <li class="level2">
          <div class="li">
            <strong>CRUSH map</strong> &#8211; “CRUSH” hijerarhijska tablica/konfiguracija
          </div>
        </li>
        
        <li class="level2">
          <div class="li">
            <strong>MDS map</strong> (za <strong>MDS</strong> ulogu [koristi se samo za <strong>S3</strong> ili <strong>Swift</strong> tj. za upotrebu kao “Object Storage”])
          </div>
        </li>
      </ul>
    </li>
  </ul>
</div>

&nbsp;

<div class="wrap_center wrap_round wrap_info plugin_wrap">
  <blockquote>
    <p style="padding-left: 30px;">
      <span style="color: #ff6600;"><strong>OSD</strong> = Object Storage Daemon. Servis (daemon) je to zadužen za rad s objektima i njihovu distribuciju te u konačnici snimanje na tvrdi disk. Jedan OSD daemon (servis) je zadužen za jedan tvrdi disk.</span>
    </p>
    
    <p style="padding-left: 30px;">
      <span style="color: #ff6600;">Dakle OSD poslužitelj koji ima osam (8) tvrdih diskova, ima i pokrenuto osam (8) OSD daemona (servisa).</span>
    </p>
  </blockquote>
</div>

&nbsp;

&nbsp;

&nbsp;

##### OSD uloga u CEPH clusteru {#osd_uloga_u_ceph_clusteru.sectionedit62}

<div class="level5">
  <p>
    &nbsp;
  </p>
  
  <p>
    Ovu ulogu moraju imati minimalno tri (3) poslužitelja.
  </p>
  
  <p>
    OSD uloga je zadužena za :
  </p>
  
  <ul>
    <li class="level1">
      <div class="li">
        Spremanje objekata na lokalni datotečni sustav (u konačnici na “OSD” tvrtde diskove ) i omogućavanje pristupa objektima preko mreže
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        zadužena je za replikaciju objekata koji se zapisuju na konkretni OSD (Daemon/servis) odnosno tvrdi disk. Dakle radi replikaciju objekata koji završe zapisani na OSD (Tvrdi disk) prema drugom OSD (tvrdi disk) &#8211; ovisno o “Cluster Map”-i i drugim parametrima (tj. o “<strong>Pool</strong>”-u ili ekvivalentu RAID polja koje se rsprostire na poslužitelje i diskove u CEPH klasteru).
      </div>
    </li>
    
    <li class="level1">
      <div class="li">
        korištenje <a class="urlextern" title="https://en.wikipedia.org/wiki/Journaling_file_system" href="https://en.wikipedia.org/wiki/Journaling_file_system" rel="nofollow">journaling</a> mehanizama kod zapisivanja podataka na OSD (disk) prema transakcijskom modelu. Dakle svaka operacija zapisivanja (Engl. Write) na CEPH sustav se radi transakcijjski s privremenim zapisivanjem transakcije na &#8220;Journaling&#8221; particiju. Kod visoko optimiziranih sustava, koriste se &#8220;Serverske&#8221; verzije SSD diskova za &#8220;Journaling&#8221;.
      </div>
    </li>
  </ul>
</div>

<div class="secedit editbutton_section editbutton_62">
</div>

##### Pogled na CEPH {#pogled_na_ceph.sectionedit63}

<div class="level5">
  <p>
    Pogledajmo kako logički izgleda cijeli CEPH, sada kada smo se upoznali sa svim važnijim elementima.
  </p>
</div>

<img class="alignnone size-full wp-image-2245" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/ceph-top_level_view.jpg?resize=838%2C483&#038;ssl=1" alt="ceph-top_level_view" width="838" height="483" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/ceph-top_level_view.jpg?w=838&ssl=1 838w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/ceph-top_level_view.jpg?resize=150%2C86&ssl=1 150w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/ceph-top_level_view.jpg?resize=300%2C173&ssl=1 300w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/ceph-top_level_view.jpg?resize=768%2C443&ssl=1 768w" sizes="(max-width: 838px) 100vw, 838px" data-recalc-dims="1" />

**U gornjem dijelu slike** je vidljiv izgled jednog OSD poslužitelja s pet tvrdih diskova. Svaki tvrdi disk mora imati minimalno jednu particiju, koju možemo formatirati s nekim od predloženih datotečnih sustava:

<li class="level1">
  <div class="li">
    xfs (preporuka)
  </div>
</li>

<li class="level1">
  <div class="li">
    ext4 ili
  </div>
</li>

<li class="level1">
  <div class="li">
    btfrs
  </div>
</li>

Dodatno, potrebna nam je još jedna particija (ili zaseban disk ili polje diskova s dodatnom particijom za “Journaling”)

U konačnici, na postojeću particiju koja je namjenjena za CEPH, na datotečni sustav kreira se struktura direktorija u koju se spremaju CEPH objekti kao i njihovi pripadajući metapodaci.

**U donjem dijelu slike** je vidljiva pozicija svakog pojedinog OSD poslužitelja (s svim njegovi “OSD” diskovima) te pozicije svih MONitor poslužitelja. Dakle vidljiv je CEPH sustav sa ukupno 30 poslužitelja i to :

<li class="level1">
  <div class="li">
    tri CEPH MONitor poslužitelja i
  </div>
</li>

<li class="level1">
  <div class="li">
    27 CEPH OSD poslužitelja.
  </div>
</li>

Sada zamislimo upotrebu u kojoj imamo poslužitelje za virtualizaciju, koji koriste ovakav CEPH sustav (sa svih 30 poslužitelja) kao disk storage sustav, dakle za spremanje virtualnih diskova virtualki.

Pogledajmo sliku kako to izgleda sa strane Virtualnog računala odnosno platforme za virtualizaciju prema CEPH sustavu (od gore do dolje)

&nbsp;

<img class="alignnone size-full wp-image-2246" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/ceph-vm-view.jpg?resize=707%2C459&#038;ssl=1" alt="ceph-vm-view" width="707" height="459" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/ceph-vm-view.jpg?w=707&ssl=1 707w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/ceph-vm-view.jpg?resize=150%2C97&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/ceph-vm-view.jpg?resize=300%2C195&ssl=1 300w" sizes="(max-width: 707px) 100vw, 707px" data-recalc-dims="1" />

Ovdje je vidljiv način pristupa CEPH “Block device”-u tj. logičkom “blok” uređaju odnosno disku koji predstavlja cijeli CEPH cluster. Na primjeru su dvije česte platforme za virtualizaciju:

<li class="level1">
  <div class="li">
    OpenStack i
  </div>
</li>

<li class="level1">
  <div class="li">
    Proxmox VE
  </div>
</li>

Platforma za virtualizaciju za svako virtualno računalo koje koristi virtualni tvrdi disk (koji je zapravo “blok uređaj” tj. logički tvrdi disk od cijelog CEPH klastera ), koristi QEMU (i Linux KVM).

&nbsp;

> <p style="padding-left: 30px;">
>   <span style="color: #ff6600;">QEMU i Linux KVM su zaduženi za sve potrebne funkcionalnosti da bi se virtualizacija uopće mogla koristiti. Dakle oni simuliraju sve virtualne komponente svakog pojedinog virtualnog računala (Matična ploča i njen BIOS, CPU, mrežna kartica i njen BIOS, disk kontroler i njem BIOS te pripadajući virtualni tvrdi disk, …)</span>
> </p>

Qemu kao Hipervizor ima nadalje metodu za korištenje svakog pojedinog virtualnog diska koji se zapravo nalazi unutar CEPH klastera ( kao “Block device” ). QEMU se tada spaja kao klijent na CEPH klaster i to na točno određeni **CEPH Pool** te njega koristi kao da je “polje diskova” na nekom SAN sustavu (jer govorimo o upotrebi CEPH-a kao “Block device-a” tj. kao RBD)

A sada pogledajmo kako to izgleda sa strane “CEPH Block Device”-a odnosno blok uređaja, kao krajnje komponente, koja na kraju stvarno pristupa CEPH klasteru za čitanje ili zapisivanje podataka. Ovdje zapravo QEMU kao CEPH klijent pristupa CEPH polju :

<img class="alignnone size-full wp-image-2247" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/ceph-write-block-device.jpg?resize=885%2C499&#038;ssl=1" alt="ceph-write-block-device" width="885" height="499" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/ceph-write-block-device.jpg?w=885&ssl=1 885w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/ceph-write-block-device.jpg?resize=150%2C85&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/ceph-write-block-device.jpg?resize=300%2C169&ssl=1 300w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/09/ceph-write-block-device.jpg?resize=768%2C433&ssl=1 768w" sizes="(max-width: 885px) 100vw, 885px" data-recalc-dims="1" />

**Klijent 1 piše ili čita na ili sa CEPH RBD**

  1. Kod procesa čitanja ili pisanja na “Block device” tj. CEPH RBD ,klijent koji žali nešto zapisati ili pročitati iz CEPH clustera koji koristi kao blok uređaj (logički kao tvrdi disk), prvo kontaktira CEPH klaster i to MONitor poslužitelje i od njih traži “CLuster Map” tablicu/konfiguraciju.
  2. CEPH cluster MONitor poslužitelj(i) mu šalju traženu tablicu/konfiguraciju
  3. Na osnovi tablice/konfiguracije koju je dobio, klijent pomoću CRUSH algoritma traži od OSD poslužitelja i OSD diskova podatke za čitanje ili traži pisanje. Do točnih OSD poslužitelja i točno određenih OSD diskova je pomoću CRUSH algoritma izračunao koji su te od njih i traži/šalje podatke
  4. S OSD-ova dobiva odgovor na traženi zahtjev (čitanje ili pisanje)

**Klijent 2 piše ili čita na ili sa CEPH RBD**

Ponavlja se proces kao i za prvog klijenta

&nbsp;

Za sada toliko

&nbsp;

&nbsp;

&nbsp;

&nbsp;

**Ako vas zanima kako instalirati i konfigurirati CEPH, pogledajte [WIKI stranicu][5] na kojoj je opisana procedura u kojoj je CEPH integriran s ProxmoxVE platformom za virtualizaciju.**

&nbsp;

&nbsp;

&nbsp;

&nbsp;

Autor:

[Hrvoje Horvat][6]

&nbsp;

&nbsp;

 [1]: https://www.opensource-osijek.org/dokuwiki/wiki:knjige:uvod_u_linux "wiki:knjige:uvod_u_linux"
 [2]: https://www.opensource-osijek.org/dokuwiki/wiki:knjige:uvod_u_linux#podjela_prema_namjeni_diskova "wiki:knjige:uvod_u_linux"
 [3]: https://www.opensource-osijek.org/dokuwiki/wiki:knjige:uvod_u_linux#lvm2 "wiki:knjige:uvod_u_linux"
 [4]: https://www.opensource-osijek.org/dokuwiki/wiki:knjige:uvod_u_linux#koja_su_najcesca_raid_polja_u_upotrebi_i_koje_su_im_prednosti_i_mane "wiki:knjige:uvod_u_linux"
 [5]: https://www.opensource-osijek.org/dokuwiki/wiki:knjige:ceph-storage#ceph_storage_with_integration_in_proxmox_ve
 [6]: https://hr.linkedin.com/in/hrvoje-horvat-48477b1