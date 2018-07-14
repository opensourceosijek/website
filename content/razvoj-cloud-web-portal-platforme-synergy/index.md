---
title: Synergy Platform
authors: hhorvat
type: page
date: 2013-11-05T15:31:50+00:00

---
<h1 style="text-align: center;">
  <strong>Hello dear reader !</strong>
</h1>

<h3 style="text-align: center;">
  <strong>(English version)</strong>
</h3>

<p style="font-size: 20px;" align="justify">
  You want to know what is Synergy Platform? To whom is intended? What is so special about it? Behind this fancy name is Enterprise Level System suited for deployment and running Reactive applications for customers which demand that system must be available 24/7. This demand is obvious: if system doesn&#8217;t work, customer looses money!
</p>

<p style="font-size: 20px;" align="justify">
  New requirements demand new technologies. Today solutions emphasize managed servers and containers. Scaling is achieved through buying larger servers and concurrent processing via multi-threading. Additional servers are added through complex, inefficient and expensive proprietary solutions.
</p>

<p style="font-size: 20px;" align="justify">
  But now a new architecture has evolved to let developers conceptualize and build applications that satisfy today’s demands. We call these applications Reactive Applications. This architecture allows developers to build systems that are <b>event-driven</b>, <b>scalable</b>, <b>resilient</b> and <b>responsive</b>: delivering highly responsive user experiences with a real-time feel, backed by a scalable and resilient application stack, ready to be deployed on multi-core and cloud computing architectures.
</p>

<p style="font-size: 20px;" align="left">
  The <a title="Reactive Manifesto" href="http://www.reactivemanifesto.org/" target="_blank">Reactive Manifesto</a> describes these critical traits which are needed for going reactive. While there are dependencies between them, these traits are not like tiers in a standard layered application architecture sense. Instead they describe design properties that apply across the whole technology stack.<b>Event-Driven:</b> Enables parallel, asynchronous processing of messages or events with ease. Application that is under heavy load can thus have lower latency and higher throughput than a traditional application based on blocking synchronization and communication primitives. This results in lower operational costs, increased utilization and happier end-users.
</p>

<li style="font-size: 20px;">
  <p style="font-size: 20px;" align="justify">
    <b>Event-Driven:</b> Enables parallel, asynchronous processing of messages or events with ease. Application that is under heavy load can thus have lower latency and higher throughput than a traditional application based on blocking synchronization and communication primitives. This results in lower operational costs, increased utilization and happier end-users.
  </p>
</li>

<li style="font-size: 20px;">
  <p style="font-size: 20px;" align="justify">
    <b>Scalable:</b> A scalable application is able to be expanded according to its usage. This can be achieved by adding elasticity to the application, the option of being able to scale out or in (add or remove nodes) on demand. In addition, the architecture makes it easy to scale up or down (deploying on a node with more or fewer CPUs) without redesigning or rewriting the application. Elasticity makes it possible to minimize the cost of operating applications in a cloud computing environment.
  </p>
</li>

<li style="font-size: 20px;">
  <p style="font-size: 20px;" align="justify">
    <b>Resilient: </b>The ability to recover and repair itself automatically in order to provide seamless business continuity. Traditional fault handling cannot achieve this because it is defensive in the small and too aggressive in the large—you either handle exceptions right where and when they happen or you initiate a failover of the whole application instance.
  </p>
</li>

<li style="font-size: 20px;">
  <p style="font-size: 20px;" align="justify">
    <b>Responsive: </b>Rich and engaging applications that provide instant feedback based on user interactions and other stimuli. This makes them more efficient, creates a feel of being connected and equipped to solve problems and accomplish tasks. One example is Google Docs which enables users to edit documents collaboratively, in real-time—allowing them to see each other’s edits and comments live, as they are made.
  </p>
</li>

<p style="font-size: 20px;" align="justify">
  It is clear that new programming paradigms and tools need to be embraced in order to deliver on the multiple levels of sophistication required to deliver these Reactive applications. Finance and telecommunication were the first to adopt new practices to satisfy the new requirements and others have followed. Open Source Osijek Community strongly supports Reactive path and believes that this paradigm can be used by small and middle size software companies which do not have to much money and want to scale up.
