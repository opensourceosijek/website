---
title: 'Linux: što nam donosi systemd'
author: Hrvoje Horvat
type: post
date: 2014-11-06T14:13:43+00:00
url: /2014/11/06/linux-sto-nam-donosi-systemd/
featured_image: /wp-content/uploads/2014/11/720px-Systemd_components.svg1_.png
categories:
  - Članci
  - Linux
  - Open Source projekti
  - Vijesti
  - Zanimljivosti

---
Mnogi možda i nisu svjesni ali sve više Linux Distribucija sa svojim novim verzijama prelazi s [**init**][1]-a na [**systemd**][2].

&nbsp;

Ako vam nije jasno o čemu se radi, prvo pročitajte :  [https://www.opensource-osijek.org/dokuwiki/wiki:knjige:uvod\_u\_linux#runlevels][3]

<= Sve opisano ovdje odnosi se na **init** i njegovo baratanje s procesima/servisima i daemonima kao i alatima koji su vezani za to (i koji više neće biti u upotrebi uvođenjem systemd-a)

&nbsp;

Naime  postoji dosta stvari na koje **init** nije ponudio najbolje riješenje ili riješenje uopće, zbog toga i opravdana tranzicija na **systemd**. Možda vam ovo izgleda kao daleka budućnost ali već prelaskom na novi Red Hat Enterprise Linux 7 ili CentOS 7 i druge novije Linux distribucije možete zaboraviti na init kao i na upravljanje servisima/daemonima na stari način i sa starim alatima.

&nbsp;

Preporučam da pročitate ovaj zanimljiv članak o razlikama između init i systemd :

<http://blog.jorgenschaefer.de/2014/07/why-systemd.html>

&nbsp;

Potom možete pogledati i malo više detalja o radu systemd, uz konkretne primjere kako po novome pokretati/stopirati  servise/daemone i sl. :

<https://access.redhat.com/articles/754933>

&nbsp;

Možete pogledati i druge detalje:

<http://www.certdepot.net/rhel7-get-started-systemd/>

&nbsp;

Osnovni elementi systemd-a su vidljivi na <a href="http://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Systemd_components.svg/720px-Systemd_components.svg.png" data-rel="lightbox-0" title="">slici</a>:

<a href="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/11/720px-Systemd_components.svg1_1.png?ssl=1" data-rel="lightbox-1" title=""><img class="alignnone size-medium wp-image-1790" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/11/720px-Systemd_components.svg1_1.png?resize=300%2C168&#038;ssl=1" alt="720px-Systemd_components.svg[1]" width="300" height="168" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/11/720px-Systemd_components.svg1_1.png?resize=300%2C168&ssl=1 300w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/11/720px-Systemd_components.svg1_1.png?resize=150%2C84&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/11/720px-Systemd_components.svg1_1.png?w=720&ssl=1 720w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" /></a>

&nbsp;

Logičku shemu rada systemd (s primjerom upotrebe tri Linux Containera pokrenuta na sustavu) možete vidjeti na [slici][4]:

&nbsp;

<a href="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/11/1280px-Linux_kernel_unified_hierarchy_cgroups_and_systemd.svg1_.png?ssl=1" data-rel="lightbox-2" title=""><img class="alignnone size-medium wp-image-1787" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/11/1280px-Linux_kernel_unified_hierarchy_cgroups_and_systemd.svg1_.png?resize=300%2C187&#038;ssl=1" alt="Systemd logical work" width="300" height="187" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/11/1280px-Linux_kernel_unified_hierarchy_cgroups_and_systemd.svg1_.png?resize=300%2C187&ssl=1 300w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/11/1280px-Linux_kernel_unified_hierarchy_cgroups_and_systemd.svg1_.png?resize=150%2C93&ssl=1 150w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/11/1280px-Linux_kernel_unified_hierarchy_cgroups_and_systemd.svg1_.png?resize=1024%2C640&ssl=1 1024w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/11/1280px-Linux_kernel_unified_hierarchy_cgroups_and_systemd.svg1_.png?w=1280&ssl=1 1280w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" /></a>

&nbsp;

I na kraju koliko god nam se ovo svidjelo ili ne  (i meni je teško priviknuti se na ovakve drastične promjene)  zapravo i nemamo izbora :-).

&nbsp;

P.S. Kada uhvatim vremena ići će i članak o konkretnim iskustvima u radu sa **systemd**.

&nbsp;

 [1]: http://en.wikipedia.org/wiki/Init
 [2]: http://en.wikipedia.org/wiki/Systemd
 [3]: https://www.opensource-osijek.org/dokuwiki/wiki:knjige:uvod_u_linux#runlevels
 [4]: http://en.wikipedia.org/wiki/Systemd#mediaviewer/File:Linux_kernel_unified_hierarchy_cgroups_and_systemd.svg