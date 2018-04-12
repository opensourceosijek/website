---
title: MariaDB Galera cluster solution
author: Alen Milinčević
type: post
date: 2014-06-30T10:00:27+00:00
url: /2014/06/30/mariadb-galera-cluster-solution/
featured_image: /wp-content/uploads/2014/06/Session1.jpg
categories:
  - Vijesti

---
<h1 lang="zxx" style="margin-bottom: 0cm;">
  <strong>Cloud web platform synergy</strong>
</h1>

&nbsp;

<p lang="zxx" style="margin-bottom: 0cm; font-weight: normal;" align="LEFT">
  <span style="font-size: medium;">To je &#8220;Enterprise Level System&#8221; (sustav za poduzeća) za reaktivne aplikacije koji želi imati visoku dostupnost.</span>
</p>

Kako bi se to postiglo, mora biti:

  * <p lang="zxx" style="margin-bottom: 0cm; font-weight: normal;" align="LEFT">
      <span style="font-size: medium;">event-driven (pokretan događajima)<br /> </span>
    </p>

  * <p lang="zxx" style="margin-bottom: 0cm; font-weight: normal;" align="LEFT">
      <span style="font-size: medium;">scalable (skalabilan)<br /> </span>
    </p>

  * <p lang="zxx" style="margin-bottom: 0cm; font-weight: normal;" align="LEFT">
      <span style="font-size: medium;">resilient (elastičan, prilagodljiv)<br /> </span>
    </p>

  * <p lang="zxx" style="margin-bottom: 0cm; font-weight: normal;" align="LEFT">
      <span style="font-size: medium;">responsive (povratno primjenjiv)<br /> </span>
    </p>

<p lang="zxx" style="margin-bottom: 0cm; font-weight: normal;" align="LEFT">
  <span style="font-size: medium;">Kako bi se postigli ti ciljevi, bilo koja korištena baza podataka mora također biti:<br /> </span>
</p>

<ul style="list-style-type: circle;">
  <li>
    <span style="font-size: medium;"> resilient (izdržljiva na poremećaje)</span>
  </li>
  <li>
    <span style="font-size: medium;"> self-healing (Mora nastaviti raditi, čak i ako je dio privremeno nedostupan zbog održavanja ili neke kritične greške)</span>
  </li>
</ul>

<p style="text-align: center;">
  <a href="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Synergy.jpg?ssl=1" data-rel="lightbox-0" title=""><img class="alignnone size-medium wp-image-1505" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Synergy.jpg?resize=300%2C209&#038;ssl=1" alt="Synergy" width="300" height="209" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Synergy.jpg?resize=300%2C209&ssl=1 300w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Synergy.jpg?w=649&ssl=1 649w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" /></a>
</p>

<h2 lang="zxx" style="margin-bottom: 0cm;">
  <strong>DB Clustering (grupiranje baze podataka)<br /> </strong>
</h2>

<p lang="zxx" style="margin-bottom: 0cm;">
  Cluster je zbir pojedinačnih node-ova (čvorova). Svaki čvor je baza podataka sama za sebe. Snaga grupiranja se može iskoristiti spajanjem pojedinih čvorova i sinhronim radom. Tako nastaje inteligentno grupiranje u clusteru. Čvorovi međusobno komuniciraju, pomažu jedan drugom, balansiraju svoj posao i rade integrirano.
</p>

<p lang="zxx" style="margin-bottom: 0cm; text-align: center;">
  <a href="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Balance.jpg?ssl=1" data-rel="lightbox-1" title=""><img class="alignnone size-medium wp-image-1495" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Balance.jpg?resize=300%2C133&#038;ssl=1" alt="Balance" width="300" height="133" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Balance.jpg?resize=300%2C133&ssl=1 300w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Balance.jpg?w=689&ssl=1 689w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" /></a>
</p>

<h2 lang="zxx" style="margin-bottom: 0cm;">
  <strong>MariaDB cluster</strong>
</h2>

