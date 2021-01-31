---
title: Upotreba Proxy poslužitelja sa autokonfiguracijom klijenata
authors: hhorvat
type: post
date: 2014-05-17T17:56:54+00:00
url: /2014/05/17/upotreba-proxy-posluzitelja-sa-autokonfiguracijom-klijenata/
featured_image: /wp-content/uploads/2014/05/Squid-proxy-logo.jpg
categories:
  - Knjige
tags:
  - Autoconfig
  - Proxy

---
**Upotreba Proxy poslužitelja sa autokonfiguracijom klijenata (web preglednika)**

&nbsp;

[toc]

&nbsp;

&nbsp;

&nbsp;

# Uvod

Objasniti ćemo kako koristiti proxy poslužitelj u svim web preglednicima ali bez potrebe ručnog konfiguriranja svakog web preglednika. Naime konfigurirati korištenje proxy poslužitelja u web preglenicima, možemo na tri načina:

A.    Ručnim unošenjem IP adrese ili imena proxy poslužitelja te porta na kojem se nalazi, uz mogućnosti ručnog definiranja iznimki za koje se ne treba koristiti poslužitelj [pr. lokalne mreže i poslužitelji i sl.].

B.    Ručnim unošenjem proxy poslužitelja i automatske konfiguracijske skripte (koja također može sadržavati iznimke kao i u točki A.)

C.   Uključivanjem automatske detekcije proxy poslužitelja (i njegove konfiguracijske skripte , kao u točki B).

&nbsp;

# Što je Proxy poslužitelj

Mi ćemo se bazirati na metodi iz točke C.

Ali prvo, podsjetimo se što je Proxy poslužitelj.

Proxy poslužitelj je posrednik između (vašeg) web preglednika i Interneta. U mrežama koje ne koriste proxy poslužitelj, vaš web preglednik se direktno spaja na određenu web stranicu a isto tako i web preglednik svakog drugog računala u mreži. Često se događa da određeni dio ljudi posjećuje iste web stranice, s kojih se kod svakog spajanja, svaki puta (za svaki web preglednik odnosno korisnika) “skidaju” isti podaci s interneta.

