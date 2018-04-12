---
title: Uvod u Linux
author: Hrvoje Horvat
type: page
date: 2013-11-17T14:04:22+00:00

---
[toc]

Priču o Linuxu moramo započeti puno ranije od vremena nastanka, točnije nekih dvadesetak godina ranije.

Ona počinje s razvojem Unix operativnih sustava.

Što je toliko posebno oko UNIX-a ?.

Njegove razne varijante su u upotrebi već desetke godina i  provjerene su u radu u raznim industrijskim  i drugim zahtjevnim okruženjima (telekomi, banke, industrija , vojska,  &#8230; ).

  * Tisuće programa koji čine UNIX/Linux su također u vrlo dugoj upotrebi te su ispolirani/testirani/optimizirani u radu.

&nbsp;

# Povijest Unix-a

<li dir="ltr">
  <p dir="ltr">
    Razvijen 1969 u “AT&T Bell labs”
  </p>
  
  <ul>
    <li dir="ltr">
      <p dir="ltr">
        1.1.1970 se smatra rođenjem Unixa
      </p>
    </li>
  </ul>
</li>

<li dir="ltr">
  <p dir="ltr">
    Od tada postoje mnoge varijante:
  </p>
  
  <ul>
    <li dir="ltr">
      <p dir="ltr">
        BSD, SUN OS (kasnije Solaris), IRIX, HP-UX, AIX, Digital UNIX, NeXTSTEP (kasnije Mac OS/IOS), QNX, Minix , &#8230;
      </p>
    </li>
    
    <li dir="ltr">
      Razvoj UNIX-a od 1969 do danas vidljiv je u ovom dokumentu (koji se stalno osvježava) : <p dir="ltr" style="display: inline !important;">
        <a href="http://www.levenez.com/unix/unix.pdf">http://www.levenez.com/unix/unix.pdf</a>
      </p>
    </li>
  </ul>
</li>

<li dir="ltr">
  <p dir="ltr">
    Koristi se na različitim arhitekturama:
  </p>
  
  <ul>
    <li dir="ltr">
      <p dir="ltr">
        x86, PowerPC, mips, SPARC, ARM, &#8230;
      </p>
    </li>
  </ul>
</li>

&nbsp;

## O Unix-u

Što je uopće Unix i što nam sve omogućava:

<li dir="ltr">
  <p dir="ltr">
    On podržava multitasking &#8211; tj. pokretanje ili izvršavanje više zadataka (programa) istovremeno
  </p>
</li>

<li dir="ltr">
  <p dir="ltr">
    Podržava multiuser rad &#8211; moguć je rad više korisnika istovremeno
  </p>
</li>

<li dir="ltr">
  <p dir="ltr">
    Interaktivan je (izvođenje naredbi je trenutno)
  </p>
</li>

&nbsp;

<span style="line-height: 1.5;">Osnovna filozofija Unix-a kaže  :</span>

**“Everything is a file”   &#8211;  Sve je datoteka **i prema tome baratanje sa samim operativnim sustavom, njegovim aplikacijama i njegovim hardverom je vrlo jednostavno te je moguće skriptirati i automatizirati svaki djelić sustava, prema potrebi.

Za sada samo dobro upamtite : **“Everything is a file”**

&nbsp;

# Povijest Open Source-a i Linux-a

Za razumjevanje razvoja Linux-u bitno je razumjeti i razvoj Open Source-a. Ali krenimo od početka. 1983. godine  &#8211; pokreće se  “Free Software Movement” te godinu dana kasnije (1983/84) Richard Stallman pokreće GNU projekt koji 1984 kreće s razvojem prvih programa.

Naime želja je bila sve programe koji postoje u komercijalnim Unix opeativnim sustavima prepisati &#8220;od nule&#8221;  (ne koristeći niti jednu liniju koda &#8211; jer bi to bilo kršenje autorskih prava) tj. napisati nove programe s istom ili proširenom funkcionalnosti i objaviti ih pod nekom od Open Source Licenci.

Veći dio ovog posla (dakle ovdje govorimo o tisućama programa) je dovršen negdje u toku 1992. godine.

Neovisno o razvoju FSF i GNU  1991. godine  Linus Torvalds razvija jezgru (Kernel) i slijedi logičan korak tj. povezivanje tisuća programa pisanih unutar GNU pokreta i kernela. Od tog trenutka povezano je sve što je bilo potrebno za stvaranje novog operativnog sustava danas poznatog pod nazivom Linux (GNU Linux).

Od tada do danas pojavile su se razne varijante Linux-a, od kojih su se ustalile tri grane na osnovi kojih su nastali na deseci drugih Linux distribucija:

  * Debian
  * Slackware
  * RedHat

Nešto više detalja možete vidjeti na :

<https://www.opensource-osijek.org/wordpress/predavanja/etfos-predavanje-sto-kako-i-zasto-open-source/>

&nbsp;

Slika prikazuje razvoj Linux-a , od 1991 do danas :

<img alt="Povijest linux-a 1.dio" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/02/Linux-timeline-part1.png?resize=2020%2C2137&#038;ssl=1" width="2020" height="2137" data-recalc-dims="1" />

<img alt="Povijest Linux-a 2. dio" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/02/Linux-timeline-part2.png?resize=2020%2C885&#038;ssl=1" width="2020" height="885" data-recalc-dims="1" />

<img alt="Povijest Linux-a 3. dio" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/02/Linux-timeline-part3.png?resize=2019%2C1447&#038;ssl=1" width="2019" height="1447" data-recalc-dims="1" />

<img alt="Povijst Linux-a 4. dio" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/02/Linux-timeline-part4.png?ssl=1" data-recalc-dims="1" />

&nbsp;

# Što čini Unix / Linux:

&nbsp;

<li dir="ltr">
  <p dir="ltr">
    Kernel:
  </p>
  
  <ul>
    <li dir="ltr">
      <p dir="ltr">
        boot code
      </p>
    </li>
    
    <li dir="ltr">
      <p dir="ltr">
        driveri
      </p>
    </li>
    
    <li dir="ltr">
      <p dir="ltr">
        memory & file management
      </p>
    </li>
  </ul>
</li>

<li dir="ltr">
  <p dir="ltr">
    Razvojno okruženje:
  </p>
  
  <ul>
    <li dir="ltr">
      <p dir="ltr">
        Compileri, linkeri, &#8230;
      </p>
    </li>
    
    <li dir="ltr">
      <p dir="ltr">
        System Library, …
      </p>
    </li>
    
    <li dir="ltr">
      <p dir="ltr">
        Debugger-i
      </p>
    </li>
  </ul>
</li>

&nbsp;

<li dir="ltr">
  <p dir="ltr">
    User interface:
  </p>
  
  <ul>
    <li dir="ltr">
      <p dir="ltr">
        Komandno linijski interface (shell)
      </p>
    </li>
    
    <li dir="ltr">
      <p dir="ltr">
        Grafičko sučelje
      </p>
    </li>
    
    <li dir="ltr">
      <p dir="ltr">
        Ostali programi (GNU)
      </p>
    </li>
  </ul>
</li>

<li dir="ltr">
  <p dir="ltr">
    Dokumentacija
  </p>
</li>

&nbsp;

# Osnovne naredbe vezane uz operativni sustav

&nbsp;

<li dir="ltr">
  <p dir="ltr">
    <span class="lang:sh decode:true  crayon-inline ">uname</span>  : ispiše osnovne sistem informacije
  </p>
</li>

<li dir="ltr">
  <p dir="ltr">
    <span class="lang:sh decode:true  crayon-inline ">dmesg</span>  : ispiše sistemske poruke
  </p>
</li>

<p dir="ltr">
                  (HW Events)
</p>

<li dir="ltr">
  <p dir="ltr">
    <span class="lang:sh decode:true  crayon-inline ">dmidecode</span>  : ispiše DMI (SMBIOS) info
  </p>
</li>

<li dir="ltr">
  <p dir="ltr">
    sadržaj <span class="lang:sh decode:true  crayon-inline ">/proc/</span>  direktorija
  </p>
</li>

<li dir="ltr">
  <p dir="ltr">
    <span class="lang:sh decode:true  crayon-inline ">lspci</span>  : ispiše sve PCI uređaje
  </p>
</li>

&nbsp;

# Datotečni sustav

(File System)

&nbsp;

<li dir="ltr">
  <p dir="ltr">
    Sadrži :
  </p>
  
  <ul>
    <li dir="ltr">
      <p dir="ltr">
        direktorije,
      </p>
    </li>
    
    <li dir="ltr">
      <p dir="ltr">
        datoteke i
      </p>
    </li>
    
    <li dir="ltr">
      <p dir="ltr">
        I-node tablice
      </p>
    </li>
  </ul>
</li>

<li dir="ltr">
  <p dir="ltr">
    I-node tablica sadrži zapis za svaku datoteku i direktorij:
  </p>
  
  <ul>
    <li dir="ltr">
      <p dir="ltr">
        owner, group, r w x , &#8230;
      </p>
    </li>
  </ul>
</li>

&nbsp;

# Struktura datoteka i direktorija

<li dir="ltr">
  <p dir="ltr">
    Razlikuju se velika i mala slova
  </p>
</li>

<li dir="ltr">
  <p dir="ltr">
    Koristi se hijerarhijska struktura direktorija
  </p>
</li>

<li dir="ltr">
  <p dir="ltr">
    Struktura direktorija je u obliku stabla
  </p>
</li>

<li dir="ltr">
  <p dir="ltr">
    Osnovne grane su već definirane i rezervirane za operacijski sustav
  </p>
</li>

<li dir="ltr">
  <p dir="ltr">
    Imena mogu biti dužine 255 znakova, mogu se koristiti svi znakovi osim:
  </p>
</li>

<p dir="ltr">
  <strong>! @ $ ^ & * , ; &#8216; ` &#8220;( ){ } [ ] < > | / \ ? ~ razmak</strong>
</p>

&nbsp;

# Struktura sistemskih direktorija

Struktura sistemskih direktorija je definirana unutar FHS (Filesystem Hierarchy Standard).

Osnovna struktura sistemskih direktorija izgleda ovako:

<img alt="" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2013/11/Unix-struktura-systemskih-direktorija.jpg?resize=877%2C199&#038;ssl=1" width="877" height="199" data-recalc-dims="1" />

<span class="lang:default decode:true  crayon-inline ">/bin</span>    &#8211;  Osnovne sistemske naredbe (binaries), koje moraju biti dostupne i u single user mode-u rada

<span class="lang:default decode:true  crayon-inline ">/boot</span>   &#8211; sve što je potrebno za boot (podizanje) Linux sustava [boot loader-i : kernel, initrd , &#8230;]

<span class="lang:default decode:true  crayon-inline ">/dev </span>  &#8211;  svi uređaji (devices) i hardver te posebne datoteke

<span class="lang:default decode:true  crayon-inline ">/etc</span>   &#8211; Sve konfiguracijske datoteke

<span class="lang:default decode:true  crayon-inline ">/home</span>   &#8211; direktoriji korisnika (home directory)

<span class="lang:default decode:true  crayon-inline ">/lib</span>   &#8211; sve sistemske biblioteke te biblioteke za razne aplikacije(library)

<span class="lang:default decode:true  crayon-inline ">/proc</span>   &#8211; virtualni file system koji daje informacije o svim procesima i poruke kernela

<span class="lang:default decode:true  crayon-inline ">/usr</span>    &#8211;  ovdje se nalaze višekorisnički (multiuser) programi , podaci itd.

<span class="lang:default decode:true  crayon-inline ">/var</span>   &#8211; varijabilni (promijenjivi) podaci , poput log datoteka, cache datoteka i sl.

&nbsp;

# Direktoriji i datoteke

&nbsp;

<p dir="ltr">
  Tipovi direktorija i datoteka [potpuno lijeva oznaka]:
</p>

&nbsp;

<li dir="ltr">
  <p dir="ltr">
    Direktorij [<span class="lang:default decode:true  crayon-inline ">d</span> ]
  </p>
</li>

&nbsp;

<li dir="ltr">
  <p dir="ltr">
    Obična datoteka [<span class="lang:default decode:true  crayon-inline ">&#8211;</span> ]
  </p>
</li>

&nbsp;

<li dir="ltr">
  Posebna datoteka &#8211; posebna datoteka, predstavlja:
</li>
<li dir="ltr">
  <ul>
    <li dir="ltr">
      <ul>
        <li dir="ltr">
          <p dir="ltr">
            Logičku jedinicu: (pr.   /dev/zero , /dev/random ) ,
          </p>
          
          <ul>
            <li dir="ltr">
              <p dir="ltr">
                Tipovi :
              </p>
              
              <ul>
                <li dir="ltr">
                  <p dir="ltr">
                    Simbolički link [<span class="lang:default decode:true  crayon-inline ">l</span> ]
                  </p>
                </li>
                
                <li dir="ltr">
                  <p dir="ltr">
                    “Named pipe” datoteka ili samo “pipe” (FIFOs) [<span class="lang:default decode:true  crayon-inline ">p</span> ]
                  </p>
                </li>
                
                <li dir="ltr">
                  <p dir="ltr">
                    Socket file [<span class="lang:default decode:true  crayon-inline ">s</span> ]
                  </p>
                </li>
              </ul>
            </li>
          </ul>
        </li>
        
        <li dir="ltr">
          <p dir="ltr">
            Hardware :
          </p>
          
          <ul>
            <li dir="ltr">
              <p dir="ltr">
                Block : barata s IO, blokovima podataka [<span class="lang:default decode:true  crayon-inline ">b</span> ]
              </p>
            </li>
            
            <li dir="ltr">
              <p dir="ltr">
                Character device: barata s IO, karakterima (znakovima) [<span class="lang:default decode:true  crayon-inline ">c</span> ]
              </p>
            </li>
          </ul>
        </li>
      </ul>
    </li>
  </ul>
</li>

&nbsp;

##  Primjeri :

<pre class="lang:sh highlight:0 decode:true">ls -al /</pre>

<pre class="lang:default decode:true">drwxr-xr-x 20 root root 4096 Jun 13 12:53 ./
drwxr-xr-x 20 root root 4096 Jun 13 12:53 ../
drwxr-xr-x 2 root root 4096 Mar 25 2011 bin/
drwxr-xr-x 2 root root 4096 Oct 6 1997 boot/
drwxr-xr-x 17 root root 69632 Nov 11 15:20 dev/
drwxr-xr-x 19 root root 4096 Nov 11 15:20 etc/
drwxr-xr-x 2 root root 4096 Oct 6 1997 home/
drwxr-xr-x 4 root root 4096 May 4 2011 lib/
dr-xr-xr-x 17 root root 0 Nov 11 15:20 proc/
drwxr-xr-x 15 root root 4096 Jun 13 12:53 usr/
drwxr-xr-x 11 root root 4096 Jun 13 12:53 var/</pre>

&nbsp;

<pre class="lang:sh highlight:0 decode:true">ls -al /dev/sda1

brw-rw----. 1 root disk 8, 1 Nov 11 17:36 /dev/sda1

ls -al /dev/ttyS0

crw-rw----. 1 root dialout 4, 64 Nov 11 17:36 /dev/ttyS0

ls -al /dev/cdrom

lrwxrwxrwx. 1 root root 3 Nov 11 17:36 /dev/cdrom -&gt; sr1</pre>

### Primjeri napredno:

&nbsp;

<p dir="ltr">
  <strong>“Named pipe”</strong>
</p>

&nbsp;

<p dir="ltr">
  Kreiranje “Named pipe” datoteke
</p>

<pre class="lang:sh decode:true">mkfifo my_pipe</pre>

&nbsp;

<p dir="ltr">
  <span style="line-height: 1.5;">Kreirati ćemo “pipe” koji će komprimirati sve što uđe u njega i stvoriti komprimiranu datoteku</span>
</p>

&nbsp;

<pre class="lang:sh decode:true">gzip -9 -c &lt; my_pipe &gt; komprimirana.datoteka.gz &</pre>

&nbsp;

&nbsp;

&nbsp;

<span style="background-color: #ffffff;"> </span>Sada ćemo poslati svoju datoteku (datoteka.txt) da se komprimira

<p dir="ltr">
  <pre class="lang:default decode:true">cat datoteka.txt &gt; my_pipe</pre>
  
  <p>
    &nbsp;
  </p>
  
  <p dir="ltr">
    Brisanje “Named pipe” datoteke (isto kao i za bilo koju drugu datoteku)
  </p>
  
  <p dir="ltr">
    <pre class="lang:default decode:true">rm my_pipe</pre>
    
    <p dir="ltr">
      <p>
         Kao što smo i prije rekli, sada postaje jasno  da <strong>“Everything is a file” </strong>ima sve više smisla.
      </p>
      
      <p>
        Evo još nekoliko primjera (<strong>NAPREDNO</strong>).
      </p>
      
      <p>
        Dakle <span class="lang:default decode:true  crayon-inline ">/dev/zero</span>   je posebna datoteka koja je generator nula (0), koju ćemo iskoristiti za generiranje nula unutar jedne datoteke, imena  sve.nule.txt . Osim toga  želimo da veličina datoteke bude 1024 byte-a.
      </p>
      
      <p>
        Za rad s ovom posebnom datotekom koristiti ćemo program disk dump (<span class="lang:default decode:true  crayon-inline ">dd</span> ), koji se koristi za konvertiranje i kopiranje datoteka, a pošto je u Unix/Linux svijetu sve datoteka, to ćemo i iskoristiti.
      </p>
      
      <p>
        Ali prvo da vidimo koje sve prekidaće naredba <span class="lang:default decode:true  crayon-inline ">dd</span>  ima.
      </p>
      
      <p>
        Evo nekoliko osnovnih:
      </p>
      
      <ul>
        <li>
          <span class="lang:default decode:true  crayon-inline">if</span>  &#8211; input file (ulazna datoteka)
        </li>
        <li>
          <span class="lang:default decode:true  crayon-inline">of</span>   &#8211; output file (izlazna datoteka)
        </li>
        <li>
          <span class="lang:default decode:true  crayon-inline">bs</span>  &#8211; koliko byte-a da čita/piše odjednom (ovo se smatra jednim blokom podataka)
        </li>
        <li>
          <span class="lang:default decode:true  crayon-inline">count</span>  &#8211; koliko blokova podataka (iz pr. <span class="lang:default decode:true  crayon-inline ">bs</span> ) dozvoljavamo da se obradi
        </li>
      </ul>
      
      <p dir="ltr">
        -ograničiti ćemo veličinu bloka (<span class="lang:default decode:true  crayon-inline ">bs=1024</span> ) na 1024 byte-a i to samo s jednim ponavljanjem (<span class="lang:default decode:true  crayon-inline">count=1</span> )
      </p>
      
      <pre class="lang:default decode:true">dd if=/dev/zero of=/neki-direktorij/sve.nule.txt bs=1024 count=1
1+0 records in
1+0 records out
1024 bytes (1.0 kB) copied, 5.8944e-05 s, 170.4 MB/s</pre>
      
      <p>
        Drugi primjer će biti kopiranje cijele diskete (/dev/fd0) u datoteku:
      </p>
      
      <p>
        <span class="lang:default decode:true  crayon-inline">/neki-direktorij/disketa.img</span>
      </p>
      
      <p>
        &nbsp;
      </p>
      
      <pre class="lang:default decode:true">dd if=/dev/fd0 of=/neki-direktorij/disketa.img</pre>
      
      <p>
        Sada ćemo koristiti posebnu datoteku, koja generira slučajne brojeve, vrlo brzo (<span class="lang:default decode:true  crayon-inline">/dev/urandom</span>) i pomoću nje generirati datoteku veličine 1MB, imena <span class="lang:default decode:true  crayon-inline ">test.file</span> .
      </p>
      
      <p>
        Dakle u blokovima od 1024 byte-a , 1k (1000) puta.
      </p>
      
      <pre class="lang:default decode:true"> dd if=/dev/urandom of=/neki-direktorij/test.file bs=1024 count=1k
1024+0 records in
1024+0 records out
1048576 bytes (1.0 MB) copied, 0.0715332 s, 140.7 MB/s</pre>
      
      <p>
        &nbsp;
      </p>
      
      <p>
        &nbsp;
      </p>
      
      <p dir="ltr">
        <p dir="ltr">
          <h1>
            Putanje (PATH):
          </h1>
          
          <p dir="ltr">
            Putanja do neke datoteke može biti:
          </p>
          
          <ul>
            <li dir="ltr">
              <p dir="ltr">
                Apsolutna (počinje od <span class="lang:default decode:true  crayon-inline ">/</span> )
              </p>
              
              <ul>
                <li dir="ltr">
                  <p dir="ltr">
                    pr datoteka messages.:    <span class="lang:default decode:true  crayon-inline ">/var/log/messages</span>
                  </p>
                </li>
              </ul>
            </li>
            
            <li dir="ltr">
              <p dir="ltr">
                Relativna (počinje od trenutnog direktorija)
              </p>
              
              <ul>
                <li dir="ltr">
                  <p dir="ltr">
                    pr.: nalazimo se u  /var pa je putanja do datoteke:  <span class="lang:default decode:true  crayon-inline "> log/messages</span>
                  </p>
                </li>
              </ul>
            </li>
          </ul>
          
          <p>
            &nbsp;
          </p>
          
          <p>
            &nbsp;
          </p>
          
          <h1>
            Ovlasti (permissions & modes)
          </h1>
          
          <p>
            &nbsp;
          </p>
          
          <p dir="ltr">
            Svaki direktorij i datokeka imaju određene ovlasti (mijenjaju se sa: <span class="lang:default decode:true  crayon-inline ">chown</span> ):
          </p>
          
          <ul>
            <li dir="ltr">
              <p dir="ltr">
                Prema vlasniku (owner)
              </p>
            </li>
            
            <li dir="ltr">
              <p dir="ltr">
                Prema grupi (group)
              </p>
            </li>
          </ul>
          
          <p dir="ltr">
            Osim toga postoje i prava pristupa i rada
          </p>
          
          <p dir="ltr">
            (mijenjaju se sa : <span class="lang:default decode:true  crayon-inline ">chmod</span> )
          </p>
          
          <ul>
            <li dir="ltr">
              <p dir="ltr">
                Pravo čitanja (Read)
              </p>
            </li>
            
            <li dir="ltr">
              <p dir="ltr">
                Pravo pisanja (Write)
              </p>
            </li>
          </ul>
          
          <p>
            Pravo izvršavanja/pokretanja (Execute)
          </p>
          
          <p>
            &nbsp;
          </p>
          
          <h2 dir="ltr">
            Što nam govore ovlasti
          </h2>
          
          <p dir="ltr">
            (od lijevo na desno):
          </p>
          
          <p>
            Pr. Izlistanje direktorija <span class="lang:default decode:true  crayon-inline ">/bin</span>  iz root (<span class="lang:default decode:true  crayon-inline ">/</span> ) direktorija:
          </p>
          
          <pre class="lang:default decode:true">drwxr-xr-x 20 root root  4096 Jun 13 12:53 /bin</pre>
          
          <p>
            <strong> </strong>d<strong>rwx<span style="color: #ff0000;">r-x</span><span style="color: #0000ff;">r-x</span>  &#8230;. &#8230;.. &#8230; .. .. . . .. .. . . . .. . .. .. . .. &#8230;.. /bin</strong>
          </p>
          
          <ul>
            <li dir="ltr">
              Prvi znak ima posebno značenje (pogledati <a href="https://www.opensource-osijek.org/wordpress/uvod-u-linux/#Direktoriji_i_datoteke">Direktoriji i datoteke</a> &#8211; gore)  [u ovom slučaju d ]
            </li>
            <li dir="ltr">
              <p dir="ltr">
                Prvi niz od tri znaka (oktet) su za vlasnika (owner) [u ovom slučaju <strong>rwx</strong>]
              </p>
            </li>
            
            <li dir="ltr">
              <p dir="ltr">
                Drugi niz od tri znaka (oktet) su za grupu (group) [u ovom slučaju <span style="color: #ff0000;"><strong>r-x</strong></span>]
              </p>
            </li>
            
            <li dir="ltr">
              <p dir="ltr">
                Treći niz od tri znaka (oktet) su za sve ostale (others) [u ovom slučaju <span style="color: #0000ff;"><strong>r-x</strong></span>]
              </p>
            </li>
          </ul>
          
          <p dir="ltr">
            Napomena : postoji i iznimka za zadnja tri znaka &#8211; umjesto Execute  [<span class="lang:default decode:true  crayon-inline ">x</span> ] , mogu biti i :
          </p>
          
          <ul>
            <li dir="ltr">
              <p dir="ltr">
                <span class="lang:default decode:true  crayon-inline ">s</span>  ili <span class="lang:default decode:true  crayon-inline ">t</span>  :
              </p>
              
              <ul>
                <li dir="ltr">
                  <p dir="ltr">
                    executable and setuid(<span class="lang:default decode:true  crayon-inline ">s</span> )/setgid(<span class="lang:default decode:true  crayon-inline ">s</span> ) [enable non root to execute]
                  </p>
                </li>
                
                <li dir="ltr">
                  <p dir="ltr">
                    or sticky (<span class="lang:default decode:true  crayon-inline ">t</span> ) [no rename or delete if not owner]
                  </p>
                </li>
              </ul>
            </li>
          </ul>
          
          <p>
            &nbsp;
          </p>
          
          <table>
            <colgroup> <col width="214px" /> <col width="214px" /> <col width="214px" /> <col width="214px" /></colgroup> <tr>
              <td>
                <p dir="ltr">
                  <strong>rwx (Bin)</strong>
                </p>
                
                <p dir="ltr">
                  111
                </p>
                
                <p dir="ltr">
                  110
                </p>
                
                <p dir="ltr">
                  101
                </p>
                
                <p dir="ltr">
                  100
                </p>
                
                <p dir="ltr">
                  011
                </p>
                
                <p dir="ltr">
                  010
                </p>
                
                <p dir="ltr">
                  001
                </p>
                
                <p dir="ltr">
                  000
                </p>
              </td>
              
              <td>
                <p dir="ltr">
                  <strong>Permissions</strong>
                </p>
                
                <p dir="ltr">
                  Full
                </p>
                
                <p dir="ltr">
                  read and write
                </p>
                
                <p dir="ltr">
                  read and execute
                </p>
                
                <p dir="ltr">
                  read only
                </p>
                
                <p dir="ltr">
                  write and execute
                </p>
                
                <p dir="ltr">
                  write only
                </p>
                
                <p dir="ltr">
                  execute only
                </p>
                
                <p dir="ltr">
                  none
                </p>
              </td>
              
              <td>
                <p dir="ltr">
                  <strong>Symbolic notation</strong>
                </p>
                
                <p dir="ltr">
                  -rwxrwxrwx
                </p>
                
                <p dir="ltr">
                  -rw-rw-rw-
                </p>
                
                <p dir="ltr">
                  -r-xr-xr-x
                </p>
                
                <p dir="ltr">
                  -r&#8211;r&#8211;r&#8211;
                </p>
                
                <p dir="ltr">
                  &#8211;wx-wx-wx
                </p>
                
                <p dir="ltr">
                  &#8211;w&#8211;w&#8211;w-
                </p>
                
                <p dir="ltr">
                  &#8212;x&#8211;x&#8211;x
                </p>
                
                <p dir="ltr">
                  &#8212;&#8212;&#8212;-
                </p>
              </td>
              
              <td>
                <p dir="ltr">
                  <strong>Octal notation</strong>
                </p>
                
                <p dir="ltr">
                  0777
                </p>
                
                <p dir="ltr">
                  0666
                </p>
                
                <p dir="ltr">
                  0555
                </p>
                
                <p dir="ltr">
                  0444
                </p>
                
                <p dir="ltr">
                  0333
                </p>
                
                <p dir="ltr">
                  0222
                </p>
                
                <p dir="ltr">
                  0111
                </p>
                
                <p dir="ltr">
                  0000
                </p>
              </td>
            </tr>
          </table>
          
          <p>
            &nbsp;
          </p>
          
          <h2>
            Rad s direktorijima i datotekama
          </h2>
          
          <p>
            <strong>Primjer izlistanja datoteke i direktorija:</strong>
          </p>
          
          <p>
            &nbsp;
          </p>
          
          <p dir="ltr">
            <strong><img alt="File permissions" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2013/11/permissions-on-file.jpg?resize=545%2C184&#038;ssl=1" width="545" height="184" data-recalc-dims="1" /></strong>
          </p>
          
          <p dir="ltr">
            <p>
              &nbsp;
            </p>
            
            <ul>
              <li dir="ltr">
                <p dir="ltr">
                  <strong>(1)</strong>  Ovlasti/permissions (objašnjeno nešto prije)
                </p>
              </li>
              
              <li dir="ltr">
                <p dir="ltr">
                  <strong>(2)</strong>  Brojčana vrijednost  :
                </p>
                
                <ul>
                  <li dir="ltr">
                    <p dir="ltr">
                      Za datoteke broj hard linkova na tu datoteku (obično 1)
                    </p>
                  </li>
                  
                  <li dir="ltr">
                    <p dir="ltr">
                      Za direktorije broj poddirektorija +2 (ako ih nema onda je 2 , ako sadrži 1 poddirektorij onda je vrijednost 3 , &#8230; )
                    </p>
                  </li>
                </ul>
              </li>
              
              <li dir="ltr">
                <p dir="ltr">
                  <strong>(3)  </strong>Tko je vlasnik (root)
                </p>
              </li>
              
              <li dir="ltr">
                <p dir="ltr">
                  <strong>(4)</strong>  Kojoj grupi pripada (server)
                </p>
              </li>
              
              <li dir="ltr">
                <p dir="ltr">
                  <strong>(5)</strong>  Veličina :
                </p>
                
                <ul>
                  <li dir="ltr">
                    <p dir="ltr">
                      Za datoteke &#8211; veličina datoteke
                    </p>
                  </li>
                  
                  <li dir="ltr">
                    <p dir="ltr">
                      Za direktorij &#8211; veličina za metapodatke za datoteke unutar tog direktorija (obično je to default veličina bloka datotečnog sustava [ext2/3/4/]) i može rasti
                    </p>
                  </li>
                </ul>
              </li>
              
              <li dir="ltr">
                <p dir="ltr">
                  <strong>(6)</strong>  Datum zadnje izmjene
                </p>
              </li>
              
              <li dir="ltr">
                <p dir="ltr">
                  <strong>(7)</strong>  Ime datoteke/direktorija
                </p>
              </li>
            </ul>
            
            <p>
              &nbsp;
            </p>
            
            <p>
              &nbsp;
            </p>
            
            <p>
              &nbsp;
            </p>
            
            <h2>
               Umask
            </h2>
            
            <ul>
              <li dir="ltr">
                <p dir="ltr">
                  Kada kreiramo bilo koji direktorij ili datoteku ona se kreira s određenim (definiranim) ovlastima, koje se čitaju iz sistemske varijable umask
                </p>
              </li>
            </ul>
            
            <p dir="ltr">
              (default je 022). Obično je definirana u :<span class="lang:default decode:true  crayon-inline "> /etc/profile</span>
            </p>
            
            <ul>
              <li dir="ltr">
                <p dir="ltr">
                  Vrijednost umask varijable oduzima se od:
                </p>
                
                <ul>
                  <li dir="ltr">
                    <p dir="ltr">
                      Max. vrijednosti za direktorije (777)
                    </p>
                    
                    <ul>
                      <li dir="ltr">
                        <p dir="ltr">
                          777 &#8211; 022 = 755
                        </p>
                      </li>
                    </ul>
                  </li>
                  
                  <li dir="ltr">
                    <p dir="ltr">
                      Max. vrijednosti za datoteke (666)
                    </p>
                    
                    <ul>
                      <li dir="ltr">
                        <p dir="ltr">
                          666 &#8211; 022 = 644
                        </p>
                      </li>
                    </ul>
                  </li>
                </ul>
              </li>
            </ul>
            
            <p>
              &nbsp;
            </p>
            
            <h2>
              Primjeri
            </h2>
            
            <p dir="ltr">
              Promijeni vlasnika u pero i grupu u server za datoteku /root/podaci/test.sh
            </p>
            
            <p dir="ltr">
              <pre class="lang:default decode:true">chown pero:server /root/podaci/test.sh</pre>
              
              <p dir="ltr">
                <p>
                  &nbsp;
                </p>
                
                <p dir="ltr">
                  <p>
                    &nbsp;
                  </p>
                  
                  <p dir="ltr">
                    Promijeni ovlasti na datoteci /root/podaci/test.sh da bude i izvršna (read+write+execute), samo za vlasnika
                  </p>
                  
                  <p dir="ltr">
                    <pre class="lang:default decode:true">chmod 0744 /root/podaci/test.sh</pre>
                    
                    <p dir="ltr">
                      <p dir="ltr">
                        Promijeni vlasnika (pero) i grupu (server) za direktorij /root/podaci te sve poddirektorije i sve datoteke rekurzivno
                      </p>
                      
                      <p dir="ltr">
                        <pre class="lang:default decode:true">chown -R pero:server /root/podaci</pre>
                        
                        <p dir="ltr">
                          <p>
                            &nbsp;
                          </p>
                          
                          <p dir="ltr">
                            <p>
                              &nbsp;
                            </p>
                            
                            <p>
                              &nbsp;
                            </p>
                            
                            <h1>
                              Datotečni sustav (File System) detaljnije
                            </h1>
                            
                            <p>
                              &nbsp;
                            </p>
                            
                            <p dir="ltr">
                              O Datotekama:
                            </p>
                            
                            <ul>
                              <li dir="ltr">
                                <p dir="ltr">
                                  Svaka datoteka se na nivou file sustava sastoji od:
                                </p>
                                
                                <ul>
                                  <li dir="ltr">
                                    <p dir="ltr">
                                      Dijela s podacima “Data”:
                                    </p>
                                    
                                    <ul>
                                      <li dir="ltr">
                                        <p dir="ltr">
                                          ovaj dio je asociran s I-node unosom u I-node tablici
                                        </p>
                                      </li>
                                    </ul>
                                  </li>
                                  
                                  <li dir="ltr">
                                    <p dir="ltr">
                                      Dijela s imenom datoteke “Filename (1)”
                                    </p>
                                  </li>
                                </ul>
                              </li>
                            </ul>
                            
                            <p>
                              Dakle ovak oizgleda datoteka na Linux File Sistemu (pr.  ext/3/4 ) ili na Unix file sistemu (pr. UFS):
                            </p>
                            
                            <p>
                              <img alt="" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2013/11/Datoteka1.jpg?resize=642%2C78&#038;ssl=1" width="642" height="78" data-recalc-dims="1" />
                            </p>
                            
                            <p>
                              &nbsp;
                            </p>
                            
                            <h2>
                              Hard Linkovi
                            </h2>
                            
                            <p>
                              Podaci unutar svake datoteke se zapravo nalaze unutar i-node-a.
                            </p>
                            
                            <p>
                              Hard link nastaje kada se u dijelu datoteke u kojem je i-node broj koristi i-node broj unutar kojeg su zapisani podaci od neke druge datoteke:
                            </p>
                            
                            <p>
                              <img style="line-height: 1.5;" alt="Hard Link" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2013/11/Hard-Link.jpg?resize=937%2C427&#038;ssl=1" width="937" height="427" data-recalc-dims="1" />
                            </p>
                            
                            <p>
                              &nbsp;
                            </p>
                            
                            <h3>
                              Prednosti i mane Hard Linkova:
                            </h3>
                            
                            <ul>
                              <li dir="ltr">
                                <p dir="ltr">
                                  Mogu se kreirati samo unutar jedne particije jer i-node tablica postoji za svaki file system/particiju zasebno
                                </p>
                              </li>
                              
                              <li dir="ltr">
                                <p dir="ltr">
                                  Brisanjem izvorne datoteke podaci ostaju sve dok postoji barem jedan hard link
                                </p>
                              </li>
                              
                              <li dir="ltr">
                                <p dir="ltr">
                                  Mogu se linkati samo datoteke, ne i direktoriji uz iznimku:
                                </p>
                                
                                <ul>
                                  <li dir="ltr">
                                    <p dir="ltr">
                                      Kada se kreira svaki novi direktorij ( mkdir ) kreira se hard link:
                                    </p>
                                    
                                    <ul>
                                      <li dir="ltr">
                                        <p dir="ltr">
                                          Jedan za roditeljski (parent)  ( .. ) ==>  ima isti inode broj kao parent
                                        </p>
                                      </li>
                                      
                                      <li dir="ltr">
                                        <p dir="ltr">
                                          Jedan za trenutni direktorij ( . ) ==> ima novi inode broj
                                        </p>
                                      </li>
                                    </ul>
                                  </li>
                                </ul>
                              </li>
                              
                              <li dir="ltr">
                                <p dir="ltr">
                                  Teže ih je primjetiti i pratiti jer se mora gledati broj linkova i i-node broj
                                </p>
                              </li>
                            </ul>
                            
                            <p>
                              &nbsp;
                            </p>
                            
                            <h4>
                              Primjeri
                            </h4>
                            
                            <p dir="ltr">
                              Kreirajmo datoteku imena text.txt
                            </p>
                            
                            <p dir="ltr">
                              <pre class="lang:default decode:true">echo “probni text” &gt; text.txt</pre>
                              
                              <p dir="ltr">
                                <p>
                                  <span style="line-height: 1.5;">Napravimo Hard link na nju</span>
                                </p>
                                
                                <p dir="ltr">
                                  (nova datoteka će se zvati hard.link)
                                </p>
                                
                                <p dir="ltr">
                                  <pre class="lang:default decode:true">ln text.txt hard.link</pre>
                                  
                                  <p dir="ltr">
                                    <p>
                                      &nbsp;
                                    </p>
                                    
                                    <p dir="ltr">
                                      Provjerimo kako to izgleda
                                    </p>
                                    
                                    <p dir="ltr">
                                      <pre class="lang:default decode:true">ls -ali</pre>
                                      
                                      <p dir="ltr">
                                        <pre class="lang:default decode:true">5636110 drwxr-xr-x  2 root root 4096 Nov 13 09:47 .
5636097 dr-xr-x---. 4 root root 4096 Nov 13 09:28 ..
5636111 -rw-r--r--  2 root root    5 Nov 13 21:29 text.txt 
5636111 -rw-r--r--  2 root root    5 Nov 13 21:29 hard.link</pre>
                                        
                                        <p dir="ltr">
                                          <p>
                                            &nbsp;
                                          </p>
                                          
                                          <p dir="ltr">
                                            <p>
                                              &nbsp;
                                            </p>
                                            
                                            <h2>
                                              Soft Linkovi
                                            </h2>
                                            
                                            <p>
                                              Soft Linkovi zapravo pokazuju na već kreiranu datoteku ili direktorij s apsolutnom ili relativnom putanjom.
                                            </p>
                                            
                                            <p>
                                              <img alt="Soft Link" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2013/11/SoftLinkovi.jpg?resize=939%2C429&#038;ssl=1" width="939" height="429" data-recalc-dims="1" />
                                            </p>
                                            
                                            <h3>
                                              Prednosti i mane Soft Linkova
                                            </h3>
                                            
                                            <ul>
                                              <li dir="ltr">
                                                <p dir="ltr">
                                                  Fleksibilniji su jer pokazuju na putanju (path) do datoteke ili direktorija
                                                </p>
                                              </li>
                                              
                                              <li dir="ltr">
                                                <p dir="ltr">
                                                  Mogu se koristiti i između file sustava (diskova ili particija)
                                                </p>
                                              </li>
                                            </ul>
                                            
                                            <p>
                                              Brisanjem originala (source) soft link postaje neupotrebljiv (pokazuje i dalje na nepostojeću datoteku/direktorij)
                                            </p>
                                            
                                            <p>
                                              &nbsp;
                                            </p>
                                            
                                            <h4>
                                              Primjeri
                                            </h4>
                                            
                                            <p dir="ltr">
                                              Nastavak na primjere od Hard Linkova:
                                            </p>
                                            
                                            <p dir="ltr">
                                              Napravimo Soft link na text.txt
                                            </p>
                                            
                                            <p dir="ltr">
                                              (nova datoteka će se zvati soft.link)
                                            </p>
                                            
                                            <p dir="ltr">
                                              <pre class="lang:default decode:true">ln -s text.txt soft.link</pre>
                                              
                                              <p dir="ltr">
                                                <span style="line-height: 1.5;"> </span>
                                              </p>
                                              
                                              <p dir="ltr">
                                                Provjerimo kako to izgleda
                                              </p>
                                              
                                              <p dir="ltr">
                                                <pre class="lang:default decode:true">ls -ali</pre>
                                                
                                                <p dir="ltr">
                                                  <p>
                                                    &nbsp;
                                                  </p>
                                                  
                                                  <pre class="lang:default decode:true">5636110 drwxr-xr-x  2 root root 4096 Nov 13 09:47 .
5636097 dr-xr-x---. 4 root root 4096 Nov 13 09:28 ..
5636111 -rw-r--r--  2 root root    5 Nov 13 21:29 text.txt 
5636111 -rw-r--r--  2 root root    5 Nov 13 21:29 hard.link 
5636112 lrwxrwxrwx  1 root root    8 Nov 13 09:34 soft.link -&gt; text.txt</pre>
                                                  
                                                  <p dir="ltr">
                                                    <p>
                                                      &nbsp;
                                                    </p>
                                                    
                                                    <p dir="ltr">
                                                      <span style="background-color: #ffffff;"> </span>
                                                    </p>
                                                    
                                                    <p>
                                                      &nbsp;
                                                    </p>
                                                    
                                                    <h1>
                                                      Oznake vremena (Timestamps)
                                                    </h1>
                                                    
                                                    <p dir="ltr">
                                                      Za svaki direktorij i datoteku zapisuju se oznake vremena:
                                                    </p>
                                                    
                                                    <ul>
                                                      <li dir="ltr">
                                                        <p dir="ltr">
                                                          <strong>modify</strong> : kada je kreiran ili mijenjan
                                                        </p>
                                                      </li>
                                                      
                                                      <li dir="ltr">
                                                        <p dir="ltr">
                                                          <strong>access</strong> : kada mu je pristupano
                                                        </p>
                                                      </li>
                                                      
                                                      <li dir="ltr">
                                                        <p dir="ltr">
                                                          <strong>change</strong> : kada je promijenjen status <span style="line-height: 1.5;">(i-node unosi)</span>
                                                        </p>
                                                      </li>
                                                    </ul>
                                                    
                                                    <h2>
                                                      Primjeri:
                                                    </h2>
                                                    
                                                    <p>
                                                      <span style="line-height: 1.5;">Nastavljamo s već kreiranim datotekama</span>
                                                    </p>
                                                    
                                                    <p dir="ltr">
                                                      Provjerimo kako izgledaju oznake <span style="color: #000000;">vremena</span>:
                                                    </p>
                                                    
                                                    <pre class="lang:default decode:true">ls -al</pre>
                                                    
                                                    <p class="lang:default highlight:0 decode:true">
                                                      <pre class="lang:default highlight:0 decode:true">drwxr-xr-x  2 root root 4096 Nov 13 19:03 . 
dr-xr-x---. 4 root root 4096 Nov 13 19:28 .. 
-rw-r--r--  2 root root    5 Nov 13 19:29 hard.link 
lrwxrwxrwx  1 root root    8 Nov 13 19:34 soft.link -&gt; text.txt 
-rw-r--r--  2 root root    5 Nov 13 19:29 text.txt</pre>
                                                      
                                                      <p class="lang:default highlight:0 decode:true">
                                                        <span style="color: #000000;"> </span>
                                                      </p>
                                                      
                                                      <p>
                                                        &nbsp;
                                                      </p>
                                                      
                                                      <p>
                                                        &nbsp;
                                                      </p>
                                                      
                                                      <p dir="ltr">
                                                        <b> </b>
                                                      </p>
                                                      
                                                      <p>
                                                        &nbsp;
                                                      </p>
                                                      
                                                      <p dir="ltr">
                                                        <p dir="ltr">
                                                          Pogledajmo<span style="color: #ff0000;"> vremenske</span> unose malo detaljnije (naredba <strong>stat</strong>)
                                                        </p>
                                                        
                                                        <p dir="ltr">
                                                          (pr. datoteka text.txt)
                                                        </p>
                                                        
                                                        <pre class="lang:default decode:true">stat text.txt</pre>
                                                        
                                                        <p>
                                                          &nbsp;
                                                        </p>
                                                        
                                                        <pre class="lang:default decode:true">File: `text.txt';
Size: 5 ; Blocks: 8 ; IO Block: 4096 ; regular file 
Device: 801h/2049d  ; Inode: 5636111 ; Links: 2
Access: (0644/-rw-r--r--);Uid: ( 0/root) ; Gid: ( 0/root) 

Access: 2013-11-13 19:47:34.519854892 +0000 
Modify: 2013-11-13 19:29:17.359728861 +0000 
Change: 2013-11-13 19:20:19.372604340 +0000</pre>
                                                        
                                                        <p>
                                                          &nbsp;
                                                        </p>
                                                        
                                                        <p dir="ltr">
                                                          <strong> </strong>
                                                        </p>
                                                        
                                                        <p>
                                                          &nbsp;
                                                        </p>
                                                        
                                                        <p>
                                                          &nbsp;
                                                        </p>
                                                        
                                                        <p>
                                                          <strong>Primjer 2:</strong>
                                                        </p>
                                                        
                                                        <p dir="ltr">
                                                          Kako promijeniti vremena pristupa/promijene datoteke:
                                                        </p>
                                                        
                                                        <ul>
                                                          <li dir="ltr">
                                                            <p dir="ltr">
                                                              promijeniti ćemo: access (-a) i modify (-m) vrijeme u :
                                                            </p>
                                                          </li>
                                                        </ul>
                                                        
                                                        <p dir="ltr">
                                                          <span style="color: #ff0000;">Godina : 2013 , Mjesec : 11 , Sat : 12 , minuta : 01 , sekunda : 10</span>
                                                        </p>
                                                        
                                                        <p dir="ltr">
                                                          <pre class="lang:default decode:true">touch -a -m -t 201311111201.10 text.txt</pre>
                                                          
                                                          <p>
                                                            &nbsp;
                                                          </p>
                                                          
                                                          <p dir="ltr">
                                                            <span style="line-height: 1.5;">Provjera:</span>
                                                          </p>
                                                          
                                                          <pre class="lang:default decode:true">stat text.txt</pre>
                                                          
                                                          <p dir="ltr">
                                                            <strong> </strong>
                                                          </p>
                                                          
                                                          <pre class="lang:default highlight:0 decode:true">File: `text.txt' 
Size: 5 Blocks: 8 IO Block: 4096 regular file Device: 801h/2049d 
Inode: 5636111 Links: 2 Access: (0644/-rw-r--r--) 
Uid: ( 0/ root) Gid: ( 0/ root) 

Access: 2013-11-11 12:01:10.000000000 +0000 
Modify: 2013-11-11 12:01:10.000000000 +0000 

Change: 2013-11-13 19:20:19.372604340 +0000</pre>
                                                          
                                                          <p>
                                                            &nbsp;
                                                          </p>
                                                          
                                                          <p dir="ltr">
                                                            <p>
                                                              &nbsp;
                                                            </p>
                                                            
                                                            <p>
                                                              &nbsp;
                                                            </p>
                                                            
                                                            <h1>
                                                              File Descriptors
                                                            </h1>
                                                            
                                                            <p dir="ltr">
                                                              File descriptori su indeksi na unose u kernelu, prema (otvorenim) datotekama.
                                                            </p>
                                                            
                                                            <p dir="ltr">
                                                              Postoje ih tri vrste:
                                                            </p>
                                                            
                                                            <ul>
                                                              <li dir="ltr">
                                                                <p dir="ltr">
                                                                  <span class="lang:default decode:true  crayon-inline ">stdout</span>  &#8211; standardni izlaz
                                                                </p>
                                                              </li>
                                                              
                                                              <li dir="ltr">
                                                                <p dir="ltr">
                                                                  <span class="lang:default decode:true  crayon-inline ">stdin</span>  &#8211; standardni ulaz (1)
                                                                </p>
                                                              </li>
                                                              
                                                              <li dir="ltr">
                                                                <span style="line-height: 1.5;"><span class="lang:default decode:true  crayon-inline ">stderror</span>  &#8211; standardna greška (2)</span>
                                                              </li>
                                                            </ul>
                                                            
                                                            <p>
                                                              &nbsp;
                                                            </p>
                                                            
                                                            <p>
                                                              &nbsp;
                                                            </p>
                                                            
                                                            <h1>
                                                              <span style="line-height: 1.5;">Komandnolinijska ljuska (Shell  )</span>
                                                            </h1>
                                                            
                                                            <p>
                                                              &nbsp;
                                                            </p>
                                                            
                                                            <p dir="ltr">
                                                              Shell je sučelje između korisnika i Operativnog sustava.
                                                            </p>
                                                            
                                                            <ul>
                                                              <li dir="ltr">
                                                                <p dir="ltr">
                                                                  Postoji ih veći broj:
                                                                </p>
                                                                
                                                                <ul>
                                                                  <li dir="ltr">
                                                                    <p dir="ltr">
                                                                      Bourne shell (<span class="lang:default decode:true  crayon-inline ">sh</span> )
                                                                    </p>
                                                                  </li>
                                                                  
                                                                  <li dir="ltr">
                                                                    <p dir="ltr">
                                                                      Bourne-Again shell (<span class="lang:default decode:true  crayon-inline ">bash</span> )
                                                                    </p>
                                                                  </li>
                                                                  
                                                                  <li dir="ltr">
                                                                    <p dir="ltr">
                                                                      Z shell (<span class="lang:default decode:true  crayon-inline ">zsh</span> )
                                                                    </p>
                                                                  </li>
                                                                  
                                                                  <li dir="ltr">
                                                                    <p dir="ltr">
                                                                      C-shell (<span class="lang:default decode:true  crayon-inline ">csh</span> )
                                                                    </p>
                                                                  </li>
                                                                  
                                                                  <li dir="ltr">
                                                                    <p dir="ltr">
                                                                      T Shell (<span class="lang:default decode:true  crayon-inline ">tcsh</span> )
                                                                    </p>
                                                                  </li>
                                                                  
                                                                  <li dir="ltr">
                                                                    <span style="line-height: 1.5;">Korn shell (<span class="lang:default decode:true  crayon-inline ">ksh</span> )</span>
                                                                  </li>
                                                                </ul>
                                                              </li>
                                                            </ul>
                                                            
                                                            <p>
                                                              &nbsp;
                                                            </p>
                                                            
                                                            <h1>
                                                              Logiranje / odlogiranje
                                                            </h1>
                                                            
                                                            <p dir="ltr">
                                                              Da bi se uopće mogli logirati u sistem vaš korisnički računa ( account) mora biti kreiran od strane administratora (root korisnika)
                                                            </p>
                                                            
                                                            <ul>
                                                              <li dir="ltr">
                                                                <p dir="ltr">
                                                                  Razlikuju se velika i mala slova
                                                                </p>
                                                              </li>
                                                              
                                                              <li dir="ltr">
                                                                <p dir="ltr">
                                                                  Minimalna dužina imena accounta je 6 znakova (u pravilu)
                                                                </p>
                                                              </li>
                                                              
                                                              <li dir="ltr">
                                                                <p dir="ltr">
                                                                  Lozinka se mijenja naredbom : passwd
                                                                </p>
                                                              </li>
                                                            </ul>
                                                            
                                                            <p>
                                                              Izlaz iz sistema se ostavaruje slijedećim naredbama:  <span class="lang:default decode:true  crayon-inline ">exit</span> <strong>  <span class="lang:default decode:true  crayon-inline "> logout</span>   </strong>
                                                            </p>
                                                            
                                                            <p>
                                                              Ili kombinacijom tipki :<strong>  <span class="lang:default decode:true  crayon-inline ">CTRL d</span> </strong>
                                                            </p>
                                                            
                                                            <p>
                                                              &nbsp;
                                                            </p>
                                                            
                                                            <h2>
                                                              Rad s korisničkim računom
                                                            </h2>
                                                            
                                                            <ul>
                                                              <li dir="ltr">
                                                                <p dir="ltr">
                                                                  Svaki korisnički račun ima svoj ID (<strong>uid</strong>)
                                                                </p>
                                                              </li>
                                                              
                                                              <li dir="ltr">
                                                                <p dir="ltr">
                                                                  Svaki korisnički račun pripada barem jednog grupi
                                                                </p>
                                                                
                                                                <ul>
                                                                  <li dir="ltr">
                                                                    <p dir="ltr">
                                                                      svaka grupa ima svoj ID (<strong>gid</strong>)
                                                                    </p>
                                                                  </li>
                                                                </ul>
                                                              </li>
                                                            </ul>
                                                            
                                                            <p>
                                                              &nbsp;
                                                            </p>
                                                            
                                                            <p dir="ltr">
                                                              Kako provjeriti pripadnost :
                                                            </p>
                                                            
                                                            <p>
                                                              &nbsp;
                                                            </p>
                                                            
                                                            <pre class="lang:default decode:true">id -a</pre>
                                                            
                                                            <p dir="ltr">
                                                              <span style="line-height: 1.5;">  </span>
                                                            </p>
                                                            
                                                            <pre class="lang:default decode:true">uid=0(root) gid=0(root) groups=0(root),1(bin),2(daemon)</pre>
                                                            
                                                            <p>
                                                              &nbsp;
                                                            </p>
                                                            
                                                            <p>
                                                              Dakle ovdje vidimo da je korisnik  root
                                                            </p>
                                                            
                                                            <p>
                                                              &#8230; da pripada primarnoj grupi root
                                                            </p>
                                                            
                                                            <p>
                                                              &#8230; da pripada i dodatnim grupama : bin i daemon
                                                            </p>
                                                            
                                                            <p>
                                                              &nbsp;
                                                            </p>
                                                            
                                                            <h1>
                                                              Osnovne kontrolne naredbe
                                                            </h1>
                                                            
                                                            <ul>
                                                              <li dir="ltr">
                                                                <p dir="ltr">
                                                                  <span class="lang:default decode:true  crayon-inline ">CTRL a</span>  &#8211; skoči na početak reda
                                                                </p>
                                                              </li>
                                                              
                                                              <li dir="ltr">
                                                                <p dir="ltr">
                                                                  <span class="lang:default decode:true  crayon-inline ">CTRL e</span>  &#8211; skoči na kraj reda
                                                                </p>
                                                              </li>
                                                              
                                                              <li dir="ltr">
                                                                <p dir="ltr">
                                                                  <span class="lang:default decode:true  crayon-inline ">CTRL c</span>  &#8211; prekini izvršavanje naredbe
                                                                </p>
                                                              </li>
                                                              
                                                              <li dir="ltr">
                                                                <p dir="ltr">
                                                                  <span class="lang:default decode:true  crayon-inline ">CTRL d</span>  &#8211; odlogiraj se
                                                                </p>
                                                              </li>
                                                              
                                                              <li dir="ltr">
                                                                <p dir="ltr">
                                                                  <span class="lang:default decode:true  crayon-inline ">CTRL d </span> &#8211; još znači i pošalji End of File trenutnom procesu
                                                                </p>
                                                              </li>
                                                              
                                                              <li dir="ltr">
                                                                <p dir="ltr">
                                                                  <span class="lang:default decode:true  crayon-inline ">CTRL ALT Fn</span>  &#8211; prebaci se na n-ti terminal (<strong>n</strong>=1&#8230;6)
                                                                </p>
                                                              </li>
                                                              
                                                              <li dir="ltr">
                                                                <span style="line-height: 1.5;"><span class="lang:default decode:true  crayon-inline ">CTRL z</span>  &#8211; privremeni prekid rada procesa (suspend)</span>
                                                              </li>
                                                            </ul>
                                                            
                                                            <p>
                                                              &nbsp;
                                                            </p>
                                                            
                                                            <h1>
                                                              Procesi
                                                            </h1>
                                                            
                                                            <p dir="ltr">
                                                              Svaki proces je instanca pokrenutog programa/naredbe na linux (bilo kojem) operativnom sustavu.
                                                            </p>
                                                            
                                                            <p dir="ltr">
                                                              Naredbama <span class="lang:default decode:true  crayon-inline ">ps</span>  i <span class="lang:default decode:true  crayon-inline ">top</span>  možemo izlistati procese.
                                                            </p>
                                                            
                                                            <p dir="ltr">
                                                              Svaki proces identificira niz parametera od kojih nas sada zanimaju samo ovi:
                                                            </p>
                                                            
                                                            <ul>
                                                              <li dir="ltr">
                                                                <p dir="ltr">
                                                                  <strong>UID</strong>  &#8211; tko je vlasnik procesa
                                                                </p>
                                                              </li>
                                                              
                                                              <li dir="ltr">
                                                                <p dir="ltr">
                                                                  <strong>PID</strong>  &#8211; jedinstvena identifikacija (dodjeljuje ju sistem)
                                                                </p>
                                                              </li>
                                                              
                                                              <li dir="ltr">
                                                                <p dir="ltr">
                                                                  <strong>STIME</strong>  &#8211; vrijeme kada je proces pokrenut
                                                                </p>
                                                              </li>
                                                              
                                                              <li dir="ltr">
                                                                <p dir="ltr">
                                                                  <strong>TIME</strong>  &#8211; vrijeme koliko je CPU radio na procesu
                                                                </p>
                                                              </li>
                                                              
                                                              <li dir="ltr">
                                                                <p dir="ltr">
                                                                  <strong>CMD</strong>  &#8211; je naredba koja čini taj proces
                                                                </p>
                                                              </li>
                                                              
                                                              <li dir="ltr">
                                                                ….
                                                              </li>
                                                            </ul>
                                                            
                                                            <p>
                                                              &nbsp;
                                                            </p>
                                                            
                                                            <h2>
                                                              Primjer upotrebe <strong>ps</strong> naredbe
                                                            </h2>
                                                            
                                                            <p dir="ltr">
                                                              Primjer  upotrebe naredbe <strong>ps  </strong>koja ispisuje  pokrenute procese.
                                                            </p>
                                                            
                                                            <p dir="ltr">
                                                              <pre class="lang:default decode:true">ps -ef</pre>
                                                              
                                                              <p>
                                                                &nbsp;
                                                              </p>
                                                              
                                                              <p>
                                                                &nbsp;
                                                              </p>
                                                              
                                                              <pre class="lang:default highlight:0 decode:true">UID     PID  PPID C  STIME    TTY  TIME              CMD
root    1    0    0  Nov14     ?   00:00:01          /sbin/init
root    2    0    0  Nov14     ?   00:00:00          [kthreadd]
root    3    2    0  Nov14     ?   00:00:00          [migration/0]
root    4    2    0  Nov14     ?   00:06:03          [ksoftirqd/0</pre>
                                                              
                                                              <p>
                                                                &nbsp;
                                                              </p>
                                                              
                                                              <p>
                                                                &nbsp;
                                                              </p>
                                                              
                                                              <h2>
                                                                Primjer upotrebe top naredbe
                                                              </h2>
                                                              
                                                              <p>
                                                                &nbsp;
                                                              </p>
                                                              
                                                              <p dir="ltr">
                                                                Primjer upotreba naredbe <strong>top</strong> koja daje puno više informacija o svakom procesu
                                                              </p>
                                                              
                                                              <p>
                                                                &nbsp;
                                                              </p>
                                                              
                                                              <pre class="lang:default decode:true">top</pre>
                                                              
                                                              <p>
                                                                &nbsp;
                                                              </p>
                                                              
                                                              <p dir="ltr">
                                                                <pre class="lang:sh highlight:0 decode:true">15:24:20 up 1 day,  5:45,  2 users,  load average: 0.00, 0.00, 0.00
Tasks: 143 total,   1 running, 142 sleeping,   0 stopped,   0 zombie
Cpu(s):  1.3%us,  0.2%sy,  0.0%ni, 98.4%id,  0.1%wa,  0.0%hi,  0.0%si,  0.0%st

Mem:  16332608k total,  7480892k used,  8851716k free,    89428k buffers
Swap: 16776184k total,        0k used, 16776184k free,  1695512k cached

PID  USER PR NI   VIRT RES   SHR  S %CPU %MEM   TIME+    COMMAND       
1   root  20 0   19348 1524  1212 S 0.0   0.0   0:01.27  init           
2   root  20 0       0    0     0 S 0.0   0.0   0:00.00  kthreadd       
3   root  RT 0       0    0     0 S 0.0   0.0   0:00.01  migration/0   
4   root  20 0       0    0     0 S 0.0   0.0   6:03.23  ksoftirqd/0</pre>
                                                                
                                                                <p>
                                                                  Opis značenja:
                                                                </p>
                                                                
                                                                <ol>
                                                                  <li>
                                                                    <span class="lang:default decode:true  crayon-inline ">PID</span>  &#8211; Process ID &#8211; jedinstveni identifikacijski broj (ID) svakog procesa
                                                                  </li>
                                                                  <li>
                                                                    <span class="lang:default decode:true  crayon-inline ">USER</span>  &#8211; Username koji je pokrenuo taj proces
                                                                  </li>
                                                                  <li>
                                                                    <span class="lang:default decode:true  crayon-inline ">PR</span>  &#8211; Prioritet procesa (od <tt>-20</tt> za &#8220;najbitnije&#8221; do  <tt>20</tt> manje &#8220;važne&#8221; procese)
                                                                  </li>
                                                                  <li>
                                                                    <span class="lang:default decode:true  crayon-inline ">NI</span>  &#8211; &#8220;Nice&#8221; vrijednost modificira prioritet procesa
                                                                  </li>
                                                                  <li>
                                                                    <span class="lang:default decode:true  crayon-inline ">VIRT</span>  -Ukupna količina virtualne memorije koju proces koristi
                                                                  </li>
                                                                  <li>
                                                                    <span class="lang:default decode:true  crayon-inline ">RES</span>  &#8211; Rezident-na veličina (kb) &#8211; &#8220;Non-swapped&#8221; fizička memorija koju proces koristi
                                                                  </li>
                                                                  <li>
                                                                    <span class="lang:default decode:true  crayon-inline ">SHR</span>  &#8211; &#8220;Shared memory size&#8221; (kb) &#8211; količina dijeljene memorije koju proces koristi (dijeljena memorija je memorja koju mogu alocirati i drugi procesi)
                                                                  </li>
                                                                  <li>
                                                                    <span class="lang:default decode:true  crayon-inline ">S</span>  &#8211; &#8220;Process status&#8221; &#8211; moguće vrijednosti: <ul>
                                                                      <li>
                                                                        <tt>R</tt> &#8211; &#8220;Running&#8221; &#8211; pokrenuto
                                                                      </li>
                                                                      <li>
                                                                        <tt>D</tt> &#8211; &#8220;Sleeping&#8221;  &#8211; (nije ga moguće prekinuti  &#8211; &#8220;interrupted&#8221;)
                                                                      </li>
                                                                      <li>
                                                                        <tt>S</tt> &#8211; Sleeping (moguće ga je prekinuti &#8211; &#8220;interrupted&#8221;)
                                                                      </li>
                                                                      <li>
                                                                        <tt>T</tt> &#8211; &#8220;Traced or stopped&#8221;
                                                                      </li>
                                                                      <li>
                                                                        <tt>Z</tt> &#8211; &#8220;Zombie&#8221; ili &#8220;hung&#8221; process
                                                                      </li>
                                                                    </ul>
                                                                  </li>
                                                                  
                                                                  <li>
                                                                    <span class="lang:default decode:true  crayon-inline ">%CPU</span>  &#8211; Postotak CPU vremena koje je proces koristio u vrijeme kada je naredba <tt>top</tt> zadnji puta osvježena
                                                                  </li>
                                                                  <li>
                                                                    <span class="lang:default decode:true  crayon-inline ">%MEM</span>  &#8211; Postotak memorije (RAM) koje je proces koristio u vrijeme kada je naredba <tt>top</tt> zadnji puta osvježena
                                                                  </li>
                                                                  <li>
                                                                    <span class="lang:default decode:true  crayon-inline ">TIME+</span>  -Kumulativno  CPU vrijeme koje su proces i njegovi podprocesi (child/djeca)koristili
                                                                  </li>
                                                                  <li>
                                                                    <span class="lang:default decode:true  crayon-inline ">COMMAND</span>  -Ime procesa ili naredbe koja je pokrenuta (pritisni  <tt>c</tt> za prebacivanje između imena procesa i putanje naredbe koja je pokrenula proces)
                                                                  </li>
                                                                </ol>
                                                                
                                                                <p>
                                                                  &nbsp;
                                                                </p>
                                                                
                                                                <h2>
                                                                  Prioriteti i procesi
                                                                </h2>
                                                                
                                                                <p>
                                                                  Na primjeru CPU (Centralni procesor) sa jednom jezgrom, možemo vidjeti da je CPU u svakom trenutku tj. najmanjoj jedinici vremena, zapravo u stanju obraditi samo jedan proces.
                                                                </p>
                                                                
                                                                <p>
                                                                  Ono što se zapravo događa je da, prvo sistem (ili naknadno korisnik) može za svaki proces odrediti određeni prioritet, prema kojemu se računa koliko vremena, unutar jednog segmenta vremena će CPU odrađivati koji proces. Praktično CPU radi preklapanje (switching) ili takozvani &#8220;context switching&#8221; između više procesa.
                                                                </p>
                                                                
                                                                <p>
                                                                  Možemo ovo zamislitit kao da svaki CPU ima malu sklopku koju prebacuje s procesa na proces (pogledajte sliku)
                                                                </p>
                                                                
                                                                <p>
                                                                  Pojednostavljeno to izgleda ovako:
                                                                </p>
                                                                
                                                                <p>
                                                                  Ako imamo 2 procesa:
                                                                </p>
                                                                
                                                                <p>
                                                                  &#8211; prvi prioriteta 90% a
                                                                </p>
                                                                
                                                                <p>
                                                                  -drugi 10%
                                                                </p>
                                                                
                                                                <p>
                                                                  CPU u svakom segmentu vremena (neka je to pr. 10 us) obrađuje prvi proces 9us a drugi 1us , u slijedećem segmentu vremena (slijedećih 10us) ponovno i tako dalje.
                                                                </p>
                                                                
                                                                <p>
                                                                  Analogija ovome je vidljiva i u višenitnim (multi threading) programima (oni su na nivou operatinog sustava isto procesi) koji su još jedan nivo iznad ove priće ali kada dođu do nivoa obrade na CPU &#8211; ponovno se dešava ista stvar.
                                                                </p>
                                                                
                                                                <p>
                                                                  &nbsp;
                                                                </p>
                                                                
                                                                <p>
                                                                  <img alt="Procesi i CPU" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2013/11/Procesi-i-CPU.jpg?resize=841%2C420&#038;ssl=1" width="841" height="420" data-recalc-dims="1" />
                                                                </p>
                                                                
                                                                <p>
                                                                  Dakle da sumiramo:
                                                                </p>
                                                                
                                                                <ul>
                                                                  <li dir="ltr">
                                                                    <p dir="ltr">
                                                                      Svaki pokrenuti proces ima određeni prioritet
                                                                    </p>
                                                                  </li>
                                                                  
                                                                  <li dir="ltr">
                                                                    <p dir="ltr">
                                                                      Standardni prioritet je 0
                                                                    </p>
                                                                    
                                                                    <ul>
                                                                      <li dir="ltr">
                                                                        <p dir="ltr">
                                                                          Prioriteti se kreću od -20 do 20 (19)
                                                                        </p>
                                                                      </li>
                                                                      
                                                                      <li dir="ltr">
                                                                        <p dir="ltr">
                                                                          Najveći prioritet je -20 a najmanji 20
                                                                        </p>
                                                                      </li>
                                                                    </ul>
                                                                  </li>
                                                                </ul>
                                                                
                                                                <h3>
                                                                   Primjeri
                                                                </h3>
                                                                
                                                                <p>
                                                                  &nbsp;
                                                                </p>
                                                                
                                                                <p dir="ltr">
                                                                  Pokreni proces (skriptu test.sh) s prioritetom 10:
                                                                </p>
                                                                
                                                                <pre class="lang:default decode:true">nice -n 10 test.sh</pre>
                                                                
                                                                <p>
                                                                  &nbsp;
                                                                </p>
                                                                
                                                                <p dir="ltr">
                                                                  ili
                                                                </p>
                                                                
                                                                <pre class="lang:default decode:true">nice -10 test.sh</pre>
                                                                
                                                                <p>
                                                                  &nbsp;
                                                                </p>
                                                                
                                                                <p>
                                                                  <span style="line-height: 1.5;">Recimo da smo već pokrenuli skriptu ili proces gore i da naknadno želimo promijeniti njen prioritet u 5, njen PID je 10456</span>
                                                                </p>
                                                                
                                                                <pre class="lang:default decode:true">renice 5 -p 10456</pre>
                                                                
                                                                <p>
                                                                  &nbsp;
                                                                </p>
                                                                
                                                                <p>
                                                                  <span style="line-height: 1.5;">Želimo li naknadno promijeniti prioritet svih procesa čiji je vlasnik pero i svih čiji su vlasnici iz grupe korisnici u prioritet 10</span>
                                                                </p>
                                                                
                                                                <pre class="lang:default decode:true">renice 10 -u pero -g korisnici</pre>
                                                                
                                                                <p>
                                                                  &nbsp;
                                                                </p>
                                                                
                                                                <h2>
                                                                   Procesi i signali koje im možemo poslati
                                                                </h2>
                                                                
                                                                <ul>
                                                                  <li dir="ltr">
                                                                    <p dir="ltr">
                                                                      Svakom procesu koji je pokrenut možemo poslati određene signale (postoji ih na desetke), najkorišteniji su:
                                                                    </p>
                                                                    
                                                                    <ul>
                                                                      <li dir="ltr">
                                                                        <p dir="ltr">
                                                                          SIGHUP  (br.  1) ”Hang UP” obično se proces stopira  ili za daemon-e &#8211; restarta i učita konfiguraciju (re-read)
                                                                        </p>
                                                                      </li>
                                                                      
                                                                      <li dir="ltr">
                                                                        <p dir="ltr">
                                                                          SIGKILL (br.  9) ==> nasilno zaustavi proces
                                                                        </p>
                                                                      </li>
                                                                      
                                                                      <li dir="ltr">
                                                                        <p dir="ltr">
                                                                          SIGTERM (br. 15) ==> standarno zaustavi proces
                                                                        </p>
                                                                      </li>
                                                                    </ul>
                                                                  </li>
                                                                </ul>
                                                                
                                                                <p>
                                                                  &nbsp;
                                                                </p>
                                                                
                                                                <ul>
                                                                  <li dir="ltr">
                                                                    <p dir="ltr">
                                                                      Listu podržanih signala možete vidjeti sa : <span class="lang:default decode:true  crayon-inline ">kill -l</span>
                                                                    </p>
                                                                  </li>
                                                                </ul>
                                                                
                                                                <p>
                                                                  Ovo je lista podržanih signala na linux kernel 2.6.x:
                                                                </p>
                                                                
                                                                <p>
                                                                  <span class="lang:default decode:true  crayon-inline ">1) SIGHUP 2) SIGINT 3) SIGQUIT 4) SIGILL 5) SIGTRAP 6) SIGABRT 7) SIGBUS 8) SIGFPE 9) SIGKILL 10) SIGUSR1 11) SIGSEGV 12) SIGUSR2 13) SIGPIPE 14) SIGALRM 15) SIGTERM 16) SIGSTKFLT 17) SIGCHLD 18) SIGCONT 19) SIGSTOP 20) SIGTSTP 21) SIGTTIN 22) SIGTTOU 23) SIGURG 24) SIGXCPU 25) SIGXFSZ 26) SIGVTALRM 27) SIGPROF 28) SIGWINCH 29) SIGIO 30) SIGPWR 31) SIGSYS 34) SIGRTMIN 35) SIGRTMIN+1 36) SIGRTMIN+2 37) SIGRTMIN+3 38) SIGRTMIN+4 39) SIGRTMIN+5 40) SIGRTMIN+6 41) SIGRTMIN+7 42) SIGRTMIN+8 43) SIGRTMIN+9 44) SIGRTMIN+10 45) SIGRTMIN+11 46) SIGRTMIN+12 47) SIGRTMIN+13 48) SIGRTMIN+14 49) SIGRTMIN+15 50) SIGRTMAX-14 51) SIGRTMAX-13 52) SIGRTMAX-12 53) SIGRTMAX-11 54) SIGRTMAX-10 55) SIGRTMAX-9 56) SIGRTMAX-8 57) SIGRTMAX-7 58) SIGRTMAX-6 59) SIGRTMAX-5 60) SIGRTMAX-4 61) SIGRTMAX-3 62) SIGRTMAX-2 63) SIGRTMAX-1 64) SIGRTMAX</span>
                                                                </p>
                                                                
                                                                <h3>
                                                                  Primjeri:
                                                                </h3>
                                                                
                                                                <p dir="ltr">
                                                                  Pr.stopiraj (SIGHUP [1]) proces PID 13245 (ovo je neka skripta koju smo pokrenuli)
                                                                </p>
                                                                
                                                                <pre class="lang:default decode:true">kill -1 13245</pre>
                                                                
                                                                <p>
                                                                  Pr.stopiraj (SIGTERM [15]) &#8211; ovo je default proces PID 13245 (ovo je neka skripta koju smo pokrenuli)
                                                                </p>
                                                                
                                                                <pre class="lang:default decode:true">kill -15 13245</pre>
                                                                
                                                                <p>
                                                                  ili
                                                                </p>
                                                                
                                                                <pre class="lang:default decode:true">kill 13245</pre>
                                                                
                                                                <p>
                                                                  Pr.nasilno ubij (SIGKILL [9])proces PID 13245 (ovo je neka skripta koju smo pokrenuli)
                                                                </p>
                                                                
                                                                <pre class="lang:default decode:true">kill -9 13245</pre>
                                                                
                                                                <p>
                                                                  &nbsp;
                                                                </p>
                                                                
                                                                <p>
                                                                  &nbsp;
                                                                </p>
                                                                
                                                                <p>
                                                                  &nbsp;
                                                                </p>
                                                                
                                                                <h2>
                                                                  <span style="font-family: Bitter, Georgia, serif; font-size: 48px; line-height: 1.3;">Unix / Linux Poslovi (Jobs)</span>
                                                                </h2>
                                                                
                                                                <ul>
                                                                  <li dir="ltr">
                                                                    <p dir="ltr">
                                                                      Shell kreira novi posao svaki puta kada se pokrene neka naredba
                                                                    </p>
                                                                  </li>
                                                                  
                                                                  <li dir="ltr">
                                                                    <p dir="ltr">
                                                                      Provjera stanja poslova &#8211; naredba <span class="lang:default decode:true  crayon-inline ">jobs</span>
                                                                    </p>
                                                                  </li>
                                                                  
                                                                  <li dir="ltr">
                                                                    <p dir="ltr">
                                                                      Poslovi mogu biti u slijedećim stanjima:
                                                                    </p>
                                                                    
                                                                    <ul>
                                                                      <li dir="ltr">
                                                                        <p dir="ltr">
                                                                          Foreground (ovo je standardno stanje) [<span class="lang:default decode:true  crayon-inline ">fg</span> ]
                                                                        </p>
                                                                      </li>
                                                                      
                                                                      <li dir="ltr">
                                                                        <p dir="ltr">
                                                                          Background (pokretanje u pozadini-ako se pokreće sa  &  na kraju) [<span class="lang:default decode:true  crayon-inline ">bg</span> ]
                                                                        </p>
                                                                      </li>
                                                                      
                                                                      <li dir="ltr">
                                                                        <p dir="ltr">
                                                                          Stopped (Stopiran ali se može pokrenuti u Foreground ili Background)
                                                                        </p>
                                                                      </li>
                                                                      
                                                                      <li dir="ltr">
                                                                        <span style="line-height: 1.5;">Terminated (Zaustavljen)</span>
                                                                      </li>
                                                                    </ul>
                                                                  </li>
                                                                </ul>
                                                                
                                                                <p>
                                                                  &nbsp;
                                                                </p>
                                                                
                                                                <h2>
                                                                  Primjeri
                                                                </h2>
                                                                
                                                                <p dir="ltr">
                                                                  Kreiraj datoteku koja će s popunjavati slučajnim znakovima
                                                                </p>
                                                                
                                                                <p dir="ltr">
                                                                  <pre class="lang:default decode:true">dd if=/dev/urandom of=/root/slucajni.znakovi.txt</pre>
                                                                  
                                                                  <p>
                                                                    &nbsp;
                                                                  </p>
                                                                  
                                                                  <p>
                                                                    &nbsp;
                                                                  </p>
                                                                  
                                                                  <p dir="ltr">
                                                                    <span style="line-height: 1.5;">Stopiraj ovaj posao (job)</span>
                                                                  </p>
                                                                  
                                                                  <pre class="lang:default decode:true">CTRL z</pre>
                                                                  
                                                                  <p>
                                                                    &nbsp;
                                                                  </p>
                                                                  
                                                                  <pre class="lang:default decode:true">[1]+  Stopped       dd if=/dev/urandom of=/root/slucajni.znakovi.txt</pre>
                                                                  
                                                                  <p>
                                                                    &nbsp;
                                                                  </p>
                                                                  
                                                                  <p dir="ltr">
                                                                    <span style="line-height: 1.5;">Pokreni ga ponovno u pozadini (background)</span>
                                                                  </p>
                                                                  
                                                                  <p dir="ltr">
                                                                    <pre class="lang:default decode:true">bg 1</pre>
                                                                    
                                                                    <p dir="ltr">
                                                                      <p>
                                                                        <span style="line-height: 1.5;">Stopiraj posao (job) br 1 [prije broja posla mora biti znak %]</span>
                                                                      </p>
                                                                      
                                                                      <p dir="ltr">
                                                                        <pre class="lang:default decode:true">stop %1</pre>
                                                                        
                                                                        <p>
                                                                          &nbsp;
                                                                        </p>
                                                                        
                                                                        <p dir="ltr">
                                                                          <span style="line-height: 1.5;">Prebaci ga u normalan rad (foreground)</span>
                                                                        </p>
                                                                        
                                                                        <p dir="ltr">
                                                                          <pre class="lang:default decode:true">fg 1</pre>
                                                                          
                                                                          <p dir="ltr">
                                                                            <span style="line-height: 1.5;">Terminiraj (ubij) ga</span>
                                                                          </p>
                                                                          
                                                                          <p>
                                                                            &nbsp;
                                                                          </p>
                                                                          
                                                                          <pre class="lang:default decode:true">CTRL c</pre>
                                                                          
                                                                          <p>
                                                                            &nbsp;
                                                                          </p>
                                                                          
                                                                          <p>
                                                                            &nbsp;
                                                                          </p>
                                                                          
                                                                          <p>
                                                                            &nbsp;
                                                                          </p>
                                                                          
                                                                          <p>
                                                                            &nbsp;
                                                                          </p>
                                                                          
                                                                          <h1>
                                                                            Osnovne naredbe
                                                                          </h1>
                                                                          
                                                                          <p dir="ltr">
                                                                            <span class="lang:default decode:true  crayon-inline ">cd</span>  &#8211; promijeni direktorij (change directory)
                                                                          </p>
                                                                          
                                                                          <p dir="ltr">
                                                                            <span class="lang:default decode:true  crayon-inline ">ls</span>  &#8211; ispis direktorija/datoteka (list directory contents)
                                                                          </p>
                                                                          
                                                                          <p dir="ltr">
                                                                            <span class="lang:default decode:true  crayon-inline ">pwd</span>  &#8211; ispis trenutnog direktorija (Print Working Directory)
                                                                          </p>
                                                                          
                                                                          <p dir="ltr">
                                                                            <span class="lang:default decode:true  crayon-inline ">date</span>  &#8211; ispis datuma i sata
                                                                          </p>
                                                                          
                                                                          <p dir="ltr">
                                                                            <span class="lang:default decode:true  crayon-inline ">cal</span>  &#8211; ispis kalendara (calendar)
                                                                          </p>
                                                                          
                                                                          <p dir="ltr">
                                                                            <span class="lang:default decode:true  crayon-inline ">man</span>  &#8211; ispis uputa (manual)
                                                                          </p>
                                                                          
                                                                          <p>
                                                                            &nbsp;
                                                                          </p>
                                                                          
                                                                          <h2>
                                                                            Rad s direktorijima
                                                                          </h2>
                                                                          
                                                                          <ul>
                                                                            <li dir="ltr">
                                                                              <p dir="ltr">
                                                                                <strong><span class="lang:default decode:true  crayon-inline ">mkdir</span>  IME-DIREKTORIJA &#8211;</strong> kreiraj direktorij imena IME (make directory)
                                                                              </p>
                                                                            </li>
                                                                          </ul>
                                                                          
                                                                          <ul>
                                                                            <li dir="ltr">
                                                                              <p dir="ltr">
                                                                                <strong><span class="lang:default decode:true  crayon-inline ">mv</span>  IME1 IME2</strong>   (move)
                                                                              </p>
                                                                            </li>
                                                                            
                                                                            <li dir="ltr">
                                                                              <p dir="ltr">
                                                                                <span style="line-height: 1.5;"><strong><span class="lang:default decode:true  crayon-inline ">mv</span>  ime-datoteke ime-dir</strong>  (move)</span>
                                                                              </p>
                                                                            </li>
                                                                            
                                                                            <li dir="ltr">
                                                                              <span style="line-height: 1.5;"><strong><span class="lang:default decode:true  crayon-inline ">mv</span>  staro-ime novo-ime</strong>  (move)</span>
                                                                            </li>
                                                                          </ul>
                                                                          
                                                                          <ul>
                                                                            <li dir="ltr">
                                                                              <p dir="ltr">
                                                                                <strong><span class="lang:default decode:true  crayon-inline ">rmdir</span>  IME</strong> &#8211; obriši direktorij imena IME (remove directory):
                                                                              </p>
                                                                              
                                                                              <ul>
                                                                                <li dir="ltr">
                                                                                  <p dir="ltr">
                                                                                    ne može se brisati direktorij u kojem se nalazimo
                                                                                  </p>
                                                                                </li>
                                                                                
                                                                                <li dir="ltr">
                                                                                  <p dir="ltr">
                                                                                    ne može se brisati direktorij koji je pun:
                                                                                  </p>
                                                                                  
                                                                                  <ul>
                                                                                    <li dir="ltr">
                                                                                      <p dir="ltr">
                                                                                        Za rekurzivno brisanje punih direktorija koristiti <span class="lang:default decode:true  crayon-inline ">rm -rf </span> <strong> IME</strong>
                                                                                      </p>
                                                                                    </li>
                                                                                  </ul>
                                                                                </li>
                                                                              </ul>
                                                                            </li>
                                                                          </ul>
                                                                          
                                                                          <p>
                                                                            &nbsp;
                                                                          </p>
                                                                          
                                                                          <h3>
                                                                            Primjeri
                                                                          </h3>
                                                                          
                                                                          <p dir="ltr">
                                                                            Kreiraj direktorij i poddirektorij u njemu (test/test1)
                                                                          </p>
                                                                          
                                                                          <p dir="ltr">
                                                                            <pre class="lang:default decode:true">mkdir -p test/test1</pre>
                                                                            
                                                                            <p dir="ltr">
                                                                              <p>
                                                                                &nbsp;
                                                                              </p>
                                                                              
                                                                              <p dir="ltr">
                                                                                <span style="line-height: 1.5;">Kreiraj datoteku imena proba.txt unutar test/test1/ direktorija</span>
                                                                              </p>
                                                                              
                                                                              <pre class="lang:default decode:true">touch test/test1/proba.txt</pre>
                                                                              
                                                                              <p dir="ltr">
                                                                                <span style="line-height: 1.5;">Obriši (! oprez !) direktorije test/test1/ i sve datoteke u njima</span>
                                                                              </p>
                                                                              
                                                                              <p>
                                                                                &nbsp;
                                                                              </p>
                                                                              
                                                                              <pre class="lang:default decode:true">rm -rf test</pre>
                                                                              
                                                                              <p>
                                                                                &nbsp;
                                                                              </p>
                                                                              
                                                                              <p>
                                                                                <span style="line-height: 1.5;"> </span>
                                                                              </p>
                                                                              
                                                                              <h2>
                                                                                 Kreiranje datoteka
                                                                              </h2>
                                                                              
                                                                              <ul>
                                                                                <li dir="ltr">
                                                                                  <p dir="ltr">
                                                                                    <strong><span class="lang:default decode:true  crayon-inline ">touch</span>  IME</strong> &#8211; kreiraj datoteku imena IME
                                                                                  </p>
                                                                                </li>
                                                                                
                                                                                <li dir="ltr">
                                                                                  <p dir="ltr">
                                                                                    <strong><span class="lang:default decode:true  crayon-inline ">cat</span>  > IME</strong> &#8211; kreiraj datoteku imena IME (upisati sadržaj , CTRL d za kraj i snimanje)
                                                                                  </p>
                                                                                </li>
                                                                                
                                                                                <li dir="ltr">
                                                                                  <p dir="ltr">
                                                                                    <strong><span class="lang:default decode:true  crayon-inline ">vi</span>  IME</strong> &#8211; kreiraj datoteku imena IME i editiraj istu sa vi editorom
                                                                                  </p>
                                                                                </li>
                                                                                
                                                                                <li dir="ltr">
                                                                                  <p dir="ltr">
                                                                                    <strong><span class="lang:default decode:true  crayon-inline ">echo</span>  > IME</strong> &#8211; kreiraj datoteku imena IME
                                                                                  </p>
                                                                                </li>
                                                                              </ul>
                                                                              
                                                                              <p>
                                                                                &nbsp;
                                                                              </p>
                                                                              
                                                                              <h2>
                                                                                Naredbe za ispis datoteka
                                                                              </h2>
                                                                              
                                                                              <ul>
                                                                                <li>
                                                                                  <span class="lang:default decode:true  crayon-inline ">cat</span>  &#8211; ispis datoteke (stdout) ili povezivanje više njih (concatenate)
                                                                                </li>
                                                                                <li>
                                                                                  <span class="lang:default decode:true  crayon-inline ">more</span>  &#8211; ispis datoteke na standardni izlaz, ekran po ekran
                                                                                </li>
                                                                                <li>
                                                                                  <span class="lang:default decode:true  crayon-inline ">less</span>  &#8211; napredna verzija more
                                                                                </li>
                                                                                <li>
                                                                                  <span class="lang:default decode:true  crayon-inline ">head</span>  &#8211; ispis samo početka datoteke (stdout)
                                                                                </li>
                                                                                <li>
                                                                                  <span class="lang:default decode:true  crayon-inline ">tail</span>  &#8211; ispis samo kraja datoteke (stdout)
                                                                                </li>
                                                                              </ul>
                                                                              
                                                                              <p>
                                                                                &nbsp;
                                                                              </p>
                                                                              
                                                                              <h2>
                                                                                Rad s datotekama
                                                                              </h2>
                                                                              
                                                                              <ul>
                                                                                <li dir="ltr">
                                                                                  <p dir="ltr">
                                                                                    <strong><span class="lang:default decode:true  crayon-inline ">mv</span>  IME1 IME2</strong>   (move) &#8211; prebacivanje
                                                                                  </p>
                                                                                  
                                                                                  <ul>
                                                                                    <li dir="ltr">
                                                                                      <p dir="ltr">
                                                                                        <strong><span class="lang:default decode:true  crayon-inline ">mv</span>  ime-datoteke ime-dir</strong>  (move)
                                                                                      </p>
                                                                                    </li>
                                                                                    
                                                                                    <li dir="ltr">
                                                                                      <p dir="ltr">
                                                                                        <strong><span class="lang:default decode:true  crayon-inline ">mv</span>  staro-ime novo-ime</strong>  (move)
                                                                                      </p>
                                                                                    </li>
                                                                                  </ul>
                                                                                </li>
                                                                              </ul>
                                                                              
                                                                              <ul>
                                                                                <li dir="ltr">
                                                                                  <p dir="ltr">
                                                                                    <strong><span class="lang:default decode:true  crayon-inline ">rm</span>  IME</strong>   Brisanje (remove)
                                                                                  </p>
                                                                                </li>
                                                                                
                                                                                <li dir="ltr">
                                                                                  <p dir="ltr">
                                                                                    <strong><span class="lang:default decode:true  crayon-inline ">cp</span>  izvor odredište</strong>   Kopiranje (copy)
                                                                                  </p>
                                                                                  
                                                                                  <ul>
                                                                                    <li dir="ltr">
                                                                                      <p dir="ltr">
                                                                                        <strong><span class="lang:default decode:true  crayon-inline ">cp</span>  izvor1 izvor2 odredište</strong>
                                                                                      </p>
                                                                                    </li>
                                                                                    
                                                                                    <li dir="ltr">
                                                                                      <p dir="ltr">
                                                                                        <strong><span class="lang:default decode:true  crayon-inline ">cp</span>  -r izvor odredište</strong>   &#8211; Rekurzivno kopiranje <span style="line-height: 1.5;">direktorija</span>
                                                                                      </p>
                                                                                    </li>
                                                                                  </ul>
                                                                                </li>
                                                                              </ul>
                                                                              
                                                                              <p>
                                                                                &nbsp;
                                                                              </p>
                                                                              
                                                                              <h2>
                                                                                Rad sa sadržajem datoteka
                                                                              </h2>
                                                                              
                                                                              <ul>
                                                                                <li dir="ltr">
                                                                                  <p dir="ltr">
                                                                                    <strong><span class="lang:default decode:true  crayon-inline ">grep</span>  pojam IMEDATOTEK</strong>E  (pretraživanje pojma unutar datoteke)
                                                                                  </p>
                                                                                  
                                                                                  <ul>
                                                                                    <li dir="ltr">
                                                                                      <p dir="ltr">
                                                                                        <strong><span class="lang:default decode:true  crayon-inline ">grep</span>  -r pojam ime-dir</strong> (rekurzivno pretraživanje)
                                                                                      </p>
                                                                                    </li>
                                                                                  </ul>
                                                                                </li>
                                                                              </ul>
                                                                              
                                                                              <ul>
                                                                                <li dir="ltr">
                                                                                  <p dir="ltr">
                                                                                    <strong><span class="lang:default decode:true  crayon-inline ">wc</span>  IMEDATOTEKE</strong>  prebrojavanje riječi u datoteci
                                                                                  </p>
                                                                                </li>
                                                                                
                                                                                <li dir="ltr">
                                                                                  <p dir="ltr">
                                                                                    <span class="lang:default decode:true  crayon-inline ">uniq</span>  &#8211;  izbacivanje riječi koje se ponavljaju
                                                                                  </p>
                                                                                </li>
                                                                                
                                                                                <li dir="ltr">
                                                                                  <p dir="ltr">
                                                                                    <span class="lang:default decode:true  crayon-inline ">sort</span>  &#8211;  sortiranje
                                                                                  </p>
                                                                                </li>
                                                                                
                                                                                <li dir="ltr">
                                                                                  <p dir="ltr">
                                                                                    <span class="lang:default decode:true  crayon-inline ">awk</span>  &#8211;  obrada text baziranih podataka
                                                                                  </p>
                                                                                </li>
                                                                                
                                                                                <li dir="ltr">
                                                                                  <p dir="ltr">
                                                                                    <span class="lang:default decode:true  crayon-inline ">sed</span>  &#8211;  stream editor (promijene nad nizom podataka)
                                                                                  </p>
                                                                                </li>
                                                                              </ul>
                                                                              
                                                                              <h3>
                                                                                Primjeri
                                                                              </h3>
                                                                              
                                                                              <p dir="ltr">
                                                                                Ispiši samo prvi stupac iz datoteke, delimiter je znak <strong><span style="color: #ff0000;">:</span></strong>
                                                                              </p>
                                                                              
                                                                              <p dir="ltr">
                                                                                U ovom slučaju izlistati ćemo datoteku u kojoj su korisnički accounti i njihovi parametri ali nas zanima samo popis korisnika, koji je u prvom stupcu.
                                                                              </p>
                                                                              
                                                                              <p dir="ltr">
                                                                                Ova datoteka inaće igleda ovako (to je praktično CSV datoteka kojoj je delimiter znak  <span style="color: #ff0000;"><strong>:</strong></span>  )
                                                                              </p>
                                                                              
                                                                              <pre class="lang:default highlight:0 decode:true">root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin
