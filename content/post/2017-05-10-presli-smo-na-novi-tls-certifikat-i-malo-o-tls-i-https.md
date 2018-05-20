---
title: 'Prešli smo na novi TLS certifikat … i malo o TLS  (i https)'
author: hhorvat
type: post
date: 2017-05-10T11:03:55+00:00
url: /2017/05/10/presli-smo-na-novi-tls-certifikat-i-malo-o-tls-i-https/
featured_image: /wp-content/uploads/2014/10/lock61.jpg
categories:
  - Članci
  - Linux
  - OS@OS
  - Vijesti

---
Možda niste niti svjesni činjenice kako je određene promjene uveo Google Chrome web preglednik, od inačice [58][1], a koje će vrlo vjerojatno i drugi slijediti.  Naime radi se o tome kako se novi _Chrome_ striktno drži standarda [RFC 2818][2]. Ovdje se radi o novom standardu za HTTPS komunikaciju, odnosno definiciji kako se treba, odnosno mora,  koristiti **TLS** (_Transport Layer Security_ ), koji je usput rečeno, naslijedio **SSL (**_Secure Sockets Layer_**)** protokol, kao standard za kriptiranje podataka za HTTP protokol.

Za one kojima nije jasna ova poveznica, zamislite TLS kao tunel kroz koji prolaze samo i isključivo kriptirani (zaštićeni) podaci, od i prema HTTP protokola odnosno od i prema **web** poslužitelju.

Dakle HTTPS u radu se oslanja na TLS tunel kroz koji se primaju i šalju kriptirani podaci, koji kada se dekriptiraju, postaju standardni (normalni) HTTP promet. Nekriptirani, odnosno nezaštićeni HTTP podaci se nikada ne šalju preko mreže, već se kriptiraju i šalju, pa ih dekriptira svatko za sebe, kako ih prima:

  * HTTP(S) poslužitelj sa svoje strane
  * klijent (web preglednik) sa svoje strane.

Dakle i klijent i poslužitelj zapravo komuniciraju normalnim HTTP protokolom jer se TLS komunikacija događa na jednoj razini ispod. Možemo reći to i ovako: <span style="color: #0000ff;">HTTP</span> komunikacija prolazi kroz <span style="color: #ff0000;">TLS kriptirani tunel</span>:

**<span style="color: #0000ff;">Klijent (HTTP)</span>  <== ==>** <span style="color: #ff0000;"><strong>Klijent (TLS tj. HTTPS) </strong><strong><&#8211; &#8211;></strong><strong> Mreža (Internet) <&#8211; &#8211;></strong></span>** <span style="color: #ff0000;">Poslužitelj (TLS tj. HTTPS)</span> <== ==>** <span style="color: #0000ff;"><strong> Poslužitelj (HTTP)</strong></span>

&nbsp;

**Kako se odvija komunikacija prema HTTPS protokolu, odnosno TLS dio**

  1. Klijent (web preglednik) šalje „**Client_Hello_**“ poruku, koja sadrži sve potrebno za buduću komunikaciju, a između ostalog i: 
      1. Listu algoritama za kriptiranje i razmjenu podataka i ključeva koje podržava (poznate pod nazivom **_cipher suites_** )
      2. Maksimalnu verziju **SSL** ili **TLS** protokola koje podržava

&nbsp;

<ol start="2">
  <li>
    Poslužitelj odgovara sa svojom „<strong>ServerHello</strong>“ porukom, te na osnovi svoje konfiguracije odnosno postavki, odabire:
  </li>
</ol>

a.) Algoritam za kriptiranje i razmjenu ključeva (**_cipher suites_**) – koje dozvoljava, a klijent podržava

Ova opcija se nalazi u konfiguraciji (datoteka: **ssl.conf** za **Apache** web poslužitelj), pod parametrom: **SSLCipherSuite** (u njoj se navodi sve što dozvoljavamo/ne dozvoljavamo od protokola ). Pogledajte jedan primjer:

<pre class="lang:default decode:true">SSLCipherSuite "EECDH+ECDSA+AESGCM EECDH+aRSA+AESGCM EECDH+ECDSA+SHA384 EECDH+ECDSA+SHA256 EECDH+aRSA+SHA384 EECDH+aRSA+SHA256 EECDH+aRSA+RC4 EECDH EDH+aRSA RC4 !aNULL !eNULL !LOW !3DES !MD5 !EXP !PSK !SRP !DSS !RC4"</pre>

b.) Maksimalnu verziju **SSL** odnosno u novijim verzijama **TLS** protokola, koje dozvoljava, a klijent podržava.

&nbsp;

