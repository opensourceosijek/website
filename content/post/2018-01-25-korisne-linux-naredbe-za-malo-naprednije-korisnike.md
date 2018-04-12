---
title: Korisne Linux naredbe (za malo naprednije korisnike)
author: Hrvoje Horvat
type: post
date: 2018-01-25T18:41:49+00:00
private: true
url: /2018/01/25/korisne-linux-naredbe-za-malo-naprednije-korisnike/
featured_image: /wp-content/uploads/2014/02/linux_img.png
categories:
  - Članci
  - Knjige
  - Linux
  - OS@OS
  - Vijesti
  - Zanimljivosti

---
U ovom članku, proći ćemo neke od korisnih Linux naredbi, za malo naprednije korisnike. Samo ćemo kratko nabrojiti korisne naredbe u Linuxu, za malo naprednije korisnike, i to uz samo nekoliko pripadajućih primjera. Na kraju ćete dobiti i PDF dokument, sa svim navedenim naredbama i primjerima upotrebe, koji si možete odštampati (i držati negdje u blizini) 🙂 .

&nbsp;

Ako vas možda područja koja ćemo obraditi, zanimaju detaljnije ili se pak želite upoznati s osnovama,  sve to možete pronaći u mojoj online knjizi: [**Uvod u Linux i Linux napredno**][1], objavljenoj unutar inicijative [_**Open Source Osijek**_][2]. a koju možete slobodno koristiti za osobnu uporabu.

&nbsp;

Dolje u tekstu, obraditi ćemo tri područja Linuxa:

  * **Mrežni (pod)sustav**
  * **Diskovni sustav**
  * **Linux sustav općenito**

&nbsp;

&nbsp;

&nbsp;

## **Mrežni podsustav**

Za rad u mrežnom sustavu odnosno s mrežom, dostupno je nekoliko osnovnih naredbi.

&nbsp;

### ifconfig

Ova naredba, dolazi u paketu <span class="lang:default decode:true crayon-inline ">net-tools</span> , koji u novijim distribucijama Linuxa nije više standardno instaliran, ali ga naravno možete instalirati. U ovom paketu dolazi cijeli niz naredbi, poput:

  * <span class="lang:default decode:true crayon-inline ">hostname</span>
  * <span class="lang:default decode:true crayon-inline ">domainname</span>
  * <span class="lang:default decode:true crayon-inline ">netstat</span>
  * <span class="lang:default decode:true crayon-inline ">arp</span>
  * <span class="lang:default decode:true crayon-inline ">ifconfig</span>
  * <span class="lang:default decode:true crayon-inline ">ipmaddr</span>
  * <span class="lang:default decode:true crayon-inline ">route</span>
  * &#8230;

