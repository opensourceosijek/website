---
title: 'Retrospektiva : Uvod u Linux – radionica (10.dio)'
author: Hrvoje Horvat
type: post
date: 2016-02-02T14:53:11+00:00
url: /2016/02/02/retrospektiva-uvod-u-linux-radionica-10-dio/
featured_image: /wp-content/uploads/2016/02/IMG_20160130_123914.jpg
categories:
  - Linux
  - Radionice

---
Zahvaljujemo se polaznicima radionice “Uvod u Linux (10.dio)”, na odzivu i dolasku.

Tokom predavanja i radionice nastavili smo s radom prema poglavljima koja smo planirali odraditi.
  
Kao i do sada, slijedeći puta nastavljamo dokle stignemo.

Plan je krenuti od  :

  * **Rada sa sadržajem datoteka te detaljnije pokriti** : 
      * **grep** 
      * **cut** 
      * **awk i sed ** 
      * &#8230; i to zasebno i u kombinaciji s do sada naučenim naredbama
  * **Shell Skripte**
  * **Traženje datoteka**
  * **Izvršavanje naredbi u zadano vrijeme**
  * **Administracija Linux sustava**
  * **Runleveli**
  * **Package management**
  * **Arhiviranje i komprimiranje/dekomprimiranje**
  * **vi editor**
  * **Mrežni sustav**

&nbsp;

Točan termin slijedeće radionice &#8220;Uvod u Linux&#8221; objaviti ćemo naknadno na :

<http://softwarecity.hr/>

&nbsp;

Zahvaljujemo se:

  * Elektrotehničkom fakultetu u Osijeku  ( <http://www.etfos.unios.hr/>  ) za računalnu učionicu sa svom potrebnom tehnikom te kolegi Hrvoju Leventiću koji je sa strane fakulteta koordinirao sve potrebne radnje za funkcioniranje ove i budućih radionica
  * Udruzi “Osijek Software City”  ( <http://softwarecity.hr/> ) za marketing i organizaciju.

&nbsp;

Pogledajte i kako je bilo na održanoj radionici :

 <img class="alignnone size-full wp-image-2086" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/IMG_20160130_123828.jpg?resize=3840%2C2160&#038;ssl=1" alt="IMG_20160130_123828" width="3840" height="2160" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/IMG_20160130_123828.jpg?w=3840&ssl=1 3840w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/IMG_20160130_123828.jpg?resize=150%2C84&ssl=1 150w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/IMG_20160130_123828.jpg?resize=300%2C169&ssl=1 300w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/IMG_20160130_123828.jpg?resize=768%2C432&ssl=1 768w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/IMG_20160130_123828.jpg?resize=1024%2C576&ssl=1 1024w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/IMG_20160130_123828.jpg?w=2000&ssl=1 2000w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/IMG_20160130_123828.jpg?w=3000&ssl=1 3000w" sizes="(max-width: 1000px) 100vw, 1000px" data-recalc-dims="1" /> <img class="alignnone size-full wp-image-2087" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/IMG_20160130_123833.jpg?resize=3840%2C2160&#038;ssl=1" alt="IMG_20160130_123833" width="3840" height="2160" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/IMG_20160130_123833.jpg?w=3840&ssl=1 3840w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/IMG_20160130_123833.jpg?resize=150%2C84&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/IMG_20160130_123833.jpg?resize=300%2C169&ssl=1 300w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/IMG_20160130_123833.jpg?resize=768%2C432&ssl=1 768w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/IMG_20160130_123833.jpg?resize=1024%2C576&ssl=1 1024w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/IMG_20160130_123833.jpg?w=2000&ssl=1 2000w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/IMG_20160130_123833.jpg?w=3000&ssl=1 3000w" sizes="(max-width: 1000px) 100vw, 1000px" data-recalc-dims="1" /> <img class="alignnone size-full wp-image-2088" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/IMG_20160130_123858.jpg?resize=3840%2C2160&#038;ssl=1" alt="IMG_20160130_123858" width="3840" height="2160" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/IMG_20160130_123858.jpg?w=3840&ssl=1 3840w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/IMG_20160130_123858.jpg?resize=150%2C84&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/IMG_20160130_123858.jpg?resize=300%2C169&ssl=1 300w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/IMG_20160130_123858.jpg?resize=768%2C432&ssl=1 768w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/IMG_20160130_123858.jpg?resize=1024%2C576&ssl=1 1024w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/IMG_20160130_123858.jpg?w=2000&ssl=1 2000w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/IMG_20160130_123858.jpg?w=3000&ssl=1 3000w" sizes="(max-width: 1000px) 100vw, 1000px" data-recalc-dims="1" /><img class="alignnone size-full wp-image-2089" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/IMG_20160130_123914.jpg?resize=3840%2C2160&#038;ssl=1" alt="IMG_20160130_123914" width="3840" height="2160" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/IMG_20160130_123914.jpg?w=3840&ssl=1 3840w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/IMG_20160130_123914.jpg?resize=150%2C84&ssl=1 150w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/IMG_20160130_123914.jpg?resize=300%2C169&ssl=1 300w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/IMG_20160130_123914.jpg?resize=768%2C432&ssl=1 768w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/IMG_20160130_123914.jpg?resize=1024%2C576&ssl=1 1024w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/IMG_20160130_123914.jpg?w=2000&ssl=1 2000w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2016/02/IMG_20160130_123914.jpg?w=3000&ssl=1 3000w" sizes="(max-width: 1000px) 100vw, 1000px" data-recalc-dims="1" />

&nbsp;