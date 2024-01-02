sudo -i

apt-get update

echo ************************************

apt install openjdk-11-jre-headless -y

apt install docker.io -y

usermod -aG docker $USER

chmod 666 /var/run/docker.sock

apt install unzip

systemctl enable docker

systemctl start  docker

systemctl status docker

curl -L https://github.com/docker/compose/releases/download/1.29.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose

wget https://dlcdn.apache.org//directory/apacheds/dist/2.0.0.AM27/apacheds-2.0.0.AM27-64bit.bin

chmod a+x apacheds-2.0.0.AM27-64bit.bin

# sudo ./apacheds-2.0.0.AM27-64bit.bin

# uid=admin,ou=system

# secret

# sudo /etc/init.d/apacheds-2.0.0.AM28-SNAPSHOT-default start


# sudo /etc/init.d/apacheds-2.0.0.AM28-SNAPSHOT-default stop