<ol start="3">
  <li>
    U ovom koraku, poslužitelj dokazuje svoj identitet klijentu pomoću <strong>certifikata</strong>. Certifikat sadrži razne podatke, poput : <ol>
      <li>
        Imena poslužitelja i domene (pr. <strong>opensource-osijek.org</strong>)
      </li>
      <li>
        Javnog ključa za asimetrično kriptiranje/dekriptiranje
      </li>
      <li>
        Digitalnog potpisa
      </li>
      <li>
        Datuma izdavanja certifikata te datuma valjanosti certifikata (pr. vrijedi do 3.8.2017)
      </li>
      <li>
        I na kraju, institucije odnosno „autoriteta“ koji je ovaj certifikat dodijelio poslužitelju
      </li>
    </ol>
  </li>
  
  <li>
    Klijent prima certifikat te provjerava vjerodostojnost istoga. Prvo provjerom vjerodostojnosti institucije (autoriteta) koja mu je izdala certifikat. Ovdje se radi o <strong>CA</strong> (Certificate Authority), koji ima pravo izdavati ovakve certifikate – u našem slučaju je to <a href="https://letsencrypt.org">Let’s Encrypt</a>, a koji je, kao i svi drugi <strong>CA</strong>, ove razine, provjeren od strane vršnih <ol>
      <li>
        Prvo klijent (web preglednik) provjerava, da li mu se u njegovoj listi <strong>CA</strong> (a koja dolazi s instalacijom svakog web preglednika), nalazi i <strong>CA</strong>, od kojeg je došao i certifikat poslužitelja na koji se spajamo.
      </li>
      <li>
        Ako ovaj <strong>CA</strong>, nije u listi web preglednika, provjeravaju se <strong>CA</strong>-ovi koji su u toj listi te se kod njih provjerava, da li smo od nekoga od njih dobili naš certifikat. Ova lista se zapravo sastoji od dvije liste : <ol>
          <li>
            <strong>root CA</strong> (odnosno vršne certifikacijske „institucije“)
          </li>
          <li>
            <strong>intemediate CA </strong>(odnosno svi oni niže razine, koji su naravno certificirani kod nekog od <strong>root CA</strong>).
          </li>
        </ol>
      </li>
    </ol>
  </li>
</ol>

**Svako malo, vršni CA, provjeravaju certifikate CA-ova niže razine (kojima su dodjeli certifikate).**

&nbsp;

**Zadnji korak je razmjena ključeva**,

Prije kriptiranja kanala, prvo se moraju razmijeniti ključevi za kriptiranje, na siguran način, kako netko tko potencijalno _prisluškuje_ komunikaciju ne bi mogao &#8220;upasti&#8221; u komunikaciju koja bi trebala biti zaštićena . Razmjena ključeva može se odraditi na dva načina &#8211; metode  **1**  ili **2 (**dolje**)**. Dakle pošto se klijent odlučio za algoritam i druge parametre, on ovisno o odabranom algoritmu za kriptiranje, odabire metodu razmjene ključeva:

  1. **Key encipherment** metoda: 
      1. Klijent kreira simetrični ključ
      2. Kriptira simetrični ključ sa poslužiteljevim javnim ključem. Samo ga poslužitelj može dekriptirati jer jedino on ima privatni ključ s kojim ga može dekriptirati (ovo sada  je asimetrična metoda)
  2. **Key agreement** (sigurnija metoda)- koristi se **Diffie-Hellman** (DH) metoda, a koja se koristi  i kod drugih protokola – pr. SSH , ili raznih vrsta VPN konekcija. DH je opisan u [RFC2631][3]. U imenu **cipher suitea**, DH je označen i kao **EDH (**_Ephemeral Diffie-Hellman_**)** ili **DHE** te** EECDH** _(Ephemeral Elliptic Curve Diffie-Hellman)_ . Pogledajmo i kako to radi: 
      1. Klijent i poslužitelj razmjenjuju vrlo velike [prim][4] brojeve (Tzv. **p** i **g**) te rade određene računske operacije s njima te potvrđuju rezultat kao provjeru autentičnosti.
      2. Klijent šalje svoj javni DH ključ na poslužitelj
      3. Poslužitelj izračunava tajni „session“ ključ na osnovu svog privatnog ključa i koristi klijentov javni ključ za kriptiranje – te ga šalje klijentu
      4. Poslužitelj šalje svoj javni DH ključ klijentu
      5. Klijent izračunava tajni „session“ ključ na osnovu svog privatnog ključa i koristi poslužiteljev javni ključ za kriptiranje – te ga šalje poslužitelju
      6. Sada obije strane imaju ključeve pomoću kojeih se kriptira kanal za komunikaciju.

