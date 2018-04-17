---
title: "Novi Web"
author: hvarga
date: 2018-04-13T18:05:57+02:00
thumbnail: "design.jpg"
type: post
---

Prešli smo na novi web! Da budem precizniji, odustali smo od privatnog servera na kojem se, pored ostalih čuda tehnologije, _vrtio_ i [Wordpress](https://wordpress.org/) zajedno sa [MySQL](https://www.mysql.com/) bazom podataka.

<!--more-->

Cijelu to skalametriju smo zamjenili sa sljedećim tehnologijama:

- [GitHub](https://github.com/)
- [Hugo](https://gohugo.io/)
- [Netlify](https://www.netlify.com/)

GitHub nam omogućuje hostanje Git repozitorija koji sadrži Hugo projekt. Hugo nam omogućuje generiranje statične web stranice iz [Markdown](https://daringfireball.net/projects/markdown/) sadržaja. I na kraju, Netlify, koji tu statičnu web stranicu i hosta na njihovim serverima.

Svi podaci iz Wordpress web stranice su izvučeni te konvertirani u Hugo projekt. No nažalost, u ovom trenutku, puno stvari ne funkcionira kako treba. Većina linkova više nije ispravno jer linkaju na stari server, slike nisu dohvatljive, sadržaj nekih članaka i stranica je u nekom čudnom stanju, informacije o autorima nisu vidljive, nepotrebni podaci koje je Wordpress generirao...

Naravno, sve će se to riješiti s vremenom. Očekujte konstantne promjene.

Vjerojatno se pitate čemu onda sve te muke oko prelaska na drugi server i totalno drugačije tehnologije? Savjetujem da si pročitate nešto o [prednostima statičkih generatora web stranica](https://gohugo.io/about/benefits/) i nešto o [Netlify](https://www.netlify.com/features/) servisu. Možda vas ti članici motiviraju da već sljedeći puta kada imate potrebe za web stranicom pak odaberete Hugo umjesto Wordpress.