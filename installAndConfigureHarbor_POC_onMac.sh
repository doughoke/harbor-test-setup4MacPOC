#!/bin/bash

#DEBUG unset comment on "set -x"
#set -x
set -e

# installAndConfigureHarbor_POC_onMac.sh
#---------------------------------------
# automatically installs vmware harbor POC with Claire enabled on Mac
# This is due to the fact that vmware team does not support running on Mac
# (Can you blame them?)
#
# Prereq
# python 2.7, Docker, Docker-Compose and knowledge of docker and dockerrepos
#
# Overview
# 1. Script will download harbor binary - set HARBOR_VERSION to a different value if required
# 2. unpacks
# 3. updates harbor.cfg, and docker-compose.yml as well as docker-compose.yml
# 4. changes permissions on filesystem to work on docker running on Mac
# 5. checks if securitykey file exists
#
# Runs in current working directory but will create a ./dev/ folder for docker VOLUMES

#example download URL https://storage.googleapis.com/harbor-releases/release-1.5.0/harbor-online-installer-v1.5.0.tgz
HARBOR_VERSION="1.5.2"

echo "checking for docker..."
if [ ! 'docker --version | grep -q Docker' ] 
then
    echo "please install docker -- goto https://docs.docker.com/docker-for-mac/install/"
    exit 1
fi
echo "docker exists"

echo "checking for python 2.7"
if [ ! 'python --version | grep -q 2.7' ] 
then
    echo "please install python 2.7 -- goto https://www.python.org/downloads/mac-osx/ (Must be 2.7!!!)"
    exit 2
fi
echo "python 2.7 exists"

echo "downloading harbor online installer - you will need internet access"
curl https://storage.googleapis.com/harbor-releases/harbor-online-installer-v${HARBOR_VERSION}.tgz -o ./harbor-online-installer-v${HARBOR_VERSION}.tgz
echo "download complete"

echo "untarring harbor"
tar -xvzf harbor-online-installer-v${HARBOR_VERSION}.tgz
echo "harbor exploded - chown group to default staff for Mac"

echo "updating docker-compose files for ./dev"
cp ./harbor/docker-compose.yml ./harbor/docker-compose.yml.orig
cp ./harbor/docker-compose.clair.yml ./harbor/docker-compose.clair.yml.orig
cp ./harbor/harbor.cfg ./harbor/harbor.cfg.orig

#fix config to use mac hostname
HOSTNAME=`hostname`
sed -i.bak "s/hostname = reg\.mydomain\.com/hostname = ${HOSTNAME}/g" ./harbor/harbor.cfg
#update location for secretkey - looks like install.sh is trying to look for this before starting the harbor
secretkey_path_modified=$(pwd)/dev/data
echo ${secretkey_path_modified}
sed -i.bK2 "s~secretkey_path = \/data~secretkey_path = $secretkey_path_modified~g" ./harbor/harbor.cfg


mkdir -p dev/data

#fix docker-compose.yml to use ./dev/var and ./dev/data instead of /var and /data
sed -i.bak 's/- \/data/- ..\/dev\/data/g' ./harbor/docker-compose.yml
sed -i.bak 's/- \/var/- ..\/dev\/var/g' ./harbor/docker-compose.yml

sed -i.bak 's/- \/data/- ..\/dev\/data/g' ./harbor/docker-compose.clair.yml
sed -i.bak 's/- \/var/- ..\/dev\/var/g' ./harbor/docker-compose.clair.yml

echo "Installing vmware harbor at version ${HARBOR_VERSION}"
echo "--after installation system will be shutdown and docker-composed up after securitykey is updated"
echo "....."
echo ""

if [ ! -f ./dev/data/secretkey ]; then
    echo "secretkey is a folder lol - let's change that"
    echo ""
    echo "..."
    rm -rf ./dev/data/secretkey
    echo "123456789ABCDEF" > dev/data/secretkey
fi

#for those curious this is the command to config and start harbor - ./harbor/install.sh --with-clair
#Start and wait for output...
command="./harbor/install.sh --with-clair"
log="harbor-startup.log"
matchstartstring="Harbor has been installed and started successfully"
retryseconds=10

${command} > "${log}" 2>&1 &
pid=$!

echo "waiting for completion... run tail -f harbor-startup.log in another shell if curious."

while sleep ${retryseconds}
do
    if grep -q "${matchstartstring}" "${log}" ;
    then
        echo "harbor started but with with bugs"
        break
    fi
    echo "."
done
#removed for 1.5.x changes
#docker-compose -f ./harbor/docker-compose.clair.yml -f ./harbor/docker-compose.yml down

#echo "restarting harbor Please wait a bit"
#docker-compose -f ./harbor/docker-compose.clair.yml -f ./harbor/docker-compose.yml up



 
