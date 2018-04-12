---
title: Raspberry Pi kao Media Centar
author: Hrvoje Horvat
type: post
date: 2014-05-22T07:46:35+00:00
url: /2014/05/22/raspberry-pi-kao-media-centar/
featured_image: /wp-content/uploads/2014/05/800px-RaspberryPi1.jpg
categories:
  - Članci
  - Hardware
  - Projekti i ideje
tags:
  - Članci

---
**Raspberry Pi kao Media Centar**

&nbsp;

Budući da već duže vrijeme TV ne nudi nikakav sadržaj, a kablovska televizija mi je i dalje preskupo rješenje (premda i tamo nije puno bolja situacija) odlučio sam se baciti u potragu za Media Centrom koji će uspjesno ispuniti sljedeće zahtjeve:

&nbsp;

  * Bežični pristup sadržaju (mp3, filmovi itd.) na udaljenom desktop računalu/serveru
  * Pristup sadržaju na internetu (YouTube, mail, live stream sportskih događaja, stream radio kanala, online gledanje filmova i serija itd.)
  * Full HD support (bilo sa nekog lokalnog diska, bilo bežično sa PC-a na lokalnoj mreži)

&nbsp;

Trenutno se ti zahtjevi mogu ostvariti na razno razne načine, a samo neki od njih su:

&nbsp;

  * Smart TV
  * Smart TV Box kartice
  * Desktop/Laptop spojen na TV (preko HDMI-a)
  * Mini PC (Mini ITX kućište/matična) spojen na TV (HDMI)
  * Android Media Player/Centar
  * Itd&#8230;

&nbsp;

&nbsp;

Međutim, nakon analiziranja gore navedenih rješenja došao sam do zaključka da su preskupa ili pre glomazna te da je trenutno najoptimalnije rješenje (za moje potrebe):

&nbsp;

  * **Raspberry Pi** (hardware) u kombinaciji s **OpenELEC**-om (software).

&nbsp;

_Ovim putem se zahvaljujem kolegama, koji su već posjeduju Raspberry-Pi, te koji su sa svojim pohvalama prema njemu bili na neki način prevaga pri mojoj odluci o kupnji istog_.

&nbsp;

Ukratko, OpenELEC je Linux distribucija koja, instalirana na Raspberry Pi, zajedno sa njim tvori odličan **XBMC** media centar.

&nbsp;

**Raspberry Pi** kao Media Centar je naravno samo jedna od mogučnosti koji on pruža a više o njemu možete pronači na:

<http://www.raspberrypi.org/>

&nbsp;

o **OpenELEC**-u:

<http://openelec.tv/>

&nbsp;

te o **XBMC**-u:

<http://xbmc.org/>

U nastavku: R-Pi ==> Raspberry-Pi

&nbsp;

Razlozi iz kojih sam se odlučio na R-Pi/XBMC:

&nbsp;

  * Omjer cijene i kvalitete
  * Veličina (otprilike kao kutija cigara)
  * Stabilnost
  * Nema ventilator (uopće ga se ne čuje)
  * XBMC na R-Pi radi odlično, podržava Full HD (1080p) format bez ikakvih problema. Dok recimo XBMC na nekom Android media centru je puno nestabilniji i 1080p format reproducira sa puno zastajkivanja i zamrzavanja. Naravno, ovo je moje iskustvo, temeljeno na jednom Android media centru koji je trenutno na tržištu među boljim a samim tim i skupljim android media centrima.
  * Hrpa plugin-a (1Channel, IceFilms &#8230;) koja omogućavaju online gledanje filmova i serija tako da praktički nije potrebno skidati ih lokalno.
  * Također tu su i SportsDevil, Navi-X te MashUp koji omogućavaju i streaming TV kanala, sportskih događaja itd.
  * Plugin-i za slušanje radio streaming.
  * &#8230;

&nbsp;

U konačnici to izgleda ovako:

<a href="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/05/RaspberryPI-overview1.png?ssl=1" data-rel="lightbox-0" title=""><img class="alignnone size-medium wp-image-1476" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/05/RaspberryPI-overview1.png?resize=300%2C225&#038;ssl=1" alt="RaspberryPI-overview1" width="300" height="225" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/05/RaspberryPI-overview1.png?resize=300%2C225&ssl=1 300w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/05/RaspberryPI-overview1.png?w=542&ssl=1 542w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" /></a>

<a href="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/05/RaspberryPI-overview2.png?ssl=1" data-rel="lightbox-1" title=""><img class="alignnone size-medium wp-image-1475" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/05/RaspberryPI-overview2.png?resize=300%2C225&#038;ssl=1" alt="RaspberryPI-overview2" width="300" height="225" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/05/RaspberryPI-overview2.png?resize=300%2C225&ssl=1 300w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/05/RaspberryPI-overview2.png?w=563&ssl=1 563w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" /></a>

Dakle, R-Pi + wireless tipkovnica + LCD TV nude odlično rješenje za pristup cjelokupnom sadržaju iz naslonjača 🙂

&nbsp;

&nbsp;

**Nabava**

** **

Ja sam ga naručio sa stranice <https://www.modmypi.com/> i to kao Raspberry Pi Starter Kit

<https://www.modmypi.com/shop/basic-raspberry-pi-set-up-kit-%28including-raspberry-pi%29>

&nbsp;

koji uključuje sve potrebno za njegov setup:

&#8211;       Raspberry Pi Model B

&#8211;       Kućište

&#8211;       8GB SD kartica (sa pre instaliranim OS-om)

&#8211;       Adapter

&#8211;       HDMI kabal

&#8211;       Mrežni kabal

&nbsp;

**Cijena: ~ 570kn (shipping uključen)**

&nbsp;

Ono što sam naknadno kupio je:

&#8211;       Wifi USB nano adapter b/g/n

&#8211;       Wireless tipkovnica (logitech k400)

&nbsp;

**Cijena: ~ 350kn (tipkovnica + wifi usb)**

&nbsp;

&nbsp;

**Cijena ukupno: ~ 920kn**

** **

Ako neko ima neki drugi jeftiniji način nek slobodno podjeli sa nama.

&nbsp;

Naravno da se može proči i jeftinije ako se umjesto wireless tipkovnice uzme nekakav remote kontroler, air mouse itd. Ali ja se nekako najbolje osjecam sa tipkovnicom u rukama 🙂

&nbsp;

** Dodatak : Naruđbe izvan Europe**

U slučaju naručivanja izvan Europe, pripremite se na vjerojatnost da ćete uz cijenu dostave morati platiti i razne druge stvari.

Pr. Naruđba Raspberry PI razvojnog kita, sa raznim senzorima , poput ovoga :

<a href="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/RaspberryPI-kit-1.jpg?ssl=1" data-rel="lightbox-2" title=""><img class="alignnone size-medium wp-image-1566" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/RaspberryPI-kit-1.jpg?resize=300%2C94&#038;ssl=1" alt="RaspberryPI-kit-1" width="300" height="94" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/RaspberryPI-kit-1.jpg?resize=300%2C94&ssl=1 300w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/RaspberryPI-kit-1.jpg?resize=150%2C47&ssl=1 150w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/RaspberryPI-kit-1.jpg?w=529&ssl=1 529w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" /></a>

&#8230; uz odabir konkretne dostavne službe **&#8220;UPS&#8221;** :

<a href="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/RaspberryPI-kit-1-dostava.jpg?ssl=1" data-rel="lightbox-3" title=""><img class="alignnone size-medium wp-image-1567" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/RaspberryPI-kit-1-dostava.jpg?resize=300%2C103&#038;ssl=1" alt="RaspberryPI-kit-1-dostava" width="300" height="103" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/RaspberryPI-kit-1-dostava.jpg?resize=300%2C103&ssl=1 300w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/RaspberryPI-kit-1-dostava.jpg?resize=150%2C51&ssl=1 150w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/RaspberryPI-kit-1-dostava.jpg?w=747&ssl=1 747w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" /></a>

Može završiti s dodatnim troškovima poput ovih :

<a href="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/RaspberryPI-kit-1-dostava-HR.jpg?ssl=1" data-rel="lightbox-4" title=""><img class="alignnone size-medium wp-image-1568" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/RaspberryPI-kit-1-dostava-HR.jpg?resize=300%2C113&#038;ssl=1" alt="RaspberryPI-kit-1-dostava-HR" width="300" height="113" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/RaspberryPI-kit-1-dostava-HR.jpg?resize=300%2C113&ssl=1 300w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/RaspberryPI-kit-1-dostava-HR.jpg?resize=150%2C56&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/RaspberryPI-kit-1-dostava-HR.jpg?w=628&ssl=1 628w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" /></a>

**Napomena** : Američki &#8220;**UPS&#8221;** za Hrvatsku ima ugovor s tvrtkom **&#8220;OVERSEAS EXPRESS&#8221;** čiji račun je vidljiv  gore (i čija vjerodostojnost se može provjeriti).

&nbsp;

**Autor : Ergotić Marko**

[LinkedIn][1]

&nbsp;

&nbsp;

 [1]: http://hr.linkedin.com/pub/marko-ergoti%C4%87/97/420/907