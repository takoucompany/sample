apt-get update
apt-get purge -y lxc-docker*
apt-get purge -y docker.io*
apt-get install -y apt-transport-https
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
DEBIAN_JESSIE_PATH=/etc/apt/sources.list.d/docker.list
#DEBIAN_JESSIE_PATH=~/hogefuga

if [ -f $DEBIAN_JESSIE_PATH ]; then
  touch $DEBIAN_JESSIE_PATH
fi

DOCKER_USER=vagrant
echo "deb https://apt.dockerproject.org/repo debian-jessie main" > $DEBIAN_JESSIE_PATH
apt-get update
apt-cache policy docker-engine
apt-get install -y docker-engine
sudo groupadd docker
sudo gpasswd -a $DOCKER_USER docker
sudo service docker start