S ovom naredbom možete ispisati konfiguraciju svih mrežnih sučelja (eth0, eth1, &#8230;) ali ih možete i konfigurirati.

Ispis konfiguracije svih mrežnih sučelja:

<pre class="font:courier-new lang:sh decode:true">eth0 Link encap:Ethernet HWaddr 08:00:27:EC:C0:1A
     inet addr:192.168.1.170 Bcast:192.168.1.255 Mask:255.255.255.0
     inet6 addr: fe80::a00:27ff:feec:c01a/64 Scope:Link
     UP BROADCAST RUNNING MULTICAST MTU:1500 Metric:1
     RX packets:43 errors:0 dropped:0 overruns:0 frame:0
     TX packets:43 errors:0 dropped:0 overruns:0 carrier:0
     collisions:0 txqueuelen:1000
     RX bytes:6805 (6.6 KiB) TX bytes:6913 (6.7 KiB)

lo Link encap:Local Loopback
   inet addr:127.0.0.1 Mask:255.0.0.0
   inet6 addr: ::1/128 Scope:Host
   UP LOOPBACK RUNNING MTU:65536 Metric:1
   RX packets:0 errors:0 dropped:0 overruns:0 frame:0
   TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
   collisions:0 txqueuelen:0
   RX bytes:0 (0.0 b) TX bytes:0 (0.0 b)</pre>

&nbsp;

&nbsp;

&nbsp;

Primjerice, konfigurirajmo mrežnu karticu **eth0** ,s IP adresom: 192.168.100.100 i maskom mreže: 255.255.255.0

<pre class="lang:default decode:true ">ifconfig eth0 192.168.100.100 netmask 255.255.255.0</pre>

&nbsp;

Isto tako, možemo mrežno sučelje uključiti ili isključiti:

<pre class="lang:default decode:true ">ifconfig eth0 up</pre>

ili

<pre class="lang:default decode:true ">ifconfig eth0 down</pre>

&nbsp;

S ovom naredbom možemo i uključiti ili isključiti podršku za multicast, na pojedinom mrežnom sučelju (pr. **eth0**)

Uključivanje multicast podrške (standardno je uključeno):

<pre class="lang:default decode:true ">ifconfig eth0 multicast</pre>

&nbsp;

Isključivanje podrške za multicast

<pre class="lang:default decode:true ">ifconfig eth0 -multicast</pre>

&nbsp;

&nbsp;

&nbsp;

### ip

Druga naredba, slična <span class="lang:default decode:true crayon-inline ">ifconfig</span> ,koja u novije vrijeme dolazi standardno s linuxom, odnosno dolazi u paketu <span class="lang:default decode:true crayon-inline">iproute</span>  ili <span class="lang:default decode:true crayon-inline">iproute2</span> . Ova naredba objedinjuje više naredbi iz starijeg paketa <span class="lang:default decode:true crayon-inline ">net-tools</span> . U ovom (<span class="lang:default decode:true crayon-inline">iproute2</span>) paketu dolazi i cijeli niz drugih naredbi za mrežu, poput:

  * <span class="lang:default decode:true crayon-inline">ip</span>
  * <span class="lang:default decode:true crayon-inline ">nstat</span>
  * <span class="lang:default decode:true crayon-inline ">ss</span>
  * <span class="lang:default decode:true crayon-inline ">bridge</span>
  * <span class="lang:default decode:true crayon-inline">tc</span>
  * <span class="lang:default decode:true crayon-inline ">lnstat</span>
  * <span class="lang:default decode:true crayon-inline ">cbq</span>
  * &#8230;

S ovom naredbom također možete i ispisati i mijenjati konfiguraciju mrežnih sučelja. Pogledajmo kako ispisati konfiguraciju svih mrežnih sučelja:

<pre class="lang:default decode:true">ip addr show</pre>

Dobiti ćemo malo drugačije (nepreglednije) izlistanje konfiguracije:

<pre class="font:courier-new lang:sh decode:true">1: lo: &lt;LOOPBACK,UP,LOWER_UP&gt; mtu 65536 qdisc noqueue state UNKNOWN
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
    inet6 ::1/128 scope host
    valid_lft forever preferred_lft forever
2: eth0: &lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt; mtu 1500 qdisc pfifo_fast state UP qlen 1000
    link/ether 08:00:27:ec:c0:1a brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.170/24 brd 192.168.1.255 scope global eth2
    inet6 fe80::a00:27ff:feec:c01a/64 scope link
    valid_lft forever preferred_lft forever</pre>

&nbsp;

&nbsp;

Naredba <span class="lang:default decode:true crayon-inline">ip </span> radi na nižoj razini od naredbe <span class="lang:default decode:true crayon-inline ">ifconfig</span> , pa se s toga s njom mogu vidjeti stvari koje naredba <span class="lang:default decode:true crayon-inline ">ifconfig</span>  ne može prikazati, poput višestrukih IP adresa na pojedinom mrežnom sučelju (ako imate takvu konfiguraciju mreže &#8211; koju recimo koriste protokoli za mrežnu redundaniju na OSI sloju 3).

Konfigurirajmo mrežno sučelje **eth0**, s istom IP adresom kao gore:

<pre class="lang:default decode:true">ip addr add 192.168.100.100/24 dev eth0</pre>

&nbsp;

S ovom naredbom također možemo podizati ili spuštati mrežno sučelje.

Podizanje odnosno uključivanje (**eth0**):

<pre class="lang:default decode:true ">ip link set eth0 up</pre>

&nbsp;

Gašenje odnosno spuštanje (**eth0**):

<pre class="lang:default decode:true">ip link set eth0 down</pre>

&nbsp;

Možemo i vidjeti koje multicast ip adrese su pridružene kojem mrežnom sučelju:

<pre class="lang:default decode:true ">ip maddr</pre>

Dobiti ćemo, nešto poput ovoga:

<pre class="font:courier-new lang:sh decode:true">1: lo
    inet 224.0.0.1
    inet6 ff02::1
2: eth0
    link 33:33:ff:ec:c0:1a
    link 01:00:5e:00:00:01
    link 33:33:00:00:00:01
    inet 224.0.0.1
    inet6 ff02::1:ffec:c01a
    inet6 ff02::1

</pre>

&nbsp;

Dodatno, moguće je i dodavati multicast adrese (dodjeljivati ih mrežnom sučelju) ili ih brisati.

Dodavanje (pr. izmišljena multicast adresa 239.100.1.35 ) na mrežno sučelje **eth0**:

<pre class="lang:default decode:true">ip maddr add 239.100.1.35 dev eth0</pre>

Ili brisanje iste multicast adrese s mrežnog sučelja **eth0**:

<pre class="lang:default decode:true ">ip maddr del 239.100.1.35 dev eth0</pre>

&nbsp;

&nbsp;

**Te izlistati ili mijenjati routing tablicu.**

Izlistanje routing tablice:

<pre class="lang:default decode:true ">ip route</pre>

Pri čemu bi dobili nešto poput ovog izlistanja:

<pre class="font:courier-new lang:sh decode:true">192.168.1.0/24 dev eth0 proto kernel scope link src 192.168.1.170
169.254.0.0/16 dev eth0 scope link metric 1002
default via 192.168.1.1 dev eth0

</pre>

&nbsp;

**Kao i dodavati ili brisati route.**

Dodavanje route (riječ <span class="lang:default decode:true crayon-inline ">add</span> ), za mrežu: 192.168.200.0/24 , preko routera: 192.168.100.1 , i to preko mrežnog sučelja **eth0** :

<pre class="lang:default decode:true ">ip route add 192.168.200.0/24 via 192.168.100.1 eth0</pre>

Za brisanje _route_ se koristi riječ <span class="lang:default decode:true crayon-inline ">del</span>, umjesto <span class="lang:default decode:true crayon-inline">add</span>.

&nbsp;

&nbsp;

&nbsp;

### netstat

Naredba <span class="lang:default decode:true crayon-inline ">netstat</span> , daje nam razne statistike mrežnih sučelja a dolazi u gore navedenom paketu. Ona dolazi sa starijim paketom <span class="lang:default decode:true crayon-inline ">net-tools</span> .

Pogledajmo i neke od primjera. Pogledajmo statistike za sva mrežna sučelja:

<pre class="lang:default decode:true">netstat -i</pre>

Dobili bismo nešto poput ovoga:

<img class="alignnone size-full wp-image-2694" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/netstat-i-1.png?resize=851%2C73&#038;ssl=1" alt="" width="851" height="73" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/netstat-i-1.png?w=851&ssl=1 851w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/netstat-i-1.png?resize=150%2C13&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/netstat-i-1.png?resize=300%2C26&ssl=1 300w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/netstat-i-1.png?resize=768%2C66&ssl=1 768w" sizes="(max-width: 851px) 100vw, 851px" data-recalc-dims="1" />

Opis:

  * <span class="lang:default decode:true crayon-inline">Iface </span> &#8211; je mrežno sučelje
  * <span class="lang:default decode:true crayon-inline">MTU </span> &#8211; je MTU (Maximum Transmission Unit )  &#8211; max. veličina paketa mrežnog sučelja
  * <span class="lang:default decode:true crayon-inline">RX-OK</span>  &#8211; su ispravnio primljeni paketi
  * <span class="lang:default decode:true crayon-inline">RX-ERR,OVR ili DRP</span>  su neispravno primljeni ili odbačeni paketi
  * <span class="lang:default decode:true crayon-inline ">TX-OK</span>  &#8211; su ispravno poslani paketi
  * <span class="lang:default decode:true crayon-inline">TX-ERR,OVR ili DRP</span> su neispravno poslani ili odbačeni paketi

Ako želimo više statističkih detalja, možemo koristiti i <span class="lang:default decode:true crayon-inline ">-s</span> :

<pre class="lang:default decode:true">netstat -s</pre>

Na što bi dobili detaljnije statistike o poslanim i primljenim paketima kao i onima s greškom, poput ovoga na slici:

<img class="alignnone wp-image-2686" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/netstat-s.png?resize=437%2C609&#038;ssl=1" alt="" width="437" height="609" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/netstat-s.png?w=530&ssl=1 530w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/netstat-s.png?resize=108%2C150&ssl=1 108w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/netstat-s.png?resize=215%2C300&ssl=1 215w" sizes="(max-width: 437px) 100vw, 437px" data-recalc-dims="1" />

&nbsp;

Ispišimo sve route (routing tablicu i _default gateway_), i to brojčano (<span class="lang:default decode:true crayon-inline ">-n</span> ):

<pre class="lang:default decode:true">netstat -rn</pre>

Pri tome bi dobili nešto poput ovog ispisa:

<img class="alignnone size-full wp-image-2695" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/netstat-rn-1.png?resize=791%2C90&#038;ssl=1" alt="" width="791" height="90" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/netstat-rn-1.png?w=791&ssl=1 791w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/netstat-rn-1.png?resize=150%2C17&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/netstat-rn-1.png?resize=300%2C34&ssl=1 300w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/netstat-rn-1.png?resize=768%2C87&ssl=1 768w" sizes="(max-width: 791px) 100vw, 791px" data-recalc-dims="1" />

&nbsp;

Ispišimo pripadnost Multicast grupama, i to brojčano (<span class="lang:default decode:true crayon-inline ">-n</span> ):

<pre class="lang:default decode:true ">netstat -gn</pre>

Pogledajmo i kako to izgleda:

<img class="alignnone size-full wp-image-2696" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/netstat-gn-1.png?resize=450%2C126&#038;ssl=1" alt="" width="450" height="126" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/netstat-gn-1.png?w=450&ssl=1 450w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/netstat-gn-1.png?resize=150%2C42&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/netstat-gn-1.png?resize=300%2C84&ssl=1 300w" sizes="(max-width: 450px) 100vw, 450px" data-recalc-dims="1" />

Ovdje vidimo kako je _**multicast**_ IP adresa: 224.0.0.1 dodjeljena mrežnom sučelju **eth0**, koje je ovdje naše primarno mrežno sučelje. To znači kako je multicast aktivan jer je ovo multicast IP na koju moraju odgovoriti svi multicast uređaji (prema definiciji rada multicast mrežnih sučelja).

&nbsp;

Ispišimo sve mrežne konekcije (TCP i UDP, brojčano), stanja veza i timere (ako se radi o TCP vezama), kao i programe (daemone/servise) koji su odgovorni za neki servis/mrežni protokol:

<pre class="lang:default decode:true ">netstat -tunaop</pre>

Opis prekidača:

  * <span class="lang:default decode:true crayon-inline">-n</span>  &#8211; prikaži numerički, bez prepoznavanja mreža ili portova/servisa
  * <span class="lang:default decode:true crayon-inline">-u</span>  &#8211; prikaži UDP konekcije_
  
_ 
  * <span class="lang:default decode:true crayon-inline">-t</span>  &#8211; prikaži TCP konekcije
  * <span class="lang:default decode:true crayon-inline">-a</span>  &#8211; prikaži sve konekcije
  * <span class="lang:default decode:true crayon-inline">-g</span>  &#8211; prikaži sve multicast adrese te s kojim mrežnim sučeljima su povezane
  * <span class="lang:default decode:true crayon-inline">-o</span>  &#8211; prikaži i timere (vremenska stanja) TCP konekcija
  * <span class="lang:default decode:true crayon-inline">-p</span>  &#8211; prikaži i proces/program/daemon koji je pokrenuo servis i otvorio konkretni port
  * <span class="lang:default decode:true crayon-inline">-s</span>  &#8211; prikaži detaljne statistike

Pogledajmo kako bi izgledao ispis gornje naredbe &#8211; ovaj testni poslužitelj ima samo par servisa/portova: **ssh**(22), **telnet**(23), **web**(80) i **bootp** (68):

<img class="alignnone size-full wp-image-2689" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/netstat-tunaop.png?resize=1232%2C143&#038;ssl=1" alt="" width="1232" height="143" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/netstat-tunaop.png?w=1232&ssl=1 1232w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/netstat-tunaop.png?resize=150%2C17&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/netstat-tunaop.png?resize=300%2C35&ssl=1 300w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/netstat-tunaop.png?resize=768%2C89&ssl=1 768w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/netstat-tunaop.png?resize=1024%2C119&ssl=1 1024w" sizes="(max-width: 1000px) 100vw, 1000px" data-recalc-dims="1" />

Što ovdje vidimo:

  * <span class="lang:default decode:true crayon-inline ">Proto </span> je protokol (TCP ili UDP)
  * <span class="lang:default decode:true crayon-inline ">Local Address</span>  je lokalna IP adresa poslužitelja i pripadajući otvoreni PORT
  * <span class="lang:default decode:true crayon-inline ">Foreign Address</span>  je adresa udaljenog računala i PORT, za ovu konekciju (jedna konekcija tj. session &#8211; jedan red)
  * <span class="lang:default decode:true crayon-inline">State</span>  je stanje veze
  * <span class="lang:default decode:true crayon-inline ">PID/Program name</span>  je ime Linux programa/procesa i njegov PID (Process ID)
  * <span class="lang:default decode:true crayon-inline ">Timer</span>  je polje za trenutno stanje svakog TCP sessiona (njegovog timera)

&nbsp;

&nbsp;

&nbsp;

### nstat

Naredba <span class="lang:default decode:true crayon-inline ">nstat</span> , je naredba slična naredbi <span class="lang:default decode:true crayon-inline ">netstat </span> ali nam može dati puno više statističkih informacija o konekcijama, a dolazi u paketu <span class="lang:default decode:true crayon-inline ">iproute</span> .

Pogledajmo sve detaljne statistike (prema svim podvrstama paketa) &#8211; slično kao <span class="lang:default decode:true crayon-inline ">netstat -s</span>  ali puno detaljnije. Koristiti ćemo prekidač <span class="lang:default decode:true crayon-inline ">-a</span> , kako bi vidjeli apsolutne vrijednosti brojača  :

<pre class="lang:default decode:true">nstat -a</pre>

Pogledajmo ispis:

<img class="alignnone wp-image-2697" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/nstat-a.png?resize=516%2C629&#038;ssl=1" alt="" width="516" height="629" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/nstat-a.png?w=550&ssl=1 550w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/nstat-a.png?resize=123%2C150&ssl=1 123w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/nstat-a.png?resize=246%2C300&ssl=1 246w" sizes="(max-width: 516px) 100vw, 516px" data-recalc-dims="1" />

&nbsp;

### ss

Naredba slična naredbi <span class="lang:default decode:true crayon-inline">netstat</span> je naredba <span class="lang:default decode:true crayon-inline ">ss</span>  (_socket statistics_), koja dolazi u paketu <span class="lang:default decode:true crayon-inline ">iproute</span> .

Pogledajmo (izlistajmo sve konekcije):

<pre class="lang:default decode:true">ss</pre>

Dobiti ćemo samo aktivne veze (s gore navedenog testnog servera, na koji gotovo ništa osim SSH nije spojeno):

<img class="alignnone size-full wp-image-2690" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/ss.png?resize=1220%2C34&#038;ssl=1" alt="" width="1220" height="34" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/ss.png?w=1220&ssl=1 1220w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/ss.png?resize=150%2C4&ssl=1 150w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/ss.png?resize=300%2C8&ssl=1 300w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/ss.png?resize=768%2C21&ssl=1 768w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/ss.png?resize=1024%2C29&ssl=1 1024w" sizes="(max-width: 1000px) 100vw, 1000px" data-recalc-dims="1" />

Pogledajmo stanja svih otvorenih mrežnih konekcija:

<pre class="lang:default decode:true">ss -nmp</pre>

Opis prekidača:

  * <span class="lang:default decode:true crayon-inline ">-n</span>  &#8211; prikaži numerički, bez prepoznavanja mreža ili portova/servisa
  * <span class="lang:default decode:true crayon-inline">-m</span>  &#8211; prikaži _socket memory info_
  * <span class="lang:default decode:true crayon-inline">-p</span>  &#8211; prikaži i proces/program/daemon koji je pokrenuo servis i otvorio konkretni port
  * <span class="lang:default decode:true crayon-inline">-t</span>  &#8211; prikaži _TCP konekcije
  
_ 
  * <span class="lang:default decode:true crayon-inline">-u</span>  &#8211; prikaži _UDP konekcije_
  * <span class="lang:default decode:true crayon-inline ">-o state established</span>  &#8211; prikaži sve konekcije u stanju ESTABLISHED

Pogledajmo kako pronači sve konekcije koje su ostvarene (u TCP stanju ESTABLISHED ) i to samo za SSH protokol. Dodati ćemo filter za dolazni SSH i odlazni SSH protokol:

<pre class=""><code>ss -o state established '( dport = :ssh or sport = :ssh )'</code></pre>

Dobiti ćemo nešto poput:

<pre class="lang:default decode:true ">Recv-Q Send-Q        Local Address:Port      Peer Address:Port
 0      192          192.168.1.170:ssh       192.168.1.164:8577    timer:(on,354ms,0)
</pre>

&nbsp;

&nbsp;

Napomena: TCP konekcije, općenito mogu biti u slijedećim stanjima:

  * CLOSE_WAIT
  * CLOSED
  * ESTABLISHED
  * FIN\_WAIT\_1
  * FIN\_WAIT\_2
  * LAST_ACK
  * LISTEN
  * SYN_RECEIVED
  * SYN_SEND
  * TIMED_WAIT

&nbsp;

&nbsp;

### ethtool

Naredba <span class="lang:default decode:true crayon-inline ">ethtool</span> , dolazi ili standarno ili ju treba instalirati u paketu <span class="lang:default decode:true crayon-inline ">ethtool</span> . Ona nam omogućava razne promjene stanja rada mrežnih sučelja, poput promjene brzine rada (10/100/1000 Mbps) te duplex načina rada (full/half), kao i uključivanja ili isključivanja raznih funkcionalnosti mrežnih kartica (poput nekih akceleriranih funkcija i slično).

Pogledajmo informacije o hardveru mrežnog sučelja (kartice) <span class="lang:default decode:true crayon-inline ">eth0</span> . Dakle ovdje ćemo vidjeti koji kernel modul (upravljački program) je zadužen za navedenu karticu, koju kartica ima verziju firmware-a i slično:

<pre class="lang:default decode:true ">ethtool -i eth0</pre>

Pogledajmo ispis:

<img class="alignnone wp-image-2699" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/ethtool-i-eth0-2.png?resize=279%2C145&#038;ssl=1" alt="" width="279" height="145" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/ethtool-i-eth0-2.png?w=384&ssl=1 384w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/ethtool-i-eth0-2.png?resize=150%2C78&ssl=1 150w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/ethtool-i-eth0-2.png?resize=300%2C156&ssl=1 300w" sizes="(max-width: 279px) 100vw, 279px" data-recalc-dims="1" />

Vidljivo je:

  * driver (kernel modul) za našu Intelovu mrežnu karticu (chip: 82573L) je <span class="lang:default decode:true crayon-inline">e1000e</span>
  * vidimo i verziju drivera: **2.3.2.-k**
  * &#8230; i ostale detalje, poput sabirnice na koju je spojen (09:00.00), &#8230;

Da je recimo driver pisan (razvijan) i kompiliran s podrškom za **NAPI**, to bi bili vidljivo kao na ovom <span class="lang:default decode:true crayon-inline ">e1000</span>  driveru, u polju version &#8211; verzija bi obično završavavala s  <span class="lang:default decode:true crayon-inline ">-NAPI</span>  (Pogledajte knjigu **&#8220;Uvod u Linux i Linux napredno&#8221;**: Poglavlje: [Interrupt moderation][3])

<img class="alignnone size-full wp-image-2698" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/ethtool-i-eth0.png?resize=290%2C160&#038;ssl=1" alt="" width="290" height="160" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/ethtool-i-eth0.png?w=290&ssl=1 290w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/ethtool-i-eth0.png?resize=150%2C83&ssl=1 150w" sizes="(max-width: 290px) 100vw, 290px" data-recalc-dims="1" />

&nbsp;

S ovim programom također možemo vidjeti i statistike mrežnih paketa, na najnižoj razini mrežne kartice (sučelja):

<pre class="lang:default decode:true">ethtool -S eth0</pre>

Pogledajmo kako izgledaju ove statistike (izrezali smo samo dio statistika):

<img class="alignnone wp-image-2700" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/ethtool-s-eth0.png?resize=260%2C571&#038;ssl=1" alt="" width="260" height="571" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/ethtool-s-eth0.png?w=416&ssl=1 416w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/ethtool-s-eth0.png?resize=68%2C150&ssl=1 68w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/ethtool-s-eth0.png?resize=137%2C300&ssl=1 137w" sizes="(max-width: 260px) 100vw, 260px" data-recalc-dims="1" />

&nbsp;

Sada ćemo vidjeti i koje sve hardverski akcelerirane funkcionalnosti (_offload_) naša mrežna kartica (sučelje) <span class="lang:default decode:true crayon-inline">eth0</span>  ima:

<pre class="lang:default decode:true">ethtool --show-offload eth0</pre>

Pogledajmo što smo dobili:

<img class="alignnone wp-image-2701" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/ethtool-show-offload-eth0.png?resize=398%2C566&#038;ssl=1" alt="" width="398" height="566" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/ethtool-show-offload-eth0.png?w=527&ssl=1 527w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/ethtool-show-offload-eth0.png?resize=105%2C150&ssl=1 105w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/ethtool-show-offload-eth0.png?resize=211%2C300&ssl=1 211w" sizes="(max-width: 398px) 100vw, 398px" data-recalc-dims="1" />

Dakle vidimo koje su akcelerirane funkcije, koje mrežna kartica ima, uključene **(ON)** odnosno koje su isključene **(OFF)** te koje se ne mogu promijeniti **[fixed].**

&nbsp;

&nbsp;

U slijedećem primjeru uključiti ćemo TX i RX **checksumming** offload na drugoj mrežnoj kartici (**eth1**):

<pre class="lang:default decode:true">ethtool --offload eth1 rx on tx on</pre>

&nbsp;

&nbsp;

&nbsp;

### ifstat

Program <span class="lang:default decode:true crayon-inline">ifstat</span> , ponekada (ovisno o distribuciji Linuxa), moramo i instalirati &#8211; dolazi u paketu <span class="lang:default decode:true crayon-inline">ifstat</span> . On nam daje osnovne statistike prometa (dolazni i odlazni) o svim mrežnim sučeljima, u realnom vremenu, kako novi paketu dolaze. Pokrenimo ga:

<pre class="lang:default decode:true">ifstat</pre>

Pogledajmo kako to izgleda:

<img class="alignnone wp-image-2703" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/ifstat.png?resize=156%2C116&#038;ssl=1" alt="" width="156" height="116" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/ifstat.png?w=184&ssl=1 184w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/ifstat.png?resize=150%2C112&ssl=1 150w" sizes="(max-width: 156px) 100vw, 156px" data-recalc-dims="1" />

Iz programa se izlazi sa <span class="lang:default decode:true crayon-inline ">CTRL</span>  + <span class="lang:default decode:true crayon-inline ">c</span>

&nbsp;

&nbsp;

### Naredbe za praćenje mrežnog prometa

Vidjeti ćemo dvije naredbe, s kojima možemo pratiti mrežni promet u realnom vremenu. Dakle za pojedino mrežno sučelje (mrežnu karticu), možemo vidjeti koliko prometa prolazi kroz nju.

&nbsp;

#### iftop

Naredbu <span class="lang:default decode:true crayon-inline ">iftop</span> , potrebno je instalirati, dolazi u paketu <span class="lang:default decode:true crayon-inline ">iftop</span> . S njom možemo pratiti promet na pojedinom mrežnom sučelju, bilo da se radi o fizičkom poput: **eth0**, **eth1**, **eno1** &#8230; ili logičkom &#8211; primjerice: **eth0.10** , **bond0**, **bond0.10**, &#8230; .

Pogledajmo kako pratiti promet na mrežnom sučelju **bond0 (agregacija/team/bond)**:

<pre class="lang:default decode:true">iftop -i bond0</pre>

Pogledajmo kako to izgleda, u trenutku kada smo kopirali datoteku s računala 192.168.1.254 => (na) => 192.168.1.164:

<img class="alignnone wp-image-2704" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iftop-i-bond0.png?resize=555%2C331&#038;ssl=1" alt="" width="555" height="331" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iftop-i-bond0.png?w=882&ssl=1 882w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iftop-i-bond0.png?resize=150%2C89&ssl=1 150w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iftop-i-bond0.png?resize=300%2C179&ssl=1 300w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iftop-i-bond0.png?resize=768%2C458&ssl=1 768w" sizes="(max-width: 555px) 100vw, 555px" data-recalc-dims="1" />

Vidljivo je kako je vršna brzina bila 574Mbps &#8211; mjereno sa strane poslužitelja (192.168.1.254), pa je to njegovo slanje (TX) te kako je najniža brzina bila 220Mbps a onda je varijrala između 560Mbps i 562Mbps.

Iz programa se izlazi s tipkom <span class="lang:default decode:true crayon-inline">Q</span>

&nbsp;

&nbsp;

#### iptraf-ng

Program <span class="lang:default decode:true crayon-inline">iptraf-ng </span>je vrlo sličan prethodnom programu. Instalira se u paketu <span class="lang:default decode:true crayon-inline">iptraf-ng</span> . Postoji i starija verzija ovog programa a zove se <span class="lang:default decode:true crayon-inline ">iptraf</span>  (_IP Traffic_)

Program možemo pokrenuti s menijem:

<pre class="lang:default decode:true ">iptraf-ng</pre>

To izgleda ovako:

<img class="alignnone size-full wp-image-2705" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iptraf-ng-1.png?resize=719%2C528&#038;ssl=1" alt="" width="719" height="528" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iptraf-ng-1.png?w=719&ssl=1 719w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iptraf-ng-1.png?resize=150%2C110&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iptraf-ng-1.png?resize=300%2C220&ssl=1 300w" sizes="(max-width: 719px) 100vw, 719px" data-recalc-dims="1" />

Ako odaberemo: IP traffic monitor, možemo odabrati mrežno sučelje : **eth0**, **eth1**, &#8230; koje već imamo i pratičme se osnovna statistika TCP/UDP

&nbsp;

Ako odaberemo &#8220;**General Interface Statistic**&#8221; dobiti ćemo opću statistiku prometa, poput ove na slici:

<img class="alignnone size-full wp-image-2706" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iptraf-ng-2.png?resize=1003%2C154&#038;ssl=1" alt="" width="1003" height="154" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iptraf-ng-2.png?w=1003&ssl=1 1003w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iptraf-ng-2.png?resize=150%2C23&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iptraf-ng-2.png?resize=300%2C46&ssl=1 300w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iptraf-ng-2.png?resize=768%2C118&ssl=1 768w" sizes="(max-width: 1000px) 100vw, 1000px" data-recalc-dims="1" />

U prethodni meni se izlazi sa **X**

Ako pak odaberemo &#8220;**Detailed interface statistics**&#8221; te odaberemo željeno mrežno sučelje, dobiti ćemo malo detaljniju statistiku mrežnog prometa, poput ove na slici:

<img class="alignnone size-full wp-image-2707" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iptraf-ng-3.png?resize=1001%2C526&#038;ssl=1" alt="" width="1001" height="526" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iptraf-ng-3.png?w=1001&ssl=1 1001w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iptraf-ng-3.png?resize=150%2C79&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iptraf-ng-3.png?resize=300%2C158&ssl=1 300w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iptraf-ng-3.png?resize=768%2C404&ssl=1 768w" sizes="(max-width: 1000px) 100vw, 1000px" data-recalc-dims="1" />

I na kraju imamo i konfiguraciju detalja, pod &#8220;**Configure**&#8221;

&nbsp;

&nbsp;

Pogledajmo kako pratiti promet na mrežnom sučelju **eth0**:

<pre class="lang:default decode:true">iptraf-ng -i eth0</pre>

Ili za pokretanje odmah u detaljniju statistiku u realnom vremenu:

<pre class="lang:default decode:true ">iptraf-ng -d eth0</pre>

&nbsp;

Iz programa se izlazi s tipkom <span class="lang:default decode:true crayon-inline ">Q</span>

Kako ste i vidjeli, ovaj program nudi nam znatno više opcija i filtera, u praćenju paketa koji prolaze kroz mrežno sučelje.

&nbsp;

&nbsp;

### iperf

Program <span class="lang:default decode:true crayon-inline ">iperf</span> , koristi se za mjerenje propusnosti mreže. Postoje razne verzije odnosno generacije ovog programa (<span class="lang:default decode:true crayon-inline ">iperf</span> , <span class="lang:default decode:true crayon-inline ">iperf2</span>  <span class="lang:default decode:true crayon-inline ">iperf3</span> ). Mi žemo koristiti <span class="lang:default decode:true crayon-inline">iperf</span>. On radi prema principu u kojemu je jedna strana (pr. računalo A)  poslužitelj a druga strana (pr. računalo B) klijent.

&nbsp;

**Zamislimo ovakav scenarij:**

Računalo A : 192.168.1.254   &#8211;> (**biti će poslužitelj**)

Računalo B: 192.168.1.170    &#8211;>  (**biti će klijent**)

&nbsp;

Na računalu A (poslužitelj), pokrećemo:

<pre class="lang:default decode:true">iperf -s</pre>

Na strani koja je poslužitelj to inicijalno izgleda ovako:

<img class="alignnone size-full wp-image-2708" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iperf-s.png?resize=421%2C86&#038;ssl=1" alt="" width="421" height="86" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iperf-s.png?w=421&ssl=1 421w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iperf-s.png?resize=150%2C31&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iperf-s.png?resize=300%2C61&ssl=1 300w" sizes="(max-width: 421px) 100vw, 421px" data-recalc-dims="1" />

Na računalu B (klijent), pokrećemo:

<pre class="lang:default decode:true">iperf -c 192.168.1.254</pre>

Na klijentu to izgleda ovako:

<img class="alignnone size-full wp-image-2709" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iperf-c.png?resize=852%2C149&#038;ssl=1" alt="" width="852" height="149" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iperf-c.png?w=852&ssl=1 852w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iperf-c.png?resize=150%2C26&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iperf-c.png?resize=300%2C52&ssl=1 300w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iperf-c.png?resize=768%2C134&ssl=1 768w" sizes="(max-width: 852px) 100vw, 852px" data-recalc-dims="1" />

Ovo je osnovni TCP test, iz kojega je vidljivo, kako je klijentska strana prema poslužiteljskoj generirala promet te smo dobili propusnost mrže od **938 Mbps**, koji je poslužitelj uredno zaprimio. Test je trajao 10 sekundi (što se može mijenjati). Ovaj program koristi samo CPU, RAM memoriju i mrežno sučelje, što je vrlo važno za što bolje generiranje i/ili primanje mrežnih paketa.

Konkretan test je pokazao kako je mreža između ova dva računala nesumnjivo u stanju raditi na brzini **1Gbps**.

&nbsp;

&nbsp;

Program podržava i razne druge opcije i parametre

&nbsp;

&nbsp;

### lsof

Naredba <span class="lang:default decode:true crayon-inline ">lsof </span> daje nam listu svih otvorenih datoteka na Linux sustavu. Pošto su na Linux/Unix sustavima i **file deskriptori** datoteke (doduše posebne), a oni se koriste i u mrežnoj komunikaciji, upotreba u ovom poglavlju o mrežnom sustavu je jasna.

Pogledajmo kako pomoću izlistavanja _file descriptora_, možemo pronaći mrežne konekcije.

&nbsp;

Pronađimo tko sve ima otvoren mrežni port 22 (ssh):

<pre class="lang:default decode:true">lsof -i :22</pre>

To bi izgledalo ovako nekako:

<img class="alignnone size-full wp-image-2711" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/lsof-i-22.png?resize=1139%2C85&#038;ssl=1" alt="" width="1139" height="85" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/lsof-i-22.png?w=1139&ssl=1 1139w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/lsof-i-22.png?resize=150%2C11&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/lsof-i-22.png?resize=300%2C22&ssl=1 300w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/lsof-i-22.png?resize=768%2C57&ssl=1 768w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/lsof-i-22.png?resize=1024%2C76&ssl=1 1024w" sizes="(max-width: 1000px) 100vw, 1000px" data-recalc-dims="1" />

Što je vidljivo:

  * COMMAND je naredba odnosno daemon (servis)
  * PID je Linux Process ID od procesa
  * USER je korisnik koji je pokrenuo daemon
  * FD je File Deskriptor broj
  * TYPE označava vrstu File deskriptora (ovdje je to **IPv4**), može biti i **REG** (File), **DIR** (direktorij), **FIFO**(posebni first in first oute device) ili **CHR** (character device)
  * DEVICE je uređaj (za normalne uređaje je to MAJ,MIN broj) za mrežne uređaje je to poseban identifikator. Za **MAJor** i **MINor** brojeve uređaja pogledajte knjigu: &#8220;**Uvod u Linux i Linux napredno**&#8220;, Poglavlje: [Uređaji ukratko][4] &#8211; nadalje.
  * SIZE/OFFSET je veličina ili offset datoteke, za file deskriptore koji predstavljaju mrežnu konekciju, ona je nula (**0t0**)
  * NODE je oznaka file deskriptora u INODE tablici
  * NAME je ime otvorene datoteke: 
      * poput izvršne datoteke ili biblioteke,
      * posebne datoteke (pr. **/dev/null**)
      * ili mrežna konekcija, u nekom od njenih stanja

U prva dva reda ispisa od gore, vidljivi su SSH servisi (jedan za IPv4 i jedan za IPv6).

U trećem redu vidimo ostvarenu SSH konekciju (stanje ESTABLISHED), u zadnjem stupcu je prvo lokalni SSH poslužitelj  (192.168.1.170) i veza prema udaljenom SSH klijentu (192.168.1.164), kao i lokalni port (22-SSH) i port na udaljenom računalu/klijentu: 9926

&nbsp;

Možemo koristiti i naprednije pretraživanje, prema stanju konekcije.  Potražimo sve TCP konekcije u stanju ESTABLISHED (otvorene):

<pre class="code">lsof -i -sTCP:ESTABLISHED -n</pre>

U istom slučaju ćemo dobiti:

<pre class="font:courier-new lang:sh decode:true ">COMMAND PID USER FD TYPE DEVICE SIZE/OFF NODE NAME
sshd 1235 root 3u IPv4 9240 0t0 TCP 192.168.1.170:ssh-&gt;192.168.1.164:9926 (ESTABLISHED)

</pre>

&nbsp;

&nbsp;

### ping

Program <span class="lang:default decode:true crayon-inline ">ping</span> , koristi se provjeru dostupnosti računala na mreži, pod slijedećim uvjetima:

  * da je udaljeno računalo koje testiramo aktivno i ima IP adresu, te da je dostupno s računala koje testiramo i
  * da udaljeno računalo nema _firewall_ ili da je on konfiguriran da propušta ping odnosno **ICMP** pakete (koje _ping_ naredba šalje)

&nbsp;

Ova naredba mjeri i vrijeme koje je bilo potrebno da paket stigne od izvora do odredišta.

Provjerimo dostupnost računala: 192.168.1.1:

<pre class="lang:default decode:true">ping 192.168.1.1</pre>

Naredba **ping** pod linuxom, šalje pakete svake sekunde, konstantno, pa ju moramo prekinuti sa <span class="lang:default decode:true crayon-inline ">CTRL </span> + <span class="lang:default decode:true crayon-inline ">C</span>

Moguće je i poslati samo određeni broj paketa, u primjeru ćemo ih poslati samo pet (5):

<pre class="lang:default decode:true ">ping -c 5 192.168.1.1</pre>

Dobiti ćemo nešto poput ovoga:

<img class="alignnone wp-image-2716" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/ping-c-5.png?resize=662%2C201&#038;ssl=1" alt="" width="662" height="201" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/ping-c-5.png?w=761&ssl=1 761w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/ping-c-5.png?resize=150%2C46&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/ping-c-5.png?resize=300%2C91&ssl=1 300w" sizes="(max-width: 662px) 100vw, 662px" data-recalc-dims="1" />

Vidljivo je:

  * kako su se slali paketi veličine 64 bytea, koji su i zaprimljeni nazad (što je normalno)
  * kako je vrijeme potrebno da paket dođe do odredišnog računala u prosjeku bilo 0.377 _ms_ (milisekundi)
  * kako je poslano 5 paketa i primljeno 5, što je dobro (može se dogoditi, za neka udaljena računala ili u nekim drugim situacijama, da se prvih par paketa izgubi)
  * vrijeme potrebno da se paket primi/pošalje: i to minimalno, prosječno i maksimalno te **mdev (**prosječno RTT vrijeme paketa**)**

&nbsp;

&nbsp;

### traceroute

Program <span class="lang:default decode:true crayon-inline">traceroute</span>  (trace route), radi slično kao naredba <span class="lang:default decode:true crayon-inline ">ping</span> , čak i koristi **ICMP** protokol ali s malo drugačijim opcijama od naredbe ping. Naime ovaj program može snimati sve usmjerivače kroz koje paket putuje od izvora do odredišta te zapisivati vrijeme potrebno da paket dođe od nas do njih. Sve pod uvjetom da to pojedini usmjerivači (_routeri_) podržavaju. Oni usmjerivaču koji to ne podržavaju, jednostavno neće dati odgovor, i biti će zapisani samo oni koji to dozvoljavaju.

Na nekim linuxima ovaj program nije dostupan ali se može instalirati u paketu <span class="lang:default decode:true crayon-inline">traceroute</span> .

Sličan program dolazi u paketu <span class="lang:default decode:true crayon-inline">iputils</span> , a zove se <span class="lang:default decode:true crayon-inline ">tracepath</span> .

&nbsp;

Ova naredba mjeri pristupna vremena do svih usmjerivača, kroz koje paket prolazi do odredišta

Zamislimo slijedeću mrežu:

&nbsp;

PC-A &#8212;-( Usmjerivač-1)&#8212;-(Usmjerivač-2)&#8212;-(Usmjerivač-3)&#8212;-PC-B [192.168.100.101]

S računala PC-A, bi trebali pokrenuti:

<pre class="lang:default decode:true">traceroute 192.168.100.101</pre>

Kao odgovor ćemo dobiti prolazna vremena od našeg računala do svakog pojedinog uređaja u prolazu (usmjerivača), pojednostavljeno, poput:

<pre class="lang:default decode:true">Usmjerivač-1  :  1 ms
Usmjerivač-2  :  5 ms
Usmjerivač-3  :  7 ms
PC-B          :  9 ms</pre>

Pogledajmo konkretan primjer, traceroute prema adresi (poslužitelju) google.com:

<pre class="lang:default decode:true ">traceroute google.com</pre>

Dobiti ćemo nešto poput navedenog ispisa

&nbsp;

<pre class="font:courier-new lang:sh decode:true">traceroute to google.com (172.217.23.142), 30 hops max, 60 byte packets

1 192.168.1.11 (192.168.1.1) 0.031 ms 0.010 ms 0.008 ms                                    
2 * * *
3 10.51.192.1 (10.51.192.1) 1.296 ms 1.273 ms 1.338 ms
4 10.10.4.17 (10.10.4.17) 5.794 ms 5.901 ms 6.015 ms
5 10.10.0.29 (10.10.0.29) 6.003 ms 5.732 ms 5.858 ms
6 10.50.0.145 (10.50.0.145) 6.045 ms 10.50.0.205 (10.50.0.205) 5.685 ms 10.50.0.73 (10.50.0.73) 5.649 ms
7 10.50.0.146 (10.50.0.146) 376.375 ms 376.417 ms 376.393 ms
8 212.92.223.254 (212.92.223.254) 6.496 ms 6.484 ms 6.528 ms
9 dh120-25.xnet.hr (83.139.120.25) 6.750 ms 6.769 ms 6.716 ms
10 * * *
11 lg35-9073.as8447.a1.net (195.3.64.129) 18.750 ms 17.814 ms 17.785 ms
12 lg1-1171.as8447.a1.net (195.3.64.2) 25.654 ms 25.865 ms 25.609 ms
13 72.14.202.36 (72.14.202.36) 25.452 ms 29.258 ms 29.222 ms
14 * 108.170.251.193 (108.170.251.193) 22.495 ms 22.814 ms
15 216.239.54.61 (216.239.54.61) 22.491 ms 22.477 ms 216.239.54.63 (216.239.54.63) 23.637 ms
16 fra16s18-in-f142.1e100.net (172.217.23.142) 25.826 ms 23.412 ms 23.343 ms</pre>

Važno je razumjeti kako <span class="lang:default decode:true crayon-inline ">traceroute </span> šalje tri paketa prema svakom od usmjerivača u nizu do odredišta, pa su za svaki od njih vidljiva (ili ne) i tri odgovora odnosno pripadajuća vremena odgovora.

Opis:

  * **1** je naš usmjerivač (192.168.1.1) i vremena u **ms** do njega
  * **2** je usmjerivač koji ne odgovara na ICMP poruke
  * **3** je prvi slijedeći u nizu usmjerivača koji je odgovorio (10.51.192.1) i vremena u **ms** do njega
  * &#8230; slijede ostali usmjerivači koji odgovaraju (*****)
  * &#8230; jedan od &#8220;čudnih&#8221;  je trenutno broj **7**, kojemu je vrijeme odgovora bilo oko 370ms, što ne znači da je stvarno paketu trebalo toliko vremena, već je trenutno taj usmjerivač preopterećen te je odgovaranje na ICMP pakete stavio u niži prioritet,u odnosu na stvarni mrežni promet
  * i na kraju &#8211; broj **16** (172.217.18.14) je naš traženi **google**-ov server

&nbsp;

&nbsp;

### Programi za skeniranje mreže i analizu mrežnih paketa

&nbsp;

#### nmap

Program <span class="lang:default decode:true crayon-inline ">nmap</span>  (Network Mapper) napravljen je za sigurnosno skeniranje pojedinih računala na mreži ili cijele mreže. On je u mogućnosti provjeriti koji su sve otvoreni portovi, ito TCP ili UDP, na nekom računalu, te dodatno saznati koji servis i verzija servisa se pokreće na tom portu. Kako bi to uopće mogao, on šalje posebno kreirane mrežne pakete, na osnovu čijeg odgovora uspijeva dobiti više informacija o računalu i portu koji skenira. Nadalje ovaj program ima i dodatne ekstenzije za mnoge protokole, kao i mogućnost skriptiranja tih ekstenzijja pa pomoću njih može saznati još znatno više o odredišnom računalu/portu/servisu koji skenira.

&nbsp;

Ovaj program podržava na desetke metoda skeniranja a postoje i stotine raznih opcija i parametara. Mi ćemo proći kroz samo par primjera.

Ping scan računala na mreži 192.168.100.0 / 24  (255.255.255.0), koji će samo na osnovi odgovora na ping pakete (ICMP) pronalaziti živa računala na mreži:

<pre class="lang:default decode:true ">nmap -sP 192.168.100.0/24</pre>

&nbsp;

Malo kompleksniji sken, koji skenira TCP portove od 1 od 65535, pomoću slanja TCP SYN paketa (<span class="lang:default decode:true crayon-inline">-sS</span> ) na cijelu IPv4 mrežu 192.168.100.0 /24. Dodatno opcija <span class="lang:default decode:true crayon-inline ">-sV </span> skenira i verziju servisa/daemona na otvorenim portovima:

<pre class="lang:default decode:true">nmap -p 1-65535 -sV -sS 192.168.100.0/24</pre>

Sada pokrenimo i sken TCP i UDP protokola, za gore navedene portove:

<pre class="lang:default decode:true">nmap -p 1-65535 -sV -sU -sS 192.168.100.0/24</pre>

Skeniraj samo jednu IP adresu (192.168.100.101), pomoću TCP ACK &#8220;_pinga_&#8220;:

<pre class="lang:default decode:true ">nmap -PA 192.168.100.101</pre>

&nbsp;

&nbsp;

#### tcpdump

Program <span class="lang:default decode:true crayon-inline ">tcpdump</span>  obično dolazi instaliran sa svim distribucijama Linuxa. Ako to ipak nije slučaj, možete ga instalirati u paketu imena <span class="lang:default decode:true crayon-inline">tcpdump</span> . Ovaj program u standardnom načinu rada prebacuje mrežnu karticu u takozvani &#8220;_promiscuous mode_&#8221; odnosno način rada, u kojemu mrežna kartica prima i mrežne pakete koje inače ne bi primila, pa se tako mogu dohvatiti svi mreži paketi koji su došli do vaše mrežne kartice.

Ovaj program ima nekoliko osnovnih i podosta naprednih opcija i prekidača. MI ćemo pokazati samo njih par.

&nbsp;

Snimimo sve mrežne pakete koji su nam došli na mrežnu karticu **eth0**:

<pre class="lang:default decode:true">tcpdump -i eth0</pre>

Iz programa (u tijeku snimanja mrežnih paketa, izlazi se za <span class="lang:default decode:true crayon-inline ">CTRL</span>  + **<span class="lang:default decode:true crayon-inline ">c</span>
  
** 

Na mrežama koje su prilično opterećene, odnosno na kojima ima puno prometa prema našoj mrežnoj kartici, dobro je filtrirati samo željeni promet, poput porta. FIltrirajmo samo pakete koji su namjenjeni portu 80 (HTTP), s time da portove vidimo brojčano (<span class="lang:default decode:true crayon-inline ">-n</span> ):

<pre class="lang:default decode:true">tcpdump -i eth0 port 80 -n</pre>

Pogledajmo i snimanje prometa za SSL/TLS (https):

<pre class="lang:default decode:true ">tcpdump -i eth0 port 443 -n</pre>

I kako to izgleda (prekinuli smo snimanje nakon par paketa):

<img class="alignnone wp-image-2720" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/tcpdump-443.png?resize=1068%2C406&#038;ssl=1" alt="" width="1068" height="406" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/tcpdump-443.png?w=1262&ssl=1 1262w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/tcpdump-443.png?resize=150%2C57&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/tcpdump-443.png?resize=300%2C114&ssl=1 300w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/tcpdump-443.png?resize=768%2C292&ssl=1 768w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/tcpdump-443.png?resize=1024%2C389&ssl=1 1024w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/tcpdump-443.png?resize=1320%2C500&ssl=1 1320w" sizes="(max-width: 1000px) 100vw, 1000px" data-recalc-dims="1" />

&nbsp;

Možemo dodatii i filter na promet sa ili od određenog računala, primjerice prema ili od IP adrese (192.168.1.254). Uključiti ćemo i logički AND uvjet, konkretno:  i host (IP 192.168.100.101) i PORT 80:

<pre class="lang:default decode:true ">tcpdump -i bond0 'host 192.168.100.101 and port 80' -n</pre>

Kako smo rekli mogući su i znatno kompleksniji filteri i opcije.

Još jedna korisna opcija odnosno prekidač je <span class="lang:default decode:true crayon-inline ">-vv</span> , koji daje još detaljniji ispis odnosno opis svakog paketa.

&nbsp;

&nbsp;

#### tshark

Program <span class="lang:default decode:true crayon-inline ">tshark</span> , doalzi u paketu <span class="lang:default decode:true crayon-inline ">wireshark </span> i on je praktično identičan GUI programu wireshark, samo što je namjenjen za izvršavanje iz _shell_a. Ova jprogram ima na tisuće opcija i filtera koje možemo koristiti za prikaz i filtriranje mrežnih paketa. Onm kao i tcpdump postavlja mrežnu karticu u &#8220;_promiscuous mode_&#8220;. Pojam &#8220;_packet capture_&#8221; je procedura dohvaćanja paketa, koji se veže uz programe ove vrste.

&nbsp;

Pokrenimo snimanje mrežnih paketa na mrežnom sučelju **eth0**:

<pre class="lang:default decode:true ">tshark -i eth0</pre>

Možemo i filtrirati pakete, na samo one koji dolaze ili su namjenjeni portu 80:

<pre class="lang:default decode:true">tshark -i eth0 port 80</pre>

I naravno proširiti filter, samo za one pakete koji dolaze ili odlaze prema odeđenom računalu (_hostu_) &#8211; pr. 192.168.100.101

<pre class="lang:default decode:true">tshark -i eth0 port 80 host 192.168.100.101</pre>

&nbsp;

Moguće je koristiti i logičke operatore, poput AND ili OR:

<pre class="lang:default decode:true">tshark -i eth0 port 80 and host 192.168.100.101</pre>

Dakle kako bi u gornjem primjeru filtrirali sve one pakete koji dolaze ili odlaze s porta 80 i (AND) koji su istovremeno poslani od ili namjenjeni računalu 192.168.100.101

&nbsp;

Naravno s prekidačem <span class="lang:default decode:true crayon-inline ">-w</span> , sve možemo i snimiti u datoteku (u našem slučaju, datoteka će se zvati: **mrezni-paketi.pcap**).

<pre class="lang:default decode:true ">tshark -i eth0 port 80 and host 192.168.100.101 -w mrezni-paketi.pcap</pre>

&nbsp;

Iz programa, u tijeku snimanja mrežnih paketa, izlazi se za <span class="lang:default decode:true crayon-inline ">CTRL</span>  + **<span class="lang:default decode:true crayon-inline">c</span>
  
** 

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;

## Diskovni podsustav

&nbsp;

### atop

Naredba <span class="lang:default decode:true crayon-inline ">atop</span> , uglavnom ne dolazi instalirana, pa ju je potrebno instalirati. Dolazi u paketu <span class="lang:default decode:true crayon-inline ">atop</span> . Ova naredba se ponaša slično kao i naredba <span class="lang:default decode:true crayon-inline ">top </span> ali nam daje znatno više mogućnosti i detalja. Dakle s ovom naredbom možemo inreraktivno pratiti zauzeće sustava: od diskovnog sustava, mrežnog sustava, pokrenutih programa/procesa i slično, prema zauzeću CPUa, RAM memorije ili mreže. Prikaz je podjeljen u dva dijela:

Gornji prikazuje generalno opterećenje sustava: CPU i RAM te opterečenje prema diskovima ili particijama te mrežnim sučeljima. Donji dio prikaza prikazuje pokrenute programe (procese) te informacije o njima: koliko CPUa ili RAM memorije zauzimaju trenutno, te koliko je pojedini proces  do sada zapisivao ili čitao s diska.

&nbsp;

<img class="alignnone size-full wp-image-2657" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/atop.png?resize=1265%2C964&#038;ssl=1" alt="" width="1265" height="964" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/atop.png?w=1265&ssl=1 1265w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/atop.png?resize=150%2C114&ssl=1 150w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/atop.png?resize=300%2C229&ssl=1 300w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/atop.png?resize=768%2C585&ssl=1 768w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/atop.png?resize=1024%2C780&ssl=1 1024w" sizes="(max-width: 1000px) 100vw, 1000px" data-recalc-dims="1" />

&nbsp;

&nbsp;

### ioping

Program <span class="lang:default decode:true crayon-inline ">ioping </span> služi za testiranje brzine pristupa disku i prijenosa podataka s istog. Potrebno je instalirati paket <span class="lang:default decode:true crayon-inline">ioping</span> . Moguće je testirati razne metode pristupanja disku, poput:

  * <span class="lang:default decode:true crayon-inline ">-A</span>  ovo je asinkrona metoda pristupa disku
  * <span class="lang:default decode:true crayon-inline ">-C</span>  je standardna _Cache_ metoda pristupa, koja koristi linux _disk cache_ memoriju
  * <span class="lang:default decode:true crayon-inline ">-D</span>  je <span class="lang:default decode:true crayon-inline ">direct I/O</span>  metoda bez cache memorije, pristupa se disku pomoću DMA ako je moguće
  * <span class="lang:default decode:true crayon-inline ">-Y</span>  je klasična sinkrona metoda pristupa disku, u kojoj se čeka da su podaci ali i metapodaci stvarno zapisani na površinu diska
  * <span class="lang:default decode:true crayon-inline ">-y</span>  je sinkrona metoda pristupa disku, u kojoj se čeka da su podaci stvarno zapisani na površinu diska, bez čekanja da se snime i metapodaci

Primjer testiranja vremena prostupa disku na kojem se nalazimo i to u 12 prolaza (pokušaja testitanja):

<pre class="lang:default decode:true">ioping -c 12 .</pre>

Testirajmo i asinkroni pristup, isto 12 puta:

<pre class="lang:default decode:true">ioping -A -c 12 .</pre>

Ili isti test za disk **/dev/sdb** :

<pre class="lang:default decode:true">ioping -c 6 -A /dev/sdb</pre>

&nbsp;

### iotop

Program <span class="lang:default decode:true crayon-inline ">iotop</span> , daje nam prikaz programa/procesa, prema opterećenju diskovnog sustava (I/O operacije). Ovaj program je obično potrebno instalirati, jer dolazi u paketu <span class="lang:default decode:true crayon-inline ">iotop</span> .

Standardno, potrebno ga je samo pokrenuti:

<pre class="lang:default decode:true ">iotop</pre>

Pogledajmo kako to izgleda:

<img class="alignnone wp-image-2659" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iotop.png?resize=797%2C573&#038;ssl=1" alt="" width="797" height="573" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iotop.png?w=903&ssl=1 903w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iotop.png?resize=150%2C108&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iotop.png?resize=300%2C216&ssl=1 300w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iotop.png?resize=768%2C552&ssl=1 768w" sizes="(max-width: 797px) 100vw, 797px" data-recalc-dims="1" />

Za svaki program/proces vidimo koliko operacija čitanja (DISK READ), zaipisivanja (DISK WRITE), swap &#8211; ako se koristi (SWAPIN) te koliki postotak procesorskog vremena se gubi na  I/O operacije prema diskovnom sustavu. Standardno su programi/procesi poredani prema postotku zauzeča CPUa s I/O operacijama.

Program možemo pokrenuti i na način u kojem se u realnom vremenu prikazuju samo oni programi/procesi koji trenutno koriste diskovni sustav, odmnosno ako nešto čitaju ili zapisuju na diskovni sustav:

<pre class="lang:default decode:true">iotop --only</pre>

&nbsp;

Postoji i nekoliko korisnih tipki koje možemo stisnuti tijekom rada ovog programa:

  *  <span class="lang:default decode:true crayon-inline ">r</span>  &#8211; (_reverse_) ako želimo obrnuti poredan programa/procesa
  * <span class="lang:default decode:true crayon-inline ">o</span>  &#8211; (only) ako želimo vidjeti samo one diskovno aktivne programe/procese
  * <span class="lang:default decode:true crayon-inline ">a</span>  &#8211; prikazuje akumulirani I/O odnosno koliko I/O operacija je pojedini program/proces odradio sumarizirano do sada

Iz programa se izlazi sa tipkom <span class="lang:default decode:true crayon-inline ">q</span> .

&nbsp;

&nbsp;

### fdisk i cfdisk

Program <span class="lang:default decode:true crayon-inline ">fdisk</span> , koristi se za particioniranje diskova, prema [**MBR**][5] shemi, uz sva njena ograničenja odnosno maksimalnu veličinu particije od 2 TB (između ostaloga). Standardno ovaj program pozivamo s oznakom diska koji želimo particionirati. Ako se primjerice radi o disku **/dev/sda** , tada će to biti:

<pre class="lang:default decode:true">fdisk /dev/sda</pre>

Dalje pratite proceduru za izradu particije, koju sada nećemo objašnjavati.

program fdisk ima i jedan vrlo koristan prekidač pomoću kojega možete na brzinu vidjeti ispisane sve particije na svim diskovima:

<pre class="lang:default decode:true">fdisk -l</pre>

&nbsp;

Program <span class="lang:default decode:true crayon-inline ">cfdisk</span>  je frontend za fdisk, s ASCII grafikom, koji dolazi u paketu s prethodnim programom, unutar paketa <span class="lang:default decode:true crayon-inline ">util-linux</span> .

<span class="lang:default decode:true crayon-inline ">cfdisk </span> pozivamo isto s navedenim diskom koji želimo particionirati (pr. **/dev/sdc**):

<pre class="lang:default decode:true">cfdisk /dev/sdc</pre>

Pogledajmo kako to izgleda:

<img class="alignnone wp-image-2660" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/cfdisk.png?resize=824%2C493&#038;ssl=1" alt="" width="824" height="493" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/cfdisk.png?w=1654&ssl=1 1654w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/cfdisk.png?resize=150%2C90&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/cfdisk.png?resize=300%2C179&ssl=1 300w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/cfdisk.png?resize=768%2C459&ssl=1 768w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/cfdisk.png?resize=1024%2C612&ssl=1 1024w" sizes="(max-width: 824px) 100vw, 824px" data-recalc-dims="1" />

Za upute kako particionirati disk pogledajte knjigu **Uvod u Linux i Linux napredno**: Poglavlje: [Rad s particijama.][6]

&nbsp;

&nbsp;

U slučajevima kada imamo veće diskove od 2TB, MBR shema particioniranja nije više zadovoljavajuća te je potrebno disk inicijalizirati i particionirati pomoću GPT sheme particioniranja, za što su nam potrebni drugi programi, upoznajmo se s njima.

&nbsp;

### gdisk i cgdisk

Program <span class="lang:default decode:true crayon-inline ">gdisk </span> je sličan programu <span class="lang:default decode:true crayon-inline">fdisk </span> osim što on radi s GPT particijama, a <span class="lang:default decode:true crayon-inline ">cgdisk </span> je ASCII GUI za <span class="lang:default decode:true crayon-inline ">gdisk</span> . Obično je potrebno instalirati paket <span class="lang:default decode:true crayon-inline ">gdisk</span> , kako bi dobili oba programa.

Particioniranje s oba programa je praktično identično kao i sa prethodna dva, uz istu napomenu, kako su oni namijenjeni za rad s  GPT particijskom shemom.

&nbsp;

### df i du

Programi <span class="lang:default decode:true crayon-inline ">df </span> i <span class="lang:default decode:true crayon-inline ">du </span> daju nam informacije o zauzeću datotečnih sustava ili direktorija.

<span class="lang:default decode:true crayon-inline ">df</span>  (_disk free_) nam daje ispis zauzeća mountanih  datotečnih sustava, pokrećemo ga s (-h daje ljudski prihvatljiv ispis: kB,MB,GB,TB):

<pre class="lang:default decode:true">df -h</pre>

Pogledajmo kako izgleda jedan ispis:

Datotečni sustav   &#8212;- VELIČINA &#8212;&#8212;ISKORIŠTENO&#8212;&#8211;DOSTUPNO&#8212;U UPOTREBI&#8212;-MOUNT-ano kao

<img class="alignnone size-full wp-image-2662" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/df.png?resize=640%2C162&#038;ssl=1" alt="" width="640" height="162" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/df.png?w=640&ssl=1 640w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/df.png?resize=150%2C38&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/df.png?resize=300%2C76&ssl=1 300w" sizes="(max-width: 640px) 100vw, 640px" data-recalc-dims="1" />

&nbsp;

Naredba <span class="lang:default decode:true crayon-inline">du  </span>(_disk usage_) nam prikazuje zauzeće direktorija. Pogledajmo koliko zauzimaju svi direktoriji i poddirektoriji, počevši od **/root/**:

<pre class="lang:default decode:true ">du -h /root/</pre>

Pogledajmo kako to izgleda na našem računalu:

<img class="alignnone wp-image-2663" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/du.png?resize=318%2C285&#038;ssl=1" alt="" width="318" height="285" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/du.png?w=486&ssl=1 486w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/du.png?resize=150%2C134&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/du.png?resize=300%2C269&ssl=1 300w" sizes="(max-width: 318px) 100vw, 318px" data-recalc-dims="1" />

Na kraju vidimo sumarizirano (zbroj), koji govori kako svi direktoriji i poddirektoriji (sve datoteke u njima) zajedno zauzimaju 69 MB.

Ako pak želimo samo sumarizirano vrijednost svih poddirektorija, tada možemo naredbu pozvati s prekidačem <span class="lang:default decode:true crayon-inline ">-s</span> :

<pre class="lang:default decode:true ">du -hs /root/</pre>

&nbsp;

&nbsp;

### mount

Naredba <span class="lang:default decode:true crayon-inline ">mount</span> , koristi se kako za mountanje novih datotečnih sustava u direktorij, tako i za prikaz već mountanih sustava.

Ispišimo što je sve mountano:

<pre class="lang:default decode:true ">mount</pre>

Dobiti ćemo nešto poput:

<img class="alignnone wp-image-2665" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/mount.png?resize=489%2C112&#038;ssl=1" alt="" width="489" height="112" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/mount.png?w=602&ssl=1 602w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/mount.png?resize=150%2C34&ssl=1 150w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/mount.png?resize=300%2C69&ssl=1 300w" sizes="(max-width: 489px) 100vw, 489px" data-recalc-dims="1" />

Možemo sve zajedno lijepo formatirati:

&nbsp;

<pre class="lang:default decode:true ">mount | column -t</pre>

Pogledajmo kako sve sada izgleda:

<img class="alignnone wp-image-2666" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/mount-column.png?resize=863%2C118&#038;ssl=1" alt="" width="863" height="118" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/mount-column.png?w=1184&ssl=1 1184w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/mount-column.png?resize=150%2C21&ssl=1 150w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/mount-column.png?resize=300%2C41&ssl=1 300w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/mount-column.png?resize=768%2C105&ssl=1 768w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/mount-column.png?resize=1024%2C140&ssl=1 1024w" sizes="(max-width: 863px) 100vw, 863px" data-recalc-dims="1" />

Dakle vidimo koje particije (1 stupac), s kojim datotečnim sustavom (5 stupac) se mountaju u koji direktorij (3 stupac), i dodatno s kojim opcijama i ovlastima (6 stupac).

Ako smo primjerice mijenjali unos u datoteci **/etc/fstab**, moguće je automatski napraviti remount bez restarta sustava:

<pre class="lang:default decode:true">mount -a</pre>

Naravno moguće je napraviti i ručni mount. Ako imamo recimo particiju **/dev/sdb1** koju smo formatirali s **ext4** datotečnim sustavom i želimo ju mountati u direktorij **/DISK** :

<pre class="lang:default decode:true ">mount -t ext4 /dev/sdb1 /DISK</pre>

&nbsp;

&nbsp;

### lsscsi

Naredba <span class="lang:default decode:true crayon-inline ">lsscsi</span> , koristi se izlistanje svih SATA/SAS/SCSI uređaja i njihovih atributa.

Naredbu možemo pozvati ovako:

<pre class="lang:default decode:true ">lsscsi</pre>

Pogledajmo ispis na VirtualBox virtualnom računalu s dva virtualna diska (**/dev/sda** i **/dev/sdb**) te jednim CD-ROM uređajem (**/dev/sr0**):

<img class="alignnone wp-image-2670" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/lsscsi-vbox.png?resize=660%2C64&#038;ssl=1" alt="" width="660" height="64" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/lsscsi-vbox.png?w=742&ssl=1 742w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/lsscsi-vbox.png?resize=150%2C15&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/lsscsi-vbox.png?resize=300%2C29&ssl=1 300w" sizes="(max-width: 660px) 100vw, 660px" data-recalc-dims="1" />

Ili isti ispis na HP poslužitelju. SCSI ID: 0:0:0:0 predstavlja sami SCSI RAID kontroler (P410I), s jednim diskom u RAID1 polju (**/dev/sda**), jedinim RDX backup uređajem (**/dev/sdb**), CD/DVDROM uređajem (**/dev/sr0**) te iSCSI diskom koji se nalazi eksportiran preko mreže, na FreeBSD poslužitelju (**/dev/sdc**):

<img class="alignnone wp-image-2671" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/lsscsi-HP.png?resize=657%2C104&#038;ssl=1" alt="" width="657" height="104" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/lsscsi-HP.png?w=746&ssl=1 746w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/lsscsi-HP.png?resize=150%2C24&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/lsscsi-HP.png?resize=300%2C47&ssl=1 300w" sizes="(max-width: 657px) 100vw, 657px" data-recalc-dims="1" />

Još više detalja možemo dobiti ako ovu naredbu pozovemo s prekidačem <span class="lang:default decode:true crayon-inline ">-v</span>  .

&nbsp;

&nbsp;

### lsblk

Naredba <span class="lang:default decode:true crayon-inline ">lsblk </span> koristi se za ispis blok uređaja (većinom disk uređaji). Ako želimo vidjeti sve blok uređaje:

  * NAME označava ime uređaja: primjerice **sda** predstavlja disk uređaj **/dev/sda**
  * MAJ:MIN su Major i Minor oznake uređaja, prema kojima se identificira uređaj. Pogledajte knjigu: **Uvod U Linux u Linux napredno**: Poglavlje:  [Uređaji (devices) detaljnije][7].
  * RM . označava jeli uređaj &#8220;removable&#8221;
  * SIZE je veličina uređaja/diska
  * RO je oznaka jeli uređaj READ ONLY
  * TYPE je oznaka vrste : jeli DISK, PARTICIJA, LVM uređaj i sl.
  * MOUNTPOINT označava direktorij u koji je uređaj **mountan (**ako je**)
  
** 

<img class="alignnone wp-image-2674" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/lsblk.png?resize=698%2C188&#038;ssl=1" alt="" width="698" height="188" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/lsblk.png?w=768&ssl=1 768w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/lsblk.png?resize=150%2C40&ssl=1 150w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/lsblk.png?resize=300%2C81&ssl=1 300w" sizes="(max-width: 698px) 100vw, 698px" data-recalc-dims="1" />

&nbsp;

&nbsp;

### iostat

Program <span class="lang:default decode:true crayon-inline ">iostat</span> , dolazi u paketu <span class="lang:default decode:true crayon-inline">sysstat</span> ,  koji je obično potrebno instalirati. On nam daje nam izlistanje trenutnog opterećenja diskovnog sustava, poput programa <span class="lang:default decode:true crayon-inline ">iotop</span> , samo za cijeli disk.

Provjerimo status svih diskova (koristili smo prekidač <span class="lang:default decode:true crayon-inline ">-m</span>  kako bi vidjeli prikaz u MB/s):

<pre class="lang:default decode:true" style="padding-left: 30px;">iostat -m</pre>

Pogledajmo ispis ove naredbe:

<img class="alignnone wp-image-2678" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iostat-1.png?resize=698%2C168&#038;ssl=1" alt="" width="698" height="168" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iostat-1.png?w=988&ssl=1 988w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iostat-1.png?resize=150%2C36&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iostat-1.png?resize=300%2C72&ssl=1 300w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iostat-1.png?resize=768%2C185&ssl=1 768w" sizes="(max-width: 698px) 100vw, 698px" data-recalc-dims="1" />

Što je ovdje vidljivo:

  * u prvom redu vidimo opterećenje cijelog sustava
  * u tablici ispod vidimo: 
      * <span class="lang:default decode:true crayon-inline ">Devices</span>  &#8211; ovo su diskovi koje pratimo: **/dev/sda**, **/dev/sdb**, i vidimo i LVM polja (**dm-0** i **dm-1**)
      * <span class="lang:default decode:true crayon-inline ">tps</span>  &#8211; ovo je broj transakcija prema diskovnom sustavu (znan i kao **IOPS** &#8211; I/O operacija u sekundi)
      * <span class="lang:default decode:true crayon-inline ">MB_read/s</span>  &#8211; koliko MB/s se čita s diska
      * <span class="lang:default decode:true crayon-inline ">MB_wrtn/s</span>  &#8211; koliko MB/s se zapisuje na disk
      * <span class="lang:default decode:true crayon-inline ">MB_read</span>  &#8211; ukupan broj MB koji je pročitan (_read_)
      * <span class="lang:default decode:true crayon-inline">MB_wrtn</span>  &#8211; ukupan broj MB koji je snimljen (**write**)

Ako želimo još detaljniji ispis stanja prema diskovnom podsustavu, možemo dodati i prekidač <span class="lang:default decode:true crayon-inline ">-x</span>  , pa sada imamo:

<img class="alignnone wp-image-2680" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iostat-mx.png?resize=918%2C147&#038;ssl=1" alt="" width="918" height="147" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iostat-mx.png?w=1463&ssl=1 1463w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iostat-mx.png?resize=150%2C24&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iostat-mx.png?resize=300%2C48&ssl=1 300w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iostat-mx.png?resize=768%2C123&ssl=1 768w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/iostat-mx.png?resize=1024%2C164&ssl=1 1024w" sizes="(max-width: 918px) 100vw, 918px" data-recalc-dims="1" />

Nećemo sve objašnjavati osim zadnjeg stupca <span class="lang:default decode:true crayon-inline ">%util</span> , koji govori koliko je opterečen CPU za **disk I/O** operacije na svakom pojedinom disku. Za više detalja pročitajte knjigu: **Uvod u Linux i Linux napredno**: Poglavlje: [Praćenje performansi I/O sustava][8].

Ova naredba ima i razne prekidače/opcije.

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;

## Linux općenito

&nbsp;

### dmidecode

Programi <span class="lang:default decode:true crayon-inline ">dmidecode</span> , koristi _DMI_ interface (**Desktop Management Interface**) kako bi preko njega mogao pristupiti informacijama o raznim komponentama računala :

  * <span class="lang:default decode:true crayon-inline ">bios </span> &#8211; BIOS matične ploče
  * <span class="lang:default decode:true crayon-inline ">system </span> &#8211; sistemske informacije proizvođača (model računala/poslužitelja, serijski brojevi i sl.)
  * <span class="lang:default decode:true crayon-inline ">baseboard </span> &#8211; o dijelovima matične ploče (disk kontroleri, integrirane mrežne kartice i druge komponente)
  * <span class="lang:default decode:true crayon-inline ">chassis</span> , <span class="lang:default decode:true crayon-inline ">processor</span> , <span class="lang:default decode:true crayon-inline ">memory</span> , <span class="lang:default decode:true crayon-inline ">cache</span> , &#8230;

Pokretanjem programa bez prekidača dobivamo sve dostupne informacije, ali možemo filtrirati i prikaz prema dijelovima navedenim gore. Pogledajmo kako dobiti informacije o matičnoj ploči:

<pre class="lang:default decode:true ">dmidecode -t bios</pre>

Pogledajmo kako to izgleda:

<img class="alignnone wp-image-2723" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/dmidecode-t-bios.png?resize=554%2C571&#038;ssl=1" alt="" width="554" height="571" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/dmidecode-t-bios.png?w=756&ssl=1 756w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/dmidecode-t-bios.png?resize=146%2C150&ssl=1 146w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/dmidecode-t-bios.png?resize=291%2C300&ssl=1 291w" sizes="(max-width: 554px) 100vw, 554px" data-recalc-dims="1" />

&nbsp;

&nbsp;

### free

Naredba <span class="lang:default decode:true crayon-inline ">free</span> , daje nam statističke informacije o trenutnom zauzeću sustava virtualne memorije (RAM i swap). Naredbu množemo i pozvati s prekidačima <span class="lang:default decode:true crayon-inline ">-m</span>  &#8211; ako želimo prikaz u MB i <span class="lang:default decode:true crayon-inline ">-g</span>  ako želimo prikaz u GB. Pogledajmo primjer:

&nbsp;

<pre class="lang:default decode:true ">free -m</pre>

<img class="alignnone wp-image-2724" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/free-m.gif?resize=741%2C76&#038;ssl=1" alt="" width="741" height="76" data-recalc-dims="1" />

Vidljivo je:

  * kako ovo računalo ima 16384 MB (16 GB) RAM memorije, od koje se koristi 7011MB a slobodno je 9372 MB
  * kako se kao _buffer/cache_, koristi 5700 MB a slobodno je 10683 MB. Pogledajte knjigu **Uvod u Linux i Linux napredno**, Poglavlja:  [VM &#8211; Slabs][9]  i [diskovni I/O podsustav][10]
  * te kako swap diska imamo 512 MB a koristi se trenutno 4 MB a slobodno je 507 MB

&nbsp;

&nbsp;

### vmstat

Program <span class="lang:default decode:true crayon-inline">vmstat</span> koristi se za prikaz informacije o sustavu virtualne memorije. On dolazi u paketu <span class="lang:default decode:true crayon-inline ">sysstat</span> .

Pokrenimo ga, na istom računalo kao i prethodnu naredbu:

<pre class="lang:default decode:true">vmstat</pre>

Dobiti ćemo ovakav ili sličan ispis:

<img class="alignnone wp-image-2725" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/vmstat.png?resize=857%2C58&#038;ssl=1" alt="" width="857" height="58" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/vmstat.png?w=990&ssl=1 990w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/vmstat.png?resize=150%2C10&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/vmstat.png?resize=300%2C20&ssl=1 300w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/vmstat.png?resize=768%2C52&ssl=1 768w" sizes="(max-width: 857px) 100vw, 857px" data-recalc-dims="1" />

Vidljivo je:

  * zauzeće RAM  memorije (&#8211;memory&#8211;)
  * swap memorije (&#8211;swap&#8211;)
  * I/O zauzeče (&#8211;io&#8211;)
  * sistemske statistike (&#8211;system&#8211;)
  * CPU statistike.

Za detalje pogledajte knjigu [Uvod u Linux i Linux napredno][1] (naredbu <span class="lang:default decode:true crayon-inline ">vmstat</span>  spominjemo na više mjesta).

Naime ovo je mjesto gdje možemo usporediti zauzeće sustava virtualne memorije i opterečenja sustava.

Korisni prekidači su :

  * <span class="lang:default decode:true crayon-inline ">-s</span>  &#8211; prikazuje više detalja
  * <span class="lang:default decode:true crayon-inline ">-d</span>  &#8211; daje nam više detalja u vezi s diskovnim sustavom

&nbsp;

&nbsp;

### mpstat

Naredba <span class="lang:default decode:true crayon-inline ">mpstat </span> također dolazi u paketu <span class="lang:default decode:true crayon-inline">sysstat</span> a daje nam informacije o zauzeću CPUa.

Pokrenimo ju:

<pre class="lang:default decode:true">mpstat</pre>

I pogledajmo što će nam dati:

<img class="alignnone wp-image-2728" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/mpstat.png?resize=1000%2C49&#038;ssl=1" alt="" width="1000" height="49" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/mpstat.png?w=1061&ssl=1 1061w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/mpstat.png?resize=150%2C7&ssl=1 150w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/mpstat.png?resize=300%2C15&ssl=1 300w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/mpstat.png?resize=768%2C38&ssl=1 768w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/mpstat.png?resize=1024%2C50&ssl=1 1024w" sizes="(max-width: 1000px) 100vw, 1000px" data-recalc-dims="1" />

&nbsp;

<li class="level1">
  <div class="li">
    <code>CPU</code> &#8211; prikazuje se ALL jer je statistika za sve CPU jezgre
  </div>
</li>

<li class="level1">
  <div class="li">
    <code>%usr</code> &#8211; je opterećenje CPUa za procese korisnika
  </div>
</li>

<li class="level1">
  <div class="li">
    <code>%nice</code> &#8211; je opterečenje CPUa za korisničke programe koji imaju drugačiji (<em>NICE</em>) prioritet
  </div>
</li>

<li class="level1">
  <div class="li">
    <code>%sys</code> &#8211; je opterećenje CPUa za sistemske servise (<em>daemone</em>)
  </div>
</li>

<li class="level1">
  <div class="li">
    <code>%iowait</code> &#8211; je opterećenje CPUa za I/O procese (prema diskovnom podsustavu), na koje se čeka i troši CPU vrijeme
  </div>
</li>

<li class="level1">
  <div class="li">
    <code>%irq</code> &#8211; je opterećenje CPUa za opsluživanje hardverskih signala prekida (<strong>IRQ</strong> / <em>interrupta</em>)
  </div>
</li>

<li class="level1">
  <div class="li">
    <code>%soft</code>&#8211; je opterećenje CPUa za opsluživanje softverskih signala prekida (<strong>Soft IRQ</strong> / <em>interrupta</em>)
  </div>
</li>

&nbsp;

&nbsp;

<li class="level1 node">
  <div class="li">
    Za virtualna računala odnosno <strong>Hipervizore</strong>:
  </div>
  
  <ul>
    <li class="level3">
      <div class="li">
        <code>%steal</code> &#8211; je opterećenje CPUa kod virtualnih računala (ako se radi o virtualnom računalu), u slučajevima kada <strong>Hipervizor</strong> oduzima dio CPU vremena virtualnom računalu
      </div>
    </li>
    
    <li class="level3">
      <div class="li">
        <code>%guest</code> &#8211; je opterećenje CPUa kod virtualnih računala gdje se prikazuje koliko CPU vremena je potrebno za opsluživanje virtualnog procesora
      </div>
    </li>
  </ul>
</li>

<li class="level1">
  <div class="li">
    <code>%idle</code> &#8211; je postotak koliko je CPU slobodan (ne radi ništa)
  </div>
</li>

&nbsp;

&nbsp;

### dstat

Naredba <span class="lang:default decode:true crayon-inline ">dstat </span> kombinira mogućnosti naredbi <span class="lang:default decode:true crayon-inline ">iostat</span> , <span class="lang:default decode:true crayon-inline ">vmstat</span> , <span class="lang:default decode:true crayon-inline ">netstat </span> i <span class="lang:default decode:true crayon-inline ">ifstat</span> , i daje nam prikaz u realnom vremenu. Pogledajmo kako to izgleda:

<pre class="font:courier-new lang:default decode:true ">dstat</pre>

&nbsp;

<img class="alignnone size-full wp-image-2730" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/dstat.png?resize=710%2C200&#038;ssl=1" alt="" width="710" height="200" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/dstat.png?w=710&ssl=1 710w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/dstat.png?resize=150%2C42&ssl=1 150w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2018/01/dstat.png?resize=300%2C85&ssl=1 300w" sizes="(max-width: 710px) 100vw, 710px" data-recalc-dims="1" />

Dakle vidimo sve statistike, koje bi nam dobro došle od svih navedenih programa, u jednoj tablici, koja se popunjava u realnom vremenu. Naime ovdje vidimo kategorija statiszika za :

  * CPU
  * Disk
  * mrežu
  * paging
  * sistem (_interrupti/context switchevi_)

Prikupljanje statistika se zaustavlja s tipkama <span class="lang:default decode:true crayon-inline ">CTRL</span>  i <span class="lang:default decode:true crayon-inline ">c</span> .

&nbsp;

### lsusb

Naredba <span class="lang:default decode:true crayon-inline ">lsusb</span> , ispisuje nam sve spojene USB kontrolere ali i USB periferiju, odnosno vanjske uređaje:

<pre class="font:courier-new lang:default decode:true ">lsusb</pre>

Dobiti ćemo nešto poput:

<pre class="font:courier-new lang:default decode:true">Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 003 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 004 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 005 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub

</pre>

Vidimo sve USB HUB (kontrolere), jer nismo spojili niti jedan vanjski USB uređaj (USB stick/disk,&#8230;)

&nbsp;

### lspci

Naredba <span class="lang:default decode:true crayon-inline ">lspci</span> , ispisuje nam sve PCI i PCI Express kontrolere (sabirnice) te uređaje spojene na njih.

Pogledajmo kako to izgleda:

<pre class="font:courier-new lang:default decode:true ">lspci</pre>

Dobivamo:

<pre class="font:courier-new lang:default decode:true ">00:00.0 Host bridge: Intel Corporation 82915G/P/GV/GL/PL/910GL Memory Controller Hub (rev 04)
00:02.0 VGA compatible controller: Intel Corporation 82915G/GV/910GL Integrated Graphics Controller (rev 04)
00:1c.0 PCI bridge: Intel Corporation 82801FB/FBM/FR/FW/FRW (ICH6 Family) PCI Express Port 1 (rev 03)
00:1c.1 PCI bridge: Intel Corporation 82801FB/FBM/FR/FW/FRW (ICH6 Family) PCI Express Port 2 (rev 03)
00:1c.2 PCI bridge: Intel Corporation 82801FB/FBM/FR/FW/FRW (ICH6 Family) PCI Express Port 3 (rev 03)
00:1c.3 PCI bridge: Intel Corporation 82801FB/FBM/FR/FW/FRW (ICH6 Family) PCI Express Port 4 (rev 03)
00:1d.0 USB controller: Intel Corporation 82801FB/FBM/FR/FW/FRW (ICH6 Family) USB UHCI #1 (rev 03)
00:1d.1 USB controller: Intel Corporation 82801FB/FBM/FR/FW/FRW (ICH6 Family) USB UHCI #2 (rev 03)
00:1d.2 USB controller: Intel Corporation 82801FB/FBM/FR/FW/FRW (ICH6 Family) USB UHCI #3 (rev 03)
00:1d.3 USB controller: Intel Corporation 82801FB/FBM/FR/FW/FRW (ICH6 Family) USB UHCI #4 (rev 03)
00:1d.7 USB controller: Intel Corporation 82801FB/FBM/FR/FW/FRW (ICH6 Family) USB2 EHCI Controller (rev 03)
00:1e.0 PCI bridge: Intel Corporation 82801 PCI Bridge (rev d3)
00:1f.0 ISA bridge: Intel Corporation 82801FB/FR (ICH6/ICH6R) LPC Interface Bridge (rev 03)
00:1f.1 IDE interface: Intel Corporation 82801FB/FBM/FR/FW/FRW (ICH6 Family) IDE Controller (rev 03)
00:1f.2 IDE interface: Intel Corporation 82801FB/FW (ICH6/ICH6W) SATA Controller (rev 03)
00:1f.3 SMBus: Intel Corporation 82801FB/FBM/FR/FW/FRW (ICH6 Family) SMBus Controller (rev 03)
07:00.0 Ethernet controller: Broadcom Corporation NetXtreme BCM5751 Gigabit Ethernet PCI Express (rev 11)
09:00.0 Ethernet controller: Intel Corporation 82573L Gigabit Ethernet Controller (rev 01)
0b:05.0 SCSI storage controller: Adaptec AIC-7892A U160/m (rev 02)</pre>

Svaki PCI/PCIe uređaj ima svoj identifikator (početni niz brojeva), a za svaki od uređaja (ili sve zajedno), pomoću prekidača <span class="font:courier-new lang:default decode:true crayon-inline">-vv</span>, možemo dobiti i detaljniji ispis. Dodatno, možemo i pomoću prekidača <span class="lang:default decode:true crayon-inline ">-s</span> , zatražiti samo ispis određenog uređaja, prema identifikatoru.

Pogledajmo primjerice zadnji uređaj (SCSI kontoler),uz više detalja:

<pre class="lang:default decode:true ">lspci -s 0b:05.0 -vv</pre>

Dobiti ćemo:

<pre class="font:courier-new lang:default decode:true ">0b:05.0 SCSI storage controller: Adaptec AIC-7892A U160/m (rev 02)
Subsystem: Adaptec 29160 Ultra160 SCSI Controller
Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx-
Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium &gt;TAbort- &lt;TAbort- &lt;MAbort- &gt;SERR- &lt;PERR- INTx-
Latency: 72 (10000ns min, 6250ns max), Cache Line Size: 32 bytes
Interrupt: pin A routed to IRQ 22
BIST result: 00
Region 0: I/O ports at 5000 [disabled] [size=256]
Region 1: Memory at f0300000 (64-bit, non-prefetchable) [size=4K]
[virtual] Expansion ROM at 80000000 [disabled] [size=128K]
Capabilities: [dc] Power Management version 2
Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
Kernel driver in use: aic7xxx</pre>

Vidimo dosta informacija, poput točnohg modela kontrolera (<span class="font:courier-new lang:default decode:true crayon-inline">Adaptec 29160 Ultra160</span>), a možda najzanimljivija je zadnja, odnosno, koji upravljački program (kernel modul) se koristi za našu SCSI kontroler &#8211; u ovom slučaju: <span class="font:courier-new lang:default decode:true crayon-inline ">aic7xxx</span> .

&nbsp;

### lscpu

Naredba <span class="lang:default decode:true crayon-inline ">lscpu </span> daje nam podatke o našem CPUu:

<pre class="lang:default decode:true ">lscpu</pre>

&nbsp;

Dobiti ćemo nešto poput:

<pre class="font:courier-new lang:default decode:true ">Architecture: x86_64
CPU op-mode(s): 32-bit, 64-bit
Byte Order: Little Endian
CPU(s): 2
On-line CPU(s) list: 0,1
Thread(s) per core: 2
Core(s) per socket: 1
Socket(s): 1
NUMA node(s): 1
Vendor ID: GenuineIntel
CPU family: 15
Model: 4
Stepping: 3
CPU MHz: 3400.000
BogoMIPS: 6384.50
L1d cache: 16K
L2 cache: 2048K
NUMA node0 CPU(s): 0,1</pre>

Dakle vidimo sve podatke o CPUu, od takta, _L1 i L2 cache_ memorije i točnog modela.

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;

 [1]: https://www.opensource-osijek.org/dokuwiki/wiki:knjige:uvod_u_linux
 [2]: https://www.opensource-osijek.org
 [3]: https://www.opensource-osijek.org/dokuwiki/wiki:knjige:uvod_u_linux#interrupt_moderation
 [4]: https://www.opensource-osijek.org/dokuwiki/wiki:knjige:uvod_u_linux#uredaji_ukratko_devices
 [5]: https://www.opensource-osijek.org/dokuwiki/wiki:knjige:uvod_u_linux#logicka_shema_diska
 [6]: https://www.opensource-osijek.org/dokuwiki/wiki:knjige:uvod_u_linux#rad_s_particijama
 [7]: https://www.opensource-osijek.org/dokuwiki/wiki:knjige:uvod_u_linux#uredaji_devices_detaljnije
 [8]: https://www.opensource-osijek.org/dokuwiki/wiki:knjige:uvod_u_linux#pracenje_performansi_i_o_sustava
 [9]: https://www.opensource-osijek.org/dokuwiki/wiki:knjige:uvod_u_linux#naprednovm_-_slabs
 [10]: https://www.opensource-osijek.org/dokuwiki/wiki:knjige:uvod_u_linux#naprednodiskovni_i_o_podsustav
