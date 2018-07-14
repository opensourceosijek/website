---
title: Uvod u programiranje – II. dio
authors: hvarga
type: post
date: 2014-03-18T19:24:05+00:00
url: /2014/03/18/uvod-u-programiranje-ii-dio/
featured_image: /wp-content/uploads/2014/03/object-oriented-programming.jpg
categories:
  - Predavanja
  - Programiranje
tags:
  - OOP
  - Predavanja
  - programiranje

---
Nastavljamo sa predavanjem &#8220;Uvod u programiranje&#8221;. Dakle, na ovom drugom, i ujedno i zadnjem dijelu predavanja, obradit ćemo pojam tj. metodologiju programiranja pod nazivom objektno orijentirano programiranje, (eng. _Object Oriented Programming_) poznatije još i pod skraćenicom OOP.

Prije toga ćemo zapravo malo napraviti korak nazad pa ćemo ponoviti nešto što smo spominjali u prvom dijelu predavanja &#8211; programske paradigme (eng. _Programming Paradigms_).

Sve to ćemo probati začiniti sa našim Karel J. Robot. Alat koji će nam pomoći da na lakši i zabavniji način naučimo OOP i kasnije programski jezik Java. Autori Karel J. Robot su najbolje to sročili:

> A Gentle Introduction to the Art of Object-Oriented Programming in Java

Predavanje je nastavak na prvi dio predavanja &#8220;Uvod u programiranje&#8221;, no neće biti problem da se _uljuljate_ u predavanje ako ipak niste bili na prvom dijelu. No, ovo predavanje je pak krucijalno jer će već sljedeće predavanje, &#8220;Uvod u programski jezik Java&#8221; i &#8220;Uvod u programski jezik C#&#8221;, zahtjevati poznavanje materijala kojeg će te dobiti na ovom predavanju.

Također, zahvaljujemo se Udruzi diplomiranih studenata ETF-a (AMA-ETF) na osiguranom prostoru.

Informacije o tome gdje i kada će se održati predavanje saznajte [ovdje][1].

&nbsp;

Slike s predavanja:

<a href="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/04/HPIM1347.jpg?ssl=1" data-rel="lightbox-0" title=""><img class="alignnone size-medium wp-image-1360" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/04/HPIM1347.jpg?resize=300%2C224&#038;ssl=1" alt="HPIM1347" width="300" height="224" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/04/HPIM1347.jpg?resize=300%2C224&ssl=1 300w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/04/HPIM1347.jpg?resize=1024%2C766&ssl=1 1024w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/04/HPIM1347.jpg?w=2000&ssl=1 2000w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" /></a> <a href="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/04/HPIM1343.jpg?ssl=1" data-rel="lightbox-1" title=""><img class="alignnone size-medium wp-image-1359" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/04/HPIM1343.jpg?resize=300%2C224&#038;ssl=1" alt="HPIM1343" width="300" height="224" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/04/HPIM1343.jpg?resize=300%2C224&ssl=1 300w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/04/HPIM1343.jpg?resize=1024%2C766&ssl=1 1024w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/04/HPIM1343.jpg?w=2000&ssl=1 2000w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" /></a> <a href="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/04/HPIM1341.jpg?ssl=1" data-rel="lightbox-2" title=""><img class="alignnone size-medium wp-image-1358" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/04/HPIM1341.jpg?resize=300%2C224&#038;ssl=1" alt="HPIM1341" width="300" height="224" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/04/HPIM1341.jpg?resize=300%2C224&ssl=1 300w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/04/HPIM1341.jpg?resize=1024%2C766&ssl=1 1024w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/04/HPIM1341.jpg?w=2000&ssl=1 2000w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" /></a> <a href="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/04/HPIM1339.jpg?ssl=1" data-rel="lightbox-3" title=""><img class="alignnone size-medium wp-image-1357" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/04/HPIM1339.jpg?resize=300%2C224&#038;ssl=1" alt="HPIM1339" width="300" height="224" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/04/HPIM1339.jpg?resize=300%2C224&ssl=1 300w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/04/HPIM1339.jpg?resize=1024%2C766&ssl=1 1024w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/04/HPIM1339.jpg?w=2000&ssl=1 2000w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" /></a> <a href="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/04/HPIM1337.jpg?ssl=1" data-rel="lightbox-4" title=""><img class="alignnone size-medium wp-image-1356" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/04/HPIM1337.jpg?resize=300%2C224&#038;ssl=1" alt="HPIM1337" width="300" height="224" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/04/HPIM1337.jpg?resize=300%2C224&ssl=1 300w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/04/HPIM1337.jpg?resize=1024%2C766&ssl=1 1024w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/04/HPIM1337.jpg?w=2000&ssl=1 2000w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" /></a>

&nbsp;

 [1]: https://www.opensource-osijek.org/wordpress/events/uvod-u-programiranje-ii-dio/ "Uvod u programiranje – II. dio"