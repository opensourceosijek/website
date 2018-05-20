---
title: MariaDB Galera cluster solution
author: amilincevic
type: post
date: 2014-06-30T11:00:17+00:00
url: /2014/06/30/mariadb-galera-cluster-solution-2/
featured_image: /wp-content/uploads/2014/06/Session.jpg
categories:
  - Vijesti

---
# MariaDB Galera cluster solution {.post-title}

<p class="post-byline">
  by <a title="Posts by Alen Milinčević" href="https://www.opensource-osijek.org/wordpress/en/author/alen_milin%c4%8devi%c4%87/" rel="author">Alen Milinčević</a> · June 26, 2014
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  <strong>Cloud web platform synergy</strong>
</p>

<p lang="zxx" style="margin-bottom: 0cm; font-weight: normal;" align="LEFT">
  <span style="font-size: medium;">It is an Enterprise Level System for reactive applications which aims to be a highly available.<br /> In order to achieve this goals it is imperative to also be:</span>
</p>

  * <p lang="zxx" style="margin-bottom: 0cm; font-weight: normal;" align="LEFT">
      <span style="font-size: medium;">event-driven</span>
    </p>

  * <p lang="zxx" style="margin-bottom: 0cm; font-weight: normal;" align="LEFT">
      <span style="font-size: medium;">scalable</span>
    </p>

  * <p lang="zxx" style="margin-bottom: 0cm; font-weight: normal;" align="LEFT">
      <span style="font-size: medium;">resilient</span>
    </p>

  * <p lang="zxx" style="margin-bottom: 0cm; font-weight: normal;" align="LEFT">
      <span style="font-size: medium;">responsive.</span>
    </p>

<p lang="zxx" style="margin-bottom: 0cm; font-weight: normal;" align="LEFT">
  <span style="font-size: medium;">In order to achieve this goals, any database used must be also:<br /> </span>
</p>

<ul style="list-style-type: circle;">
  <li>
    <span style="font-size: medium;"> resilient (durable to any disruptions )</span>
  </li>
  <li>
    <span style="font-size: medium;"> self-healing (must continue working , even if a part is temporarly unaccessible due to maintance or some critical error )</span>
  </li>
</ul>

<p style="text-align: center;">
  <a href="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Synergy.jpg?ssl=1" data-rel="lightbox-0" title=""><img class="alignnone size-medium wp-image-1505" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Synergy.jpg?resize=300%2C209&#038;ssl=1" alt="Synergy" width="300" height="209" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Synergy.jpg?resize=300%2C209&ssl=1 300w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Synergy.jpg?w=649&ssl=1 649w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" /></a>
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  <strong>DB Clustering</strong>
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  A cluster is a collection of individual nodes. Every node is a database in itself. The power of clustering can be leveraged by connecting individual nodes and let it work synchronized. This makes the whole database cluster intelligent. The nodes communicate together, help each other, balance their work between them and work in an integrated fashion.
</p>

<p lang="zxx" style="margin-bottom: 0cm; text-align: center;">
  <a href="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Balance.jpg?ssl=1" data-rel="lightbox-1" title=""><img class="alignnone size-medium wp-image-1495" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Balance.jpg?resize=300%2C133&#038;ssl=1" alt="Balance" width="300" height="133" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Balance.jpg?resize=300%2C133&ssl=1 300w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Balance.jpg?w=689&ssl=1 689w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" /></a>
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  <strong>MariaDB cluster</strong>
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  MySQL is one of the most used databases (if not the most used database). MariaDB is an enchanced cousin of MySQL. It can work by itself, but only working in cluster makes it highly available.<br /> In comparison to other existing databases, it is:
</p>

<ul style="list-style-type: circle;">
  <li>
    <span style="font-weight: normal;">A high availability solution with synchronous replication, failover and resynchronization</span>
  </li>
  <li>
    No loss of data
  </li>
  <li>
    All servers have up-to-date data (no slave lag)
  </li>
  <li>
    Read scalability
  </li>
  <li>
    Pretty good’ write scalability
  </li>
  <li>
    High availability across data centers
  </li>
</ul>

