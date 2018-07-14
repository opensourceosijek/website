---
title: ArhiXML
authors: hhorvat
type: page
date: 2013-11-20T09:51:55+00:00

---
## Što je ArhiXML

<li dir="ltr">
  ArhiXML je aplikacija pomoću koje se izrađuju popisi arhivskog gradiva koje tvrtke i institucije posjeduju u svojim pismohranama, a dužne su taj popis elektronski dostavljati državnom arhivu (ARHiNET).
</li>
<li dir="ltr">
  ARHiNET je mrežni informacijski sustav za opis, obradu i upravljanje arhivskim gradivom.
</li>

## Zašto baš ta ideja za projekt ?

<li dir="ltr">
  Prema Pravilniku o izmjenama i dopunama Pravilnika o zaštiti i čuvanju arhivskog i registraturnog gradiva izvan arhiva (NN 106/07) tvrtke su dužne popis arhivskog gradiva dostavljati u elektronskom obliku.
</li>
<li dir="ltr">
  Tvrtke imaju dva izbora; koristiti sam ARHiNET sustav koji se naplaćuje ili besplatno sami izraditi XML datoteku te istu slati ARHiNET sustavu.
</li>
<li dir="ltr">
  <span style="line-height: 1.5;">ARHiNET nudi dokumentaciju i pravila po kojima se izrađuje XML.</span>
</li>
<li dir="ltr">
  <span style="line-height: 1.5;">Sama izrada XML datoteke nije jednostavna te traži određeni nivo tehničkog predznanja.</span>
</li>
<li dir="ltr">
  <span style="line-height: 1.5;">Nakon izrade XML datoteke, ista se mora validirati. Postoje alati koji validiraju XML datoteku pomoću XML schema datoteke.</span>
</li>
<li dir="ltr">
  <span style="line-height: 1.5;">Takvi alati predstavljaju dodatnu investiciju za korisnika te također traže određeni nivo tehničkog predznanja za ispravno korištenje.</span>
</li>

## <span style="line-height: 1.3;">Po čemu je ova aplikacija zanimljiva</span>

  1. Kod razvoja ove aplikacije želja nam je bila prezentirati tehnike i tehnologije koje se temelje na server-side programiranju s mogućnošću definiranja dijela same aplikacije koji  će se izvršavati na poslužitelju a koji na klijentskoj strani (web preglednik). Također aplikacija mora biti razvijana na način da omogućava maksimalnu brzinu rada i pouzdanost.
  2. Potom smo željeli da se samo vrijeme razvoja aplikacije skrati i pojednostavi što je moguće više te da se u razvoju ne treba brinuti u tome kako će se sama Web stranica iscrtavati (renderirati) i sl..
  3. Nadalje  željeli smo izraditi funkcionalnu aplikaciju neovisnu o operatvnom sustavu na kojemu će se izvršavati i poslužiteljska i klijentska strana, te da na klijentskoj strani ne smije biti potrebe za instaliranjem plugina ili bilo kakvog dodatnog softvera.
  4. Osim toga, naš zahtjev u razvoju aplikacije je bio i taj da se aplikacija mora moći izvršavati unutar minimalnog cluster sustava, otpornog na ispade.
  5. Slijedeći zahtjev je bio da se sama aplikacija može vrlo brzo i jednostavno nadograditi, i to samo na strani poslužitelja u nekoliko sekundi (ne računajući vrijeme kopiranja datoteke na poslužitelj) te da se instalacija može automatski proširiti na sve poslužitelje u clusteru.
  6. Na kraju želimo da se ova aplikacija može uz minimalne prepravke instalirati na našu buduću [Cloud Web portal platformu][1].
  7. Ove tehnike će kasnije biti korisne za većinu projekata koje pokrećemo kao i za bilo koje druge naprednije projekte.

