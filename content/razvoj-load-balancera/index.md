---
title: Razvoj Load Balancera
author: Hrvoje Horvat
type: page
date: 2013-11-18T09:39:55+00:00

---
# Razvoj Open Source Load Balancera

&nbsp;

# Što je Load Balancer

Load Balancer je mrežni uređaj ili servis koji se koristi u svrhu povećanja kapaciteta i/ili dostupnosti određenog/ih poslužitelja s konkretnim servisima (http,https,dns, &#8230;).

Dakle Load Balancer distribuira opterečenje na više poslužitelja istovremeno.

<li dir="ltr">
  <p dir="ltr">
    Load Balanceri mogu koristiti TCP ili UDP protokol za prijenos podataka.
  </p>
</li>

Oni su izvana vidljivi kao jedna jedina IP adresa &#8211; prema kojoj svi pristupaju.

Iza njih se nalaze stvarni poslužitelji koji opslužuju određeni posao (pr Web poslužitelji [HTTP]) i na koje Load Balancer raspoređuje promet te se brine o svim konekcijama.

&nbsp;

<img alt="Load Balancer osnovni način rada" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2013/11/LB-osnovno.jpg?resize=764%2C348&#038;ssl=1" width="764" height="348" data-recalc-dims="1" />

&nbsp;

Kako to zapravo izgleda od strane interneta , preko Load Balancera do poslužitelja (primjer je isto za http) [ovo je pojednostavljen rad ali dovoljan za razumjevanje]:

<img alt="Od interneta preko Load Balancera do poslužitelja" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2013/11/LB-internet-to-intranet.jpg?resize=636%2C650&#038;ssl=1" width="636" height="650" data-recalc-dims="1" />

**1.** Http promet dolazi do virtualne IP adrese na Load Balanceru (koja je zadužena samo za jedan protokol u ovom slučaju za HTTP promet ) , na port 80 (http)

**2.** Load Balancer primjenjuje jedan od konfiguriranih load balancing algoritama :

  * Round Robin
  * Weighted Round Robin
  * Least Connection
  * Weighted Least Connection
  * &#8230;.

Te šalje pakete dalje,na poslužitelje

**3.** Svaki od poslužitelja kada obradi sve što treba, šalje nazad paket na Load Balancer

**4.** Load Balancer vraća paket nazad na odredište (na internet).

## Monitori stvarnih (real) poslužitelja

<li dir="ltr">
  <p dir="ltr">
    Load Balancer svako malo mora provjeravati dostupnost &#8220;Real Servera&#8221; (fizičkih poslužitelja), i to dostupnosti specifičnih servisa (koje mora biti moguće mijenjati)
  </p>
</li>

Naime nije dovoljno provjeravati samo da li je neki poslužitelj dostupan (pr. **ping** poslužitelja), već je potrebno provjeravati dostupnost konkretniog servisa koji se &#8220;Load balance-ira&#8221; npr. za  HTTP.

Kako to izgleda:

<img alt="Monitoring servera" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2013/11/LB-monitori.jpg?resize=780%2C372&#038;ssl=1" width="780" height="372" data-recalc-dims="1" />

Dakle Monitori Load Balancera (u našem slučaju za HTTP) moraju slati HTTP zahtjeve na sve poslužitelje koje load balance-iramo , i svaki koji uredno odgovori smatramo da je dostupan.

Svi koji su dostupni &#8211; ostaju u grupi poslužitelja na koje se promet load balance-ira.

Oni koji ispadnu iz grupe, jer nisu dostupni,  se nakon nekog vremena ponovno provjeravaju &#8211; da li su u međuvremenu &#8220;oživjeli&#8221;. Ako jesu vračaju se u gupu i ponovno se koriste.

&nbsp;

# Što postoji na tržištu

<li dir="ltr">
  <p dir="ltr">
    Komercijalni uređaji / software
  </p>
  
  <ul>
    <li dir="ltr">
      <p dir="ltr">
        Cijena im je od ~5.000+ U$ na više
      </p>
    </li>
    
    <li dir="ltr">
      <p dir="ltr">
        Rade na TCP i na UDP protokolu :
      </p>
      
      <ul>
        <li dir="ltr">
          <p dir="ltr">
            Podržavaju dosta veliki niz protokola :
          </p>
          
          <ul>
            <li dir="ltr">
              <p dir="ltr">
                http , https , dns , RADIUS , Diameter , &#8230;
              </p>
            </li>
          </ul>
        </li>
        
        <li dir="ltr">
          <p dir="ltr">
            Podržavaju jednaku količinu monitora Real Servera
          </p>
        </li>
      </ul>
    </li>
    
    <li dir="ltr">
      <p dir="ltr">
        Postoji podrška , koja se plaća
      </p>
    </li>
  </ul>
</li>

<li dir="ltr">
  <p dir="ltr">
    Open Source bazirani uređaji / software
  </p>
  
  <ul>
    <li dir="ltr">
      <p dir="ltr">
        Open Source :
      </p>
      
      <ul>
        <li dir="ltr">
          <p dir="ltr">
            Ograničenih mogućnosti , podrška je  od strane zajednice
          </p>
        </li>
      </ul>
    </li>
    
    <li dir="ltr">
      <p dir="ltr">
        Enterprise (komercijalne )verzije bazirane na OpenSource-u:
      </p>
      
      <ul>
        <li dir="ltr">
          <p dir="ltr">
            Sa nešto više mogućnosti , s podrškom
          </p>
        </li>
      </ul>
    </li>
  </ul>
</li>

&nbsp;

## Mane navedenih uređaja

<li dir="ltr">
  <p dir="ltr">
    Komercijalni
  </p>
  
  <ul>
    <li dir="ltr">
      <p dir="ltr">
        Vrlo visoka cijena , kada se uključi podrška i mogućnost update-a , cijene za osnovne modele rastu i preko 20.000 U$
      </p>
      
      <ul>
        <li dir="ltr">
          <p dir="ltr">
            U pravilu je to standardna PC (x86) platforma (nestandarnih dimenzija), u najboljem slučaju sa dodatnim SSL/IPSec hardverskim akceleratorskim karticama
          </p>
        </li>
      </ul>
    </li>
    
    <li dir="ltr">
      <p dir="ltr">
        Gore navedeni specijalizirani hardver (u smislu široke dostupnosti a ne kvalitete/brzine/pouzdanosti) za koji su brzi popravci nemogući,potencijalno dugo čekanje na popravak /  skupi dijelovi (ako je garancija istekla ili ne postoji ugovor 24/7)
      </p>
    </li>
    
    <li dir="ltr">
      <p dir="ltr">
        Podrška uglavnom nije na nivou za koji se plaća
      </p>
    </li>
    
    <li dir="ltr">
      <p dir="ltr">
        Osnovni modeli , sve do najjačih modela ne podržavaju nikakve napredne mrežne mogućnosti za redundanciju (pr. agregacija [LACP] između dva LB i redundantnog Switcha i sl. ). Kod večine proizvođaća to nemaju niti najjači modeli (poput pr Cisco 3750 switcheva , koji imaju mogućnost &#8220;stack&#8221;-iranja) &#8211; dakle po tom pitanju Load Balanceri se  ponašaju se poput običnih PC računala.
      </p>
    </li>
  </ul>
</li>

&nbsp;

<li dir="ltr">
  <p dir="ltr">
    Open Source bazirani
  </p>
  
  <ul>
    <li dir="ltr">
      <p dir="ltr">
        Open source :
      </p>
      
      <ul>
        <li dir="ltr">
          <p dir="ltr">
            Koriste tehnologije koje su dosta zaostale i/ili prespore za ovu namjenu
          </p>
        </li>
      </ul>
    </li>
  </ul>
</li>

<p dir="ltr">
  (pr. korištenje Python-a  i sl.)
</p>

<li dir="ltr">
  <p dir="ltr">
    Nemaju naprednijih mogućnosti koje su potrebne većini koji bi koristili taj uređaj/softver
  </p>
</li>

<li dir="ltr">
  <p dir="ltr">
    Imaju osnovni set monitora Real Servera
  </p>
</li>

<li dir="ltr">
  <p dir="ltr">
    Sveukupno upitne su sve karakteristike uređaja ovisno o hardveru
  </p>
</li>

<li dir="ltr">
  <p dir="ltr">
    Interoperability Testovi i Performace testovi ne postoje ili su upitni
  </p>
</li>

<li dir="ltr">
  <p dir="ltr">
    Enterprise :
  </p>
  
  <ul>
    <li dir="ltr">
      <p dir="ltr">
        Cijena se približava komercijalnim produktima
      </p>
    </li>
    
    <li dir="ltr">
      <p dir="ltr">
        Imaju dodane napredne funkcije koje nedostaju u Open Source varijanti
      </p>
    </li>
    
    <li dir="ltr">
      <p dir="ltr">
        Podrška postoji (plaća se)
      </p>
    </li>
    
    <li dir="ltr">
      <p dir="ltr">
        Interoperability Testovi i Performace testovi ne postoje ili su upitni
      </p>
    </li>
  </ul>
</li>

&nbsp;

# Što mi želimo napraviti

<li dir="ltr">
  <p dir="ltr">
    Dizajnirati uređaj / proizvod :
  </p>
  
  <ul>
    <li dir="ltr">
      <p dir="ltr">
        Poznavajući mrežne potrebe i zahtjeve
      </p>
    </li>
    
    <li dir="ltr">
      <p dir="ltr">
        Poznavajući programske potrebe i zahtjeve
      </p>
    </li>
    
    <li dir="ltr">
      <p dir="ltr">
        Poznavajući slabosti postojećih sustava
      </p>
    </li>
    
    <li dir="ltr">
      <p dir="ltr">
        S iskustvima krajnjih korisnika kao:
      </p>
      
      <ul>
        <li dir="ltr">
          <p dir="ltr">
            Sistem inženjera
          </p>
        </li>
        
        <li dir="ltr">
          <p dir="ltr">
            Mrežnih inženjera
          </p>
        </li>
        
        <li dir="ltr">
          <p dir="ltr">
            Programera
          </p>
        </li>
      </ul>
    </li>
  </ul>
</li>

<li dir="ltr">
  <p dir="ltr">
    Krenuti u razvoj , korištenjem metode razvoja koja je najbliža našem projektu
  </p>
</li>

<li dir="ltr">
  <p dir="ltr">
    Najveći prioriteti nam moraju biti  : KVALITETA , POUZDANOST i BRZINA.
  </p>
</li>

&nbsp;

# Tko će nam trebati

<li dir="ltr">
  <p dir="ltr">
    Sistem administratori i inženjeri
  </p>
</li>

<li dir="ltr">
  <p dir="ltr">
    Mrežni administratori i inženjeri
  </p>
</li>

<li dir="ltr">
  <p dir="ltr">
    Programeri :
  </p>
  
  <ul>
    <li dir="ltr">
      <p dir="ltr">
        Za Web sučelje
      </p>
    </li>
    
    <li dir="ltr">
      <p dir="ltr">
        Za sistemske skripte [veći dio će napraviti sistemaši] (shell i sl.)
      </p>
    </li>
    
    <li dir="ltr">
      <p dir="ltr">
        Potencijalno C , C++ za pristup Linux kernelu i naprednim funkcijama
      </p>
    </li>
  </ul>
</li>

<li dir="ltr">
  Svi ostali koji žele nešto naučiti.
</li>

&nbsp;

&nbsp;