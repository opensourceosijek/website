---
title: 'Retrospektiva: Suradnja s poduzetničkim inkubatorom (BIOS) Osijek : Implementacija infrastrukture potrebne za virtualizacijsku platformu'
author: Hrvoje Horvat
type: post
date: 2015-12-24T10:55:06+00:00
url: /2015/12/24/retrospektiva-suradnja-s-poduzetnickim-inkubatorom-bios-osijek-implementacija-infrastrukture-potrebne-za-virtualizacijsku-platformu/
featured_image: /wp-content/uploads/2015/12/BIOS-i-OpenSourceOsijek.jpg
categories:
  - Članci
  - Hardware
  - Linux
  - Open Source projekti
  - OS@OS
  - Vijesti
  - Zanimljivosti

---
U toku 2012/13 godine, na početku naše suradnje s poduzetničkim inkubatorom (BIOS : <http://inkubator.hr/> ), s obzirom na slične ciljeve, odlućili smo se za pilot projekt instalacije i konfiguracije virtualizacijske platforme.

Osim virtualizacijske platforme bilo je potrebno nadograditi i rekonfigurirati dio mreže koji je bio naslonjen na virtualizacijsku platformu te druge servise i usluge povezane s njom.

Plan je bio da će se platforma na početku koristiti za potrebe BIOS-a te njihovih podstanara i partnera, kojima je trebalo nezahtjevno virtualno računalo ili linux kontejner (kao poslužitelj, za testiranje i razvoj i sl.).

&nbsp;

Bela je dobio (ili dao) zeleno svjetlo pa smo i krenuli s jednim poslužiteljem kao “proof of concept”.

Naša suradnja od tada je na vrlo visokoj razini te se ovim putem posebno zahvaljujemo Beli Ikotić i svima drugima od strane poduzetničkog inkubatora BIOS, koji su bili uključeni u ovaj projekt.

Također se želimo zahvaliti i Valentu Turkoviću koji nas je inicijalno povezao.

&nbsp;

S obzirom na dugogodišnja iskustva na području virtualizacije te izvrsna iskustva i suradnju s **ProxMox**-om, odlučili smo se za platformu “**[ProxMox Virtual Environment][1]**”, koja je razvijana prema principima otvorenog koda (engl. Open Source), pod licencom [GNU AGPL, v3.][2]

Više o ovoj platformi pogledajte u našem [članku][3] o suradnji s ProxMox-om odnosno tvrtkom koja pruža komercijalnu podršku za ProxMox Virtual Environment ,  “**Proxmox Server Solutions GmbH**”.

&nbsp;

&nbsp;

&nbsp;

<img class="alignnone wp-image-2050" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-small.jpg?resize=807%2C129&#038;ssl=1" alt="ProxMox small" width="807" height="129" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-small.jpg?w=1154&ssl=1 1154w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-small.jpg?resize=150%2C24&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-small.jpg?resize=300%2C48&ssl=1 300w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-small.jpg?resize=768%2C123&ssl=1 768w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2015/12/ProxMox-small.jpg?resize=1024%2C164&ssl=1 1024w" sizes="(max-width: 807px) 100vw, 807px" data-recalc-dims="1" />

ProxMox VE platforma je izdana s licencom otvorenog koda i potpuno je besplatna za komercijalnu upotrebu.

Sama &#8220;Open Source&#8221; platforma ima sve funkcionalnosti odnosno nema nikakva (skrivena) ograničenja.

S druge strane za one koji žele odabrati komercijalni model, moguće je kupiti i službenu podršku.

[Službena podrška][4] se nudi u više razina &#8211; ovisno o tome koja razina podrške vam je stvarno potrebna.

&nbsp;

**Malo statistike**

ProxMox VE platforma koju smo implementirali u BIOS Osijek ( <http://inkubator.hr/> ), volonterski, u ime inicijative **Open Source Osijek**, sada radi više od dvije i pol godine, bez i jednog ispada ili problema u radu.

&nbsp;

Unutar toga vremena (do danas), bilo je oko 20 većih nadogradnji platforme, zbog kojih su napravljeni planirani restarti fizičkih poslužitelja na kojima je platforma instalirana.

&nbsp;

Na platformi je konstantno pokrenuto oko 20+ Linux kontejnera i nekoliko Virtualnih računala (većinom sa Windows Server OS-om).

&nbsp;

Platforma je instalirana na starijoj generaciji  HP poslužitelja sa intel Xeon procesorima i pokazala se i dokazala kao izvrsna i na nešto starijem hardveru.

&nbsp;

Nadalje upotrebom Linux kontejnera unutar platforme drastično smo smanjili glad za hardverskim resursima u odnosu na klasičnu virtualizaciju. Virtualizaciju smo koristili samo u slučajevima kada je bilo potrebno koristiti NE-Linux operacijske sustave (MS Windows ili sl.)

&nbsp;

Potom je dodan još jedan poslužitelj te NAS i SAN storage, te smo narasli do malog ProxMox VE klastera, koji nudi redundanciju (zalihost) za Virtualke i Linux kontejnere.

Vanjski (čitaj zaseban) NAS i SAN storage, koji smo također instalirali i konfigurirali, koristimo za sigurnosne kopije virtualki i linux kontejnera te druge klasterske namjene.

&nbsp;

Nadamo se i skoroj nadogradnji odnosno proširenjima koja će donijeti nove mogućnosti i funkcionalnosti koje do sada nismo mogli uključiti (iako su tu &#8211; unutar ProxMox VE platforme).
  
Nakon potrebnih nadogradnji i rekonfiguracije mreže i IT sustava, poduzetnički inkubator (BIOS) će biti u mogućnosti osim za svoje potrebe nuditi i Virtualke i/ili Linux kontejnere i svojim podstanarima &#8211; iako na relativno skromnom hardveru (za sada) ali i to je dobar početak.

&nbsp;

&nbsp;

Još jednom su se znanje i iskustvo u kombinaciji s OpenSource riješenjima pokazali ne samo konkurentnim već i puno boljim od “Close Sorce” komercijalnih riješenja.

 [1]: http://proxmox.com/en/proxmox-ve
 [2]: http://www.gnu.org/licenses/agpl-3.0.en.html
 [3]: https://www.opensource-osijek.org/wordpress/2015/12/24/proxmox-server-solutions-gmbh-je-postao-tehnoloski-partner-inicijative-open-source-osijek/
 [4]: http://proxmox.com/en/proxmox-ve/pricing