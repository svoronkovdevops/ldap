sudo -i 
PASSWD='adm'

echo -e "$PASSWD\n$PASSWD" | apt-get install slapd ldap-utils -y

systemctl start slapd.service
systemctl enable slapd.service
ufw allow ldap

cd /home/vagrant/open

cp ldap.conf /etc/ldap/ldap.conf



ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/ldap/schema/cosine.ldif
ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/ldap/schema/nis.ldif
ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/ldap/schema/inetorgperson.ldif
ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/ldap/schema/openldap.ldif
ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/ldap/schema/dyngroup.ldif

apt install phpldapadmin -y



