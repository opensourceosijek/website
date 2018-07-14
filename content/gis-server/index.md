---
title: GIS Server
authors: hhorvat
type: page
date: 2013-11-20T13:20:15+00:00

---
# Što je GIS poslužitelj i čemu služi

<p dir="ltr">
  GIS (Geografski Informacijski Sustav) je sustav za upravljanje prostornim podacima i osobinama pridruženih njima.
</p>

<p dir="ltr">
  U najstrožem smislu to je računalni sustav sposoban za integriranje, spremanje, uređivanje, analiziranje i prikazivanje geografskih informacija.
</p>

<p dir="ltr">
  U općenitijem smislu GIS je oruđe &#8220;pametne karte&#8221; koje dopušta korisnicima stvaranje interaktivnih upita (pretrage koja stvara korisnik), analiziranje prostornih informacija i uređivanje podataka.
</p>

&#8230; možemo promatrati GoogleMaps kao GIS Lite sustav

&nbsp;

# Činjenice o GIS sustavima

<li dir="ltr">
  <p dir="ltr">
    Poslužiteljska strana:
  </p>
  
  <ul>
    <li dir="ltr">
      <p dir="ltr">
        Veliko opterečenje prema bazi podataka (LAN/CPU/RAM)
      </p>
    </li>
    
    <li dir="ltr">
      <p dir="ltr">
        Najveće opterečenje prema samoj jezgri GIS poslužitelja (CPU/RAM)
      </p>
    </li>
    
    <li dir="ltr">
      <p dir="ltr">
        Vrlo malo opterečenje prema Frontendu (Web poslužitelj)
      </p>
    </li>
    
    <li dir="ltr">
      <p dir="ltr">
        Brzina veze prema internetu je usko grlo
      </p>
    </li>
  </ul>
</li>

<li dir="ltr">
  <p dir="ltr">
    Klijentska strana:
  </p>
  
  <ul>
    <li dir="ltr">
      <p dir="ltr">
        Vrlo malo opterečenje
      </p>
    </li>
    
    <li dir="ltr">
      <p dir="ltr">
        ? Izbor Web preglednika (ne/kompatibilnosti)
      </p>
    </li>
    
    <li dir="ltr">
      <p dir="ltr">
        ? Brzina veze prema internetu je usko grlo
      </p>
    </li>
  </ul>
</li>

<li dir="ltr">
  <p dir="ltr">
    Sa strane održavanja sustava:
  </p>
  
  <ul>
    <li dir="ltr">
      <p dir="ltr">
        Potrebno je detaljno planiranje i dizajn svakog projekta
      </p>
    </li>
    
    <li dir="ltr">
      <p dir="ltr">
        Potrebne su maksimalne optimizacije i razrađen model rada na svakom projektu
      </p>
    </li>
    
    <li dir="ltr">
      <p dir="ltr">
        Brzina veze prema internetu
      </p>
    </li>
    
    <li dir="ltr">
      <p dir="ltr">
        Potrebne su efikasne metode za backup/restore svakog projekta i / ili cijelog GIS sustava
      </p>
    </li>
  </ul>
</li>

&nbsp;

# Koji open source GIS poslužitelji postoje

<li dir="ltr">
  <p dir="ltr">
    http://www.osgeo.org
  </p>
  
  <ul>
    <li dir="ltr">
      <p dir="ltr">
        GeoServer
      </p>
    </li>
    
    <li dir="ltr">
      MapGuide
    </li>
  </ul>
</li>

&nbsp;

# Što treba poboljšati (Server side)

<li dir="ltr">
  <p dir="ltr">
    Logiranje i praćenje svih komponenti sustava (syslog, SNMP)
  </p>
</li>

<li dir="ltr">
  <p dir="ltr">
    Komunikaciju prema bazi podataka
  </p>
  
  <ul>
    <li dir="ltr">
      <p dir="ltr">
        Osmisliti model redundantnih baza podataka (Active(r/w)/Active(r/w ili barem Active(r/w/Standby(r)): zbog brzine i sigurnosti
      </p>
    </li>
  </ul>
</li>

<li dir="ltr">
  <p dir="ltr">
    Za jezgru GIS-a:
  </p>
  
  <ul>
    <li dir="ltr">
      <p dir="ltr">
        Uvesti optimizacije za izvršavanje unutar Virtualnog okruženje
      </p>
    </li>
    
    <li dir="ltr">
      <p dir="ltr">
        Uvesti mogućnosti pokretanja više instanci na istom poslužitelju i/ili na više njih ( redundancija: A/A )
      </p>
    </li>
    
    <li dir="ltr">
      <p dir="ltr">
        Optimizirati korištenje CPU :
      </p>
      
      <ul>
        <li dir="ltr">
          <p dir="ltr">
            Prebaciti dio kalkulacija na klijentsku stranu (Web preglednik)
          </p>
        </li>
      </ul>
    </li>
    
    <li dir="ltr">
      Uvesti mogućnost upotrebe GPU-a, uz CPU
    </li>
  </ul>
</li>

&nbsp;

<li dir="ltr">
  <p dir="ltr">
    Za Web poslužitelj:
  </p>
  
  <ul>
    <li dir="ltr">
      <p dir="ltr">
        Uvesti mogućnost redundancije zbog opterečenja i sigurnosti
      </p>
    </li>
    
    <li dir="ltr">
      Dio kalkulacija prebaciti na njega
    </li>
  </ul>
</li>

&nbsp;

# Što treba poboljšati (Client side)

<li dir="ltr">
  <p dir="ltr">
    Dodati mogućnost da se što veći dio kalkulacija radi na njemu (Web preglednik):
  </p>
  
  <ul>
    <li dir="ltr">
      <p dir="ltr">
        Paziti na generiranje prometa od/prema internetu
      </p>
    </li>
    
    <li dir="ltr">
      <p dir="ltr">
        Iskoristiti GPU na klijentskoj strani (ako postoji) [HTML5 + WebGL]
      </p>
    </li>
  </ul>
</li>

&nbsp;

# Što mi želimo razvijati

Moderan Cluster GIS Poslužitelj koji zna iskoristiti mogućnosti distribuiranog rada.

S obzirom na činjenice :

  * Da su GIS sustavi vrlo zahtjevni što se tiće resursa: (CPU,RAM , Diskovni prostor i brzina)
  * Da se u praksi sve više proširuju i nadograđuju (sve više podataka, slika, &#8230;)
  * Da se od njih traži pouzdanost

Možemo zaključiti da postojeći GIS sustavi ne zadovoljavaju te osnovne parametre.

&nbsp;

Dakle sam razvoj GIS polsužitelja se može razvijati u nekoliko  smjerova:

  1. Kao aplikacija unutar [cloud web portal platforme Synergy][1]
  2. Kao samostalnan GIS Server
  3. Kao modifikacija neke od open source GIS server platformi &#8211; pr. za korištenje kao u točki **1.**

&nbsp;

Logička shema rada samostalnog cluster GIS Servera koji zadovolave gore navedene zahtjeve bi bila:

&nbsp;

<img alt="GIS Server Osnovni Cluster način rada" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2013/11/GIS-cluster-basic.jpg?resize=861%2C565&#038;ssl=1" width="861" height="565" data-recalc-dims="1" />

&nbsp;

&nbsp;

 [1]: https://www.opensource-osijek.org/wordpress/razvoj-cloud-web-portal-platforme-synergy/ "Razvoj cloud web portal platforme Synergy"