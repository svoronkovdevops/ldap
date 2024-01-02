sudo -i

apt-get update

echo ************************************

PASSWD='123'

echo -e "$PASSWD\n$PASSWD" | apt-get install slapd ldap-utils -y


slapcat