## Kako to radi?

  * Aplikacija je pisana u programskom jeziku Java kao servlet koristeći Java Enterprise Edition API i Vaadin framework. Za razliku od drugih server-side aplikacija, aplikacije koje su pisane u programskom jeziku Java kao servleti omogućavaju brže izvršavanje, bolju kontrolu te manje trošenje resursa (ovo zadovoljava zahtjeve 1, 2 i 3). Ne zaboravimo i činjenicu da je Java platforma provjerena u desetljetnom radu u najzahtjevnijim okruženjima (telekomi, industrija&#8230;). Osim toga korištenjem Vaadin frameworka smo ubrzali vrijeme razvoja aplikacije jer nam sam framework nudi obilje funkcionalnosti o kojima se više ne moramo brinuti, već ih samo treba koristiti. Vaadin je također dokazan u radu, dugi niz godina.
  * Pošto je aplikacija pisana kao servlet, za njeno izvršavanje je potreban minimalno samo _Servlet Container_, ali pošto smo imali zahjev za radom u clusteru (točka 4), minimalno preporučamo Apache Tomcat ili neki od _Java Application_ servera koji također imaju mogućnost rada u Clusteru kao što su <span style="line-height: 1.5;">GlassFish, </span><span style="line-height: 1.5;">JBoss, </span><span style="line-height: 1.5;">WebSphere i ostali.</span>
  * <span style="line-height: 1.5;">Nadalje, zahtjev za brzom i automatskom nadogradnjom aplikacije (točka 5) riješen    je u svim <em>Servlet Container</em> kao i u <em>Java Application</em> serverima.</span>

&nbsp;

<div style="max-width: 970px" class="wp-caption alignnone">
  <img alt="Logička shema rada" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2013/12/ArhiXML3.png?resize=960%2C720&#038;ssl=1" width="960" height="720" data-recalc-dims="1" />
  
  <p class="wp-caption-text">
    Logička shema rada
  </p>
</div>

&nbsp;

## Korištene tehnologije

<li dir="ltr">
  Mozilla Firefox, Google Chrome.
</li>
<li dir="ltr">
  Java.
</li>
<li dir="ltr">
  Vaadin.
</li>
<li dir="ltr">
  Eclipse.
</li>
<li dir="ltr">
  Apache Tomcat.
</li>

## Korisničko sučelje

<li dir="ltr">
  Sučelje je konceptualno podijeljeno na dva dijela: <ul>
    <li dir="ltr">
      glavna tablica,
    </li>
    <li dir="ltr">
      forma.
    </li>
  </ul>
</li>

<li dir="ltr">
  Glavna tablica sadrži hijerarhijski popis svih registraturnih jedinica.
</li>
<li dir="ltr">
  Forma sadrži detaljne podatke o jednoj registraturnoj jedinici.
</li>

<img alt="" src="https://lh3.googleusercontent.com/z2g3J5CYoL7rFKk4FDhxXr88oOSNbICGYtysCGkp39aKX8vV1TM3PoD20_C0hwzBkIvUkz3IlIqfRCbiAgMz4Z7N2ata6SsiCEQKMl5c0B1bygyVlyBl_lsM-24" width="892px;" height="426.0594447178478px;" />

<img alt="Dodaj unos" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2013/12/ArhiXML-dodaj.jpg?resize=775%2C184&#038;ssl=1" width="775" height="184" data-recalc-dims="1" />

<img style="line-height: 1.5;" alt="" src="https://lh4.googleusercontent.com/iptpc1rL9ZUNjxl0KR1A0jGKIixtIEgYZ-qMqs_Iu86NjWZ5I6tzsTqKQjH3ypkfq0TgdHawHVYww_eg0baOhKy8yBJNnesWJGd3hpYrKinFbwv0NSCpI1Rp2fE" width="892px;" height="424px;" />

<img alt="" src="https://lh6.googleusercontent.com/DelLOjTFz9KCHwqmWVQ_Rlje2PJvqmxctePXTmK_ZxJXvAp5rxE4bw5l4_U9kAbVPzCwppF95IFTUEm59ksNK5SEJBAFkBle3kj8P2pY-hA66VTwiEX8njeDzyA" width="892px;" height="666px;" />

## Primjer XML datoteke:

<pre class="lang:default decode:true">&lt;?xml version="1.0" standalone="yes"?&gt;
&lt;ARHiNET xmlns="http://arhinet.arhiv.hr/ARHiNET.xsd"&gt;
&lt;RegistraturnaJedinica ImateljId="12345" RazinaId="0" Signatura="1" Naziv="Hrvatski zavod za ..." GodinaOd="1992" GodinaDo="2008"&gt;
    &lt;Stvaratelj StvarateljId="98765" UlogaId="1"/&gt;
    &lt;RegistraturnaJedinica RazinaId="1" Signatura="1" Naziv="Organizacija i upravljanje"&gt;
        &lt;RegistraturnaJedinica RazinaId="2" Signatura="1" Naziv="Nadzorni odbor"&gt;
            &lt;RegistraturnaJedinica RazinaId="3" Signatura="1" Naziv="Sjednice Odbora" GodinaOd="1992" GodinaDo="2008"&gt;
                &lt;NapomenaORazdoblju&gt;Nedostaju zapisnici sa sjednica za razdoblje od 1994. do 1996.&lt;/NapomenaORazdoblju&gt;
                &lt;Sadrzaj&gt;Materijali za sjednice, zapisnici sa sjednica, odluke.&lt;/Sadrzaj&gt;
                &lt;Gradja KomPodvrstaId="1"/&gt;
                &lt;Medij VrstaMedijaId="1"/&gt;
                &lt;KolicinaArhivskihJedinica MjernaJedinicaId="1" Kolicina="1"/&gt;
                &lt;KolicinaTehnickihJedinica VrstaTehnickeJediniceId="91" Kolicina="14"/&gt;
                &lt;KolicinaTehnickihJedinica VrstaTehnickeJediniceId="23" Kolicina="1"/&gt;
            &lt;/RegistraturnaJedinica&gt;
            &lt;RegistraturnaJedinica RazinaId="3" Signatura="2" Naziv="Izvješća o nadzoru vođenja poslova" GodinaOd="1993" GodinaDo="2008"&gt;
                &lt;Gradja KomPodvrstaId="1"/&gt;
                &lt;Medij VrstaMedijaId="1"/&gt;
                &lt;KolicinaArhivskihJedinica MjernaJedinicaId="1" Kolicina="0.3"/&gt;
                &lt;KolicinaTehnickihJedinica VrstaTehnickeJediniceId="91" Kolicina="4"/&gt;
            &lt;/RegistraturnaJedinica&gt;
            &lt;RegistraturnaJedinica RazinaId="3" Signatura="3" Naziv="Suglasnost na programe razvoja" GodinaOd="1993" GodinaDo="2008"&gt;
                &lt;Gradja KomPodvrstaId="1"/&gt;
                &lt;Medij VrstaMedijaId="1"/&gt;
                &lt;KolicinaArhivskihJedinica MjernaJedinicaId="1" Kolicina="0.1"/&gt;
                &lt;KolicinaTehnickihJedinica VrstaTehnickeJediniceId="91" Kolicina="1"/&gt;
            &lt;/RegistraturnaJedinica&gt;
            &lt;RegistraturnaJedinica RazinaId="3" Signatura="4" Naziv="Suglasnost na godišnji plan poslovanja" GodinaOd="1993" GodinaDo="2008"&gt;
                &lt;Gradja KomPodvrstaId="1"/&gt;
                &lt;Medij VrstaMedijaId="1"/&gt;
                &lt;KolicinaArhivskihJedinica MjernaJedinicaId="1" Kolicina="0.1"/&gt;
                &lt;KolicinaTehnickihJedinica VrstaTehnickeJediniceId="91" Kolicina="1"/&gt;
            &lt;/RegistraturnaJedinica&gt;
            &lt;RegistraturnaJedinica RazinaId="3" Signatura="5" Naziv="Imenovanja" GodinaOd="1992" GodinaDo="2006"&gt;
                &lt;Gradja KomPodvrstaId="1"/&gt;
                &lt;Medij VrstaMedijaId="1"/&gt;
                &lt;KolicinaTehnickihJedinica VrstaTehnickeJediniceId="23" Kolicina="1"/&gt;
            &lt;/RegistraturnaJedinica&gt;
        &lt;/RegistraturnaJedinica&gt;
        &lt;RegistraturnaJedinica RazinaId="2" Signatura="2" Naziv="Skupština"/&gt;
        &lt;RegistraturnaJedinica RazinaId="2" Signatura="3" Naziv="Uprava"/&gt;
        &lt;RegistraturnaJedinica RazinaId="2" Signatura="4" Naziv="Normativni akti"/&gt;
    &lt;/RegistraturnaJedinica&gt;
    &lt;RegistraturnaJedinica RazinaId="1" Signatura="2" Naziv="Opći poslovi"/&gt;
    &lt;RegistraturnaJedinica RazinaId="1" Signatura="3" Naziv="Pravni poslovi"/&gt;
    &lt;RegistraturnaJedinica RazinaId="1" Signatura="4" Naziv="Financijsko i računovodstveno poslovanje"/&gt;
    &lt;RegistraturnaJedinica RazinaId="1" Signatura="5" Naziv="Ljudski potencijali"/&gt;
    &lt;RegistraturnaJedinica RazinaId="1" Signatura="6" Naziv="Stručna djelatnost zavoda"/&gt;
&lt;/RegistraturnaJedinica&gt;
&lt;/ARHiNET&gt;</pre>

## Tehnički zahtjevi

<li dir="ltr">
  Zahtjevi su definirani od strane ARHiNET sustava u obliku dokumentacije i XML schema datoteke.
</li>
<li dir="ltr">
  Korisniku aplikacije maksimalno sakriti kompleksnost same XML datoteke.
</li>
<li dir="ltr">
  Ulaz u aplikaciju i izlaz iz aplikacije je XML datoteka koja mora biti pravovaljanja, tj. po pravilima ARHiNET sustava.
</li>

## Status projekta

<li dir="ltr">
  Softver je funkcionalan. Podržava sva pravila koja su opisana na stranicama ARHiNET-a.
</li>
<li dir="ltr">
  Postoje mogućnosti napretka. Povećati performanse, poboljšati korisničko sučelje&#8230;
</li>
<li dir="ltr">
  Dodatne informacije kao i sam izvorni kod softvera (privremeno &#8211; dok sve ne prebacimo na <a title="ArhiXML Redmine" href="https://www.opensource-osijek.org/redmine/projects/arhixml">naš sustav</a>) možete pronaći na <a href="https://bitbucket.org/hrle/arhixml">https://bitbucket.org/hrle/arhixml</a>.
</li>

## Isprobajte aplikaciju

ArhiXML smo instalirali na našem serveru te ga možete i <a href="https://www.opensource-osijek.org/arhixml/" target="_blank">isprobati</a>.

 [1]: https://www.opensource-osijek.org/wordpress/razvoj-cloud-web-portal-platforme-synergy/ "Razvoj cloud web portal platforme Synergy"