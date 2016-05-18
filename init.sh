#!/bin/sh

#Update system
sudo yum -y update

#Install docker's repo
sudo tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/$releasever/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF

#Install docker engine (last)
sudo yum -y install docker-engine
sudo service docker start

sudo usermod -aG docker centos

sudo su
curl -L https://github.com/docker/compose/releases/download/1.7.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
exit

sudo mkdir /srv/docker/jenkins_home
sudo chown 1000 /srv/docker/jenkins_home/