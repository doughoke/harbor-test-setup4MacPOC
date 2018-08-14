#!/bin/bash

#DEBUG unset comment on "set -x"
#set -x
set -e

# cleanUpHarbor_POC_onMac.sh
#---------------------------------------
# Stops and cleans up Harbor on Mac
# 
# Prereq
# You successfully ran and installed Harbor with the script provided... also - python 2.7, Docker, Docker-Compose and knowledge of docker and dockerrepos
#
# Overview
# 1. Shuts down harbor
# 2. cleans up any artifacts that where created
#
# Runs in current working directory 

echo "This will destroy your local copy of Harbor...."
echo "..............................................."
echo "Therefore anything saved in Harbor will also disappear. If you want to demo to your colleagues don't run this until you show off."
echo "Please answer Y/N"
echo "------------------"
echo "|                |"
echo "|    Yes or No   |"
echo "------------------"
while true; do
    read -p "Do you wish to remove Harbor?" yn
    case $yn in
        [Yy]* ) echo "uninstalling harbor please wait..."  && echo "Shutting down" && docker-compose -f ./harbor/docker-compose.clair.yml -f ./harbor/docker-compose.yml down && echo "delete artifacts afterwards ./dev, ./harbor tgz file and startup log"; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done


