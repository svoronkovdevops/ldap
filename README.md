# LDAP


## Content

[Links](#links)

[Vagrant docker](#vagrant-docker)

[OpenLDAP](#openldap)

[Using OpenLDAP in Vagrant](#using-openldap-in-vagrant)

[Apache DS](#apache-ds)



## Links

[open](https://www.openldap.org/)

[apache](https://directory.apache.org/)

[apache studio](https://directory.apache.org/studio/)

[Content](#content)


## Vagrant docker

`cd basic`

`vagrant up`

http://100.0.0.15

`vagrant ssh basic` - connect to VM

VM username `vagrant`

VM password `vagrant`

[Content](#content)


## OpenLDAP


`sudo mkdir -p /data/slapd/config`

`sudo mkdir /data/slapd/databasea`

`sudo chmod 775 -R /data/slapd`

`sudo chown -R $USER:docker /data/slapd`




```sh

docker run \
      --name openldap-server \
      -p 389:389 \
      -p 636:636 \
      --hostname ldap.vsvdev.com \
	    --env LDAP_ORGANISATION="VSVDev" \
	    --env LDAP_DOMAIN="vsvdev.com" \
	    --env LDAP_ADMIN_PASSWORD="admin" \
      --env LDAP_BASE_DN="dc=vsvdev,dc=com" \
      --volume /data/slapd/database:/var/lib/ldap \
      --volume /data/slapd/config:/etc/ldap/slapd.d \
	    --detach osixia/openldap:latest
```

```sh
docker run \
    --name phpldapadmin \
    -p 10080:80 \
    -p 10443:443 \
    --hostname phpldapadmin-service \
    --link openldap-server:ldap-host \
    --env PHPLDAPADMIN_LDAP_HOSTS=ldap.vsvdev.com \
    --detach osixia/phpldapadmin:latest
```


https://100.0.0.15:10443/


cn=admin,dc=vsvdev,dc=com

admin


[Content](#content)



## Using OpenLDAP in Vagrant


`cd open_ldap`

`vagrant up`

If something wrong stop and delete VM

In Vagrantfile comment shell

```ruby
#ldap.vm.provision "shell", path: "test.sh"
```

`vagrant ssh ldap` - connect to VM

VM username `vagrant`

VM password `vagrant`

and do manually commands in test.sh

`cd open_ldap\vagrant`

and do manually commands in actions.sh

http://100.0.0.17


[Content](#content)


## Apache DS

`cd apacheds`

`vagrant up`

If something wrong stop and delete VM

In Vagrantfile comment shell

```ruby
#apacheds.vm.provision "shell", path: "test.sh"
```

`vagrant ssh apacheds` - connect to VM

VM username `vagrant`

VM password `vagrant`

and do manually commands in test.sh

http://100.0.0.18

[Content](#content)