<p lang="zxx" style="margin-bottom: 0cm;">
  <strong>Topology</strong>
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  When running on only one physical computer, it is vulnerable to this computer failing to work.<br /> Connecting more than one computer in a cluster creates a database topology.<br /> In a topology clear rules must be set, so that not every node fights with each other.
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  Traditionally, this was acheieved by using a master, which coordinates the communication and slaves that obey to this. In case the master fails, the whole cluster is uncoordinated. First solutions to this problems made a fail mechanism, where one of the remaining slaves would be declared master. When the original master returned, it could only be a slave. There can only be one.<br /> MariaDB galera technology takes a different approach. It is composed of donors and joiners. First node which starts the cluster is the original donor. It is bootstraped in order to create the cluster. Any incoming node will become joiner. However, it can be a donor for some another joiner. Some nodes serve as mediators and the cluster selforganizes into an unified working unit. In case of some nodes failing, this is detected and the remaining nodes reconnect. All of this is done behind scenes.
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  Writing to the database and reading from the database happen on a “agree first” basis. All the node members are asked when a write operation is performed, and when all agree, it is carried out and the result is propagated throughout the cluster. Should a write operation happen on the same data on more than one node, a livelock occurs. This is however not critical, since only retires in different times must be performed. The same data cannot be written at the same time to more than one node. Data consistency is warranted. Read operations can occur at any time at any number of nodes, since the data is consistent when having been written.
</p>

<p lang="zxx" style="margin-bottom: 0cm; text-align: center;">
  <a href="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Session.jpg?ssl=1" data-rel="lightbox-2" title=""><img class="alignnone size-medium wp-image-1502" src="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Session.jpg?resize=212%2C300&#038;ssl=1" alt="Session" width="212" height="300" srcset="https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Session.jpg?resize=212%2C300&ssl=1 212w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Session.jpg?resize=724%2C1024&ssl=1 724w, https://i0.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/Session.jpg?w=794&ssl=1 794w" sizes="(max-width: 212px) 100vw, 212px" data-recalc-dims="1" /></a>
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  <strong>Quorum</strong>
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  In order to decide what must be done next, at least an uneven number of nodes must agree. It is recommended to use at least 3 nodes. The number of nodes which have the mayority decide how to resolve a confliclicting situation. Connections in a cluster between some nodes could fail. This is known as a split brain or brain split. Each partition would continue to work on it’s own, what is the least wanted behaviour. Therefore only the majority continues, while the minority goes into a sleep-mode. Upon reconnecting to the majority, the cluster continous to work in unison. This is self-healing and resiliency.
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  <img class="alignnone size-medium wp-image-1493 aligncenter" src="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/quorum.jpg?resize=300%2C234&#038;ssl=1" alt="quorum" width="300" height="234" srcset="https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/quorum.jpg?resize=300%2C234&ssl=1 300w, https://i2.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/quorum.jpg?w=625&ssl=1 625w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" />
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  <strong>Current status within Open Source Osijek community</strong>
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  The MariaDB database galera aim is to serve as the main backend for the Synergy Platform. As it does heavy work of keeping any data consistent and does it quite well, the choice over some other existing alternatives was not difficult. Tests show low resource usage and the multimaster functionality is better choice than using a traditional master-slave model.
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  In order to have a minimum working system with quorum, Open Source Osijek has chosen to have a 3-node MariaDB Galera cluster.
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  <a href="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/MariaDB.jpg?ssl=1" data-rel="lightbox-3" title=""><img class=" wp-image-1494 aligncenter" src="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/MariaDB.jpg?resize=246%2C348&#038;ssl=1" alt="MariaDB" width="246" height="348" srcset="https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/MariaDB.jpg?resize=212%2C300&ssl=1 212w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/MariaDB.jpg?resize=724%2C1024&ssl=1 724w, https://i1.wp.com/www.opensource-osijek.org/wordpress/wp-content/uploads/2014/06/MariaDB.jpg?w=794&ssl=1 794w" sizes="(max-width: 246px) 100vw, 246px" data-recalc-dims="1" /></a>
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  <strong> </strong>
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  <strong>References</strong>
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  <a href="https://mariadb.org/">https://mariadb.org/</a>
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  <a href="https://mariadb.com/kb/en/galera/">https://mariadb.com/kb/en/galera/</a>
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  <a href="https://mariadb.com/kb/en/what-is-mariadb-galera-cluster/">https://mariadb.com/kb/en/what-is-mariadb-galera-cluster/</a>
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  <a href="http://en.wikipedia.org/wiki/High_availability">http://en.wikipedia.org/wiki/High_availability</a>
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  <a href="http://en.wikipedia.org/wiki/Redundancy_%28databases%29">http://en.wikipedia.org/wiki/Redundancy_%28databases%29</a>
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  <a href="http://haproxy.1wt.eu/">http://haproxy.1wt.eu/</a>
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  <a href="http://www.keepalived.org/">http://www.keepalived.org/</a>
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  <a href="http://en.wikipedia.org/wiki/Replication_%28computing%29">http://en.wikipedia.org/wiki/Replication_%28computing%29</a>
</p>

<p lang="zxx" style="margin-bottom: 0cm;">
  <a href="http://www.percona.com/live/mysql-conference-2013/sessions/how-understand-galera-replication-0">http://www.percona.com/live/mysql-conference-2013/sessions/how-understand-galera-replication-0</a>
</p>