</p>

<p style="font-size: 20px;" align="justify">
  <b>What hardware resources are used by Open Source Osijek Community ?</b>
</p>

<p style="font-size: 20px;" align="justify">
  <a title="Osijek business center BIOS" href="http://inkubator.hr/" target="_blank">Osijek business center BIOS</a> has granted our community free hardware resources. The plan is to use it for educational purposes and development of Synergy Platform. For development purposes four ProxMox Linux Containers are used on one physical machine. It is not the best solution to have all linux containers on one physical machine but for now it is good enough. In near future one more physical machine will be added.
</p><figure>

<img class="aligncenter wp-image-1530 " src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2013/11/Synergy_platform_hardware.jpg?resize=960%2C433&#038;ssl=1" alt="Synergy_platform_hardware" width="960" height="433" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2013/11/Synergy_platform_hardware.jpg?w=1190&ssl=1 1190w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2013/11/Synergy_platform_hardware.jpg?resize=300%2C135&ssl=1 300w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2013/11/Synergy_platform_hardware.jpg?resize=1024%2C462&ssl=1 1024w" sizes="(max-width: 960px) 100vw, 960px" data-recalc-dims="1" /><figcaption style="font-size: 15px; text-align: center;">Fig1. &#8211; Synergy Platform Hardware</figcaption></figure> 

<p style="font-size: 20px;" align="justify">
  <b>How Synergy Platform architecture looks like ?</b>
</p>

<p style="font-size: 20px;" align="justify">
  Synergy Platform is composed from several components necessary for building <a title="High Available" href="http://en.wikipedia.org/wiki/High-availability_cluster" target="_blank">High Availability</a> (HA) services.
</p><figure>

<img class="aligncenter wp-image-1532" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2013/11/Synergy_platform_overview.jpg?resize=881%2C1731&#038;ssl=1" alt="Synergy_platform_overview" width="881" height="1731" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2013/11/Synergy_platform_overview.jpg?w=1173&ssl=1 1173w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2013/11/Synergy_platform_overview.jpg?resize=152%2C300&ssl=1 152w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2013/11/Synergy_platform_overview.jpg?resize=521%2C1024&ssl=1 521w" sizes="(max-width: 881px) 100vw, 881px" data-recalc-dims="1" /><figcaption style="font-size: 15px; text-align: center;">Fig2. &#8211; Synergy Platform architecture</figcaption></figure> 

&nbsp;

<p style="font-size: 20px;" align="justify">
  List of components:
</p>

<li style="font-size: 20px;">
  <p style="font-size: 20px;">
    <a title="Linux OS" href="http://www.centos.org/" target="_blank"><b>Linux Centos</b></a> – linux distribution which focus on stability, predictability, and security.
  </p>
</li>

<li style="font-size: 20px;">
  <p style="font-size: 20px;">
    <a title="Synchronous multi-master cluster for MariaDB" href="https://mariadb.com/kb/en/what-is-mariadb-galera-cluster/" target="_blank"><b>MariaDB Galera Cluster</b></a> – MariaDB Galera Cluster is a synchronous multi-master cluster for MariaDB with synchronous data replication and active-active multi-master topology.
  </p>
</li>

<li style="font-size: 20px;">
  <p style="font-size: 20px;">
    <a title="Advanced key-value store. It is often referred to as a data structure server since keys can contain strings, hashes, lists, sets and sorted sets." href="http://redis.io/" target="_blank"><b>Redis</b></a> – advanced key-value store. It is often referred to as a data structure server since keys can contain strings, hashes, lists, sets and sorted sets. Most typical use-case: cache frequently accessed data in-memory, often in front of a database. Who&#8217;s using Redis? Twitter , Github, Weibo, Pinterest, Snapchat, Craigslist, Digg, StackOverflow, Flickr and many others.
  </p>
</li>

<li style="font-size: 20px;">
  <p style="font-size: 20px;">
    <a title="Toolkit for building REST/HTTP-based integration layers on top of Scala and Akka. " href="http://spray.io/" target="_blank"><b>Spray</b></a> – fully asynchronous HTTP server which can handle thousands of concurrent connections. It also supports request and response streaming, HTTP pipelining and SSL. It has elegant DSL for API construction which is quite unique.
  </p>