<p lang="zxx" style="margin-bottom: 0cm;">
  MySQL je jedna od najkorištenijih baza podataka (ako ne i najkorištenija.
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  MariaDB je poboljšani rođak od MySQL. Može raditi samostalno, ali jedino rad u clusteru je čini visoko dostupnom.<br /> U usporedbi s ostalim postojećim bazama podataka, to je:
</p>

<ul style="list-style-type: circle;">
  <li>
    <span style="font-weight: normal;">Rješenje visoke dostupnosti sa sinhronom replikacijom, failover-om (mogućnošću automatske promjene na redundanti sustav u slučaju pada glavnog) i resinhronizacijom</span>
  </li>
  <li>
    Nema gubitka podataka
  </li>
  <li>
    Svi poslužitelji imaju najnovije podatke (nema kašnjenja stanja na slugama)
  </li>
  <li>
    Skalabilnost čitanja
  </li>
  <li>
    Poprilično dobra skalabilnost pisanja
  </li>
  <li>
    Visoka dostupnost između centara za podatke
  </li>
</ul>

<h2 lang="zxx" style="margin-bottom: 0cm;">
  <strong>Topologija</strong>
</h2>

<p lang="zxx" style="margin-bottom: 0cm;">
  Kada je pokrenuta na jednom računalu, osjetljiva je na pad računala.<br /> Spajanjem više od jednog računala u cluster stvara topologiju baze podataka.<br /> U topologiji moraju postajati jasna pravila, kako se ne bi svaki čvor svađao sa svima ostalima.
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  Tradicionalno se to postizalo korištenjem mastera (glavnog računala), koji koordinira komunikaciju i slave-ova (sluga) koji se pokoravaju. U slučaju pada mastera, cijeli sustav je nekoordiniran. Prva rješenja su imala mehanizam, koji bi potom jednog od preostalih slave-ova proglasio master-om. Može biti samo jedan.<br /> MariaDB galera tehnologija prisupa problemu na drugačiji način. Sastavljena je od donor-a (davatelja) i joiner-a (pridruženih). Prvi čvor koji pokreće cluster je originalni donor. On se pokreće kako bi se kreirao cluster. Svaki pridružujući čvor će postati joiner. Međutim, može istovremeno biti i donor nekom drugom joiner-u. Neki čvorovi služe kao medijatori (posrednici) i cluster se samoorganizira u jedinstvenu radnu jedinicu. Ako neki čvorovi prestanu raditi, svi ostali čvorovi se preorganiziraju. Sve se to događa samostalno u pozadini.
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  Pisanje u bazu podata i čitanje iz baze se događa na principu &#8220;prvo dogovor&#8221;. Svi čvorovi se prvo pitaju kada se vrši operaciju upisa podataka i tek kad se svi slože, tek onda se izvršava i rezultat se propagira (proširuje) kroz cluster. Ako se operacija pisanja dogodi na istim podatcima na više od jednog čvora, događa se &#8220;livelock&#8221; (zaključavanje naživo). Međutim to nije kritično, jer se ponovnim pokušajima pisanja u različita vremena jednom zapiše. Isti podatak se ne može zapisati u isto vrijeme na više od jednog čvora. Konzistencija podataka je osigurana. Operacije čitanja se mogu dogoditi bilo kada na bilo kojem broju čvorova, jer su podatci konzistenti pri pisanju.
</p>

<p lang="zxx" style="margin-bottom: 0cm; text-align: center;">
  <a href="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Session.jpg?ssl=1" data-rel="lightbox-2" title=""><img class="alignnone size-medium wp-image-1502" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Session.jpg?resize=212%2C300&#038;ssl=1" alt="Session" width="212" height="300" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Session.jpg?resize=212%2C300&ssl=1 212w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Session.jpg?resize=724%2C1024&ssl=1 724w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Session.jpg?w=794&ssl=1 794w" sizes="(max-width: 212px) 100vw, 212px" data-recalc-dims="1" /></a>
</p>

<h2 lang="zxx" style="margin-bottom: 0cm;">
  <strong>Quorum (Kvorum)<br /> </strong>
</h2>

<p lang="zxx" style="margin-bottom: 0cm;">
  Kako bi se odlučilo što će se raditi slijedeće, barem se neparan broj čvorova mora dogovoriti. Preporučljivo je koristiti barem 3 čvora. Broj čvorova koji imaju većinu odlučuje kako će se razriješiti konfliktna situacija. Spojevi u clusteru između nekih čvorova mogu zatajiti. To je poznato kao situacija &#8220;split brain&#8221; ili &#8220;brain split&#8221; (sindrom odvojenog mozga). Svaka particija bi nastavila posao po svome, što je najmanje željeno ponašanje. Zbog toga samo većina nastavlja rad, dok manjina ide u modus spavanja (čekanje). Nakon ponovnog spajanja na većinu, cluster nastavlja raditi u jedinstvu. To je &#8220;self-healing&#8221; (samoliječenje) i  &#8220;resiliency&#8221; (elastičnost).
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  <img class="alignnone size-medium wp-image-1493 aligncenter" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/quorum.jpg?resize=300%2C234&#038;ssl=1" alt="quorum" width="300" height="234" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/quorum.jpg?resize=300%2C234&ssl=1 300w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/quorum.jpg?w=625&ssl=1 625w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" />
</p>

<h2 lang="zxx" style="margin-bottom: 0cm;">
  <strong>Trenutni status unutar Open Source Osijek zajednice</strong>
</h2>

<p lang="zxx" style="margin-bottom: 0cm;">
  MariaDB galera baza podatak cilja kao glavni backend (pozadinska logika za bazu podataka) za Synergy Platformu. Kako izvršava pozadinski posao čuvanja podataka i čini to vrlo dobro, odabir umjesto nekih drugih alternativa nije bio težak. Testovi pokazuju malo korištenje resursa i kako je &#8220;multimaster functionality&#8221; (pisanje je moguće na svaki čvor, automatski se sinhronizira stanje) bolje rješenje od korištenja tradicionalnog modela master-slave.
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  Kako bi se imao najmanji pouzdan sustav sa kvorumom, Open Source Osijek odabire MariaDB Galera cluster sa 3 čvora.<br /> U budućnosti je moguće proširenje, ovisno o potrebama.
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  <a href="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/MariaDB.jpg?ssl=1" data-rel="lightbox-3" title=""><img class=" wp-image-1494 aligncenter" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/MariaDB.jpg?resize=246%2C348&#038;ssl=1" alt="MariaDB" width="246" height="348" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/MariaDB.jpg?resize=212%2C300&ssl=1 212w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/MariaDB.jpg?resize=724%2C1024&ssl=1 724w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/MariaDB.jpg?w=794&ssl=1 794w" sizes="(max-width: 246px) 100vw, 246px" data-recalc-dims="1" /></a>
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  <strong> </strong>
</p>

<h2 lang="zxx" style="margin-bottom: 0cm;">
  <strong>Reference (engleski)<br /> </strong>
</h2>

<p lang="zxx" style="margin-bottom: 0cm;">
  <a href="https://mariadb.org/">https://mariadb.org/</a>
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  <a href="https://mariadb.com/kb/en/galera/">https://mariadb.com/kb/en/galera/</a>
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  <a href="https://mariadb.com/kb/en/what-is-mariadb-galera-cluster/">https://mariadb.com/kb/en/what-is-mariadb-galera-cluster/</a>
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  <a href="http://en.wikipedia.org/wiki/High_availability">http://en.wikipedia.org/wiki/High_availability</a>
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  <a href="http://en.wikipedia.org/wiki/Redundancy_%28databases%29">http://en.wikipedia.org/wiki/Redundancy_%28databases%29</a>
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  <a href="http://haproxy.1wt.eu/">http://haproxy.1wt.eu/</a>
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  <a href="http://www.keepalived.org/">http://www.keepalived.org/</a>
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  <a href="http://en.wikipedia.org/wiki/Replication_%28computing%29">http://en.wikipedia.org/wiki/Replication_%28computing%29</a>
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  <a href="http://www.percona.com/live/mysql-conference-2013/sessions/how-understand-galera-replication-0">http://www.percona.com/live/mysql-conference-2013/sessions/how-understand-galera-replication-0</a>
</p>

&nbsp;