adm:x:3:4:adm:/var/adm:/sbin/nologin
lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin</pre>
                                                                              
                                                                              <pre class="lang:default decode:true">awk -F':' '{ print $1 }' /etc/passwd</pre>
                                                                              
                                                                              <p dir="ltr">
                                                                                <span style="line-height: 1.5;">Ispis izgleda ovako :</span>
                                                                              </p>
                                                                              
                                                                              <pre class="lang:default highlight:0 decode:true">root

bin

daemon

adm

lp

sync

shutdown

halt

...</pre>
                                                                              
                                                                              <p>
                                                                                U kasnijim poglavljima ćemo ući detaljnije u neke od gore navedenih programa.
                                                                              </p>
                                                                              
                                                                              <p dir="ltr">
                                                                                <span style="line-height: 1.5;"> </span>
                                                                              </p>
                                                                              
                                                                              <p>
                                                                                &nbsp;
                                                                              </p>
                                                                              
                                                                              <h1>
                                                                                Arhiviranje
                                                                              </h1>
                                                                              
                                                                              <ul>
                                                                                <li dir="ltr">
                                                                                  <p dir="ltr">
                                                                                    Za arhiviranje i čitanje arhiviranih datoteka koristi se naredba <span class="lang:default decode:true  crayon-inline ">tar</span>
                                                                                  </p>
                                                                                </li>
                                                                              </ul>
                                                                              
                                                                              <p dir="ltr">
                                                                                   Nastala je zbog potrebe za arhiviranjem  podataka na tračne medije, za pohranu podataka (backup).
                                                                              </p>
                                                                              
                                                                              <ul>
                                                                                <li dir="ltr">
                                                                                  <p dir="ltr">
                                                                                    Naziv je došao od Tape ARchive
                                                                                  </p>
                                                                                </li>
                                                                              </ul>
                                                                              
                                                                              <p>
                                                                                Slika pokazuje kako izgleda tračni uređaj za DDS trake te neke od traka (uz 3.5&#8243; disketu za usporedbu veličine).
                                                                              </p>
                                                                              
                                                                              <p>
                                                                                <img alt="" src="https://lh4.googleusercontent.com/6LGi07-fCOtcYaEfV1rYmeikb393Ss5K1x5cWQP8K_VIbaM3fFX4gey8_jRFyep_b9kZE4CZqjxRecsjnrtiBNCd-h8BAyrPq3aCqyuiwu7yY6VoxRK43IjzkHga" width="556.0287893700787px;" height="417.23625123031496px;" />
                                                                              </p>
                                                                              
                                                                              <ul>
                                                                                <li dir="ltr">
                                                                                  <p dir="ltr">
                                                                                    Naredba <span class="lang:default decode:true  crayon-inline ">tar</span> , osim samih datoteka i/ili direktorija može spremati i sve ovlasti.
                                                                                  </p>
                                                                                </li>
                                                                                
                                                                                <li dir="ltr">
                                                                                  <p dir="ltr">
                                                                                    Neki od prekidača naredbe tar
                                                                                  </p>
                                                                                  
                                                                                  <ul>
                                                                                    <li dir="ltr">
                                                                                      <p dir="ltr">
                                                                                        <span class="lang:default decode:true  crayon-inline ">c</span>   &#8211; create (kreiraj)
                                                                                      </p>
                                                                                    </li>
                                                                                    
                                                                                    <li dir="ltr">
                                                                                      <p dir="ltr">
                                                                                        <span class="lang:default decode:true  crayon-inline ">v </span>  &#8211; verbose (detaljniji ispis)
                                                                                      </p>
                                                                                    </li>
                                                                                    
                                                                                    <li dir="ltr">
                                                                                      <p dir="ltr">
                                                                                        <span class="lang:default decode:true  crayon-inline ">t</span>   &#8211; izlistaj sadržaj
                                                                                      </p>
                                                                                    </li>
                                                                                    
                                                                                    <li dir="ltr">
                                                                                      <p dir="ltr">
                                                                                        <span class="lang:default decode:true  crayon-inline ">f</span>   &#8211; slijedeći argument je naziv datoteke
                                                                                      </p>
                                                                                    </li>
                                                                                    
                                                                                    <li dir="ltr">
                                                                                      <p dir="ltr">
                                                                                        <span class="lang:default decode:true  crayon-inline ">z</span>   &#8211; dodatno komprimiraj (gzip format)
                                                                                      </p>
                                                                                    </li>
                                                                                    
                                                                                    <li dir="ltr">
                                                                                      <p dir="ltr">
                                                                                        <span class="lang:default decode:true  crayon-inline ">j</span>   &#8211; dodatno komprimiraj (bzip2 format)
                                                                                      </p>
                                                                                    </li>
                                                                                    
                                                                                    <li dir="ltr">
                                                                                      <p dir="ltr">
                                                                                        <span class="lang:default decode:true  crayon-inline ">p</span>   &#8211; sačuvaj sve ovlasti (preserve permissions &#8211; ovo je standardno ako ste root)
                                                                                      </p>
                                                                                    </li>
                                                                                  </ul>
                                                                                </li>
                                                                              </ul>
                                                                              
                                                                              <p>
                                                                                &nbsp;
                                                                              </p>
                                                                              
                                                                              <h2>
                                                                                Primjeri
                                                                              </h2>
                                                                              
                                                                              <p dir="ltr">
                                                                                Kreiraj tar arhivu od trenutnog direktorija, naziva arhiva.tar
                                                                              </p>
                                                                              
                                                                              <pre class="lang:default decode:true">tar cvf arhiva.tar .</pre>
                                                                              
                                                                              <p>
                                                                                Kreiraj tar arhivu od trenutnog direktorija, direktno na traku (/dev/st0)
                                                                              </p>
                                                                              
                                                                              <pre class="lang:default decode:true">tar cvf /dev/st0 .</pre>
                                                                              
                                                                              <p>
                                                                                Kreiraj komprimiranu tar arhivu od trenutnog direktorija, naziva arhiva.tgz
                                                                              </p>
                                                                              
                                                                              <pre class="lang:default decode:true">tar cvzf arhiva.tgz .</pre>
                                                                              
                                                                              <p>
                                                                                Ispiši samo sadržaj datoteke arhiva.tgz
                                                                              </p>
                                                                              
                                                                              <pre class="lang:default decode:true">tar tvf arhiva.tgz</pre>
                                                                              
                                                                              <p>
                                                                                Odkomprimiraj i dearhiviraj arhivu: arhiva.tgz
                                                                              </p>
                                                                              
                                                                              <pre class="lang:default decode:true">tar xvzf arhiva.tgz</pre>
                                                                              
                                                                              <p>
                                                                                &nbsp;
                                                                              </p>
                                                                              
                                                                              <h2>
                                                                                Rad s tračnim uređajima
                                                                              </h2>
                                                                              
                                                                              <ul>
                                                                                <li dir="ltr">
                                                                                  <p dir="ltr">
                                                                                    Činjenice o trakama:
                                                                                  </p>
                                                                                  
                                                                                  <ul>
                                                                                    <li dir="ltr">
                                                                                      <p dir="ltr">
                                                                                        Podaci se na trake zapisuju serijski (u nizu)
                                                                                      </p>
                                                                                    </li>
                                                                                    
                                                                                    <li dir="ltr">
                                                                                      <p dir="ltr">
                                                                                        Mogu spremiti velike količine podataka (pr. LTO 6 : 2.5TB)
                                                                                      </p>
                                                                                    </li>
                                                                                    
                                                                                    <li dir="ltr">
                                                                                      <p dir="ltr">
                                                                                        Najjeftiniji su pouzdani medij za pohranu velike količine podataka
                                                                                      </p>
                                                                                    </li>
                                                                                    
                                                                                    <li dir="ltr">
                                                                                      <p dir="ltr">
                                                                                        Trake su izdržljive:
                                                                                      </p>
                                                                                      
                                                                                      <ul>
                                                                                        <li dir="ltr">
                                                                                          <p dir="ltr">
                                                                                            omougučavaju do nekoliko tisuća ubacivanja i izbacivanja iz tračnog uređaja
                                                                                          </p>
                                                                                        </li>
                                                                                        
                                                                                        <li dir="ltr">
                                                                                          <p dir="ltr">
                                                                                            omogučavaju nekoliko stotina prepisivanja cijele trake
                                                                                          </p>
                                                                                        </li>
                                                                                      </ul>
                                                                                    </li>
                                                                                    
                                                                                    <li dir="ltr">
                                                                                      <p dir="ltr">
                                                                                        Za rad s tračnim uređajima i trakama koristi se naredba <span class="lang:default decode:true  crayon-inline ">mt</span>  (magnetic tape controll)
                                                                                      </p>
                                                                                    </li>
                                                                                  </ul>
                                                                                </li>
                                                                              </ul>
                                                                              
                                                                              <p>
                                                                                &nbsp;
                                                                              </p>
                                                                              
                                                                              <p>
                                                                                Specifikacija osnovnih karakteristika LTO traka:
                                                                              </p>
                                                                              
                                                                              <p>
                                                                                <img alt="" src="https://lh6.googleusercontent.com/eS2oYeX9HALVtFh_gmM7wDA7bh99yySBWNFDIr9GmareBo1ASy8el3GOUkdIxOuFpiP1SG2M4pD5sZdyRbcJrhLZPvW6YUSXX6F_iFXVGWg33CyMwclA3IDk9YGk" width="831.9946757639487px;" height="377.27030852710794px;" />
                                                                              </p>
                                                                              
                                                                              <p>
                                                                                Upotreba naredbe <span class="lang:default decode:true  crayon-inline ">mt</span>
                                                                              </p>
                                                                              
                                                                              <ul>
                                                                                <li dir="ltr">
                                                                                  <p dir="ltr">
                                                                                    Prekidači naredbe <span class="lang:default decode:true  crayon-inline ">mt</span> :
                                                                                  </p>
                                                                                  
                                                                                  <ul>
                                                                                    <li dir="ltr">
                                                                                      <p dir="ltr">
                                                                                        <span class="lang:default decode:true  crayon-inline ">-f</span>       &#8211; file device (ime uređaja /dev/&#8230;)
                                                                                      </p>
                                                                                    </li>
                                                                                    
                                                                                    <li dir="ltr">
                                                                                      <p dir="ltr">
                                                                                        <span class="lang:default decode:true  crayon-inline ">rewind</span>   &#8211; premotaj traku na početak
                                                                                      </p>
                                                                                    </li>
                                                                                    
                                                                                    <li dir="ltr">
                                                                                      <p dir="ltr">
                                                                                        <span class="lang:default decode:true  crayon-inline ">retension</span>   &#8211; premotaj na kraj pa na početak (zbog   izjednačavanja napetosti trake)
                                                                                      </p>
                                                                                    </li>
                                                                                    
                                                                                    <li dir="ltr">
                                                                                      <p dir="ltr">
                                                                                        <span class="lang:default decode:true  crayon-inline ">status</span>   &#8211; ispiši status
                                                                                      </p>
                                                                                    </li>
                                                                                    
                                                                                    <li dir="ltr">
                                                                                      <p dir="ltr">
                                                                                        <span class="lang:default decode:true  crayon-inline ">reserve</span>   &#8211; rezerviraj &#8211; i nakon završetka snimanja
                                                                                      </p>
                                                                                    </li>
                                                                                    
                                                                                    <li dir="ltr">
                                                                                      <p dir="ltr">
                                                                                        <span class="lang:default decode:true  crayon-inline ">release</span>   &#8211; oslobodi za drugi rad
                                                                                      </p>
                                                                                    </li>
                                                                                    
                                                                                    <li dir="ltr">
                                                                                      <p dir="ltr">
                                                                                        <span class="lang:default decode:true  crayon-inline ">erase</span>   &#8211; obriši cijelu traku
                                                                                      </p>
                                                                                    </li>
                                                                                    
                                                                                    <li dir="ltr">
                                                                                      <p dir="ltr">
                                                                                        <span class="lang:default decode:true  crayon-inline ">offline</span>   &#8211; unload tape (izbaci traku)
                                                                                      </p>
                                                                                    </li>
                                                                                  </ul>
                                                                                </li>
                                                                              </ul>
                                                                              
                                                                              <p>
                                                                                &nbsp;
                                                                              </p>
                                                                              
                                                                              <h3>
                                                                                Primjeri <span class="lang:default decode:true  crayon-inline ">mt</span>  i <span class="lang:default decode:true  crayon-inline ">tar</span>
                                                                              </h3>
                                                                              
                                                                              <p dir="ltr">
                                                                                Premotaj traku (/dev/st0) na početak
                                                                              </p>
                                                                              
                                                                              <pre class="lang:default decode:true">mt -f /dev/st0 rewind</pre>
                                                                              
                                                                              <p>
                                                                                Provjeri na kojem bloku se traka nalazi
                                                                              </p>
                                                                              
                                                                              <pre class="lang:default decode:true">mt -f /dev/st0 tell</pre>
                                                                              
                                                                              <p>
                                                                                Ispiši sve datoteke na traci
                                                                              </p>
                                                                              
                                                                              <pre class="lang:default decode:true">tar -tzf /dev/st0</pre>
                                                                              
                                                                              <p>
                                                                                &nbsp;
                                                                              </p>
                                                                              
                                                                              <p dir="ltr">
                                                                                Napravi restore direktorija www [na traci](prvo premotaj na početak)
                                                                              </p>
                                                                              
                                                                              <pre class="lang:default decode:true">cd /root/restoredir/

mt -f /dev/st0 rewind

tar -xzf /dev/st0 www</pre>
                                                                              
                                                                              <p>
                                                                                &nbsp;
                                                                              </p>
                                                                              
                                                                              <p>
                                                                                &nbsp;
                                                                              </p>
                                                                              
                                                                              <p>
                                                                                &nbsp;
                                                                              </p>
                                                                              
                                                                              <p>
                                                                                &nbsp;
                                                                              </p>
                                                                              
                                                                              <h1>
                                                                                Meta znakovi
                                                                              </h1>
                                                                              
                                                                              <p>
                                                                                Meta znakove često koristimo za regularne izraze
                                                                              </p>
                                                                              
                                                                              <ul>
                                                                                <li dir="ltr">
                                                                                  <p dir="ltr">
                                                                                    Meta znakovi  su većina nealfanumerčkih znakova, koji imaju posebno značenje u komandnoj ljusci.
                                                                                  </p>
                                                                                </li>
                                                                                
                                                                                <li dir="ltr">
                                                                                  <p dir="ltr">
                                                                                    Neki od meta znakova:
                                                                                  </p>
                                                                                </li>
                                                                              </ul>
                                                                              
                                                                              <p dir="ltr">
                                                                                <strong>             </strong>
                                                                              </p>
                                                                              
                                                                              <p>
                                                                                <span class="lang:default highlight:0 decode:true crayon-inline">< > * ? [ ] $ & &#8211; \ ! ; | &nbsp;“ ‘</span>
                                                                              </p>
                                                                              
                                                                              <p>
                                                                                &nbsp;
                                                                              </p>
                                                                              
                                                                              <ul>
                                                                                <li dir="ltr">
                                                                                  <p dir="ltr">
                                                                                    Wildcards znakovi su podgrupa Meta znakova i zamjenjuju alfanumeričke znakove, to su : <strong> <span class="lang:default highlight:0 decode:true  crayon-inline">* ? ! [ ] &#8211;</span> </strong>
                                                                                  </p>
                                                                                </li>
                                                                              </ul>
                                                                              
                                                                              <p>
                                                                                &nbsp;
                                                                              </p>
                                                                              
                                                                              <h2>
                                                                                Značenje nekih meta znakova
                                                                              </h2>
                                                                              
                                                                              <p dir="ltr">
                                                                                <p dir="ltr">
                                                                                  Wildcards
                                                                                </p>
                                                                                
                                                                                <ul>
                                                                                  <li dir="ltr">
                                                                                    <p dir="ltr">
                                                                                      <span class="lang:default highlight:0 decode:true  crayon-inline ">*</span>   označava bilo koliko znakova (i 0 njih)
                                                                                    </p>
                                                                                  </li>
                                                                                  
                                                                                  <li dir="ltr">
                                                                                    <p dir="ltr">
                                                                                      <span class="lang:default highlight:0 decode:true  crayon-inline ">?</span>  označava točno jedan bilo koji znak
                                                                                    </p>
                                                                                  </li>
                                                                                  
                                                                                  <li dir="ltr">
                                                                                    <p dir="ltr">
                                                                                      <span class="lang:default highlight:0 decode:true  crayon-inline ">[ ]</span>  označava listu znakova pr.     [a-zA-Z]
                                                                                    </p>
                                                                                  </li>
                                                                                </ul>
                                                                                
                                                                                <p dir="ltr">
                                                                                  Meta znakovi
                                                                                </p>
                                                                                
                                                                                <ul>
                                                                                  <li dir="ltr">
                                                                                    <p dir="ltr">
                                                                                      <span class="lang:default highlight:0 decode:true  crayon-inline ">;</span>   pokretanje više naredni jedna za drugom
                                                                                    </p>
                                                                                  </li>
                                                                                  
                                                                                  <li dir="ltr">
                                                                                    <p dir="ltr">
                                                                                      <span class="lang:default highlight:0 decode:true  crayon-inline ">&</span>  pokretanje u  pozadini
                                                                                    </p>
                                                                                  </li>
                                                                                </ul>
                                                                                
                                                                                <p>
                                                                                  &nbsp;
                                                                                </p>
                                                                                
                                                                                <p>
                                                                                  &nbsp;
                                                                                </p>
                                                                                
                                                                                <h1>
                                                                                  Regularni izrazi
                                                                                </h1>
                                                                                
                                                                                <ul>
                                                                                  <li dir="ltr">
                                                                                    <p dir="ltr">
                                                                                      Regularni izrazi predstavljaju zapise koji se odnose na određeni uzorak.
                                                                                    </p>
                                                                                  </li>
                                                                                  
                                                                                  <li dir="ltr">
                                                                                    <p dir="ltr">
                                                                                      Koriste se za pronalaženje i baratanje s određenim uzorcima.
                                                                                    </p>
                                                                                  </li>
                                                                                  
                                                                                  <li dir="ltr">
                                                                                    <p dir="ltr">
                                                                                      Koriste ih i razni programi :
                                                                                    </p>
                                                                                    
                                                                                    <ul>
                                                                                      <li dir="ltr">
                                                                                        <p dir="ltr">
                                                                                          <span class="lang:default highlight:0 decode:true  crayon-inline ">vi , more , grep , sed , awk , &#8230;</span>
                                                                                        </p>
                                                                                      </li>
                                                                                    </ul>
                                                                                  </li>
                                                                                </ul>
                                                                                
                                                                                <p>
                                                                                  &nbsp;
                                                                                </p>
                                                                                
                                                                                <h2>
                                                                                  Primjeri upotrebe
                                                                                </h2>
                                                                                
                                                                                <p dir="ltr">
                                                                                  Pr. izlistajmo datoteke čije ima počinje sa <strong>d</strong>
                                                                                </p>
                                                                                
                                                                                <pre class="lang:default decode:true">ls -al d*</pre>
                                                                                
                                                                                <p>
                                                                                  &nbsp;
                                                                                </p>
                                                                                
                                                                                <pre class="lang:default decode:true">-rw-r--r-- 1 root root 320 Nov 15 11:28 datoteka.txt</pre>
                                                                                
                                                                                <p dir="ltr">
                                                                                  <p>
                                                                                     <span style="line-height: 1.5;">Pr. izlistajmo datoteke čije ima počinje s datoteka.tx i ima još jedan bilo koji karakter (alfabet)</span>
                                                                                  </p>
                                                                                  
                                                                                  <pre class="lang:default decode:true">ls -al datoteka.tx?</pre>
                                                                                  
                                                                                  <p dir="ltr">
                                                                                    <pre class="lang:default decode:true">-rw-r--r-- 1 root root 320 Nov 15 11:28 datoteka.txt</pre>
                                                                                    
                                                                                    <p dir="ltr">
                                                                                      <h2>
                                                                                         Regularni izrazi i metaznakovi
                                                                                      </h2>
                                                                                      
                                                                                      <ul>
                                                                                        <li dir="ltr">
                                                                                          <p dir="ltr">
                                                                                            Ponekad želimo isključiti djelovanje metaznakova, za to služi metaznak \
                                                                                          </p>
                                                                                          
                                                                                          <ul>
                                                                                            <li dir="ltr">
                                                                                              <p dir="ltr">
                                                                                                Pr.: želimo ispisati <strong>test*</strong>
                                                                                              </p>
                                                                                            </li>
                                                                                          </ul>
                                                                                        </li>
                                                                                      </ul>
                                                                                      
                                                                                      <pre class="lang:default decode:true">echo test\*

test*</pre>
                                                                                      
                                                                                      <p>
                                                                                        &nbsp;
                                                                                      </p>
                                                                                      
                                                                                      <h3>
                                                                                         Posebni metaznakovi
                                                                                      </h3>
                                                                                      
                                                                                      <ul>
                                                                                        <li dir="ltr">
                                                                                          <p dir="ltr">
                                                                                            Jednostruki navodnici  <span class="lang:default decode:true  crayon-inline">‘  ’</span>
                                                                                          </p>
                                                                                          
                                                                                          <ul>
                                                                                            <li dir="ltr">
                                                                                              <p dir="ltr">
                                                                                                isključuju interpretaciju svih meta znakova osim <span style="background-color: #f4f4f4; font-family: 'Courier 10 Pitch', Courier, monospace; font-size: 13px; line-height: 1.5;">  ! \</span>
                                                                                              </p>
                                                                                            </li>
                                                                                          </ul>
                                                                                        </li>
                                                                                      </ul>
                                                                                      
                                                                                      <ul>
                                                                                        <li dir="ltr">
                                                                                          <p dir="ltr">
                                                                                            Dvostruki navodnici   <span class="lang:default decode:true  crayon-inline">“ “</span>
                                                                                          </p>
                                                                                          
                                                                                          <ul>
                                                                                            <li dir="ltr">
                                                                                              <p dir="ltr">
                                                                                                isključuju interpretaciju svih metaznakova osim <span class="lang:default decode:true  crayon-inline ">$</span>  (koji služi za supstituciju varijabli) te   <span class="lang:default decode:true  crayon-inline">! ` \</span>
                                                                                              </p>
                                                                                            </li>
                                                                                          </ul>
                                                                                        </li>
                                                                                      </ul>
                                                                                      
                                                                                      <ul>
                                                                                        <li dir="ltr">
                                                                                          <p dir="ltr">
                                                                                            Jednostruki  kosi navodnici     <span class="lang:default decode:true  crayon-inline ">`  `</span>
                                                                                          </p>
                                                                                          
                                                                                          <ul>
                                                                                            <li>
                                                                                               sve što se nalazi unutar njih će biti izvršeno kao naredba ili niz naredbi
                                                                                            </li>
                                                                                          </ul>
                                                                                        </li>
                                                                                      </ul>
                                                                                      
                                                                                      <h4 dir="ltr">
                                                                                      </h4>
                                                                                      
                                                                                      <h4 dir="ltr">
                                                                                        <span style="line-height: 1.5;">Primjeri:</span>
                                                                                      </h4>
                                                                                      
                                                                                      <p dir="ltr">
                                                                                        Postaviti ćemo varijablu <strong>TEST</strong> na vrijednost<strong> 1</strong>
                                                                                      </p>
                                                                                      
                                                                                      <pre class="lang:default decode:true">TEST=1</pre>
                                                                                      
                                                                                      <p>
                                                                                        &nbsp;
                                                                                      </p>
                                                                                      
                                                                                      <p dir="ltr">
                                                                                        Ispisati ju preko <span class="lang:default decode:true  crayon-inline ">“ ”</span>
                                                                                      </p>
                                                                                      
                                                                                      <pre class="lang:default decode:true">echo “$TEST”

1</pre>
                                                                                      
                                                                                      <p>
                                                                                        Ispisati ju preko <span class="lang:default decode:true  crayon-inline ">&#8216; &#8216;</span>
                                                                                      </p>
                                                                                      
                                                                                      <pre class="lang:default decode:true">echo '$TEST'

$TEST</pre>
                                                                                      
                                                                                      <p>
                                                                                        &nbsp;
                                                                                      </p>
                                                                                      
                                                                                      <p dir="ltr">
                                                                                        Ispisati ćemo komentar i pozvati drugu naredbu , pomoću <span class="lang:default decode:true  crayon-inline ">&#8221; &#8220;</span>  i  <span class="lang:default decode:true  crayon-inline">` `</span>
                                                                                      </p>
                                                                                      
                                                                                      <p dir="ltr">
                                                                                        Obratite pažnju da je sve što je bilo upisano između  <span class="lang:default decode:true  crayon-inline">` `</span> pokrenuto kao naredba.
                                                                                      </p>
                                                                                      
                                                                                      <pre class="lang:default decode:true">echo "komentar  `ls -al datoteka.txt`"

komentar  -rw-r--r-- 1 root root 0 Nov 21 09:49 datoteka.txt</pre>
                                                                                      
                                                                                      <p>
                                                                                        <span style="line-height: 1.5;"> &#8230; a sada pomoću <span class="lang:default decode:true  crayon-inline ">&#8216; &#8216;</span> </span>
                                                                                      </p>
                                                                                      
                                                                                      <pre class="lang:default decode:true">echo 'komentar  `ls -al datoteka.txt`'

komentar  `ls -al datoteka.txt`</pre>
                                                                                      
                                                                                      <p>
                                                                                        &nbsp;
                                                                                      </p>
                                                                                      
                                                                                      <pre class="lang:default decode:true">echo 'komentar "ls -al datoteka.txt"'

komentar "ls -al datoteka.txt"</pre>
                                                                                      
                                                                                      <p>
                                                                                        &nbsp;
                                                                                      </p>
                                                                                      
                                                                                      <p dir="ltr">
                                                                                        <span style="line-height: 1.5;"> Primjeri upotrebe metaznakova u često korištenim programima:</span>
                                                                                      </p>
                                                                                      
                                                                                      <p dir="ltr">
                                                                                        <img alt="" src="https://lh5.googleusercontent.com/4p2FBmpLVBCSDeFygF9KZz6f8h-NtCfZs8BQsS4MYlpKD-XacEf0usy3mToxNwf8MSZlXJMEqGJp8sB6NfVUGSlGj3OJCIxo8CJWibIrXNNFcALE7_Er1_xiQiXZ" width="664.5906054879737px;" height="388.52225492382297px;" />
                                                                                      </p>
                                                                                      
                                                                                      <p dir="ltr">
                                                                                        <p dir="ltr">
                                                                                          <p>
                                                                                             <span style="line-height: 1.5;"> </span>
                                                                                          </p>
                                                                                          
                                                                                          <p dir="ltr">
                                                                                            <h1>
                                                                                              Preusmjeravanje i &#8220;Pipe&#8221;
                                                                                            </h1>
                                                                                            
                                                                                            <p dir="ltr">
                                                                                              Preusmjeravanje (redirekcija), pomoću meta znakova  <span class="lang:default highlight:0 decode:true  crayon-inline "><<   <    >   >></span>    :
                                                                                            </p>
                                                                                            
                                                                                            <ul>
                                                                                              <li dir="ltr">
                                                                                                <p dir="ltr">
                                                                                                  Default ulaz je <span class="lang:default highlight:0 decode:true  crayon-inline">stdin</span>  (tipkovnica)
                                                                                                </p>
                                                                                              </li>
                                                                                              
                                                                                              <li dir="ltr">
                                                                                                <p dir="ltr">
                                                                                                  Default izlaz je <span class="lang:default highlight:0 decode:true  crayon-inline ">stdout</span>  (ekran)
                                                                                                </p>
                                                                                              </li>
                                                                                            </ul>
                                                                                            
                                                                                            <p>
                                                                                              Pipe ( <span class="lang:default decode:true  crayon-inline ">|</span>  ) preusmjerava standardni izlaz jedne naredbe u standardni ulaz druge, bez potrebe za korištenjem privremenih datoteka
                                                                                            </p>
                                                                                            
                                                                                            <p>
                                                                                              &nbsp;
                                                                                            </p>
                                                                                            
                                                                                            <h2>
                                                                                               Primjeri preusmjeravanja
                                                                                            </h2>
                                                                                            
                                                                                            <p dir="ltr">
                                                                                              <p dir="ltr">
                                                                                                Preusmjeri naredbu u datoteku:
                                                                                              </p>
                                                                                              
                                                                                              <p dir="ltr">
                                                                                                Pr. Preusmjeri izlistanje direktorija (ls -al) u datoteku
                                                                                              </p>
                                                                                              
                                                                                              <p dir="ltr">
                                                                                                naredba > datoteka.txt
                                                                                              </p>
                                                                                              
                                                                                              <pre class="lang:default decode:true">ls -al &gt; datoteka.txt</pre>
                                                                                              
                                                                                              <p dir="ltr">
                                                                                                <p>
                                                                                                   Preusmjeravanje na kraj datoteke
                                                                                                </p>
                                                                                                
                                                                                                <pre class="lang:default decode:true">ls -al &gt;&gt; datoteka.txt</pre>
                                                                                                
                                                                                                <p dir="ltr">
                                                                                                  <p>
                                                                                                     Preusmjeri datoteku u naredbu
                                                                                                  </p>
                                                                                                  
                                                                                                  <p dir="ltr">
                                                                                                    naredba < datoteka.txt
                                                                                                  </p>
                                                                                                  
                                                                                                  <pre class="lang:default decode:true">cat &lt; file1 &gt; file2</pre>
                                                                                                  
                                                                                                  <p dir="ltr">
                                                                                                    <span style="line-height: 1.5;"> </span><span style="line-height: 1.5;">==>  ulaz </span><strong style="line-height: 1.5;">cat</strong><span style="line-height: 1.5;"> naredbe je </span><strong style="line-height: 1.5;">file1</strong><span style="line-height: 1.5;"> a izlaz se preusmjerava u </span><strong style="line-height: 1.5;">file2</strong>
                                                                                                  </p>
                                                                                                  
                                                                                                  <p>
                                                                                                    &nbsp;
                                                                                                  </p>
                                                                                                  
                                                                                                  <h2>
                                                                                                    Primjeri &#8220;Pipe&#8221;-a
                                                                                                  </h2>
                                                                                                  
                                                                                                  <p dir="ltr">
                                                                                                    I prethodnog primjera preusmjeravanja ispisa direktorija u datoteku te ćemo prebrojati koliko riječi sadrži ta datoteka.
                                                                                                  </p>
                                                                                                  
                                                                                                  <p dir="ltr">
                                                                                                    Za prebrojavanje riječi koristiti ćemo naredbu <span class="lang:default highlight:0 decode:true  crayon-inline ">wc</span>  (word count).
                                                                                                  </p>
                                                                                                  
                                                                                                  <p dir="ltr">
                                                                                                    Ona standardno ispisuje:
                                                                                                  </p>
                                                                                                  
                                                                                                  <p dir="ltr">
                                                                                                    broj novih redova    broj riječi    byte count
                                                                                                  </p>
                                                                                                  
                                                                                                  <p dir="ltr">
                                                                                                    Dakle:
                                                                                                  </p>
                                                                                                  
                                                                                                  <pre class="lang:default decode:true">ls -al &gt; datoteka.txt</pre>
                                                                                                  
                                                                                                  <p dir="ltr">
                                                                                                    <pre class="lang:default decode:true">cat datoteka.txt | wc     
 7      58     320</pre>
                                                                                                    
                                                                                                    <p dir="ltr">
                                                                                                      <p>
                                                                                                        &nbsp;
                                                                                                      </p>
                                                                                                      
                                                                                                      <p dir="ltr">
                                                                                                        <span style="background-color: #ffffff;"><strong> </strong></span>Sada ćemo istu stvar iz pretodnog primjera još više pojednostavniti.
                                                                                                      </p>
                                                                                                      
                                                                                                      <p dir="ltr">
                                                                                                        Napomena:  <span class="lang:default highlight:0 decode:true  crayon-inline ">wc</span>  standardno ispisuje:
                                                                                                      </p>
                                                                                                      
                                                                                                      <p dir="ltr">
                                                                                                        broj novih redova    broj riječi    byte count
                                                                                                      </p>
                                                                                                      
                                                                                                      <p dir="ltr">
                                                                                                        Dakle:
                                                                                                      </p>
                                                                                                      
                                                                                                      <pre class="lang:default decode:true">ls -al | wc     
 7      58     320</pre>
                                                                                                      
                                                                                                      <p dir="ltr">
                                                                                                        <h1>
                                                                                                           Komandna ljuska (shell) &#8211; Varijable
                                                                                                        </h1>
                                                                                                        
                                                                                                        <ul>
                                                                                                          <li dir="ltr">
                                                                                                            <p dir="ltr">
                                                                                                              Razlikujemo nekoliko vrsta varijbli:
                                                                                                            </p>
                                                                                                            
                                                                                                            <ul>
                                                                                                              <li dir="ltr">
                                                                                                                <p dir="ltr">
                                                                                                                  Environment varijable
                                                                                                                </p>
                                                                                                              </li>
                                                                                                              
                                                                                                              <li dir="ltr">
                                                                                                                <p dir="ltr">
                                                                                                                  “Obične” shell varijable
                                                                                                                </p>
                                                                                                              </li>
                                                                                                            </ul>
                                                                                                          </li>
                                                                                                          
                                                                                                          <li dir="ltr">
                                                                                                            <p dir="ltr">
                                                                                                              Environment varijable se prenose u pod shell-ove
                                                                                                            </p>
                                                                                                          </li>
                                                                                                          
                                                                                                          <li dir="ltr">
                                                                                                            <p dir="ltr">
                                                                                                              “Obične” shell varijable “žive” samo unutar shell-a u kojem radimo
                                                                                                            </p>
                                                                                                          </li>
                                                                                                        </ul>
                                                                                                        
                                                                                                        <p>
                                                                                                          &nbsp;
                                                                                                        </p>
                                                                                                        
                                                                                                        <h2>
                                                                                                          Primjeri (bash shell):
                                                                                                        </h2>
                                                                                                        
                                                                                                        <p dir="ltr">
                                                                                                          Pr. kreirajmo sistemsku varijablu TEST , koja će imati vrijednost korisnik
                                                                                                        </p>
                                                                                                        
                                                                                                        <pre class="lang:default decode:true">TEST=korisnik</pre>
                                                                                                        
                                                                                                        <p>
                                                                                                          &nbsp;
                                                                                                        </p>
                                                                                                        
                                                                                                        <p dir="ltr">
                                                                                                          Ispišimo ju (vrijednost varijable dobivamo sa $)
                                                                                                        </p>
                                                                                                        
                                                                                                        <pre class="lang:default decode:true">echo $TEST

korisnik</pre>
                                                                                                        
                                                                                                        <p>
                                                                                                          &nbsp;
                                                                                                        </p>
                                                                                                        
                                                                                                        <p dir="ltr">
                                                                                                          Postavimo ovu varijablu kao Environment varijablu:
                                                                                                        </p>
                                                                                                        
                                                                                                        <pre class="lang:default decode:true">export TEST</pre>
                                                                                                        
                                                                                                        <p>
                                                                                                          &nbsp;
                                                                                                        </p>
                                                                                                        
                                                                                                        <p dir="ltr">
                                                                                                          Pokrenimo podljusku (subshell) i ispišimo varijablu
                                                                                                        </p>
                                                                                                        
                                                                                                        <pre class="lang:default decode:true">bash

echo $TEST

korisnik</pre>
                                                                                                        
                                                                                                        <p>
                                                                                                          &nbsp;
                                                                                                        </p>
                                                                                                        
                                                                                                        <p dir="ltr">
                                                                                                          Obrišimo postavljenu varijablu (iz početnog shell-a)
                                                                                                        </p>
                                                                                                        
                                                                                                        <pre class="lang:default decode:true">unset TEST</pre>
                                                                                                        
                                                                                                        <h2>
                                                                                                          Aliasi
                                                                                                        </h2>
                                                                                                        
                                                                                                        <ul>
                                                                                                          <li dir="ltr">
                                                                                                            <p dir="ltr">
                                                                                                              Aliasi se koriste za dodjeljivanje niza naredbi nekoj novoj (<span class="lang:default decode:true  crayon-inline ">alias</span> ) naredbi
                                                                                                            </p>
                                                                                                            
                                                                                                            <ul>
                                                                                                              <li dir="ltr">
                                                                                                                <p dir="ltr">
                                                                                                                  pr. stvorimo alias imena ll koji će pokrenuti naredbu<span class="lang:default decode:true  crayon-inline "> ls -alhi</span>
                                                                                                                </p>
                                                                                                              </li>
                                                                                                            </ul>
                                                                                                          </li>
                                                                                                        </ul>
                                                                                                        
                                                                                                        <pre class="lang:default decode:true">alias ll=´ls -alhi´</pre>
                                                                                                        
                                                                                                        <p>
                                                                                                          &nbsp;
                                                                                                        </p>
                                                                                                        
                                                                                                        <ul>
                                                                                                          <li dir="ltr">
                                                                                                            <p dir="ltr">
                                                                                                              Za brisanje aliasa koristi se naredba unalias
                                                                                                            </p>
                                                                                                            
                                                                                                            <ul>
                                                                                                              <li dir="ltr">
                                                                                                                <p dir="ltr">
                                                                                                                  Pr. obrišimo <span class="lang:default decode:true  crayon-inline ">alias ll</span>
                                                                                                                </p>
                                                                                                              </li>
                                                                                                            </ul>
                                                                                                          </li>
                                                                                                        </ul>
                                                                                                        
                                                                                                        <pre class="lang:default decode:true">unalias ll</pre>
                                                                                                        
                                                                                                        <p>
                                                                                                          &nbsp;
                                                                                                        </p>
                                                                                                        
                                                                                                        <h2>
                                                                                                           Konfiguracija komandne ljuske (shell)
                                                                                                        </h2>
                                                                                                        
                                                                                                        <ol>
                                                                                                          <li dir="ltr">
                                                                                                            <p dir="ltr">
                                                                                                              Kod startanja shell-a , prvo se učitava globalna konfiguracijska datoteka, mi ćemo govoriti o bash shell-u.
                                                                                                            </p>
                                                                                                          </li>
                                                                                                        </ol>
                                                                                                        
                                                                                                        <p dir="ltr">
                                                                                                          (nju konfigurira administrator)
                                                                                                        </p>
                                                                                                        
                                                                                                        <p dir="ltr">
                                                                                                          <span class="lang:default decode:true  crayon-inline ">/etc/profile</span>
                                                                                                        </p>
                                                                                                        
                                                                                                        <ol start="2">
                                                                                                          <li dir="ltr">
                                                                                                            <p dir="ltr">
                                                                                                              Potom se učitava ona za svakog korisnika iz njegovog home direktorija (ako postoji):
                                                                                                            </p>
                                                                                                          </li>
                                                                                                        </ol>
                                                                                                        
                                                                                                        <p dir="ltr">
                                                                                                          (Vrijednosti postavjene u /etc/profile datoteci mogu se ovdje promjeniti samo ako nisu postavljene kao readonly)
                                                                                                        </p>
                                                                                                        
                                                                                                        <p dir="ltr">
                                                                                                          <span class="lang:default decode:true  crayon-inline ">.bashrc</span>
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          &nbsp;
                                                                                                        </p>
                                                                                                        
                                                                                                        <h2>
                                                                                                          Pamćenje starih naredbi
                                                                                                        </h2>
                                                                                                        
                                                                                                        <ul>
                                                                                                          <li dir="ltr">
                                                                                                            <p dir="ltr">
                                                                                                              Od trenutka logiranja na sistem a to je i  trenutak kada se pokreće komandna ljuska (Shell) pamte se sve naredbe koje smo pozvali
                                                                                                            </p>
                                                                                                          </li>
                                                                                                          
                                                                                                          <li dir="ltr">
                                                                                                            <p dir="ltr">
                                                                                                              Naredbe koje smo pozivali moguće je:
                                                                                                            </p>
                                                                                                            
                                                                                                            <ul>
                                                                                                              <li dir="ltr">
                                                                                                                <p dir="ltr">
                                                                                                                  pozvati ponovno
                                                                                                                </p>
                                                                                                              </li>
                                                                                                              
                                                                                                              <li dir="ltr">
                                                                                                                <p dir="ltr">
                                                                                                                  pretraživati
                                                                                                                </p>
                                                                                                              </li>
                                                                                                            </ul>
                                                                                                          </li>
                                                                                                        </ul>
                                                                                                        
                                                                                                        <p dir="ltr">
                                                                                                          <span style="background-color: #ffffff;"><strong> </strong></span>
                                                                                                        </p>
                                                                                                        
                                                                                                        <h3>
                                                                                                          Primjeri
                                                                                                        </h3>
                                                                                                        
                                                                                                        <ul>
                                                                                                          <li dir="ltr">
                                                                                                            <p dir="ltr">
                                                                                                              history Ispiši povijest pozivanja svih naredbi
                                                                                                            </p>
                                                                                                            
                                                                                                            <ul>
                                                                                                              <li dir="ltr">
                                                                                                                <p dir="ltr">
                                                                                                                  <span class="lang:default decode:true  crayon-inline ">set HISTSIZE = xxx</span>  Podešavanje koliko zadnjih naredbi
                                                                                                                </p>
                                                                                                              </li>
                                                                                                            </ul>
                                                                                                          </li>
                                                                                                        </ul>
                                                                                                        
                                                                                                        <p dir="ltr">
                                                                                                                   ( xxx ) će se pamtiti
                                                                                                        </p>
                                                                                                        
                                                                                                        <ul>
                                                                                                          <li dir="ltr">
                                                                                                            <p dir="ltr">
                                                                                                              <span class="lang:default decode:true  crayon-inline ">!123</span>    pozovi naredbu iz povijesti pod rednim brojem 123
                                                                                                            </p>
                                                                                                          </li>
                                                                                                          
                                                                                                          <li dir="ltr">
                                                                                                            <p dir="ltr">
                                                                                                              <span class="lang:default decode:true  crayon-inline ">!ls</span>    pozovi zadnju naredbu iz povijesti koja počinje sa ls
                                                                                                            </p>
                                                                                                          </li>
                                                                                                          
                                                                                                          <li dir="ltr">
                                                                                                            <p dir="ltr">
                                                                                                              <span class="lang:default decode:true  crayon-inline ">CTRL r</span>   &#8211; pretraži history (ovo važi za bash shell)
                                                                                                            </p>
                                                                                                          </li>
                                                                                                        </ul>
                                                                                                        
                                                                                                        <p>
                                                                                                          &nbsp;
                                                                                                        </p>
                                                                                                        
                                                                                                        <h1>
                                                                                                          Crontab
                                                                                                        </h1>
                                                                                                        
                                                                                                        <p>
                                                                                                          &nbsp;
                                                                                                        </p>
                                                                                                        
                                                                                                        <ul>
                                                                                                          <li dir="ltr">
                                                                                                            <p dir="ltr">
                                                                                                              <span class="lang:default decode:true  crayon-inline ">crontab</span>  se koristi za automatsko pokretanje programa u točno određeno vrijeme
                                                                                                            </p>
                                                                                                          </li>
                                                                                                          
                                                                                                          <li dir="ltr">
                                                                                                            <p dir="ltr">
                                                                                                              Svaki korisnik može imati svoje crontab unose
                                                                                                            </p>
                                                                                                          </li>
                                                                                                        </ul>
                                                                                                        
                                                                                                        <p>
                                                                                                          Format <span class="lang:default decode:true  crayon-inline ">crontab</span>  unosa je opisan na slici:
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          <img alt="" src="https://lh6.googleusercontent.com/ifaxiNJS7VSQe5CNT-Vf492VMaasoRXw6QLaBJFbmFhRu6utdkxleBpMXt9owyMkZuifgnSfvaSNGMIr40q0SCAmKdmw0bQA9e7k92nT3ZoKo3vvyrT_dHF78dq0" width="686.989593585958px;" height="382.4777373867085px;" />
                                                                                                        </p>
                                                                                                        
                                                                                                        <h2>
                                                                                                          Crontab primjeri
                                                                                                        </h2>
                                                                                                        
                                                                                                        <ul>
                                                                                                          <li dir="ltr">
                                                                                                            <p dir="ltr">
                                                                                                              Opcije naredbe crontab su:
                                                                                                            </p>
                                                                                                            
                                                                                                            <ul>
                                                                                                              <li dir="ltr">
                                                                                                                <p dir="ltr">
                                                                                                                  <span class="lang:default decode:true  crayon-inline ">e</span>  &#8211; editiraj crontab datoteku
                                                                                                                </p>
                                                                                                              </li>
                                                                                                              
                                                                                                              <li dir="ltr">
                                                                                                                <p dir="ltr">
                                                                                                                  <span class="lang:default decode:true  crayon-inline ">l</span>  &#8211; (malo slovo L) ispiši sadržaj datoteke
                                                                                                                </p>
                                                                                                              </li>
                                                                                                              
                                                                                                              <li dir="ltr">
                                                                                                                <p dir="ltr">
                                                                                                                  <span class="lang:default decode:true  crayon-inline ">r</span>  &#8211; briše korisnikovu crontab datoteku
                                                                                                                </p>
                                                                                                              </li>
                                                                                                            </ul>
                                                                                                          </li>
                                                                                                        </ul>
                                                                                                        
                                                                                                        <p dir="ltr">
                                                                                                          Kreiraj novi crontab unos (da se pokreće svaki dan u 00:00.h.), koji će pokretati naredbu <span class="lang:default decode:true  crayon-inline ">df -h</span>
                                                                                                        </p>
                                                                                                        
                                                                                                        <pre class="lang:default decode:true">crontab -e

0 0 * * * df -h</pre>
                                                                                                        
                                                                                                        <p>
                                                                                                          &nbsp;
                                                                                                        </p>
                                                                                                        
                                                                                                        <h1>
                                                                                                           <span style="font-family: Bitter, Georgia, serif; font-size: 48px; line-height: 1.3; color: #141412;">at naredba</span>
                                                                                                        </h1>
                                                                                                        
                                                                                                        <p>
                                                                                                          &nbsp;
                                                                                                        </p>
                                                                                                        
                                                                                                        <ul>
                                                                                                          <li dir="ltr">
                                                                                                            <p dir="ltr">
                                                                                                              Koristi se za automatsko jednokratno pokretanje programa ili skripti u točno određeno vrijeme
                                                                                                            </p>
                                                                                                          </li>
                                                                                                          
                                                                                                          <li dir="ltr">
                                                                                                            <p dir="ltr">
                                                                                                              Ako izlaz naredbe at nije preusmjeren u datoteku generirati će se e-mail koji sadrži <span class="lang:default decode:true  crayon-inline ">stdout</span>  i <span class="lang:default decode:true  crayon-inline ">stderr</span>
                                                                                                            </p>
                                                                                                          </li>
                                                                                                        </ul>
                                                                                                        
                                                                                                        <p>
                                                                                                          &nbsp;
                                                                                                        </p>
                                                                                                        
                                                                                                        <h2>
                                                                                                          Primjeri:
                                                                                                        </h2>
                                                                                                        
                                                                                                        <p dir="ltr">
                                                                                                          Pr. Kreiraj datoteku at.datoteka u 10:18.h. (CTRL d je izlaz)
                                                                                                        </p>
                                                                                                        
                                                                                                        <pre class="lang:default decode:true">at 10:18

touch at.datoteka

CTRL d</pre>
                                                                                                        
                                                                                                        <p>
                                                                                                          &nbsp;
                                                                                                        </p>
                                                                                                        
                                                                                                        <p dir="ltr">
                                                                                                          Pr. pokreni samo skriptu (-f) at.skripta.sh u 10:19.h. i još pošalji e-mail (-m)
                                                                                                        </p>
                                                                                                        
                                                                                                        <pre class="lang:default decode:true">at 10:19 -m -f at.skripta.sh</pre>
                                                                                                        
                                                                                                        <p>
                                                                                                          &nbsp;
                                                                                                        </p>
                                                                                                        
                                                                                                        <p dir="ltr">
                                                                                                          Provjeri koje sve at zadatke imamo aktivne
                                                                                                        </p>
                                                                                                        
                                                                                                        <pre class="lang:default decode:true">atq</pre>
                                                                                                        
                                                                                                        <p>
                                                                                                          &nbsp;
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          &nbsp;
                                                                                                        </p>
                                                                                                        
                                                                                                        <h1>
                                                                                                          Administracija Linux sustava
                                                                                                        </h1>
                                                                                                        
                                                                                                        <ul>
                                                                                                          <li dir="ltr">
                                                                                                            <p dir="ltr">
                                                                                                              Za administraciju sustava, potrebno je biti root korisnik (administrator)
                                                                                                            </p>
                                                                                                          </li>
                                                                                                          
                                                                                                          <li dir="ltr">
                                                                                                            <p dir="ltr">
                                                                                                              root korisnik ima User ID 0  (UID)
                                                                                                            </p>
                                                                                                          </li>
                                                                                                          
                                                                                                          <li dir="ltr">
                                                                                                            <p dir="ltr">
                                                                                                              Drugi korisnici mogu dobiti root ovlasti (ako znaju root lozinku), upotrebom naredbe <span class="lang:default decode:true  crayon-inline ">su</span>  (Substitute User)
                                                                                                            </p>
                                                                                                          </li>
                                                                                                        </ul>
                                                                                                        
                                                                                                        <p dir="ltr">
                                                                                                          Pr. postani <span class="lang:default decode:true  crayon-inline ">root</span>  korisnik i preuzmi njegov environment (<span class="lang:default decode:true  crayon-inline ">&#8211;</span> )
                                                                                                        </p>
                                                                                                        
                                                                                                        <pre class="lang:default decode:true">su - root</pre>
                                                                                                        
                                                                                                        <ul>
                                                                                                          <li dir="ltr">
                                                                                                            <p dir="ltr">
                                                                                                              Korisnički računi (accounti) i grupe su definirani u nekoliko sistemskih datoteka:
                                                                                                            </p>
                                                                                                            
                                                                                                            <ul>
                                                                                                              <li dir="ltr">
                                                                                                                <p dir="ltr">
                                                                                                                  <span class="lang:default decode:true  crayon-inline ">/etc/passwd</span>  &#8211; sadrži ime accounta, osobne podatke, shell koji će biti pokrenut kod logiranja,&#8230;
                                                                                                                </p>
                                                                                                              </li>
                                                                                                              
                                                                                                              <li dir="ltr">
                                                                                                                <p dir="ltr">
                                                                                                                  <span class="lang:default decode:true  crayon-inline ">/etc/shadow</span>  &#8211; sadrži kriptirane lozinke za svaki korisnički račun (account)
                                                                                                                </p>
                                                                                                              </li>
                                                                                                              
                                                                                                              <li dir="ltr">
                                                                                                                <p dir="ltr">
                                                                                                                  <span class="lang:default decode:true  crayon-inline ">/etc/group</span>  &#8211; ovdje su definirane sve korisničke grupe i pripdanosti grupama
                                                                                                                </p>
                                                                                                              </li>
                                                                                                            </ul>
                                                                                                          </li>
                                                                                                        </ul>
                                                                                                        
                                                                                                        <p>
                                                                                                          Dakle svaki korisnički račun (account) je upisan u <span class="lang:default decode:true  crayon-inline ">/etc/passwd</span>  , njegova kriptirana lozinka u <span class="lang:default decode:true  crayon-inline ">/etc/shadow</span>  a sve grupe korisnika koje postoje na sustavu, zajedno s pripadnostima korisnik/grupa se nalaze u<span class="lang:default decode:true  crayon-inline "> /etc/group</span>
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          &nbsp;
                                                                                                        </p>
                                                                                                        
                                                                                                        <h2>
                                                                                                          Što je /etc/passwd
                                                                                                        </h2>
                                                                                                        
                                                                                                        <p>
                                                                                                          <span class="lang:default decode:true  crayon-inline ">/etc/passwd</span>  datoteka sadrži bitne informacije, koje su potrebne za logiranje svakog korisnika na sustav.
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          Naime kod logiranja na sustav, prvo se provjerava da li određeni korisnik postoji (prvi stupac u datoteci je upravo username [ime korisničkog accounta]). Drugi stupac (x) označava da se kriptirani password nalazi u datoteci <span class="lang:default decode:true  crayon-inline ">/etc/shadow</span>  , koja će biti kasnije objašnjena. Osim toga važno je znati da svaki korisnik može pripadati samo jednoj primarnoj grupi (pogledajte <span class="lang:default decode:true  crayon-inline ">GID</span>  [Group ID] stupac na slici dolje) i u više sekundarnih grupa korisnika koje su opisane u poglavlju o <span class="lang:default decode:true  crayon-inline ">/etc/group</span>  datoteci.
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          &nbsp;
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          Izgled <span class="lang:default decode:true  crayon-inline">/etc/passwd</span>  datoteke je opisan na slici:
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          <img alt="" src="https://lh3.googleusercontent.com/hVn4JGrgkVx0n_ugZWGZzAcroaaGiAIDpzf9FXTlgGTbV8qfyyScFSGM2-PtBfdoezHyjspes9HMunCr_-Q-cLKMoLd3Ve5UFZOlbFKTcbNSlUfg8dnjYB2u_fsP" width="629.2703126922368px;" height="350.8267716535433px;" />
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          &nbsp;
                                                                                                        </p>
                                                                                                        
                                                                                                        <h2>
                                                                                                          Što je /etc/shadow
                                                                                                        </h2>
                                                                                                        
                                                                                                        <p>
                                                                                                          <span class="lang:default decode:true  crayon-inline">/etc/shadow</span>  datoteka sadrži kriptiranu lozinku za svaki korisnički račun (account).
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          Naime nakon prvog koraka (objašnjenog u poglavlju prije), kod logiranja korisnika na sustav i provjere da li korisnik postoji, ako postoji, sustav će vas zatražiti da upišete lozinku. Lozinka se tada kriptira (pogledajte dolje pod <strong>Napredno</strong>) i uspoređuje se s već kriptiranom u datoteci <span class="lang:default decode:true  crayon-inline ">/etc/shadow</span>  , za točno određenog korisnika. Ako se poklapaju omogućen je pristup sustavu.
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          Izgled <span class="lang:default decode:true  crayon-inline">/etc/shadow</span>   datoteke je opisan na slici:
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          <img alt="" src="https://lh4.googleusercontent.com/g1ubbGipTryoioBf53eM37CE9aq3cJXvZLp0MgULkuqCBO9sNGK4MOefyLHzdLyU4w_81X16P7oiAGG3tV5QOsFVdXhv0A8VbufPi13ULJHtj3D8NLcoY1JhRdxN" width="635.5380886608534px;" height="375.417343339895px;" />
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          &nbsp;
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          <strong>NAPREDNO:</strong>
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          Kako izgleda kriptirani password :
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          &nbsp;
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          <img alt="Izgled kriptiranog passworda" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/02/IzgledKriptiranogPassworda.jpg?resize=707%2C218&#038;ssl=1" width="707" height="218" data-recalc-dims="1" />
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          &nbsp;
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          Što je opće (password) hash ?<br /> To je matematička metoda/algoritam pomoću koje se na osnovi niza ulaznih znakova (pr. naš password) stvara (kreira) jedinstveni nîz znakova fiksne duljine.<br /> Ovo je jednosmjeran put &#8211; nije moguće na onovi hash nîza dobiti izvorni password.
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          Pr. Vjerojatno ste nekada kopirali ISO image (CD ili DVD) te ste uz njega primjetili pr. MD5 sum od tog ISO image-a, koji se napravljen stoga da nakon što se skinuli (download) taj ISO file, možete i na svom računalu napraviti MD5 sum i usporediti da li ste dobili iste vrijednosti.
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          Kako MD5 checksum [hash]) napraviti na Linux-u, na datoteci : <strong>Moj-DVD.iso</strong> :
                                                                                                        </p>
                                                                                                        
                                                                                                        <pre class="lang:default decode:true">md5sum Moj-DVD.iso
2325a89d93576d17579b726935346342 Moj-DVD.iso</pre>
                                                                                                        
                                                                                                        <p>
                                                                                                          Napomena: osim MD5, postoje i drugi hash algoritmi.
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          Neki od drugih tipova hash algoritama, koji se koriste na Linux-u, za password-e:
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          &nbsp;
                                                                                                        </p>
                                                                                                        
                                                                                                        <table>
                                                                                                          <colgroup> <col width="214px" /> <col width="214px" /></colgroup> <tr>
                                                                                                            <td>
                                                                                                              <p dir="ltr">
                                                                                                                <strong>Brojčana oznaka</strong>
                                                                                                              </p>
                                                                                                              
                                                                                                              <p dir="ltr">
                                                                                                                1
                                                                                                              </p>
                                                                                                              
                                                                                                              <p dir="ltr">
                                                                                                                2
                                                                                                              </p>
                                                                                                              
                                                                                                              <p dir="ltr">
                                                                                                                5
                                                                                                              </p>
                                                                                                              
                                                                                                              <p dir="ltr">
                                                                                                                6
                                                                                                              </p>
                                                                                                            </td>
                                                                                                            
                                                                                                            <td>
                                                                                                              <p dir="ltr">
                                                                                                                <strong>Algoritam</strong>
                                                                                                              </p>
                                                                                                              
                                                                                                              <p dir="ltr">
                                                                                                                MD5
                                                                                                              </p>
                                                                                                              
                                                                                                              <p dir="ltr">
                                                                                                                Blowfish
                                                                                                              </p>
                                                                                                              
                                                                                                              <p dir="ltr">
                                                                                                                SHA-256
                                                                                                              </p>
                                                                                                              
                                                                                                              <p dir="ltr">
                                                                                                                SHA-512
                                                                                                              </p>
                                                                                                            </td>
                                                                                                          </tr>
                                                                                                        </table>
                                                                                                        
                                                                                                        <p>
                                                                                                          Dakle, vratimo se na sliku &#8220;Kako izgleda kriptirani password&#8221;.
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          Naime u Linux-u, password se kreira kombiniranjem “salt-a” i željenog “password-a”, pomoću odabranog algoritma.
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          <strong>Primjer:</strong>
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          Kako provjeriti koji hash-ing algoritam naš Linux sustav koristi, iz komandne linije:
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          &nbsp;
                                                                                                        </p>
                                                                                                        
                                                                                                        <pre>authconfig --test | grep hash</pre>
                                                                                                        
                                                                                                        <p>
                                                                                                          Rezultat našeg upita je :
                                                                                                        </p>
                                                                                                        
                                                                                                        <pre>password hashing algorithm is sha512</pre>
                                                                                                        
                                                                                                        <p>
                                                                                                          &nbsp;
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          U našem slučaju koristi se hashing algoritam <span class="lang:default decode:true  crayon-inline ">6</span>  : tj <span class="lang:default decode:true  crayon-inline ">SHA-512</span> , pa ćemo u primjeru koji slijedi, koristiti iti algoritam.
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          &nbsp;
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          <strong>Primjer :</strong>
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          Kako ručno kreirati password, korištenjem salt-a i željenog algoritma ?.
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          Koristiti ćemo programski jezik <span class="lang:default decode:true  crayon-inline ">python</span> , iz komandne linije:
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          &nbsp;
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          <span class="lang:default decode:true  crayon-inline ">python -c &#8216;import crypt; print crypt.crypt(&#8220;ovo_je_password&#8221;, &#8220;$6$ovo_je_salt&#8221;)&#8217;</span>
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          &nbsp;
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          Rezultat je funkcionalan dio passworda, koji smo prije (ponovljena slika dolje), označili kao dio pod nazivom
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          &#8220;<span style="color: #ff0000;">Kriptirani password</span>&#8221; :
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          <span class="lang:default decode:true  crayon-inline ">$6$ovo_je_salt$fPiMsDoTHyyQ9R6qx3cIICWKOCqD8dfBzMTrF8rnRMHsETgsUUd9ZINq7PFjPrbtnZAannKfcKUnxj36CSNnk.</span>
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          <img alt="" src="https://lh4.googleusercontent.com/g1ubbGipTryoioBf53eM37CE9aq3cJXvZLp0MgULkuqCBO9sNGK4MOefyLHzdLyU4w_81X16P7oiAGG3tV5QOsFVdXhv0A8VbufPi13ULJHtj3D8NLcoY1JhRdxN" width="635.5380886608534px;" height="375.417343339895px;" />
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          &nbsp;
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          &nbsp;
                                                                                                        </p>
                                                                                                        
                                                                                                        <h2>
                                                                                                           Što je /etc/group
                                                                                                        </h2>
                                                                                                        
                                                                                                        <p>
                                                                                                          <span class="lang:default decode:true  crayon-inline">/etc/group</span>  datoteka sadrži korisničke grupe i pripadnosti korisnika tim grupama.
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          Pogledajte sliku dolje!.
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          Dakle pr. grupa <span class="lang:default decode:true  crayon-inline ">bin</span>  ima svoj identifikacijski broj <span class="lang:default decode:true  crayon-inline ">1</span>  i njoj pripadaju korisnici <span class="lang:default decode:true  crayon-inline ">bin</span>  i <span class="lang:default decode:true  crayon-inline ">daemon</span>
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          &nbsp;
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          Izgled <span class="lang:default decode:true  crayon-inline ">/etc/group</span>   datoteke je opisan na slici:
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          <img alt="" src="https://lh3.googleusercontent.com/vowDWC1pfOIQXTxF0djLB6RXngoJ9LSsjUr0qrkeYzIfk7UgTfFNMJGDJO5cXgDPFeuBNjh8ibGa59TD-PKEGtBownpufjWHFBD38ear4x_MgHj1uvm3h8LdWdFS" width="637.0078422966905px;" height="375.0288457595144px;" />
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          &nbsp;
                                                                                                        </p>
                                                                                                        
                                                                                                        <h2>
                                                                                                          Primjeri
                                                                                                        </h2>
                                                                                                        
                                                                                                        <p dir="ltr">
                                                                                                          Ispiši tko je trenutni korisnik.
                                                                                                        </p>
                                                                                                        
                                                                                                        <pre class="lang:default decode:true">id

uid=0(root) gid=0(root) groups=0(root)</pre>
                                                                                                        
                                                                                                        <p>
                                                                                                          Opis :
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          <span class="lang:default decode:true  crayon-inline ">uid 0</span>  , znači da je korisnički <span class="lang:default decode:true  crayon-inline ">ID</span>  jednak <span class="lang:default decode:true  crayon-inline "></span> (<span class="lang:default decode:true  crayon-inline "></span>  je <span class="lang:default decode:true  crayon-inline ">root</span>  korisnik [Administrator po Windows terminologiji]), te da je primarna grupa ovog korisnika <span class="lang:default decode:true  crayon-inline "></span>  (ime grupe je<span class="lang:default decode:true  crayon-inline "> root</span> ) , te da još pripada u sekundane grupe <span class="lang:default decode:true  crayon-inline "></span>  (<span class="lang:default decode:true  crayon-inline ">root</span> ).
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          &nbsp;
                                                                                                        </p>
                                                                                                        
                                                                                                        <p dir="ltr">
                                                                                                          <span style="line-height: 1.5;">Ispiši kojim sve grupama pripada trenutni korisnik root</span>
                                                                                                        </p>
                                                                                                        
                                                                                                        <pre class="lang:default decode:true">groups

root</pre>
                                                                                                        
                                                                                                        <p dir="ltr">
                                                                                                          Kreiraj novu grupu korisnici
                                                                                                        </p>
                                                                                                        
                                                                                                        <pre class="lang:default decode:true">groupadd korisnici</pre>
                                                                                                        
                                                                                                        <p>
                                                                                                          &nbsp;
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          <span style="line-height: 1.5;">Dodaj istog korisnika (<span class="lang:default decode:true  crayon-inline ">pero</span> ) i u dodatnu grupu (-a) [ne mijenjati primarnu grupu]  (-G) <span class="lang:default decode:true  crayon-inline">korisnici</span> </span>
                                                                                                        </p>
                                                                                                        
                                                                                                        <pre class="lang:default decode:true">usermod -a -G korisnici pero</pre>
                                                                                                        
                                                                                                        <p>
                                                                                                          &nbsp;
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          &nbsp;
                                                                                                        </p>
                                                                                                        
                                                                                                        <p dir="ltr">
                                                                                                          Promijeni pripadnost primarnoj grupi<span class="lang:default decode:true  crayon-inline "> korisnici</span>  (-g) za korisnika <span class="lang:default decode:true  crayon-inline ">pero</span>
                                                                                                        </p>
                                                                                                        
                                                                                                        <pre class="lang:default decode:true">usernmod -g korisnici pero</pre>
                                                                                                        
                                                                                                        <p>
                                                                                                          &nbsp;
                                                                                                        </p>
                                                                                                        
                                                                                                        <h1>
                                                                                                          Runlevels
                                                                                                        </h1>
                                                                                                        
                                                                                                        <p>
                                                                                                          Runlevel-i su modovi rada svakog UNIX/Linux operativnog sustava. Standarno ih ima 7 i to su:
                                                                                                        </p>
                                                                                                        
                                                                                                        <p>
                                                                                                          <strong> </strong>
                                                                                                        </p>
                                                                                                        
                                                                                                        <table style="border: 0px solid #dc143c; background-color: #f5f5f5;" border="0" cellpadding="0" align="left">
                                                                                                          <tr>
                                                                                                            <td>
                                                                                                              <p align="center">
                                                                                                                <b>Run Level</b>
                                                                                                              </p>
                                                                                                            </td>
                                                                                                            
                                                                                                            <td>
                                                                                                              <p align="center">
                                                                                                                <b>Mode</b>
                                                                                                              </p>
                                                                                                            </td>
                                                                                                            
                                                                                                            <td>
                                                                                                              <p align="center">
                                                                                                                <b>Opis</b>
                                                                                                              </p>
                                                                                                            </td>
                                                                                                          </tr>
                                                                                                          
                                                                                                          <tr>
                                                                                                            <td>
                                                                                                              <strong></strong>
                                                                                                            </td>
                                                                                                            
                                                                                                            <td>
                                                                                                              Halt
                                                                                                            </td>
                                                                                                            
                                                                                                            <td>
                                                                                                              Gasi operativni sustav (shutdown)
                                                                                                            </td>
                                                                                                          </tr>
                                                                                                          
                                                                                                          <tr>
                                                                                                            <td>
                                                                                                              <strong>1</strong>
                                                                                                            </td>
                                                                                                            
                                                                                                            <td>
                                                                                                              Single-User Mode
                                                                                                            </td>
                                                                                                            
                                                                                                            <td>
                                                                                                              Ne konfigurira mrežne interface-e , ne pokreće  servise (daemon), dozvoljava samo pristup root korisniku
                                                                                                            </td>
                                                                                                          </tr>
                                                                                                          
                                                                                                          <tr>
                                                                                                            <td>
                                                                                                              <strong>2</strong>
                                                                                                            </td>
                                                                                                            
                                                                                                            <td>
                                                                                                              Multi-User Mode
                                                                                                            </td>
                                                                                                            
                                                                                                            <td>
                                                                                                              (Ovisno o Linux distribuciji ) ali obično podiže mrežne interface-e ,ali  ne pokreće mrežne servise (daemons), dozvoljen je pristup svim korisnicima&nbsp;</p> 
                                                                                                              
                                                                                                              <p>
                                                                                                                &nbsp;</td> </tr> 
                                                                                                                
                                                                                                                <tr>
                                                                                                                  <td>
                                                                                                                    <strong>3</strong>
                                                                                                                  </td>
                                                                                                                  
                                                                                                                  <td>
                                                                                                                    Multi-User Mode with Networking
                                                                                                                  </td>
                                                                                                                  
                                                                                                                  <td>
                                                                                                                    Normalno pokreće operativni sustav
                                                                                                                  </td>
                                                                                                                </tr>
                                                                                                                
                                                                                                                <tr>
                                                                                                                  <td>
                                                                                                                    <strong>4</strong>
                                                                                                                  </td>
                                                                                                                  
                                                                                                                  <td>
                                                                                                                    Undefined
                                                                                                                  </td>
                                                                                                                  
                                                                                                                  <td>
                                                                                                                    Često ne definirano / moguće je definirati za svoje potrebe&nbsp;</p> 
                                                                                                                    
                                                                                                                    <p>
                                                                                                                      (Slackware Linux ga koristi kao Runlevel 5)</td> </tr> 
                                                                                                                      
                                                                                                                      <tr>
                                                                                                                        <td>
                                                                                                                          <strong>5</strong>
                                                                                                                        </td>
                                                                                                                        
                                                                                                                        <td>
                                                                                                                          X11
                                                                                                                        </td>
                                                                                                                        
                                                                                                                        <td>
                                                                                                                          Starta runlevel 3 + display manager(X ) [pokreće X Window grafički sustav]
                                                                                                                        </td>
                                                                                                                      </tr>
                                                                                                                      
                                                                                                                      <tr>
                                                                                                                        <td>
                                                                                                                          <strong>6</strong>
                                                                                                                        </td>
                                                                                                                        
                                                                                                                        <td>
                                                                                                                          Reboot
                                                                                                                        </td>
                                                                                                                        
                                                                                                                        <td>
                                                                                                                          Restarta operativni sustav
                                                                                                                        </td>
                                                                                                                      </tr></tbody> </table> 
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        &nbsp;
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        &nbsp;
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        &nbsp;
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Kod svakog startanja operativnog sustava, nakon što se učita Linux kernel, pokreće se prvi proces tj.  <span class="lang:default decode:true  crayon-inline ">init</span>  program, on čita datoteku <span class="lang:default decode:true  crayon-inline "> /etc/inittab</span>  u kojoj su definirani runleveli.
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        <span class="lang:default decode:true  crayon-inline ">init</span>  proces osim toga pokreće i sve ostale procese na sustavu a sam se pokreće kao servis (<span class="lang:default decode:true  crayon-inline ">daemon</span> ). On na osnovi runlevel broja pokreće skripte koje se nalaze u direktorijima unutar glavnog direktorija <span class="lang:default decode:true  crayon-inline ">/etc/rc.d</span>  .
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Dakle osnovna struktura direktorija unutar <span class="lang:default decode:true  crayon-inline ">/etc/rc.d</span>  je :
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <pre class="lang:default decode:true">drwxr-xr-x 2 root root 4.0K Nov 11 15:05 rc0.d
drwxr-xr-x 2 root root 4.0K Nov 11 15:05 rc1.d
drwxr-xr-x 2 root root 4.0K Nov 11 15:05 rc2.d
drwxr-xr-x 2 root root 4.0K Nov 11 15:05 rc3.d
drwxr-xr-x 2 root root 4.0K Nov 11 15:05 rc4.d
drwxr-xr-x 2 root root 4.0K Nov 11 15:05 rc5.d
drwxr-xr-x 2 root root 4.0K Nov 11 15:05 rc6.d</pre>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Pri tome:
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        <span class="lang:default decode:true  crayon-inline ">rc0.d</span>  je init 0
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        <span class="lang:default decode:true  crayon-inline ">rc1.d</span>  je init 1
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        itd.
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Ako pogledamo sadržaj direktorija za runlevel 3 ( <span class="lang:default decode:true  crayon-inline ">/etc/rc.d/rc3.d</span>  ) :
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <pre class="lang:default decode:true">lrwxrwxrwx 1 root root 22 Nov 11 15:04 K15htcacheclean -&gt; ../init.d/htcacheclean
lrwxrwxrwx 1 root root 13 Jul 24 16:06 K35nmb -&gt; ../init.d/nmb
lrwxrwxrwx 1 root root 13 Jul 24 16:06 K35smb -&gt; ../init.d/smb
lrwxrwxrwx 1 root root 20 Jul 24 16:06 K50netconsole -&gt; ../init.d/netconsole
lrwxrwxrwx 1 root root 15 Nov 11 15:05 K50snmpd -&gt; ../init.d/snmpd
lrwxrwxrwx 1 root root 19 Nov 11 15:05 K50snmptrapd -&gt; ../init.d/snmptrapd
lrwxrwxrwx 1 root root 17 Jul 24 16:06 K73winbind -&gt; ../init.d/winbind
lrwxrwxrwx 1 root root 14 Nov 11 15:05 K74nscd -&gt; ../init.d/nscd
lrwxrwxrwx 1 root root 15 Nov 11 15:04 K75netfs -&gt; ../init.d/netfs
lrwxrwxrwx 1 root root 19 Jul 24 16:06 K75quota_nld -&gt; ../init.d/quota_nld
lrwxrwxrwx 1 root root 19 Nov 11 15:04 K75udev-post -&gt; ../init.d/udev-post
lrwxrwxrwx 1 root root 15 Nov 11 15:05 K87named -&gt; ../init.d/named
lrwxrwxrwx 1 root root 21 Jul 24 16:06 K87restorecond -&gt; ../init.d/restorecond
lrwxrwxrwx 1 root root 17 Jul 24 16:06 K87rpcbind -&gt; ../init.d/rpcbind
lrwxrwxrwx 1 root root 21 Jul 24 16:06 K89portreserve -&gt; ../init.d/portreserve
lrwxrwxrwx 1 root root 15 Nov 11 15:04 K89rdisc -&gt; ../init.d/rdisc
lrwxrwxrwx 1 root root 18 Jul 24 16:06 S08iptables -&gt; ../init.d/iptables
lrwxrwxrwx 1 root root 21 Jul 24 16:06 S08modules_dep -&gt; ../init.d/modules_dep
lrwxrwxrwx 1 root root 17 Nov 11 15:04 S10network -&gt; ../init.d/network
lrwxrwxrwx 1 root root 17 Nov 11 15:05 S12rsyslog -&gt; ../init.d/rsyslog
lrwxrwxrwx 1 root root 14 Jul 24 16:06 S55sshd -&gt; ../init.d/sshd
lrwxrwxrwx 1 root root 16 Jul 24 16:06 S56xinetd -&gt; ../init.d/xinetd
lrwxrwxrwx 1 root root 19 Jul 24 16:06 S65saslauthd -&gt; ../init.d/saslauthd
lrwxrwxrwx 1 root root 18 Jul 24 16:06 S80sendmail -&gt; ../init.d/sendmail
lrwxrwxrwx 1 root root 15 Nov 11 15:04 S85httpd -&gt; ../init.d/httpd
lrwxrwxrwx 1 root root 15 Jul 24 16:06 S90crond -&gt; ../init.d/crond
lrwxrwxrwx 1 root root 11 Nov 11 15:04 S99local -&gt; ../rc.local</pre>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Vidimo da su sve S* i K* datoteke zapravo simbolički linkovi na datoteke koje se nalaze unutar direktorija <span class="lang:default decode:true  crayon-inline">/etc/rc.d/init.d</span>  .
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        To je tako zbog toga što sve servise (daemone) tj. njihove skripte kreiramo samo na jednom mjestu (<span class="lang:default decode:true  crayon-inline">/etc/rc.d/init.d</span> ) a onda u svakom runelevel direktoriju (<span class="lang:default decode:true  crayon-inline ">/etc/rc.d/rc*.d</span> ) trebamo samo kreirati simbolički link koji ako mu ime počinje s <span class="lang:default decode:true  crayon-inline ">K</span>  ,  će biti pokrenut s opcijom <span class="lang:default decode:true  crayon-inline">stop</span>  , a ako mu ime počinje sa <span class="lang:default decode:true  crayon-inline ">S</span>  , biti će pokrenut sa <span class="lang:default decode:true crayon-inline">start</span>
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Ono što je važno kod izvornih skripti koje se nalaze unutar direktorija <span class="lang:default decode:true  crayon-inline ">/etc/rc.d/init.d</span>    je to da moraju imati minimalno  implementirane tri opcije (<span class="lang:default decode:true  crayon-inline ">stop</span>  , <span class="lang:default decode:true  crayon-inline ">start</span>  , <span class="lang:default decode:true  crayon-inline ">restart</span> ).
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Osim toga, u slučaju RedHat baziranik Linux-a   [pr. CentOS] ako skripta sadrži ključnu riječ  <span class="lang:default decode:true  crayon-inline "># chkconfig</span>   , parametri iza nje će se koristiti za automatsko kreiranje <span class="lang:default decode:true  crayon-inline ">/etc/rc.d/rc*.d</span>  simboličkih linkova.
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        &nbsp;
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <h2>
                                                                                                                        Kako to radi (sistemski dio)
                                                                                                                      </h2>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Važno za znati je da je PID od init  procesa 1 , pošto je on prvi proces koji starta sve ostale procese i brine se o njima.
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Standardno se podiže runlevel 3, kod Linux-a koji ne startaju grafičko sučelje (X Window) a za one koji ga startaju , se podiže runlevel 5.
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Dakle ako je standardni (default) runlevel 3, dešava se slijedeće:
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <ol>
                                                                                                                        <li>
                                                                                                                          Nakon startanja kernela init  ulazi u direktorij  <span class="lang:default decode:true  crayon-inline "> /etc/rc.d/rc3.d/</span>
                                                                                                                        </li>
                                                                                                                        <li>
                                                                                                                          Iz tog direktorija pokreću se sve skripte koje u imenu počinju sa K i to prema broju. Dakle prvo s najmanjim brojem pr. K1&#8230;.. , K2&#8230;&#8230;. , pa K3&#8230;.. i tako do najvećeg broja i to tako da se svaka od njih poziva sa opcijom  stop  . Dakle K1&#8230; stop , pr.: K15htcacheclean stop   i to tako za sve njih koliko god ih ima. Naime prvo se stopiraju svi servisi.
                                                                                                                        </li>
                                                                                                                        <li>
                                                                                                                          Nakon toga se startaju one sa S u imenu (ovdje se zapravo startaju servisi), ponovno s najmanjim brojem pr. S1&#8230;.. , S2&#8230;&#8230;. , pa S3&#8230;.. i tako do najvećeg broja i to tako da se svaka od njih poziva sa opcijom  start . Dakle S1&#8230; start , pr.: S10network start  i to tako za sve njih koliko god ih ima.
                                                                                                                        </li>
                                                                                                                      </ol>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Zbog čega brojevi kod imena S i K skripti &#8211; zbog toga da točno možemo kontrolirati koja će se prije ili poslije koje skripte pokrenuti.
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Jedina mala razlika su runleveli <strong></strong> (halt/shutdown) i <strong>6 </strong>(reboot).  Dakle <span class="lang:default decode:true  crayon-inline ">/etc/rc.d/rc0.d/</span>   i <span class="lang:default decode:true  crayon-inline ">/etc/rc.d/rc6.d/</span>   sastoje se 99% od datoteka imena  <strong>K</strong>* , pošto oni, kod gašenja ili restarta računala moraju &#8220;uredno&#8221; stopirati tj.poubijati (odatle <strong>K</strong>ill) sve servise. Obično su samo dvije <strong>S</strong>* datoteke.
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Prva je koja nakon što je sve uredno stopirano preko <strong>K</strong>* poubija sve što je možda zaostalo.
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Druga je ona koja u slučaju init 0 gasi računalo a u slučaju init 6 (restart) restarta računalo.
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        &nbsp;
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        U svakom trenutku, moguće je promijeniti runlevel, naredbom init
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Pr. želimo li ugasiti računalo to možemo napraviti sa:
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <pre>init 0</pre>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        ili ako ga želimo restartati onda pokrećemo:
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <pre>init 6</pre>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        ili ako želimo nešto raditi/popraviti na sustavu i ne želimo dozvoliti pristup nikome preko mreže vež samo nama (root), koji smo fizički ispred računala/poslužitelja, tada možemo koristiti:
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <pre>init 1</pre>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        &nbsp;
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <h2>
                                                                                                                        Kako to radi (servisi/daemoni)
                                                                                                                      </h2>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Dolje je primjer izlistanja početka skripte koja starta SSH Server ( <span class="lang:default decode:true  crayon-inline ">/etc/rc.d/init.d/sshd</span>  ) .
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <pre class="lang:default decode:true">#!/bin/bash
#
# sshd Start up the OpenSSH server daemon
#
# chkconfig: 2345 55 25
# description: SSH is a protocol for secure remote shell access. \
# This service starts up the OpenSSH server daemon.
#</pre>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Dakle linija <span class="lang:default decode:true  crayon-inline"># chkconfig: 2345 55 25</span>  znači slijedeće:
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <ul>
                                                                                                                        <li>
                                                                                                                          prvi niz brojeva (<span class="lang:default decode:true  crayon-inline ">2345</span>  u ovom slučaju) znači u kojim runlevel-ima će se pokretati ova skripta
                                                                                                                        </li>
                                                                                                                        <li>
                                                                                                                          drugi broj (<span class="lang:default decode:true  crayon-inline ">55</span>  u ovom primjeru) je prioritet kod startanja (<span class="lang:default decode:true  crayon-inline ">S*</span>  broj)
                                                                                                                        </li>
                                                                                                                        <li>
                                                                                                                          treći broj (<span class="lang:default decode:true  crayon-inline ">25</span>  u ovom primjeru) je prioritet kod stopiranja (<span class="lang:default decode:true  crayon-inline ">K*</span>  broj)
                                                                                                                        </li>
                                                                                                                      </ul>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Naime u ovom slučaju sistem će kreirati simboličke linkove naziva<span class="lang:default decode:true  crayon-inline "> S55sshd</span>  u runlevel direktorijima 2,3,4 i 5 (<span class="lang:default decode:true  crayon-inline ">/etc/rc.d/rc*.d</span> )te<span class="lang:default decode:true  crayon-inline "> K25sshd</span>  u preostalim runlevelima u kojima sistem mora gasiti ovaj servis, dakle : <strong> 0</strong> (shutdown), <strong>1</strong> (singleuser , no network) i <strong>6</strong> (reboot)
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Nadalje postoji i naredba (Redhat bazirani Linux-i), s kojom možemo vidjeti u kojim runlevelima se koji servis (daemon tj. skripta koja ga starta/stopira) podiže ili ne podiže.
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Naredba je <span class="lang:default decode:true  crayon-inline ">chkconfig</span> .
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Možemo ju samo pozvati bez opcija i prekidača ili s njima.
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Mi ćemo probati ispisati sve runlevele za skriptu koju smo maloprije gledali (sshd):
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <pre class="lang:default decode:true">chkconfig --list sshd
sshd 0:off 1:off 2:on 3:on 4:on 5:on 6:off</pre>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Ovdje vidimo ono o čemu smo pričali gore (pogledajte 2,3,4 i 5).
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        S naredbom chkconfig moguće je i naknadno mijenjati runlevele skripti (servisa/daemona) koji su već na sustavu ili dodavati nove (ili brisati postojeće).
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Pr. Želimo da se HTTP server (httpd) starta sa sustavom automatski (dakle da bude u runlevelima 2,3 ,4 ,5)
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <pre><code>chkconfig httpd on</code></pre>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Provjera:
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <pre class="lang:default decode:true">chkconfig --list httpd
httpd 0:off 1:off 2:on 3:on 4:on 5:on 6:off</pre>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        &nbsp;
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Pr. Želimo ipak da se HTTP server ne starta više automatski:
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <pre><code>chkconfig httpd off</code></pre>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Provjera:
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <pre>chkconfig --list httpd
httpd 0:off 1:off 2:off 3:off 4:off 5:off 6:off</pre>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        &nbsp;
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Pr. Kreirali smo svoju novu skriptu, naziva <span class="lang:default decode:true  crayon-inline ">/etc/rc.d/init.d/moj-servis</span>  , koja sadrži <span class="lang:default decode:true  crayon-inline ">start</span> ,<span class="lang:default decode:true  crayon-inline "> stop</span>  i<span class="lang:default decode:true  crayon-inline "> restart</span>  opcije te ju želimo dodati pomoći chkconfig naredbe ,da se starta automatski sa sustavom.
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Prvo ju dodajmo u chkconfig
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <pre class="lang:default decode:true">chkconfig --add moj-servis</pre>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Sada joj dodjelimo prava da se starta automatski u runlevelima 2,3,4,5
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <pre class="lang:default decode:true">chkconfig moj-servis on</pre>
                                                                                                                      
                                                                                                                      <h2>
                                                                                                                      </h2>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        &nbsp;
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <h1>
                                                                                                                        Package Management
                                                                                                                      </h1>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        U radu i primjerima koji slijede, koristiti ćemo Red Hat package management (RPM), koji koriste i druge distribucije Linux-a, bazirane na Red Hat-u, poput:
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <ul>
                                                                                                                        <li>
                                                                                                                          CentOS Linux
                                                                                                                        </li>
                                                                                                                        <li>
                                                                                                                          SUSE Linux
                                                                                                                        </li>
                                                                                                                        <li>
                                                                                                                          Open SUSE Linux
                                                                                                                        </li>
                                                                                                                        <li>
                                                                                                                          Fedora Linux
                                                                                                                        </li>
                                                                                                                        <li>
                                                                                                                          Oracle Linux
                                                                                                                        </li>
                                                                                                                        <li>
                                                                                                                          &#8230;
                                                                                                                        </li>
                                                                                                                      </ul>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Ekstenzija paketa je <span class="lang:default decode:true  crayon-inline ">.rpm</span>  .
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        &nbsp;
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <h2>
                                                                                                                        RPM Package manager
                                                                                                                      </h2>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        RPM Package manager nam omogućava:
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <ul>
                                                                                                                        <li>
                                                                                                                          instalaciju paketa
                                                                                                                        </li>
                                                                                                                        <li>
                                                                                                                          deinstalaciju paketa
                                                                                                                        </li>
                                                                                                                        <li>
                                                                                                                          provjeru ispravnosti (checksum) paketa
                                                                                                                        </li>
                                                                                                                        <li>
                                                                                                                          pretraživanje paketa
                                                                                                                        </li>
                                                                                                                        <li>
                                                                                                                          update paketa
                                                                                                                        </li>
                                                                                                                      </ul>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Ekvivalent Linux paketa u Windows svijetu je instalacija nekog programa &#8211; pr. format <span class="lang:default decode:true  crayon-inline ">.msi</span>  ili <span class="lang:default decode:true  crayon-inline ">.exe</span>  :
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Npr. <span class="lang:default decode:true  crayon-inline">Instalacija-programa.exe</span>  ili  <span class="lang:default decode:true  crayon-inline ">Instalacija-programa.msi</span>
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        &nbsp;
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Paketi se uglavnom nalaze na tkzv. javnim repository-jima poput &#8220;EPEL&#8221; repozitorija:
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        (Primjer je EPEL repozitorij za RedHat bazirane Linux-e , verzije 6.x , i to za 64.bitnu x86 platformu procesora)
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        <a title="&quot;EPEL&quot; Repository" href="http://mirror.datacenter.by/pub/fedoraproject.org/epel/6/x86_64/">EPEL</a>
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Svaki RPM paket može biti i kriptografski verificiran pomoću:
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <ul>
                                                                                                                        <li>
                                                                                                                          GPG (GNU Privacy Guard) &#8211; alternativa PGP i
                                                                                                                        </li>
                                                                                                                        <li>
                                                                                                                          MD5
                                                                                                                        </li>
                                                                                                                      </ul>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Što je uopće  repozitorij:<br /> U biti to je pripremljeni direktoriji na Web-u, koji sadrži softverske pakete (.rpm) i ostale specifične datoteke, s kojega možete &#8220;skinuti &#8221; (download) željene (dostupne) pakete. Podržani načini skidanja su preko HTTP ili FTP protokola.
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        &nbsp;
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Vratimo se paketima i onome što se nalazi unutar svakog paketa:
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <ul>
                                                                                                                        <li>
                                                                                                                          Header &#8211; informacije o samom paketu:  verzija, arhitektura, opis, listu datoteka, &#8230;
                                                                                                                        </li>
                                                                                                                        <li>
                                                                                                                          Payload &#8211; arhiva samih datoteka obično u cpio formatu ( koja je komprimirana sa gzip-om, noviji formati podržavaju i druge kompresije)
                                                                                                                        </li>
                                                                                                                        <li>
                                                                                                                          Signature (potpis) &#8211; koji osigurava integritet paketa [GPG ili MD5]
                                                                                                                        </li>
                                                                                                                      </ul>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        U trenutku kada radimo neku operaciju sa paketima, oodređene informacije o svakom paketu se snimaju/čitaju u/iz interne RPM baze podataka (na samom računalu).
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Interna  RPM baza podataka sadrži listu instaliranih paketa na sustavu. Bazu možemo pretraživati po raznim kriterijima te možemo provjeriti verzije instaliranih paketa.
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        &nbsp;
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <h3>
                                                                                                                        Primjeri:
                                                                                                                      </h3>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Ispiši verziju paketa imena telnet
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <pre class="lang:default decode:true">rpm -q telnet</pre>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        &nbsp;
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Izlistaj (-q) sve (-a) instalirane pakete:
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <pre class="lang:default decode:true">rpm -qa</pre>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        &nbsp;
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Upotreba wildcard-a (ispiši sve instalirane pakete i pronađi samo onaj koji u imenu ima telnet*):
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <pre class="lang:default decode:true">rpm -qa "telnet*"</pre>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        &nbsp;
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Pronađi koji paket je instalirao točno određenu datoteku (s apsloutnom putanjom) pr . datoteka ssh , koja se nalazi u /usr/bin/ssh:
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <pre class="lang:default decode:true">rpm -qf /usr/bin/ssh
openssh-clients-5.3p1-84.1.el6.x86_64</pre>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        &nbsp;
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Osnovni  prekidači <span class="lang:default decode:true  crayon-inline ">rpm</span>  naredbe su:
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        <span class="lang:default decode:true  crayon-inline ">-i IME</span>  : install &#8211; instaliraj paket (IME može biti i URL [FTP ili HTTP])<br /> <span class="lang:default decode:true  crayon-inline ">-U IME</span>  : Upgrade &#8211; nadogradi paket<br /> <span class="lang:default decode:true  crayon-inline ">-e IME</span>  : Erase &#8211; obriši/uninstaliraj paket<br /> <span class="lang:default decode:true  crayon-inline ">-V IME</span>  : Verify &#8211; provjeri paket:
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <ul>
                                                                                                                        <li>
                                                                                                                          Provjeravaju se : <ul>
                                                                                                                            <li>
                                                                                                                              Owner,
                                                                                                                            </li>
                                                                                                                            <li>
                                                                                                                              Group,
                                                                                                                            </li>
                                                                                                                            <li>
                                                                                                                              Mode,
                                                                                                                            </li>
                                                                                                                            <li>
                                                                                                                              MD5 checksum,
                                                                                                                            </li>
                                                                                                                            <li>
                                                                                                                              Size,
                                                                                                                            </li>
                                                                                                                            <li>
                                                                                                                              Major and Minor Version number,
                                                                                                                            </li>
                                                                                                                            <li>
                                                                                                                              Symlink,
                                                                                                                            </li>
                                                                                                                            <li>
                                                                                                                              Modification time
                                                                                                                            </li>
                                                                                                                          </ul>
                                                                                                                        </li>
                                                                                                                      </ul>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Dodatni korisni prekidači : -h (hash marks -#) i -v (verbose)
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        &nbsp;
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        &nbsp;
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        &nbsp;
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Korisni prekidaći za pretraživanje (malo slovo Q):<br /> <span class="lang:default decode:true  crayon-inline ">-qi IME </span>: ispiši opis paketa (ovdje je i ime grupe kojoj pripada)<br /> <span class="lang:default decode:true  crayon-inline ">-qg IME</span> : ispiši listu paketa koji pripadaju određenoj grupi<br /> Pr.: rpm -qg “System Environment/Daemons”<br /> <span class="lang:default decode:true  crayon-inline ">-ql IME</span> : ispiši listu datoteka unutar paketa<br /> Pr.: rpm -ql openssh-clients<br /> <span class="lang:default decode:true  crayon-inline ">-qc IME</span> : ispiši konfiguracijske datoteke određenog paketa<br /> <span class="lang:default decode:true  crayon-inline ">-qs IME</span> : ispiši stanje datoteka unutar paketa, poruke mogu biti slijedeće:
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <ul>
                                                                                                                        <li>
                                                                                                                          <strong>normal</strong> &#8211; Datoteka je instalirana
                                                                                                                        </li>
                                                                                                                        <li>
                                                                                                                          <strong>not installed</strong> &#8211; datoteka iz paketa nije instalirana
                                                                                                                        </li>
                                                                                                                        <li>
                                                                                                                          <strong>replaced</strong> &#8211; datoteka je zamijenjena
                                                                                                                        </li>
                                                                                                                      </ul>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        &nbsp;
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        I na kraju o nedostacima rpm paketa i  samog managera paketa:
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <ul>
                                                                                                                        <li>
                                                                                                                          Ne može riješiti ovisnosti o nekom drugom paketu (dependencies)
                                                                                                                        </li>
                                                                                                                      </ul>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Jedino što RPM može napraviti po pitanju ovisnosti o nekom drugom paketu je da prije instalacije provjeri da li je taj paket instaliran i upozori vas da vam nedostaju određeni paketi, ali on ih za vas neće moći instalirati. To morate sami (moguće je [i dosta često] da neki paket koji nedostaje ovisi o nekom trećem ili četvrtom i tako dalje).
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Ali i za to postoji riješenje 🙂
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        &nbsp;
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <h2>
                                                                                                                        YUM Package Management
                                                                                                                      </h2>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        YUM (Yellow dog Update Modified) je nadogradnja na mogućnosti RPM package managera.
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Možemo reći da je on frontend za RPM package manager.<br /> YUM omogućava praćenje ovisnosti (dependencies) o drugim paketima i automatski ih riješava:<br /> On to riješava uvođenjem dodatka na RPM repository (Metadata), koji je zapravo dodatna baza podataka koja sadrži podatke o svakom paketu i svim međuovisnostima (dependency) između svih <span class="lang:default decode:true  crayon-inline ">rpm</span>  paketa.
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        NAPOMENA: Svaki puta kada pokrenete <span class="lang:default decode:true  crayon-inline ">yum</span>  , on se spaja na sve repozitorije na internetu, koji su vam dodati u sustav.
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Nakon toga, povlači sve YUM baze podataka s njih, na vaše računalo. Na taj način u svakom trenutku usporedbom instaliranih paketa i onih koji su u YUM bazi podataka, YUM &#8220;zna&#8221; da li se pojavila novija verzija nekog programa (uz osnovnu funkcionalnost da su mu poznate međuovisnosti paketa [dependencies]).
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        &nbsp;
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        <strong>Kako se instaliraju paketi pomoću YUM-a ?</strong>
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Naime procedura je slijedeća:
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <ol>
                                                                                                                        <li>
                                                                                                                          Dodajete novi repository (ako nije dodan, a baš na njemu se nalazi paket koji trebate), ako već je dodan, onda preskačete ovaj korak,
                                                                                                                        </li>
                                                                                                                        <li>
                                                                                                                          Kod (svakog) pokretanja YUM-a, sinkroniziraju se meta podaci (Metadata) sa Web repozitorija na lokalno računalo,
                                                                                                                        </li>
                                                                                                                        <li>
                                                                                                                          YUM kopira RPM pakete te provjerava ovisnosti (dependencies), ako postoje, prvo se kopiraju i instaliraju svi paketi koji su prethodno potrebni, a tek onda oni koji slijede.
                                                                                                                        </li>
                                                                                                                      </ol>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        &nbsp;
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        <strong>Koji su osnovni prekidači YUM-a ?</strong>
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Osnovni prekidači (najčešće korišteni) , su :
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        YUM osnovni prekidači:<br /> <span class="lang:default decode:true  crayon-inline ">yum update</span>  : napravi update svih paketa (full system update)<br /> <span class="lang:default decode:true  crayon-inline ">yum install IME</span>  : Instaliraj novi paket imena (IME)<br /> <span class="lang:default decode:true  crayon-inline">yum erase IME</span>  : Uninstaliraj paket imena (IME)<br /> <span class="lang:default decode:true  crayon-inline">yum search IME</span>  : pretraži sve pakete u potrazi za ključnom riječi (IME)<br /> <span class="lang:default decode:true  crayon-inline">yum list installed</span>  : Ispiši popis svih instaliranih paketa<br /> <span class="lang:default decode:true  crayon-inline">yum grouplist</span>  : Ispiši popis svih instaliranih grupa paketa<br /> <span class="lang:default decode:true  crayon-inline">yum groupinstall IME</span> : Instaliraj grupu paketa , npr:<br /> <span class="lang:default decode:true  crayon-inline">yum groupinstall &#8220;Development Tools&#8221;</span><br /> <span class="lang:default decode:true  crayon-inline">yum groupremove IME</span> : Uninstaliraj grupu paketa , npr
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        <span class="lang:default decode:true  crayon-inline crayon-selected">       yum groupremove &#8220;Development Tools&#8221;</span>
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        &nbsp;
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <h3>
                                                                                                                        Primjeri:
                                                                                                                      </h3>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Dodavanje novog repozitorija, poluautomatski (pr. EPEL za 64).
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Dakle otišli smo na EPEL repozitorij ( http://mirror.datacenter.by/pub/fedoraproject.org/epel/6/x86_64 ) te želimo instalirali automatski taj repozitorij (tu se nalazi paket epel-****.rpm).
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Način 1.:
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <pre class="lang:default decode:true">wget http://mirror.datacenter.by/pub/fedoraproject.org/epel/6/x86_64/epel-release-6-8.noarch.rpm
rpm -ivh epel-release-6-8.noarch.rpm</pre>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Način 2. (sjetimo se da RPM paket manger podržava HTTP i FTP direktno) :
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <pre>rpm -ivh http://mirror.datacenter.by/pub/fedoraproject.org/epel/6/x86_64/epel-release-6-8.noarch.rpm</pre>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Provjerimo da li je novi repozitorij dodan (treba se pojaviti epel):
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <pre class="lang:default decode:true">yum repolist</pre>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Ako nije uključen, uključimo ga:
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <pre class="lang:default decode:true">yum --enablerepo=epel</pre>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        &nbsp;
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Instalirajmo Midnight Commander (Norton Commander klon za Linux), ime paketa je  <span class="lang:default decode:true  crayon-inline ">mc</span>
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <pre class="lang:default decode:true">yum install mc</pre>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        &nbsp;
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Uninstalirajmo Midnight Commander (Norton Commander klon za Linux), ime paketa je  <span class="lang:default decode:true  crayon-inline ">mc</span>
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <pre class="lang:default decode:true">yum erase mc</pre>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        &nbsp;
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        &nbsp;
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <h1>
                                                                                                                         vi editor
                                                                                                                      </h1>
                                                                                                                      
                                                                                                                      <ul>
                                                                                                                        <li dir="ltr">
                                                                                                                          <p dir="ltr">
                                                                                                                            vi editor je dostupan na svim verzijama Unix-a i Linux-a koje postoje
                                                                                                                          </p>
                                                                                                                        </li>
                                                                                                                        
                                                                                                                        <li dir="ltr">
                                                                                                                          <p dir="ltr">
                                                                                                                            Ima dva osnovna moda rada
                                                                                                                          </p>
                                                                                                                          
                                                                                                                          <ul>
                                                                                                                            <li dir="ltr">
                                                                                                                              <p dir="ltr">
                                                                                                                                insert mode : za upisivanje teksta
                                                                                                                              </p>
                                                                                                                            </li>
                                                                                                                            
                                                                                                                            <li dir="ltr">
                                                                                                                              <p dir="ltr">
                                                                                                                                naredbeni mod : za izvršavanje naredbi nad tekstom
                                                                                                                              </p>
                                                                                                                            </li>
                                                                                                                          </ul>
                                                                                                                        </li>
                                                                                                                      </ul>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        &nbsp;
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <ul>
                                                                                                                        <li dir="ltr">
                                                                                                                          <p dir="ltr">
                                                                                                                            insert i append
                                                                                                                          </p>
                                                                                                                          
                                                                                                                          <ul>
                                                                                                                            <li dir="ltr">
                                                                                                                              <p dir="ltr">
                                                                                                                                <span class="lang:default decode:true  crayon-inline ">i</span>  (insert) &#8211; ubaci tekst ispred
                                                                                                                              </p>
                                                                                                                            </li>
                                                                                                                            
                                                                                                                            <li dir="ltr">
                                                                                                                              <p dir="ltr">
                                                                                                                                <span class="lang:default decode:true  crayon-inline ">a</span>  (append) &#8211; ubaci tekst iza
                                                                                                                              </p>
                                                                                                                            </li>
                                                                                                                            
                                                                                                                            <li dir="ltr">
                                                                                                                              <p dir="ltr">
                                                                                                                                <span class="lang:default decode:true  crayon-inline ">o</span>   &#8211; otvori novi red ispod
                                                                                                                              </p>
                                                                                                                            </li>
                                                                                                                            
                                                                                                                            <li dir="ltr">
                                                                                                                              <p dir="ltr">
                                                                                                                                <span class="lang:default decode:true  crayon-inline ">O</span>   &#8211; otvori novi red iznad
                                                                                                                              </p>
                                                                                                                            </li>
                                                                                                                            
                                                                                                                            <li dir="ltr">
                                                                                                                              <p dir="ltr">
                                                                                                                                <span class="lang:default decode:true  crayon-inline ">I</span>   &#8211; ubaci tekst na početak reda
                                                                                                                              </p>
                                                                                                                            </li>
                                                                                                                            
                                                                                                                            <li dir="ltr">
                                                                                                                              <p dir="ltr">
                                                                                                                                <span class="lang:default decode:true  crayon-inline ">A</span>   &#8211; ubaci tekst na kraj reda
                                                                                                                              </p>
                                                                                                                            </li>
                                                                                                                          </ul>
                                                                                                                        </li>
                                                                                                                      </ul>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        <span class="lang:default decode:true  crayon-inline ">ESC</span>  &#8211; vraća u naredbeni mode
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <ul>
                                                                                                                        <li dir="ltr">
                                                                                                                          <p dir="ltr">
                                                                                                                            Ako ne rade kursorske tipke:
                                                                                                                          </p>
                                                                                                                          
                                                                                                                          <ul>
                                                                                                                            <li dir="ltr">
                                                                                                                              <p dir="ltr">
                                                                                                                                <span class="lang:default decode:true  crayon-inline ">h</span>  (lijevo)
                                                                                                                              </p>
                                                                                                                            </li>
                                                                                                                            
                                                                                                                            <li dir="ltr">
                                                                                                                              <p dir="ltr">
                                                                                                                                <span class="lang:default decode:true  crayon-inline ">l</span>  (desno)
                                                                                                                              </p>
                                                                                                                            </li>
                                                                                                                            
                                                                                                                            <li dir="ltr">
                                                                                                                              <p dir="ltr">
                                                                                                                                <span class="lang:default decode:true  crayon-inline ">j</span>  (dolje)
                                                                                                                              </p>
                                                                                                                            </li>
                                                                                                                            
                                                                                                                            <li dir="ltr">
                                                                                                                              <p dir="ltr">
                                                                                                                                <span class="lang:default decode:true  crayon-inline ">k</span>  (gore)
                                                                                                                              </p>
                                                                                                                            </li>
                                                                                                                          </ul>
                                                                                                                        </li>
                                                                                                                      </ul>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        <span class="lang:default decode:true  crayon-inline ">ESC</span>  &#8211; vraća u naredbeni mode
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        &nbsp;
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <ul>
                                                                                                                        <li dir="ltr">
                                                                                                                          <p dir="ltr">
                                                                                                                            Brisanje
                                                                                                                          </p>
                                                                                                                          
                                                                                                                          <ul>
                                                                                                                            <li dir="ltr">
                                                                                                                              <p dir="ltr">
                                                                                                                                <span class="lang:default decode:true  crayon-inline ">x</span>  (brisanje znaka)
                                                                                                                              </p>
                                                                                                                            </li>
                                                                                                                            
                                                                                                                            <li dir="ltr">
                                                                                                                              <p dir="ltr">
                                                                                                                                <span class="lang:default decode:true  crayon-inline ">dd</span>  (brisanje cijelog reda)
                                                                                                                              </p>
                                                                                                                            </li>
                                                                                                                          </ul>
                                                                                                                        </li>
                                                                                                                        
                                                                                                                        <li dir="ltr">
                                                                                                                          <p dir="ltr">
                                                                                                                            Undo
                                                                                                                          </p>
                                                                                                                          
                                                                                                                          <ul>
                                                                                                                            <li dir="ltr">
                                                                                                                              <p dir="ltr">
                                                                                                                                <span class="lang:default decode:true  crayon-inline ">u</span>  (undo prvu promjenu)
                                                                                                                              </p>
                                                                                                                            </li>
                                                                                                                            
                                                                                                                            <li dir="ltr">
                                                                                                                              <p dir="ltr">
                                                                                                                                <span class="lang:default decode:true  crayon-inline ">U</span>  (undo sve promjene u redu)
                                                                                                                              </p>
                                                                                                                            </li>
                                                                                                                          </ul>
                                                                                                                        </li>
                                                                                                                      </ul>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        &nbsp;
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <ul>
                                                                                                                        <li dir="ltr">
                                                                                                                          <p dir="ltr">
                                                                                                                            Ponavljanje naredbe
                                                                                                                          </p>
                                                                                                                          
                                                                                                                          <ul>
                                                                                                                            <li dir="ltr">
                                                                                                                              <p dir="ltr">
                                                                                                                                <span class="lang:default decode:true  crayon-inline ">.</span>  (ponavlja zadnju naredbu)
                                                                                                                              </p>
                                                                                                                            </li>
                                                                                                                          </ul>
                                                                                                                        </li>
                                                                                                                        
                                                                                                                        <li dir="ltr">
                                                                                                                          <p dir="ltr">
                                                                                                                            Kopiranje (Yank)
                                                                                                                          </p>
                                                                                                                          
                                                                                                                          <ul>
                                                                                                                            <li dir="ltr">
                                                                                                                              <p dir="ltr">
                                                                                                                                <span class="lang:default decode:true  crayon-inline ">yw</span>  (kopiraj trenutnu riječ)
                                                                                                                              </p>
                                                                                                                            </li>
                                                                                                                            
                                                                                                                            <li dir="ltr">
                                                                                                                              <p dir="ltr">
                                                                                                                                <span class="lang:default decode:true  crayon-inline ">2yw</span>  (kopiraj 2 riječi)
                                                                                                                              </p>
                                                                                                                            </li>
                                                                                                                            
                                                                                                                            <li dir="ltr">
                                                                                                                              <p dir="ltr">
                                                                                                                                <span class="lang:default decode:true  crayon-inline ">yy</span>  ili <span class="lang:default decode:true  crayon-inline ">Y</span>  (kopiraj trenutni red)
                                                                                                                              </p>
                                                                                                                            </li>
                                                                                                                            
                                                                                                                            <li dir="ltr">
                                                                                                                              <p dir="ltr">
                                                                                                                                <span class="lang:default decode:true  crayon-inline ">2yy</span>  (kopiraj 2 reda)
                                                                                                                              </p>
                                                                                                                            </li>
                                                                                                                          </ul>
                                                                                                                        </li>
                                                                                                                        
                                                                                                                        <li dir="ltr">
                                                                                                                          <p dir="ltr">
                                                                                                                            Paste
                                                                                                                          </p>
                                                                                                                          
                                                                                                                          <ul>
                                                                                                                            <li dir="ltr">
                                                                                                                              <p dir="ltr">
                                                                                                                                <span class="lang:default decode:true  crayon-inline ">p</span>  (paste)
                                                                                                                              </p>
                                                                                                                            </li>
                                                                                                                          </ul>
                                                                                                                        </li>
                                                                                                                      </ul>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        &nbsp;
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <ul>
                                                                                                                        <li dir="ltr">
                                                                                                                          <p dir="ltr">
                                                                                                                            Traženje
                                                                                                                          </p>
                                                                                                                          
                                                                                                                          <ul>
                                                                                                                            <li dir="ltr">
                                                                                                                              <p dir="ltr">
                                                                                                                                <span class="lang:default decode:true  crayon-inline ">/pojam</span>  (traži <span class="lang:default decode:true  crayon-inline ">pojam</span> )
                                                                                                                              </p>
                                                                                                                            </li>
                                                                                                                            
                                                                                                                            <li dir="ltr">
                                                                                                                              <p dir="ltr">
                                                                                                                                <span class="lang:default decode:true  crayon-inline ">n</span>  (traži slijedeći pojam)
                                                                                                                              </p>
                                                                                                                            </li>
                                                                                                                            
                                                                                                                            <li dir="ltr">
                                                                                                                              <p dir="ltr">
                                                                                                                                <span class="lang:default decode:true  crayon-inline ">N</span>  (traži prethodni nađeni pojam)
                                                                                                                              </p>
                                                                                                                            </li>
                                                                                                                          </ul>
                                                                                                                        </li>
                                                                                                                        
                                                                                                                        <li dir="ltr">
                                                                                                                          <p dir="ltr">
                                                                                                                            Pronađi i zamjeni
                                                                                                                          </p>
                                                                                                                          
                                                                                                                          <ul>
                                                                                                                            <li dir="ltr">
                                                                                                                              <p dir="ltr">
                                                                                                                                <span class="lang:default decode:true  crayon-inline ">%s/prvo/drugo/g</span>
                                                                                                                              </p>
                                                                                                                            </li>
                                                                                                                          </ul>
                                                                                                                        </li>
                                                                                                                      </ul>
                                                                                                                      
                                                                                                                      <p dir="ltr">
                                                                                                                        (Zamjeni riječ <span class="lang:default decode:true  crayon-inline ">prvo</span>  sa <span class="lang:default decode:true  crayon-inline ">drugo</span> )
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        &nbsp;
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <ul>
                                                                                                                        <li dir="ltr">
                                                                                                                          <p dir="ltr">
                                                                                                                            Snimanje
                                                                                                                          </p>
                                                                                                                          
                                                                                                                          <ul>
                                                                                                                            <li dir="ltr">
                                                                                                                              <p dir="ltr">
                                                                                                                                <span class="lang:default decode:true  crayon-inline ">:w</span>  (snimi)
                                                                                                                              </p>
                                                                                                                            </li>
                                                                                                                            
                                                                                                                            <li dir="ltr">
                                                                                                                              <p dir="ltr">
                                                                                                                                <span class="lang:default decode:true  crayon-inline ">:wq</span>  (snimi i izađi iz vi-ja)
                                                                                                                              </p>
                                                                                                                            </li>
                                                                                                                            
                                                                                                                            <li dir="ltr">
                                                                                                                              <span style="line-height: 1.5;"><span class="lang:default decode:true  crayon-inline ">:wq!</span>  (snimi i izađi iz vi-ja, čak i ako je otvorena datoteka read-only)</span>
                                                                                                                            </li>
                                                                                                                          </ul>
                                                                                                                        </li>
                                                                                                                      </ul>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        &nbsp;
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        &nbsp;
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        <span style="color: #ff0000; background-color: #ffff99;"><strong>Napomena : dokument je u razvoju te će se stalno dopunjavati i ispravljati</strong></span>
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        &nbsp;
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        Za sve koji u međuvremenu žele učiti Linux ali nisu u mogućnosti instalirati ga, preporučam Embedded Linux u Web Browseru:
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        <a title="Linux in Web Browser" href="http://bellard.org/jslinux/">http://bellard.org/jslinux/</a>
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        <span style="line-height: 1.5;"> </span>
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        &nbsp;
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        <span style="color: #ff0000; background-color: #ffff99;"><strong> </strong></span>
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <p>
                                                                                                                        <strong><span style="color: #ff0000; background-color: #ffff99;"><strong><strong>Nastavak u slijedećem predavanju  ( IV ):</strong></strong></span><br /> </strong>
                                                                                                                      </p>
                                                                                                                      
                                                                                                                      <ul>
                                                                                                                        <li>
                                                                                                                          <strong>vi</strong>
                                                                                                                        </li>
                                                                                                                        <li>
                                                                                                                          <strong>sed</strong>
                                                                                                                        </li>
                                                                                                                        <li>
                                                                                                                          <strong>grep</strong>
                                                                                                                        </li>
                                                                                                                        <li>
                                                                                                                          <strong>awk</strong>
                                                                                                                        </li>
                                                                                                                        <li>
                                                                                                                          <strong>Shell skripte</strong>
                                                                                                                        </li>
                                                                                                                      </ul>