</li>

<li style="font-size: 20px;">
  <p style="font-size: 20px;">
    <a title="The Reliable, High Performance TCP/HTTP Load Balancer" href="http://haproxy.1wt.eu/" target="_blank"><b>HAProxy</b></a> – TCP/HTTP load balancer commonly used to improve the performance of web sites and services by spreading requests across multiple servers. It is written in C and has a reputation for being fast, efficient (in terms of processor and memory usage) and stable. It is used by a number of high-profile websites including Stack Overflow, Reddit, Tumblr, and Twitter and is used in the OpsWorks product from Amazon Web Services.
  </p>
</li>

<li style="font-size: 20px;">
  <p style="font-size: 20px;">
    <a title="Akka Toolkit" href="http://akka.io/" target="_blank"><b>Reactive applications powered by Akka Toolkit</b></a> – Akka is used for building highly concurrent, distributed, and fault tolerant event-driven applications on the JVM (Java Virtual Machine). It has excellent properties: simple concurrency and distribution, resilient by design (self-heal), high performance (millions msg/sec on a single machine and small memory footprint), adaptive load balancing, routing, partitioning and configuration-driven remoting.
  </p>
</li>

<li style="font-size: 20px;">
  <p style="font-size: 20px;">
    <a title="Play WebFramework" href="http://www.playframework.com/" target="_blank"><b>Play WebFramework</b></a> – it is just a presentation component which serves users as front-end window to their business logic. It is used as glue between HAProxy load balancer and Spray HTTP server. This means that Play uses only HTTP to communicate with Reactive Applications. We could say that Play is “thin-client”.
  </p>
</li>

<li style="font-size: 20px;">
  <span style="color: #444444;"><a title="ProxMox" href="https://www.proxmox.com/" target="_blank">ProxMox</a> &#8211; virtualization management solution, based on KVM virtualization and containers. It manages virtual machines, storage, virtualized networks, and HA Clustering.</span>
</li>

<p style="font-size: 20px;" align="justify">
  Now, when a reader reads this list of features he/she will probably say: “Hey, this is not special. I can use JBoss Application Framework, Spring, Tomcat, Microsoft .NET Framework, MySQL, PostgreSQL,&#8230; and achieve the same enterprise level system quality and loose coupling between services with any of these technologies”. My answer to this is: “<i>Building distributed, high performance and event-driven applications is HARD. It is not something which comes out-off-box with standard frameworks. Don&#8217;t get me wrong, most of frameworks are sufficient for standard projects (standard project = applications are running on single node). But if you need balanced load distribution over all cluster nodes and guaranteed automatic fail-over of applications then you have to build the goddamn system by yourself. This is how it is done in industry where every minute of off-line system </i><i>or degradation in performance </i><i>is lost of money. </i><i>Industry</i><i> pay</i><i>s</i><i> for this kind of systems with great money and </i><i>have </i><i>big expectations. </i><i>One of goals of Open Source Osijek Community is to show how to build simplified version </i><i>of </i><i>highly</i><i> available and redundant</i><i> system. </i><i>Our Synergy Platform (version 1) </i><i>will be </i><i>mostly suited for projects where the most </i><i>frequent</i><i> business process flow is</i><i>: </i><i>c</i><i>lient request → server back-end → </i><i>read</i><i>/</i><i>write</i><i> something from/</i><i>to</i><i> database.</i>”
</p>

<p style="font-size: 20px;" align="justify">
  <b>What are we doing currently?</b>
</p>

<p style="font-size: 20px;" align="justify">
  In June, 2014 we will be testing the last missing link for our platform – Redis: In-memory key-value store.
</p>

<p style="font-size: 20px;" align="justify">
  Meanwhile, when I steal some time I will study and try Docker application container which could help us to distribute Reactive Applications flexibly and to have the same environment on developer computer and production system.
</p>

<p style="font-size: 20px;" align="justify">
  ps. Translation to Croatian language is comming soon&#8230;
</p>

&nbsp;