Za detalje oko procesa komunikacije, kod uspostavljanja kriptirane (HTTPS) veze, pogledajte :

[https://en.wikipedia.org/wiki/Transport\_Layer\_Security#Client-authenticated\_TLS\_handshake][5]

&nbsp;

&nbsp;

&nbsp;

**Vratimo se na RFC2818**

Prema ovom standardu, ime računala (_Hostname_) definirano u certifikatu **mora** biti zapisano korištenjem **SAN** (_Subject Alternative Name_) unosa, a ne kako je prije bilo slučaj, korištenjem **CN** (_Common Name_) unosa.

Za one koje zanima više detalja o SAN unosu, pogledajte [RFC 3280][6], poglavlje : 4.2.1.7

&nbsp;

S obzirom da je naš **CA** (_Certificate Authority_) – odnosno tvrtka od koje smo dobili **TLS/SSL** certifikat koristio **CN**, a ne **SAN** unos za naš certifikat odlučili smo se za određene promjene.

&nbsp;

Nakon malo istraživanja, odlučili smo se za drugi **CA** (Certificate Authority) &#8211; [Let’s Encrypt][7]. _Let’s Encrypt_ je slobodan, automatiziran i otvoren **CA** (_Certificate Authority_) koji je pokrenut za javno dobro, od strane **ISRG**  ([Internet Security Research Group][8]).

Već nakon nekog vremena ovu organizaciju su počele sponzorirati, kako neprofitne tako i profitne male ali i velike tvrtke.

Ako pogledate listu glavnih sponzora, postati će vam jasan naš odabir:

<img class="alignnone size-full wp-image-2567" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/05/LetsEncrypt-major-sponsors.png?resize=435%2C617&#038;ssl=1" alt="" width="435" height="617" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/05/LetsEncrypt-major-sponsors.png?w=435&ssl=1 435w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/05/LetsEncrypt-major-sponsors.png?resize=106%2C150&ssl=1 106w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2017/05/LetsEncrypt-major-sponsors.png?resize=212%2C300&ssl=1 212w" sizes="(max-width: 435px) 100vw, 435px" data-recalc-dims="1" />

Dodatno, ono što je vrlo važno je i kompatibilnost ovih certifikata sa svim važnijim web preglednicima:

  * **Mozilla Firefo**x >= v2.0
  * **Google Chrome**
  * **Internet Explorer on Windows XP SP3 and higher**
  * **Microsoft Edge**
  * **Android OS** >= v2.3.6
  * **Safari** >= v4.0 on macOS
  * **Safari on iOS** >= v3.1
  * **Debian Linux** >= v6
  * **Ubuntu Linux** >= v12.04
  * **NSS Library** >= v3.11.9
  * **Amazon FireOS** (Silk Browser)
  * **Cyanogen** > v10
  * **Jolla Sailfish OS** > v1.1.2.16
  * **Kindle** > v3.4.1
  * **Java 7** >= 7u111
  * **Java 8** >= 8u101
  * **Blackberry** >= 10.3.3

&nbsp;

A i činjenica kako ga sada koriste i mnogi veći igrači.

&nbsp;

Važno je znati kako je valjanost ovih certifikata 90 dana. Naravno nakon tog vremena potrebno ih je osvježiti. **Let’s Encrypt**, koristi  [ACME][9] protokol i pripadajuće **ACME** klijente, kako za kreiranje certifikata, tako i za njihovo osvježavanje.

ACME klijenata ima cijeli niz – pogledajte [link][10].

Mi smo se odlučili za [acme.sh][11] – klijent u potpunosti napisan samo korištenjem **shella** (pr. **bash**)**,**  bez potrebe za bilo kojim dodatnim bibliotekama ili drugim alatima ili programskim jezicima. Odluka je pala ne njega zbog jednostavnosti i činjenice kako ga koriste mnoge tvrtke u čiji odabir imamo puno povjerenje. Pogledajte listu korisnika **acme.sh** -> [LINK][12].

**acme.sh** ažurira certfikat jednostavnim dodavanje u **cron**, za svaki dan. Dakle svaki dan se provjerava je li certifikat istekao, i ako je, povlači se novi, te se restarta web poslužitelj (za cca 89 dana ćemo vidjeti da li to radi automatski J ). Ovo bi trebala biti **KISS** metoda koja provjereno radi .

Što se instalacije i konfiguracije tiče, sve je teklo glatko, prema uputama :

<https://github.com/Neilpang/acme.sh>

&nbsp;

**Osnovna konfiguracija web poslužitelja**

Osim standardnih dijelova za konfiguraciju SSL/TLS dijela, dio koji se odnosi na certifikate je slijedeći – govorimo o **Apache** web poslužitelju.

Napomena: **SSLCertificateChainFile** se više ne koristi već se koristi:  **SSLCertificateFile**.

&nbsp;

Dakle ovako:

<pre class="lang:default decode:true ">SSLCertificateFile /etc/httpd/ssl/fullchain.cer</pre>

&nbsp;

Ovo je **chain** certifikat (**fullchain.cer**) koji ste dobili od **Let’s Encrypta.** Ovaj certifikat kako mu i naziv kaže (**_chain_**=lanac) certifikat je koji sadrži niz certifikata, počevši od **root CA &#8211;** onoga koji je opće „dozvolio“ rad našem &#8211; nižem odnosno **intermediate** **CA** (od kojega smo mi dobili certifikat**),** preko tog **intermediate** **CA (**ovdje je to Let’s Encrypt **)** i sve do našeg certifikata (za našu stranicu za koju smo ga i tražili).

Slijedeća stavka je **SSLCACertificateFile**,  koristi se u slučajevima ako tražimo autentikaciju klijenata (mi ćemo i to uključiti),

Konfiguracija izgleda ovako:

<pre class="lang:default decode:true ">SSLCACertificateFile /etc/httpd/ssl/ca.cer</pre>

&nbsp;

Dakle korisitmo (ca.cer) dobiven od **Let’s Encrypta.**

I na kraju, naš privatni RSA ključ (**_private key_**), koji smo dobili od **Let’s Encrypta.** Dakle ovo je par od našeg javnog ključa (**_public key_**) – iz našeg certifikata. U našem slučaju je to datoteka : opensource-osijek.org.key

Prema tome, konfiguracija izgleda ovako:

<pre class="lang:default decode:true ">SSLCertificateKeyFile /etc/httpd/ssl/opensource-osijek.org.key</pre>

&nbsp;

&nbsp;

Za one kojima još nije najbolje sjelo: simetrično i asimetrično kriptiranje

  * **Simetrično kriptiranje** 
      * S jednim (istim) ključem se radi i (en)kriptiranje i dekriptiranje. Dakle s istim ključem zaključavate sef s podacima ali i bilo tko s istim takvim ključem može otključati sef. Simetrija u nazivu je stoga što je jedan ključ i za zaključavanje (kriptiranje) i otključavanje (dekriptiranje)
  * **Asimetrično kriptiranje** 
      * Uvijek se generira (kreira) par ključeva, jedan privatni i jedan javni. Javni ključ se daje svima jer je to ključ s kojim se samo i isključivo mogu (en)kriptirati podaci. Dok se (en)kriptirani podaci samo i isključivo mogu dekriptirati s privatnim ključem. Dakle javni ključ se koristi za (en)kriptiranje a privatni za dekriptiranje podataka. Ovo znači i to, kako je za dvosmjernu komunikaciju, potrebno da svaka strana kreira sve svoje ključeve. 
          * Strana A : svoj privatni ključ čuva a javni daje strani B (i bilo kome drugom)
          * Strana B : svoj privatni ključ čuva a javni daje strani A (i bilo kome drugom) 
              * Prema tome kada strana A šalje podatke na stranu B, ona ih (en)kriptira s javnim ključem od strane B, koja ih potom dekriptira sa svojim privatnim ključem (B). Kada strana B šalje podatke na stranu A, ona ih (en)kriptira s javnim ključem od strane A, koja ih potom dekriptira sa svojim privatnim ključem (A).
      * Zbog toga i asimetrija u nazivu jer ne postoji jedan ključ za sve namjene, već su i ključevi i sam način rada asimetrični.

&nbsp;

&nbsp;

<span style="color: #999999;">Autor: <a style="color: #999999;" href="https://www.linkedin.com/in/hrvoje-horvat-48477b1/">Hrvoje Horvat</a></span>

 [1]: https://bugs.chromium.org/p/chromium/issues/detail?id=308330
 [2]: https://tools.ietf.org/html/rfc2818
 [3]: https://tools.ietf.org/html/rfc2631
 [4]: https://hr.wikipedia.org/wiki/Prosti_broj
 [5]: https://en.wikipedia.org/wiki/Transport_Layer_Security#Client-authenticated_TLS_handshake
 [6]: https://www.ietf.org/rfc/rfc3280.txt
 [7]: https://letsencrypt.org/
 [8]: https://letsencrypt.org/isrg/
 [9]: https://ietf-wg-acme.github.io/acme/
 [10]: https://letsencrypt.org/docs/client-options/
 [11]: https://github.com/Neilpang/acme.sh
 [12]: https://github.com/Neilpang/acme.sh/wiki/Blogs-and-tutorials