---
title: Installation Manual
authors: hvarga
type: page
date: 2013-10-29T17:56:22+00:00
private: true

---
## <span style="font-family: Bitter, Georgia, serif; font-size: 30px; line-height: 1.3;">OpenLDAP</span>

### Version

2.4.23

### Description

<p dir="ltr">
  OpenLDAP is a free, open source implementation of the Lightweight Directory Access Protocol (LDAP) developed by the OpenLDAP Project. LDAP is a platform-independent protocol.
</p>

<h3 dir="ltr">
  Usage
</h3>

<p dir="ltr">
  OpenLDAP will be used to store authorization and authentication data for every tool listed in this document.
</p>

<h3 dir="ltr">
  Installation Procedure
</h3>

  1. **Install needed packages** 
      * <span class="lang:default highlight:0 decode:true crayon-inline">yum install openldap openldap-servers openldap-clients</span>
  2. **Start OpenLDAP on system startup** 
      * <span class="lang:default highlight:0 decode:true crayon-inline">chkconfig slapd on</span>
  3. **Edit the database file to change domain** 
      * <span class="lang:default highlight:0 decode:true crayon-inline">vim /etc/openldap/slapd.d/cn=config/olcDatabase={2}bdb.ldif</span>
      * Change <span class="lang:default highlight:0 decode:true crayon-inline">olcSuffix</span> to <span class="lang:default highlight:0 decode:true crayon-inline">olcSuffix: dc=opensourceosijek,dc=org</span>
  
        Change <span class="lang:default highlight:0 decode:true crayon-inline">olcRootDN</span> to <span class="lang:default highlight:0 decode:true crayon-inline">olcRootDN: cn=Manager,dc=opensourceosijek,dc=org</span>
      * At the end of the file add
  
        <span class="lang:default highlight:0 decode:true crayon-inline">olcRootPW:{SSHA}72520OHdazor7Z9pZZI9vr7+b19/+uJt olcAccess: to dn.subtree=&#8221;dc=opensourceosijek,dc=org&#8221; filter=(objectclass=inetOrgPerson) by self read by * auth</span>
  4. **Specify the monitoring privileges** 
      * <span class="lang:default highlight:0 decode:true crayon-inline">vim /etc/openldap/slapd.d/cn=config/olcDatabase={1}monitor.ldif</span>
      * Change <span class="lang:default highlight:0 decode:true crayon-inline">olcAccess</span> to
  
        <span class="lang:default highlight:0 decode:true crayon-inline">olcAccess: {0}to * by dn.base=&#8221;gidNumber=0+uidNumber=0,cn=peercred,cn=externa l,cn=auth&#8221; read by dn.base=&#8221;cn=Manager,dc=opensourceosijek,dc=org&#8221; read by * none</span>
  5. **Edit LDAP config files** 
      * <span class="lang:default highlight:0 decode:true crayon-inline">vim /etc/openldap/ldap.conf</span>
      * At the end of the file add
  
        <span class="lang:default highlight:0 decode:true crayon-inline">BASE dc=opensourceosijek,dc=org</span>
  6. **Start the OpenLDAP server** 
      * <span class="lang:default highlight:0 decode:true  crayon-inline">service slapd start</span>

### User Documentation

<http://www.openldap.org/doc/admin24/>

## Apache HTTP Server

### Version

2.2.15

### Description

<p dir="ltr">
  The Apache HTTP Server Project is an effort to develop and maintain an open-source HTTP server for modern operating systems including UNIX and Windows NT. The goal of this project is to provide a secure, efficient and extensible server that provides HTTP services in sync with the current HTTP standards.
</p>

<h3 dir="ltr">
  Usage
</h3>

<p dir="ltr">
  The Apache HTTP Server will be used to serve web applications like WordPress and Redmine. It is also used as a proxy towards Apache Tomcat.
</p>

### Application Configuration

&nbsp;