Proxy poslužitelj je centralno mjesto na mreži na koje se svi web preglednici prvo spajaju, a on se u pozadini spaja na internet i pri tome svaku posjećenu stranicu, tj. svaki njen element (a kojih svaka stranica ima i na stotine [svaka sličica,logo, animacija, &#8230;] ) pri tome drži u svojoj RAM memoriji i/ili na tvrdom disku. Ovime je opisan osnovni princip rada proxy poslužitelja.

&nbsp;

&nbsp;

Osim toga proxy poslužitelji imaju i na desetke drugih funkcionalnosti poput:

  * Preciznog definiranja veličine objekata (s web stranica), koji će se držati u RAM memoriji
  * Definiranja ukupne veličine RAM memorije za cache svih objekata
  * Definiranja veličine objekata koji će se snimati na Tvrdi disk (pojedinačno , i ukupne veličine)
  * Definiranja DNS poslužitelja koje će proxy poslužiteljkontaktirati te definiranje veličine interne memorije za cache-iranje DNS podataka (ili ne)
  * Ograničenje prava pristupa na internet, prema IP adresi klijenta ili prema korisničkom računu klijenta, koji se može nalaziti u Active Directory-ju,  LDAP-u i sl.
  * Ograničenje prava pristupa samo na određene web stranice,
  * Ograničenje prava pristupa na sve osim na  određene web stranice (pr. Youtube, Facebook i sl.),
  * Ograničenje brzine pristupa prema raznim parametrima,
  * Ograničenje pristupa prema raznim drugim parametrima i protokolima (pr. Zabranjen je  FTP promet prema/od interneta u radno vrijeme od 08:00 do 16:00.h. )
  * Ograničenja/odobrenja pristupa za razne Chat protokole (Skype , Yahoo , MSN , ICQ , &#8230;)
  * &#8230;

Proxy poslužitelji obično rade sa: HTTP, HTTPS i FTP protokolima.

Napomena : Osnovna konfiguracija mrežne opreme u mrežama koje koriste proxy poslužitelje podrazumjeva zabranu izlaska na internet za sve osim za proxy poslužitelj !.

&nbsp;

&nbsp;

&nbsp;

&nbsp;

# Podaci o našoj testnoj konfiguraciji:

Web/DHCP/DNS/proxy poslužitelj ima IP  adresu : **192.168.100.254**

Hostname poslužitelja je:  **server1**

Proxy poslužitelj je na portu: **8888**

&nbsp;

Logička shema naše (zamišljene) mreže  :


[Slika](https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/Proxy-basic-net.png)

&nbsp;

Da ne bi bili isključivi prema close source programima i sustavima, pokazati ćemo kako je simbioza između close source i open source programa i sustava jednostavna.

Odluka je pala na Windows Server 2003 R2 te njegove DHCP i DNS poslužitelje (close source strana) te na Apache Web Server i Squid Proxy  Server (open source strana).Jednostavno zato  jer su mi bili dostupni u trenutku pisanja i zadovoljavaju sve što je potrebno da bi napravili funkcionalan proxy poslužitelj koji koristi autokonfiguraciju na strani klijenata odnosno web preglednika.

&nbsp;

Koristili smo squid proxy server ( <http://www.squid-cache.org/>  ) kompajliran za Windows OS.

Instalacija i konfiguracija neće biti objašnjena (ovo je posebna priča [i potencijalno članak]) ali dovoljno je definirati disk i direktorij gdje će se smještati objekti , IP adresa poslužitelja i ACL.koji je za potrebe testa definiran da propušta sve.tj. dopušta svima korištenje proxy poslužitelja, bez obzira na IP/Hostname ili korisnički račun u Active Directory-ju ili nekoj LDAP bazi ili sl.

&nbsp;

Istovremeno smo instalirali  i konfigurirali Apache Web poslužitelj (najosnovnija instalacija i konfiguracija). Naime osnovna namjena Apache Web poslužitelja je samo smještanje automatske konfiguracijske skripte.

Nakon što smo instalirali i konfigurirali proxy poslužitelj, potrebno je svaki web preglednik ručno konfigurirati da ga i koristi. Dakle krećemo od klijentske strane.

Kao što smo spomenuli na početku ovdje su vidljive opcije A, B i C (za konfiguraciju proxy poslužitelja u web pregledniku):

&nbsp;

**Opcija A** : Ručno konfiguriranje proxy servera.

<a href="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/Proxy-opcija1.jpg?ssl=1" data-rel="lightbox-1" title=""><img class="alignnone size-medium wp-image-1436" src="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/Proxy-opcija1.jpg?resize=300%2C262&#038;ssl=1" alt="Proxy-opcija1" width="300" height="262" srcset="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/Proxy-opcija1.jpg?resize=300%2C262&ssl=1 300w, https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/Proxy-opcija1.jpg?w=343&ssl=1 343w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" /></a>

&nbsp;

**Opcija B :**Osim “ručnog rada”, moguće je konfigurirati web preglednike da to odrađuju pomoću konfiguracijske skripte.

<a href="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/Proxy-opcija2.jpg?ssl=1" data-rel="lightbox-2" title=""><img class="alignnone size-medium wp-image-1437" src="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/Proxy-opcija2.jpg?resize=300%2C259&#038;ssl=1" alt="Proxy-opcija2" width="300" height="259" srcset="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/Proxy-opcija2.jpg?resize=300%2C259&ssl=1 300w, https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/Proxy-opcija2.jpg?w=344&ssl=1 344w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" /></a>

**Opcija C:** Automatskim prepoznavanje proxy poslužitelja na mreži, uz korištenje iste konfiguracijske skripte:

<img class="alignnone" src="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/Proxy-opcija3.jpg?resize=338%2C292&#038;ssl=1" alt="" width="338" height="292" data-recalc-dims="1" />

==> Mi ćemo koristiti upravo ovu metodu.

&nbsp;

&nbsp;

# Kako to sve zajedno radi u teoriji ?.

U praksi se najčešće koriste dvije metode za &#8220;autodiscovery&#8221; proxy poslužitelja.

Prva se oslanja na posebnu opciju u DHCP poslužitelju, koju mora podržavati DHCP klijent (a i web preglednik).

Druga se oslanja na DNS poslužitelj.

&nbsp;

Objasnimo prvu metodu :

Dakle mrežne kartica mora biti konfigurirana da IP parametre mreže dobiva od DHCP poslužitelja.

Primjer je konfiguracija mrežne kartice (IPv4 : TCP/IP) u Windows 7 :

<a href="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/Win7-TCP-IPconfig.jpg?ssl=1" data-rel="lightbox-3" title=""><img class="alignnone size-medium wp-image-1439" src="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/Win7-TCP-IPconfig.jpg?resize=270%2C300&#038;ssl=1" alt="Win7-TCP-IPconfig" width="270" height="300" srcset="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/Win7-TCP-IPconfig.jpg?resize=270%2C300&ssl=1 270w, https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/Win7-TCP-IPconfig.jpg?w=408&ssl=1 408w" sizes="(max-width: 270px) 100vw, 270px" data-recalc-dims="1" /></a>

Dakle procedura je standardna za DHCP protokol, s time da kao što smo rekli i DHCP klijent (u ovom slučaju ovo Windows 7 računalo) mora podržavati opciju 252 (što uglavnom nije slučaj za večinu Windows i Linux Operativnih sustava, “by default”).

Pokušajmo to ipak napraviti na strani DHCP poslužitelja, za one Operativne sustave koji to standardno podržavaju bez ikakvih modifikacija sustava:

Pokrenimo DHCP poslužitelj , označimo naš poslužitelj (**server1**),  desni klik , **Set Predefined Options**  Sada trebamo dodati novu DHCP opciju : odaberimo: **Add**

<a href="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/DHCP-252-1.jpg?ssl=1" data-rel="lightbox-4" title=""><img class="alignnone size-medium wp-image-1440" src="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/DHCP-252-1.jpg?resize=300%2C296&#038;ssl=1" alt="DHCP-252-1" width="300" height="296" srcset="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/DHCP-252-1.jpg?resize=300%2C296&ssl=1 300w, https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/DHCP-252-1.jpg?w=379&ssl=1 379w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" /></a>

… i otvara nam se slijedeći prozor:

<a href="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/DHCP-252-2.jpg?ssl=1" data-rel="lightbox-5" title=""><img class="alignnone size-medium wp-image-1441" src="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/DHCP-252-2.jpg?resize=300%2C173&#038;ssl=1" alt="DHCP-252-2" width="300" height="173" srcset="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/DHCP-252-2.jpg?resize=300%2C173&ssl=1 300w, https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/DHCP-252-2.jpg?w=369&ssl=1 369w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" /></a>

Sada ćemo dodati DHCP opciju **252**

Name : **WPAD**

Data type: **String**

Code: **252**

Description (Opis) : **Proxy Serve Automatic Configuration**

Potvridmo sa **OK**

&nbsp;

&nbsp;

Sada trebamo odabrati naš željeni opseg DHCP poslužitelja (Scope):

Desni klik na **Scope options** :odabrati:  **Configure Options**

Sada idemo do kraja , do naše nove opcije **252**:

<img class="alignnone size-medium wp-image-1442" src="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/DHCP-252-3.jpg?resize=270%2C300&#038;ssl=1" alt="DHCP-252-3" width="270" height="300" srcset="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/DHCP-252-3.jpg?resize=270%2C300&ssl=1 270w, https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/DHCP-252-3.jpg?w=408&ssl=1 408w" sizes="(max-width: 270px) 100vw, 270px" data-recalc-dims="1" />

Uključimo ju i pod String value, moramo upisati URL do naše wpad.dat datoteke (koja treba biti u root direktoriju web poslužitelja) &#8211; za sada ćemo koristiti samo IP adresu.

&nbsp;

I to je to što se tiće DHCP poslužitelja.

Sada ćemo pokrenuti [Wireshark][1], da vidimo da li naši Windows-i 7 standardno koriste DHCP opciju 252.

&nbsp;

Podsjetimo se i kako teče “razgovor” prema DHCP standardu (tkzv. **DORA** ):

Client ⇒ Server  : DHCP **D**iscover

Server ⇒ Client  : DHCP **O**ffer

Client ⇒ Server  : DHCP **R**equest

Server ⇒ Client  : DHCP **A**cknowledge

&nbsp;

… i ako se zatvara konekcija

Client ⇒ Server  : DHCP Release

&nbsp;

Wireshark nam kaže da smo od našeg DHCP poslužitelja dobili slijedeće (filtrirane su samo DHCP poruke i to dio poruke koji nam je zanimljiv tj. bitan za razumjevanje):

<a href="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/DHCP-wire-1.jpg?ssl=1" data-rel="lightbox-6" title=""><img class="alignnone size-medium wp-image-1443" src="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/DHCP-wire-1.jpg?resize=300%2C213&#038;ssl=1" alt="DHCP-wire--1" width="600" height="413" srcset="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/DHCP-wire-1.jpg?resize=300%2C213&ssl=1 300w, https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/DHCP-wire-1.jpg?w=502&ssl=1 502w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" /></a> (Slika : Windows DHCP klijent)

&nbsp;

Prema tome, kao što sam i rekao, ništa od AutoDiscovery protokola za Proxy u ovom slučaju, ili u slučaju sa Standardnog Linux-a :

<a href="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/DHCP-wire-2.jpg?ssl=1" data-rel="lightbox-7" title=""><img class="alignnone size-medium wp-image-1444" src="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/DHCP-wire-2.jpg?resize=300%2C202&#038;ssl=1" alt="DHCP-wire--2" width="600" height="402" srcset="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/DHCP-wire-2.jpg?resize=300%2C202&ssl=1 300w, https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/DHCP-wire-2.jpg?w=506&ssl=1 506w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" /></a><span style="color: #000000;">(Slika: Linux : DHCP klijent)</span>

&#8230; Uočite razliku (Windows i Linux DHCP klijenti).

&nbsp;

A sada pogledajmo što je zahtjevao (DHCP Request, opcija 55) Linux DHCP klijent:

<a href="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/DHCP-wire-REQ-2-Win.jpg?ssl=1" data-rel="lightbox-8" title=""><img class="alignnone size-medium wp-image-1446" src="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/DHCP-wire-REQ-2-Win.jpg?resize=300%2C158&#038;ssl=1" alt="DHCP-wire-REQ--2-Win" width="600" height="320" srcset="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/DHCP-wire-REQ-2-Win.jpg?resize=300%2C158&ssl=1 300w, https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/DHCP-wire-REQ-2-Win.jpg?w=620&ssl=1 620w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" /></a>

&nbsp;

I istovremeno što je zahtjevao Windows 7 DHCP klijent:

<a href="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/DHCP-wire-REQ-2-Win.jpg?ssl=1" data-rel="lightbox-8" title=""><img class="alignnone size-medium wp-image-1446" src="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/DHCP-wire-REQ-2-Win.jpg?resize=300%2C158&#038;ssl=1" alt="DHCP-wire-REQ--2-Win" width="600" height="320" srcset="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/DHCP-wire-REQ-2-Win.jpg?resize=300%2C158&ssl=1 300w, https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/DHCP-wire-REQ-2-Win.jpg?w=620&ssl=1 620w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" /></a>

&nbsp;

Dakle u nekoliko opcija se razlikuju (Windows u odnosu na Linux DHCP klijent) ali niti jedan niti drugi nisu spominjali opciju 252 koja nas je zanimala (ovo je moguće konfigurirati ali ovo je također neka druga tema [članak]).

&nbsp;

# Riješenje

A sada riješenje problema koje radi i na Linux i Windows OS-u , bez rekonfiguriranja samog OS-a.

Dakle ovo je ona druga metoda, preko DNS poslužitelja.

Procedura je slijedeća:

Mrežnu karticu također konfiguriramo da koristi DHCP poslužitelj kao i prva metoda.

Nadalje treba nam Web preglednik koji je konfiguriran da koristi automatsku konfiguraciju proxy poslužitelja (naša opcija **C**):

<a href="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/Proxy-opcija3.jpg?ssl=1" data-rel="lightbox-10" title=""><img class="alignnone size-medium wp-image-1448" src="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/Proxy-opcija3.jpg?resize=300%2C259&#038;ssl=1" alt="Proxy-opcija3" width="600" height="500" srcset="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/Proxy-opcija3.jpg?resize=300%2C259&ssl=1 300w, https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/Proxy-opcija3.jpg?w=338&ssl=1 338w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" /></a>

Na osnovu IP parametara koje je dobio od DHCP poslužitelja , slaže zahtjeve prema  DNS poslužitelju na slijedeći način:

&nbsp;

  1. Provjerava se DHCP opcija 15 ( **Domain Name**) 
      1. Ako ima više domena za svaku se pravi FQDN (hostname.domena):

**                                      i.       ** **wpad.imedomene1**

**                                    ii.       ** **wpad.imedomene2**

**                                   iii.       ** **wpad.imedomene3**

**                                   iv.       ** **wpad.imedomene4**

&#8230;pr. ime domene je :  firma.os.hr    ⇒ tada će se tražiti **wpad.firma.os.hr**

<ol start="2">
  <li>
    Od DNS poslužitelja se traži IP adresa, redom (iz točke 1.a. : i , ii , iii , iv, &#8230; koliko ima domena) <ol>
      <li>
        DNS serveru daj mi IP adresu od : wpad.firma.os.hr
      </li>
      <li>
        Ako nema odgovora za prvu domenu, traži se po drugoj domeni (ii) , trećoj (iii), četvrtoj (iv) i tako koliko ih god ima
      </li>
    </ol>
  </li>
  
  <li>
     Pošto je ovo jednostavna mreža i primjer te imamo samo jednu domenu (<strong>firma.os.hr</strong>), DHCP zahtjev je bio poslan za : <strong>wpad.firma.os.hr</strong> i DNS bi nam odgovara da je IP adresa : 192.168.100.254
  </li>
  <li>
    Radi se HTTP GET na <a href="http://wpad.firma.os.hr/wpad.dat">http://wpad.firma.os.hr/wpad.dat</a> te se dohvaća automatska konfiguracijska skripta.
  </li>
  <li>
    Automatska konfiguracijska skripta se učitava te se web pregledik konfigurira prema njoj (o tome malo kasnije)
  </li>
</ol>

&nbsp;

# Konfiguracija DNS poslužitelja

Slijedi konfiguracija DNS poslužitelja koji već mora biti konfiguriran sa gore navedenom domenom , tako da ćemo dodati samo **A record** (za Host)  [DNS je također jedna druga tema/članak] , osim A recorda , mogli smo doati i **Alias record** (**CNAME**) , koji bi pokazivao na već postojeći A record : **server1.firma.os.hr**

&nbsp;

&nbsp;

Pokrenimo (konfiguraciju) DNS poslužitelja.

Dakle pošto smo se odlučili za A record , dodajemo **wpad** pod Name i IP adresu:  **192.168.100.254**

&nbsp;

Dodajmo DNS **A** record : U “**Forward Lookup zones**”

<a href="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/DNS-ForwardLookup-A-record.jpg?ssl=1" data-rel="lightbox-11" title=""><img class="alignnone size-medium wp-image-1449" src="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/DNS-ForwardLookup-A-record.jpg?resize=300%2C275&#038;ssl=1" alt="DNS-ForwardLookup-A-record" width="600" height="520" srcset="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/DNS-ForwardLookup-A-record.jpg?resize=300%2C275&ssl=1 300w, https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/DNS-ForwardLookup-A-record.jpg?w=348&ssl=1 348w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" /></a>

&#8230;i Add host.

&nbsp;

Nakon ovoga bi DNS resolving **wpad.firma.os.hr**  trebao vratiti IP 192.168.100.254

Provjerimo u Command Prompt-u (**cmd**):

&nbsp;

**C:\>nslookup wpad.firma.os.hr**

**Server:  server1.firma.os.hr**

**Address:  192.168.100.254**

&nbsp;

<span style="color: #ff0000;"><strong>DNS request timed out.</strong></span>

<span style="color: #ff0000;"><strong>    timeout was 2 seconds.</strong></span>

<span style="color: #ff0000;"><strong>*** Request to wpad.firma.os.hr timed-out</strong></span>

&nbsp;

&nbsp;

<span style="text-decoration: underline;"><span style="color: #ff00ff;"><strong>DNS resolving ne radi !!.</strong></span></span>

&nbsp;

&nbsp;

# U čemu je problem ?

Imamo sigurnosni problem !.

Pošto je u mnogim mrežama sigurnost zapostavljena, te je moguća automatska registracija FQDN-a računala, te je moguće da netko lažira svoj hostname u **wpad.imedomene** , MS (a i mnogi drugi DNS poslužitelji) je u DNS ugradio zaštitu te ne dozvoljava resolving takvog imena tj wpad hostname-a. te se on nalazi u listi hostaname-ova koja je blokirana.

&nbsp;

Poruka koju ćemo dobiti (na DNS poslužitelju) je :

<a href="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/DNS-Security-Error.jpg?ssl=1" data-rel="lightbox-12" title=""><img class="alignnone size-medium wp-image-1450" src="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/DNS-Security-Error-270x300.jpg?resize=270%2C300&#038;ssl=1" alt="DNS-Security-Error" width="490" height="600" srcset="https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/DNS-Security-Error.jpg?resize=270%2C300&ssl=1 270w, https://raw.githubusercontent.com/opensourceosijek/website/master/content/wp-content/uploads/2014/05/DNS-Security-Error.jpg?w=405&ssl=1 405w" sizes="(max-width: 270px) 100vw, 270px" data-recalc-dims="1" /></a>

Da bismo to riješti isključiti ćemo tu listu a sigurnosni problem riješiti na način da se samo računala dodana u domenu mogu registrirati u DNS (i to samo da Admin Domene ima ta prava).

&nbsp;

Kako to riješti :

  1. Moramo instalirati Support Tools sa instalacijskog CD-a od Windows Server 2003 R2 :

Putanja CDa-  , &#8230;\SUPPORT\TOOLS\

Pokrenuti (instalirati) :SUPTOOLS.MSI

&nbsp;

&nbsp;

Pokrenimo Command Prompt (**cmd**) :

&nbsp;

Sada maknimo blok listu:

**C:\>dnscmd /config /enableglobalqueryblocklist 0**

_Registry property enableglobalqueryblocklist successfully reset._

Command completed successfully.

&nbsp;

I probajmo da li  DNS resolving radi

&nbsp;

&nbsp;

**C:\>nslookup wpad.firma.os.hr**

**Server:  server1.firma.os.hr**

**Address:  192.168.100.254**

&nbsp;

**Name:    wpad.firma.os.hr**

**Addresses:  192.168.100.254**

&nbsp;

&nbsp;

Nakon ovoga moramo kreirati autokonfiguracijsku datoteku na Web poslužitelju koji smo naveli (wpad.firma.os.hr).

Datoteka se mora zvati **wpad.dat** , i sadržavati minimalno lsijedeće redove:

&nbsp;

**function FindProxyForURL(url,host)**

** **

** {**

** return &#8220;PROXY 192.168.100.254:8888&#8221;;**

** }**

&nbsp;

&nbsp;

Dakle ovo je osnovna konfiguracija datoteke wpad.dat, koja mora sadržavati Prox Server i njegov port. Osim toga ovdje je moguće definirati raznorazna pravila i izuzetke.

Pr. da se za neke mreže ili poslužitelje ne koristi proxy , za druge da , za treće neki drugi proxy itd.

&nbsp;

Napomena : Datoteka se mora nalaziti u root direktoriju web poslužitelja.

&nbsp;

Sada je sve spremno za rad 🙂 .

 [1]: http://www.wireshark.org/