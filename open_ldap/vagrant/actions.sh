 
 ldapmodify -D "cn=admin,dc=nodomain" -w 123
 
 # create units 
 
dn: ou=users,dc=nodomain
changetype: add
objectClass: top
objectClass: organizationalUnit
ou: users
description: Central location for UNIX users

#2 times enter key

dn: ou=groups,dc=nodomain
changetype: add
objectClass: top
objectClass: organizationalUnit
ou: groups
description: Central location for UNIX groups

#2 times enter key

dn: ou=roles,dc=nodomain
changetype: add
objectclass:organizationalunit
ou: roles
description: generic roles branch

#2 times enter key

# add groups



dn: cn=sysadmin,ou=groups,dc=nodomain
changetype: add
cn: sysadmin
objectClass: top
objectClass: posixGroup
gidNumber: 1100
description: UNIX systems administrators

#2 times enter key

dn: cn=nssproxy,ou=groups,dc=nodomain
changetype: add
cn: nssproxy
objectClass: top
objectClass: posixGroup
gidNumber: 801
description: Network Service Switch Proxy

#2 times enter key

dn: cn=test,ou=groups,dc=nodomain
changetype: add
cn: test
objectClass: top
objectClass: posixGroup
gidNumber: 1101
description: Test

#2 times enter key

# add users

dn: cn=pablo,ou=users,dc=nodomain
changetype: add
uid: pablo
gecos: Pablo Sdoba
objectClass: top
objectClass: account
objectClass: posixAccount
objectClass: shadowAccount
userPassword: 123
shadowLastChange: 15140
shadowMin: 0
shadowMax: 99999
shadowWarning: 7
loginShell: /bin/bash
uidNumber: 1100
gidNumber: 1100
homeDirectory: /home/pablo

dn: cn=nssproxy,ou=users,dc=nodomain
changetype: add
uid: nssproxy
gecos: Network Service Switch Proxy User
objectClass: top
objectClass: account
objectClass: posixAccount
objectClass: shadowAccount
userPassword: 123
shadowLastChange: 15140
shadowMin: 0
shadowMax: 99999
shadowWarning: 7
loginShell: /bin/false
uidNumber: 801
gidNumber: 801
homeDirectory: /home/nssproxy

dn: cn=test,ou=users,dc=nodomain
changetype: add
uid: test
gecos: Test User
objectClass: top
objectClass: account
objectClass: posixAccount
objectClass: shadowAccount
userPassword: 123
shadowLastChange: 15140
shadowMin: 0
shadowMax: 99999
shadowWarning: 7
loginShell: /bin/bash
uidNumber: 1101
gidNumber: 1101
homeDirectory: /home/test

 


 # add users to groups

dn: cn=nssproxy,ou=groups,dc=nodomain
changetype: modify
add: memberuid
memberuid: pablo


dn: cn=nssproxy,ou=groups,dc=nodomain
changetype: modify
add: memberuid
memberuid: nssproxy


# Create roles and add users
dn: cn=viewer,ou=roles,dc=nodomain
changetype: add
objectclass: groupofnames
cn: viewer 
description: Customer viewer role 
member: uid=nssproxy,ou=users,dc=nodomain


dn: cn=sysadmin,ou=roles,dc=nodomain
changetype: add
objectclass: groupofnames
cn: sysadmin 
description: Customer viewer role 
member: uid=pablo,ou=users,dc=nodomain